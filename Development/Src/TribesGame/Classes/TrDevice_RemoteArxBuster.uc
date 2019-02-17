/**
 * 
 */
class TrDevice_RemoteArxBuster extends TrDevice;

/** Skel control for detonator hand. */
var SkelControlSingleBone DetonatorControl;
var SkelControlSingleBone DetonatorChild;

/** Is the left arm visible? */
var repnotify bool r_bIsLeftArmVisible;

/** An array of arx rounds ready for detonation */
var array<TrProj_RemoteArxBuster> RemoteArxRounds;

/** Blend node to control a detonator idle. */
var AnimNodeAdditiveBlending DetReadyAdditiveAnimNode;

/** Spinfusor idle sound. */
var SoundCue m_ArxIdleSound;

simulated function SetArxIdle(bool bEnabled)
{
	local TrPawn POwner;

	POwner = TrPawn(Instigator);
	if( POwner != None )
	{
		// Disc spinning sound.
		POwner.SetWeaponAmbientSound(bEnabled ? m_ArxIdleSound : None);
	}
}

replication
{
    if (bNetDirty && bNetOwner && Role == ROLE_Authority)
		r_bIsLeftArmVisible;
}

simulated event ReplicatedEvent(name VarName)
{   
    if(VarName == 'r_bIsLeftArmVisible')
    {
        SetLeftArmVisible(r_bIsLeftArmVisible);
        return;
    }
	else if(VarName == 'r_AmmoCount')
    {
        m_nCarriedAmmo = r_AmmoCount.CarriedAmmoCount;
		m_RemainingAmmoInClip = r_AmmoCount.ClipAmmoCount;

		if( m_RemainingAmmoInClip > 0 )
		{
			DetPoseActive(false);
		}
		else
		{
			DetPoseActive(true);
		}
        return;
    }
	super.ReplicatedEvent(VarName);
}

simulated function SetLeftArmVisible(bool bVisible)
{
	ClearTimer('HideArmTimer');

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( DetonatorControl != none )
		{
			DetonatorControl.SetSkelControlActive(!bVisible);	
		}

		if( !bVisible )
		{
			DetPoseActive(false);
		}
	}

	if( Role == ROLE_Authority )
	{
		r_bIsLeftArmVisible = bVisible;
		bNetDirty = true;
	}
}

simulated function DetPoseActive(bool bActive)
{
	if( WorldInfo.NetMode != NM_DedicatedServer && DetReadyAdditiveAnimNode != none )
	{
		if( !bActive && DetReadyAdditiveAnimNode.Child2WeightTarget != 0.0 )
		{
			DetReadyAdditiveAnimNode.SetBlendTarget(0.0, 0.25);
		}
		else if( bActive && DetReadyAdditiveAnimNode.Child2WeightTarget != 1.0 )
		{
			DetReadyAdditiveAnimNode.SetBlendTarget(1.0, 0.35);
		}
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	super.PostInitAnimTree(SkelComp);

    if( SkelComp == Mesh )
    {
		DetonatorControl = SkelControlSingleBone(SkelComp.FindSkelControl('Detonator'));
		DetonatorChild = SkelControlSingleBone(SkelComp.FindSkelControl('DetonatorChild'));
		DetReadyAdditiveAnimNode = AnimNodeAdditiveBlending(SkelComp.FindAnimNode('DetReadyAdditiveBlend'));

		SetArxIdle(true);
    }
}

simulated function int AddAmmo( int Amount )
{
	super.AddAmmo(Amount);

	if( Role == ROLE_Authority && WorldInfo.NetMode < NM_DedicatedServer )
	{
		if( m_RemainingAmmoInClip > 0 )
		{
			DetPoseActive(false);
		}
		else
		{
			DetPoseActive(true);
		}
	}

	return m_RemainingAmmoInClip;
}

function PerformInactiveReload()
{
	// Do not perform an inactive reload if rounds are out. There is a valid case where inactive reloads are
	// necessary: If a player detonates, then switches weapons before the reload happens.
	if( RemoteArxRounds.Length == 0 )
	{
		super.PerformInactiveReload();
	}
}

function RequestReload()
{
	ActivateRemoteRounds();

	super.RequestReload();
}

simulated function bool CanClientRequestReloadNow()
{
	return (GetNumRoundsCurrentlyInClip() < GetMaxAmmoCount()) && m_bAllowReloads;
}

simulated function StartFire(byte FireModeNum)
{
	local TrPlayerController TrPC;

	if( !r_bReadyToFire && m_RemainingAmmoInClip == 0 )
	{
		TrPC = TrPlayerController(Instigator.Controller);
		if( TrPC != none )
		{
			TrPC.ReloadWeapon();
		}
	}
	else
	{
		Super.StartFire(FireModeNum);
	}
}

simulated function FireAmmunition()
{
	if( Role == ROLE_Authority )
	{
		r_bReadyToFire = false;
	}
	Super.FireAmmunition();
}

simulated function Projectile ProjectileFire()
{
	local Projectile ProjCreated;
	local TrProj_RemoteArxBuster TrProj;

	ProjCreated = super.ProjectileFire();

	// Add the newly created projectile to the rounds ready to fire.
	TrProj = TrProj_RemoteArxBuster(ProjCreated);
	if (TrProj != none)
	{
		RemoteArxRounds.AddItem(TrProj);
	}

	SetLeftArmVisible(true);

	return ProjCreated;
}

simulated function ActivateRemoteRounds(optional bool bDoNoDamage = false)
{
	local int i;

	// Explode all of our arx rounds on reload.
	for (i = 0; i < RemoteArxRounds.Length; i++)
	{
		if (bDoNoDamage)
		{
			RemoteArxRounds[i].Damage = 0;
		}

		RemoteArxRounds[i].m_bIsDetonating = true;
		RemoteArxRounds[i].Explode(RemoteArxRounds[i].Location, vect(0,0,1));
	}

	// Clear the remote rounds list.
	RemoteArxRounds.Remove(0, RemoteArxRounds.Length);

	if( Role == ROLE_Authority )
	{
		SetTimer(0.75, false, 'HideArmTimer');
	}
}

simulated function HideArmTimer()
{
	SetLeftArmVisible(false);
}

simulated event Destroyed()
{
	ActivateRemoteRounds(true);

	super.Destroyed();
}

simulated state Active
{
	simulated function BeginState( Name PreviousStateName )
	{
		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			SetLeftArmVisible(r_bIsLeftArmVisible);
		}

		super.BeginState(PreviousStateName);
	}
	simulated function bool DoAutoReload()
	{
		return (super.DoAutoReload() && RemoteArxRounds.Length == 0);
	}

	simulated function BeginFire(byte FireModeNum)
	{
		if (!HasAnyAmmo())
		{
			ActivateRemoteRounds();
		}

		super.BeginFire(FireModeNum);
	}
}

