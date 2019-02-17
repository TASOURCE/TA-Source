class TrVehicleWeapon_BeowulfGunner extends TrVehicleWeapon_FullAuto
	HideDropDown;

var TrSkelControl_SpinControl m_BarrelSpinControl;

simulated function InitVehicleGun()
{
	super.InitVehicleGun();

	if (MyVehicle != none && MyVehicle.Mesh != none)
	{
        m_BarrelSpinControl = TrSkelControl_SpinControl(MyVehicle.Mesh.FindSkelControl(m_WeaponSpinControl));
	}
}

simulated function Activate()
{
	super.Activate();

	InitVehicleGun();
}

simulated state WeaponFullAutoFiring
{
	simulated function BeginState(name PreviousStateName)
	{
		super.BeginState(PreviousStateName);

		if (m_BarrelSpinControl != none)
		{
			m_BarrelSpinControl.Spin(true);
		}
	}

	simulated function EndState(name NextStateName)
	{
		super.EndState(NextStateName);

		if (m_BarrelSpinControl != none)
		{
			m_BarrelSpinControl.Spin(false);
		}
	}
}

defaultproperties
{
   WeaponFireFullAutoSnd(0)=None
   DBWeaponId=7405
   m_nReticuleIndex=2
   m_fDefaultAccuracy=0.980000
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.110000
   m_fAccuracyCorrectionRate=0.190000
   m_bSpawnTracers=False
   m_bSpawnTracerBeams=True
   m_bCanZoom=True
   m_nLowAmmoWarning=2
   m_nCarriedAmmo=100000
   m_fReloadTime=4.000000
   m_WeaponSpinControl="GunBarrelSpin"
   FireTriggerTags(0)="MuzzleFlashGunner"
   FireTriggerTags(1)="MuzzleFlashGunner"
   ImpactEffects(0)=(MaterialType="Composite")
   ImpactEffects(1)=(MaterialType="Concrete")
   ImpactEffects(2)=(MaterialType="Dirt")
   ImpactEffects(3)=(MaterialType="Grass")
   ImpactEffects(4)=(MaterialType="Metal")
   ImpactEffects(5)=(MaterialType="MetalGrate")
   ImpactEffects(6)=(MaterialType="Rock")
   ImpactEffects(7)=(MaterialType="Water")
   MaxFinalAimAdjustment=0.500000
   VehicleClass=Class'TribesGame.TrVehicle_Beowulf'
   bSniping=True
   MaxAmmoCount=100
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrVehicleWeapon_BeowulfGunner:ForceFeedbackWaveformShooting1'
   EffectSockets(0)="WSO_Emit02"
   EffectSockets(1)="WSO_Emit02"
   MuzzleFlashSocket="WSO_Emit02"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   aimerror=750.000000
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponProjectiles(0)=Class'TribesGame.TrProj_BeowulfGunner'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.110000
   FireInterval(1)=()
   bInstantHit=True
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon_FullAuto:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon_FullAuto:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon_FullAuto:PickupMesh'
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
      Name="PickupMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon_FullAuto:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrVehicleWeapon_BeowulfGunner"
   ObjectArchetype=TrVehicleWeapon_FullAuto'TribesGame.Default__TrVehicleWeapon_FullAuto'
}
