/**
 * 
 */
class TrDevice_PhaseRifle extends TrDevice;

/** How much damage to apply per energy. */
var float m_DamagePerEnergy;

/** The maximum amount of energy to consume. */
var float m_MaxEnergyConsumed;

simulated function InstantFire()
{
	super.InstantFire();

	StopFire(0);
}

/** Gives the chance for a device to modify the configured hit damage, i.e. via scope */
function float ModifyInstantHitDamage(byte FiringMode, ImpactInfo Impact, float damage)
{
	local float EnergyOnFire;
	local TrPawn TrP;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		EnergyOnFire = FMin(TrP.GetCurrentPowerPool(), m_MaxEnergyConsumed);
		TrP.ConsumePowerPool(EnergyOnFire);
	}

	damage += EnergyOnFire * m_DamagePerEnergy;

	return super.ModifyInstantHitDamage(FiringMode,Impact,damage);
}

defaultproperties
{
   m_DamagePerEnergy=5.000000
   m_MaxEnergyConsumed=90.000000
   DBWeaponId=7395
   DBXPActivityId=148
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bSpawnTracerBeams=True
   m_bIsKickbackAdditive=True
   m_bAllowHoldDownFire=False
   m_bAllowFireWhileZoomed=True
   m_fAccuracyLossOnShot=0.050000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=12
   m_nAltReticuleIndex=22
   m_nLowAmmoWarning=1
   m_nCarriedAmmo=24
   m_nMaxCarriedAmmo=24
   m_fReloadTime=2.000000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=None
   m_TinyWeaponsOffset=(X=16.000000,Y=3.000000,Z=-8.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=55.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.200000)
   InfoPanelDescription="A precision sniping weapon, the Phase Rifle uses energy to fire. Unlike the BXT1 it does not need to be scoped for full damage and can fire from the hip."
   InfoPanelDamage=6
   InfoPanelRadius=-9
   InfoPanelFireRate=3
   InfoPanelClipSize=1
   UpgradeDescription(0)="+8 AMMO"
   UpgradeDescription(1)="+1 CLIP\nSIZE"
   UpgradeDescription(2)="-20% RANGE\nFALLOFF"
   UpgradeDescription(3)="-30% RELOAD\nTIME"
   Upgrades(0)=(IconId=4,DatabaseItemId=7932,Modifications=((ModType=30,Value=8.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=7933,Modifications=((ModType=64,Value=1.000000)))
   Upgrades(2)=(IconId=7,DatabaseItemId=7934,Modifications=((ModType=54,Value=0.200000)))
   Upgrades(3)=(IconId=10,DatabaseItemId=7935,Modifications=((ModType=31,Value=0.300000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_PhaseRifle_Content"
   bSniping=True
   bTargetFrictionEnabled=True
   bTargetAdhesionEnabled=True
   MaxAmmoCount=4
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_PhaseRifle:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_PhaseRifle'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=0,G=10,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_NovaColt'
   PlayerViewOffset=(X=6.000000,Y=5.000000,Z=-3.000000)
   SmallWeaponsOffset=(X=6.000000,Y=1.000000,Z=1.500000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   InstantHitDamage(0)=60.000000
   InstantHitDamage(1)=()
   InstantHitMomentum(0)=1000.000000
   InstantHitMomentum(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_PhaseRifle'
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
   ItemName="Phase Rifle"
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
   Name="Default__TrDevice_PhaseRifle"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
