/**
 * Also known as the BXT1
 */
class TrDevice_SniperRifle extends TrDevice;

/** Maxiumum damage when fully charged. */
var float m_fMaxAimedDamage;

/** The current state of the aim charged. */
var float m_fAimChargeDeltaTime;

/** How long to get to fully charged state in zoom mode. */
var float r_fAimChargeTime;

/** Coefficients for charge-up time */
var float m_fMultCoeff;
var float m_fDivCoeff;

/** Handles playing the scope charge sound. */
var AudioComponent m_ScopeChargeSound;

replication
{
	if (bNetDirty && bNetOwner && Role == ROLE_Authority)
		r_fAimChargeTime;
}

simulated function OnSwitchToWeapon()
{
	m_fAimChargeDeltaTime = 0.0f;

	super.OnSwitchToWeapon();
}

simulated function OnSwitchAwayFromWeapon()
{
	m_fAimChargeDeltaTime = 0.0f;

	super.OnSwitchAwayFromWeapon();
}

simulated function InstantFire()
{
	super.InstantFire();
	StopFire(0);

	// Reset the aim charge.
	if (Role < ROLE_Authority)
	{
		m_fAimChargeDeltaTime = 0.0f;
	}
}

/** Gives the chance for a device to modify the configured hit damage, i.e. via scope */
function float ModifyInstantHitDamage(byte FiringMode, ImpactInfo Impact, float damage)
{
	local float AimChargePct;
	local TrPlayerController PC;

	PC = TrPlayerController(Instigator.Controller);

	// Are we zoomed in?
	if( PC != none && PC.m_ZoomState != ZST_NotZoomed )
	{
		// Calculate the aim charge percent.
		//Old Linear Scale: AimChargePct = FMin(r_fAimChargeTime, m_fAimChargeDeltaTime) / r_fAimChargeTime;
		//Polynomial Scale, 16x^2
		AimChargePct = FMin(r_fAimChargeTime, m_fAimChargeDeltaTime);
		AimChargePct = FMin((m_fMultCoeff * AimChargePct * AimChargePct) / m_fDivCoeff, 1.0f);

		// Apply the increase in damage based on the aim charge.
		if (AimChargePct > 0 && r_fAimChargeTime > 0)
		{
			if (m_fMaxAimedDamage > damage)
			{
				damage += (m_fMaxAimedDamage - damage) * AimChargePct;
			}
		}
	}

	// Reset the aim charge.
	m_fAimChargeDeltaTime = 0.0f;

    return super.ModifyInstantHitDamage(FiringMode,Impact,damage);
}

simulated function StartFire(byte FireModeNum)
{
	local TrPlayerController PC;

	if( WorldInfo.NetMode != NM_DedicatedServer && !IsTimerActive('RefireCheckTimer') )
	{
		PC = TrPlayerController(Instigator.Controller);
		if( PC != none )
		{
			PC.ResetZoomDuration(true);
		}
	}

	super.StartFire(FireModeNum);
}

// Used for calculating the HUD bar zoom intensity.
simulated function float CalcHUDAimChargePercent()
{
    if (WorldInfo.NetMode != NM_DedicatedServer && r_fAimChargeTime > 0)
    {
        return m_fAimChargeDeltaTime / r_fAimChargeTime;
    }
    
    return 0.0f;
}

simulated event Tick(float DeltaTime)
{
	local float InterpDeltaTime;
	local TrPlayerController TrPC;
	local TrPawn TrPOwner;

	InterpDeltaTime = DeltaTime;

	// Make sure we have a valid owner and controller.
	TrPOwner = TrPawn(Owner);
	if (TrPOwner == none)
	{
		super.Tick(DeltaTime);
		return;
	}
	TrPC = TrPlayerController(Instigator.Controller);
	if (TrPC == none)
	{
		super.Tick(DeltaTime);
		return;
	}

	// If we aren't zoomed, no charge.
	if (TrPC.m_ZoomState == ZST_NotZoomed)
	{
		m_fAimChargeDeltaTime = 0.0f;
	}
	else
	{
		// Is the charge time slower?
		if (TrPOwner.Physics == PHYS_Falling || 
			TrPOwner.Physics == PHYS_Flying || 
			VSizeSq(TrPOwner.Velocity) > 490000)
		{
			InterpDeltaTime *= 0.5f;
		}

		// Increment the charge time.
		m_fAimChargeDeltaTime += InterpDeltaTime;
	}

	if (m_fAimChargeDeltaTime >= r_fAimChargeTime)
	{
		StopScopeRechargeSound();
	}

	super.Tick(DeltaTime);
}

