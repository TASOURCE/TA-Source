/**
 * 
 */
class TrDevice_RocketLauncher extends TrDevice_ConstantFire;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_bHasLoopingFireAnim=False
   DBWeaponId=8253
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=8
   m_nLowAmmoWarning=1
   m_nCarriedAmmo=27
   m_nMaxCarriedAmmo=27
   m_fReloadTime=1.800000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RocketLauncher:FireCameraShake'
   m_TinyWeaponsOffset=(X=20.000000,Y=2.000000,Z=-7.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=7.000000,Z=58.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.500000)
   Upgrades(0)=(IconId=4,DatabaseItemId=8301,Modifications=((ModType=30,Value=6.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8302,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8303,Modifications=((ModType=30,Value=6.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_RocketLauncher_Content"
   MaxAmmoCount=3
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_RocketLauncher'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashLightClass=None
   PlayerViewOffset=(X=10.000000,Y=1.000000,Z=-3.000000)
   SmallWeaponsOffset=(X=5.000000,Y=3.000000,Z=1.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_RocketLauncher'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.250000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:FirstPersonMesh'
      FOV=47.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_RocketLauncher"
   ObjectArchetype=TrDevice_ConstantFire'TribesGame.Default__TrDevice_ConstantFire'
}
