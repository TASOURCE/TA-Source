/**
 * 
 */
class TrDevice_Shotgun extends TrDevice
	native;

var()		int		m_nMinShotCount;
var			int		m_nImpactCounter;
var         float   m_fConsumeAmmoTimeStamp;
var         float   m_fInnerDefaultAccuracy;
var         int     m_nShotsFired;
var         int     m_nConsumeShotsFired;

/** Handles the custom animation work for the shotgun. */
var AnimNodePlayCustomAnim ReloadCustomAnimNode;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == Mesh )
    {
        ReloadCustomAnimNode = AnimNodePlayCustomAnim(SkelComp.Animations.FindAnimNode('ReloadCustomAnim'));
    }
    
    Super.PostInitAnimTree(SkelComp);
}

/*
 *  called server side to catch locations of impacts so we can replicate multiple impact points to clients that dont simulate them
 */
function SetFlashLocation( vector HitLocation )
{
	super.SetFlashLocation(HitLocation);

	TrPawn(Instigator).ReplicateMultiFlashLocation( m_nImpactCounter, HitLocation );
	m_nImpactCounter++;
}

function PerformInactiveReload()
{
	local int AmmoToLoad;

    if( m_bAllowReloads && Role==ROLE_Authority )
    {
		// Assume will deplete all inventory
		AmmoToLoad = m_nCarriedAmmo;
	    
		// Don't load more than will fit in the magazine
		if (AmmoToLoad + m_RemainingAmmoInClip > GetMaxAmmoCount())
		{
			AmmoToLoad = GetMaxAmmoCount() - m_RemainingAmmoInClip;
		}
        if (AmmoToLoad!=0)
        {
		    // decrement inventory
		    m_nCarriedAmmo -= AmmoToLoad;

			// increment magazine content
		    AddAmmo(AmmoToLoad);

			UpdateReplicatedCarriedAmmo();

			// Open the ability to fire back up.
			EnableWeaponReadyToFire();
        }
    }
}

simulated function CustomFire()
{
	local int shotCount;

	// figure out how many shots are going out...
	shotCount = m_nMinShotCount;

	// reset the impact counter
	m_nImpactCounter=0;
	m_nShotsFired=0;

	while (shotCount>0)
	{
		InstantFire();
		shotCount--;
		m_nShotsFired++;
	}

	// if we hit anything, terminate the list
	if (m_nImpactCounter>0)
	{
		TrPawn(Instigator).ReplicateMultiFlashLocation( m_nImpactCounter, vect(0,0,0) );
	}

	// Cancel any custom reload animation.
	if( ReloadCustomAnimNode != none )
	{
		ReloadCustomAnimNode.StopCustomAnim(0.0);
	}
}

simulated function FireAmmunition()
{
	if( Role == ROLE_Authority )
	{
		r_bReadyToFire = false;
	}
	else
	{
		// Simulate the ammo loss on the client.
		AddAmmo(-ShotCost[0]);
	}
	Super.FireAmmunition();
}

simulated function StartFire(byte FireModeNum)
{
	if( Role < ROLE_Authority )
	{
		m_bWantsToFire = true;
	}
	super.StartFire(FireModeNum);
}

simulated function ConsumeAmmo(byte FireModeNum);

simulated function ConsumeAmmo_Internal(byte FireModeNum)
{
	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		// Only consume ammo once we've hit the last of a shot group. This variable is set by HasAmmoInDevice.
		if( m_nConsumeShotsFired >= m_nMinShotCount )
		{
			m_nConsumeShotsFired = 0;
			super.ConsumeAmmo_Internal(FireModeNum);
		}
	}
	else if (WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_Standalone)
	{
		// In listen servers and stand-alone, go with the old logic.
		if (m_fConsumeAmmoTimeStamp <= WorldInfo.TimeSeconds)
		{
			m_fConsumeAmmoTimeStamp = WorldInfo.TimeSeconds + FireInterval[FireModeNum] * 0.5f;
			super.ConsumeAmmo_Internal(FireModeNum);
		}
	}

	if( GetAmmoCount() == 0 )
	{
		// Make the player manually re-engage the firing procedure when our clip runs out.
		m_bWantsToFire = false;
	}
}