simulated function PlayScopeRechargeSound()
{
	if( m_ScopeChargeSound != none )
	{
		m_ScopeChargeSound.Stop();
		// Need to call stop here to cancel any previous fade out.
		m_ScopeChargeSound.FadeIn(0.1f, 1.0f);
	}
}

simulated function StopScopeRechargeSound()
{
	if( m_ScopeChargeSound != none && m_ScopeChargeSound.IsPlaying() && m_ScopeChargeSound.FadeOutTargetVolume != 0.0f )
	{
		m_ScopeChargeSound.FadeOut(0.2f, 0.0f);
	}
}

defaultproperties
{
   m_fMaxAimedDamage=500.000000
   r_fAimChargeTime=2.500000
   m_fMultCoeff=16.000000
   m_fDivCoeff=100.000000
   Begin Object Class=AudioComponent Name=ScopeChargeSound
      Name="ScopeChargeSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   m_ScopeChargeSound=ScopeChargeSound
   DBWeaponId=7400
   DBXPActivityId=124
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bSpawnTracerBeams=True
   m_bIsKickbackAdditive=True
   m_bAllowHoldDownFire=False
   m_bAllowFireWhileZoomed=True
   m_fAccuracyLossOnShot=0.050000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=12
   m_nAltReticuleIndex=21
   m_nLowAmmoWarning=1
   m_nCarriedAmmo=24
   m_nMaxCarriedAmmo=24
   m_fReloadTime=2.000000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=None
   m_TinyWeaponsOffset=(X=13.000000,Y=2.000000,Z=-6.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.000000)
   InfoPanelDescription="A Sniper Rifle, the BXT1 does more damage the longer you are in Scope."
   InfoPanelDamage=6
   InfoPanelRadius=-9
   InfoPanelFireRate=2
   InfoPanelClipSize=1
   UpgradeDescription(0)="+8 AMMO"
   UpgradeDescription(1)="+1 CLIP\nSIZE"
   UpgradeDescription(2)="-20% RANGE\nFALLOFF"
   UpgradeDescription(3)="-30% RELOAD\nTIME"
   Upgrades(0)=(IconId=4,DatabaseItemId=7927,Modifications=((ModType=30,Value=8.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=7929,Modifications=((ModType=64,Value=1.000000)))
   Upgrades(2)=(IconId=7,DatabaseItemId=7930,Modifications=((ModType=54,Value=0.200000)))
   Upgrades(3)=(IconId=10,DatabaseItemId=7931,Modifications=((ModType=31,Value=0.300000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_SniperRifle_Content"
   bSniping=True
   bTargetFrictionEnabled=True
   bTargetAdhesionEnabled=True
   MaxAmmoCount=4
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SniperRifle:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_SniperRifle'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=255,R=255,A=255)
   MuzzleFlashDuration=0.500000
   PlayerViewOffset=(X=3.000000,Y=1.000000,Z=-7.000000)
   SmallWeaponsOffset=(X=6.000000,Y=2.000000,Z=3.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   InstantHitDamage(0)=10.000000
   InstantHitDamage(1)=()
   InstantHitMomentum(0)=1000.000000
   InstantHitMomentum(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_SniperRifle'
   InstantHitDamageTypes(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   bInstantHit=True
   WeaponRange=100000.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=60.000000
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
   ItemName="BXT1 Rifle"
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
   Components(0)=ScopeChargeSound
   Name="Default__TrDevice_SniperRifle"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
