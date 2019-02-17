/**
 * 
 */
class TrDevice_PlasmaGun extends TrDevice_ConstantFire;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_bHasLoopingFireAnim=False
   DBWeaponId=8251
   DBXPActivityId=147
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=24
   m_nLowAmmoWarning=3
   m_nCarriedAmmo=30
   m_nMaxCarriedAmmo=30
   m_fReloadTime=1.800000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_PlasmaGun:FireCameraShake'
   m_TinyWeaponsOffset=(X=20.000000,Y=2.000000,Z=-7.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=7.000000,Z=58.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=16384),Scale=2.750000)
   m_InGamePaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=16384),Scale=2.750000)
   InfoPanelDescription="A flexible weapon, the Plasma Gun fires massive balls of energy that explode on contact, with excellent rate of fire compared to Spinfusors."
   InfoPanelDamage=4
   InfoPanelRadius=2
   InfoPanelFireRate=4
   InfoPanelClipSize=4
   UpgradeDescription(0)="+10 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+10 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8295,Modifications=((ModType=30,Value=10.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8296,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8297,Modifications=((ModType=30,Value=10.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_PlasmaGun_Content"
   MaxAmmoCount=10
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_PlasmaGun'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=77,G=199,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_Gold'
   PlayerViewOffset=(X=15.000000,Y=2.500000,Z=-2.000000)
   SmallWeaponsOffset=(X=5.000000,Y=4.000000,Z=1.900000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_PlasmaGun'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.740000
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
   ItemName="Plasma Gun"
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
   Name="Default__TrDevice_PlasmaGun"
   ObjectArchetype=TrDevice_ConstantFire'TribesGame.Default__TrDevice_ConstantFire'
}