function ProcessInstantHit_Internal(byte FiringMode, ImpactInfo Impact, optional bool bHeadShot)
{
	Super.ProcessInstantHit_Internal(FiringMode, Impact);
	ConsumeAmmo_Internal(FiringMode);
}

event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	if( SeqNode != None && SeqNode.NodeName == 'Reload' && ReloadCustomAnimNode != None )
	{
		if (m_bReloadBulletInChamber)
			ReloadCustomAnimNode.PlayCustomAnim('ReloadOut', 1.0, 0.025, 0.1, false, true);
		else
			ReloadCustomAnimNode.PlayCustomAnim('ReloadOutPump', 1.0, 0.025, 0.1, false, true);
	}
	super.OnAnimEnd(SeqNode, PlayedTime, ExcessTime);
}

simulated state WeaponFiring
{
	/**
	 * Timer event, call is set up in Weapon::TimeWeaponFiring().
	 * The weapon is given a chance to evaluate if another shot should be fired.
	 * This event defines the weapon's rate of fire.
	 */
	simulated function RefireCheckTimer()
	{
		// If we are wanting to reload, do it.
		if (m_bPendingReload && (GetNumRoundsCurrentlyInClip() < GetMaxAmmoCount()) && (m_nCarriedAmmo > 0) && m_bAllowReloads)
		{
            GotoState('DeviceReloading');
			return;
		}

		super.RefireCheckTimer();
	}

	function RequestReload()
	{
		// Set the pending reload on the server.
		if( Role == ROLE_Authority )
		{
			m_bPendingReload = true;
		}
	}
}

simulated state DeviceReloading
{
	simulated function BeginFire(byte FireModeNum)
	{
		// Allow player to go to the firing state even while reloading.
		if( m_nCarriedAmmo > 0 )
		{
			if( !bDeleteMe && Instigator != None )
			{
				super.BeginFire(FireModeNum);

				if (m_RemainingAmmoInClip > 0 && PendingFire(FireModeNum) )
				{
					SendToFiringState(FireModeNum);
				}
			}
		}

	}
}

defaultproperties
{
   m_nMinShotCount=8
   m_fInnerDefaultAccuracy=0.920000
   DBWeaponId=7399
   DBXPActivityId=168
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bReloadSingles=True
   m_bCanEarlyAbortReload=True
   m_bSpawnTracerBeams=True
   m_bIsKickbackAdditive=True
   m_fDefaultAccuracy=0.850000
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=10
   m_nLowAmmoWarning=2
   m_nCarriedAmmo=30
   m_nMaxCarriedAmmo=30
   m_fReloadTime=0.600000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Shotgun:FireCameraShake'
   m_TinyWeaponsOffset=(X=15.000000,Y=3.000000,Z=-7.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=55.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.500000)
   InfoPanelDescription="Deals massive damage over short distances."
   InfoPanelDamage=7
   InfoPanelRadius=-3
   InfoPanelFireRate=4
   InfoPanelClipSize=2
   UpgradeDescription(0)="+10 AMMO"
   UpgradeDescription(1)="+1 CLIP\nSIZE"
   UpgradeDescription(2)="+10 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=7861,Modifications=((ModType=37,Value=10.000000)))
   Upgrades(1)=(DatabaseItemId=7862,Modifications=((ModType=67,Value=1.000000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=7863,Modifications=((ModType=37,Value=10.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Shotgun_Content"
   bSniping=True
   bTargetFrictionEnabled=True
   bTargetAdhesionEnabled=True
   MaxAmmoCount=5
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_Shotgun:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_Shotgun'
   MaxPitchLag=400.000000
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=2.000000,Y=-3.000000,Z=-8.000000)
   SmallWeaponsOffset=(X=6.000000,Y=1.250000,Z=0.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=()
   InstantHitDamage(0)=80.000000
   InstantHitDamage(1)=()
   InstantHitMomentum(0)=1000.000000
   InstantHitMomentum(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_Shotgun'
   InstantHitDamageTypes(1)=()
   bInstantHit=True
   WeaponRange=3000.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=2.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Shotgun"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      ReplacementPrimitive=None
      MaxDrawDistance=6000.000000
      CachedMaxDrawDistance=6000.000000
      MotionBlurScale=0.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      bAllowAmbientOcclusion=False
      Scale=1.250000
      Name="PickupMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Shotgun"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
