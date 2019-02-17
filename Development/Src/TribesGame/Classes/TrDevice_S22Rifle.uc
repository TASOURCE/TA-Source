/**
 * 
 */
class TrDevice_S22Rifle extends TrDevice;

simulated function InstantFire()
{
	super.InstantFire();
	StopFire(0);
}

defaultproperties
{
   DBWeaponId=7424
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_fAccuracyLossOnShot=0.045000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=3
   m_nLowAmmoWarning=5
   m_nCarriedAmmo=180
   m_nMaxCarriedAmmo=180
   m_fPctTimeBeforeReload=0.588000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_S22Rifle:FireCameraShake'
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=45.000000),Rotation=(Pitch=4004,Yaw=-16384,Roll=0),Scale=2.600000)
   Upgrades(0)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(1)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(2)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(3)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(4)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   m_sContentDataClassName="TribesGameContent.TrDevice_S22Rifle_Content"
   bSniping=True
   MaxAmmoCount=22
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_S22Rifle:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_S22Rifle'
   MaxPitchLag=-600.000000
   MaxYawLag=-600.000000
   RotChgSpeed=2.500000
   ReturnChgSpeed=3.500000
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=255,R=255,A=255)
   MuzzleFlashDuration=0.500000
   PlayerViewOffset=(X=-3.000000,Y=-1.250000,Z=-2.500000)
   SmallWeaponsOffset=(X=8.000000,Y=2.000000,Z=-0.500000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=100,Yaw=0,Roll=0)
   FireInterval(0)=0.100000
   FireInterval(1)=()
   InstantHitDamage(0)=120.000000
   InstantHitDamage(1)=()
   InstantHitMomentum(0)=1000.000000
   InstantHitMomentum(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_S22Rifle'
   InstantHitDamageTypes(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   bInstantHit=True
   WeaponRange=10000.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=65.000000
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
   ItemName="S22 Rifle"
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
   Name="Default__TrDevice_S22Rifle"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