simulated state WeaponConstantFiring
{
	simulated function BeginState(Name PreviousStateName)
	{
		if (m_RemainingAmmoInClip > 0)
		{
			super.BeginState(PreviousStateName);
		}
		else
		{
			RequestReload();
		}
	}
}

function OnRemoteProjectileDestroyedByOther(TrProjectile DestroyedProjectile)
{
	local int i;
	local bool bRemovedProjectile;
	local TrPlayerController TrPC;

	for (i = 0; i < RemoteArxRounds.Length; i++)
	{
		if( RemoteArxRounds[i] == DestroyedProjectile )
		{
			// Remove the projectile from the list.
			RemoteArxRounds.Remove(i, 1);
			bRemovedProjectile = true;
			break;
		}
	}

	if( bRemovedProjectile && RemoteArxRounds.Length == 0 )
	{
		// All of the projectiles that were out have been destroyed externally, so inform the instigator.
		TrPC = TrPlayerController(Instigator.Controller);
		if( TrPC != none )
		{
			TrPC.ReceiveLocalizedMessage( class'TrPromptMessage', 6);
		}

		SetLeftArmVisible(false);

		if( m_RemainingAmmoInClip == 0 && m_nCarriedAmmo > 0 )
		{
			// Since we have no more ammo to shoot in the clip, force a reload.
			RequestReload();
		}
	}
}

simulated event OnAnimPlay(AnimNodeSequence SeqNode)
{
    Super.OnAnimPlay(SeqNode);
    if( SeqNode != None && (SeqNode.AnimSeqName == 'reload' || SeqNode.AnimSeqName == 'reloadpartial') )
    {
        SetArxIdle(false);
    }
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    Super.OnAnimEnd(SeqNode, PlayedTime, ExcessTime);
    if( SeqNode != None && (SeqNode.AnimSeqName == 'reload' || SeqNode.AnimSeqName == 'reloadpartial') )
    {
        SetArxIdle(true);
    }
}

/** Called when the retrieve animation is called (not quick retrieve!) */
simulated function OnPlayRetrieveAnim()
{
	if( DetonatorControl != none )
	{
		DetonatorControl.SetSkelControlStrength(0.0, 0.0);
		DetonatorChild.SetSkelControlStrength(0.0, 0.0);
	}
}

simulated function PlayWeaponEquip()
{
    Super.PlayWeaponEquip();
    SetArxIdle(true);
}

simulated function PlayWeaponPutDown()
{
    Super.PlayWeaponPutDown();
    SetArxIdle(false);
}

simulated function PutDownFast()
{
	super.PutDownFast();
	SetArxIdle(false);
}

simulated function OnSwitchAwayFromWeapon()
{
	super.OnSwitchAwayFromWeapon();
	SetArxIdle(false);
}

defaultproperties
{
   DBWeaponId=8252
   DBXPActivityId=134
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=8
   m_nLowAmmoWarning=2
   m_nCarriedAmmo=27
   m_nMaxCarriedAmmo=27
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RemoteArxBuster:FireCameraShake'
   m_TinyWeaponsOffset=(X=12.000000,Y=0.000000,Z=-5.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=7.000000,Z=58.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.500000)
   InfoPanelDescription="The Jackal fires up to three rounds that stick to any surface, and are remote triggered for detonation. Perfect for setting up traps and destroying objectives from a safe distance."
   InfoPanelDamage=4
   InfoPanelRadius=4
   InfoPanelFireRate=6
   InfoPanelClipSize=2
   UpgradeDescription(0)="+6 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+6 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8298,Modifications=((ModType=30,Value=6.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8299,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8300,Modifications=((ModType=30,Value=6.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_RemoteArxBuster_Content"
   MaxAmmoCount=3
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_RemoteArxBuster:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_RemoteArxBuster'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashLightClass=None
   PlayerViewOffset=(X=13.000000,Y=0.000000,Z=-3.000000)
   SmallWeaponsOffset=(X=5.000000,Y=2.000000,Z=0.300000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_RemoteArxBuster'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.250000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=47.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Jackal"
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
   Name="Default__TrDevice_RemoteArxBuster"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
