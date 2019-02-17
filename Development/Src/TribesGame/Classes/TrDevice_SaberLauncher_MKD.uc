/**
 * 
 */
class TrDevice_SaberLauncher_MKD extends TrDevice_ConstantFire;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_bHasLoopingFireAnim=False
   DBWeaponId=8401
   DBXPActivityId=160
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=8
   m_nLowAmmoWarning=4
   m_nCarriedAmmo=10
   m_nMaxCarriedAmmo=10
   m_fReloadTime=1.700000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SaberLauncher_MKD:FireCameraShake'
   m_TinyWeaponsOffset=(X=10.000000,Y=0.000000,Z=-4.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=6.000000,Z=55.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=1.400000)
   m_InGamePaperDollInfo=(Scale=1.450000)
   InfoPanelDescription="The Titan is a dumb-fire rocket that travels in a straight line. It's designed with a very short fuse, to aid in mid-air suppression, and explodes on any surface contact."
   InfoPanelDamage=6
   InfoPanelRadius=5
   InfoPanelFireRate=3
   InfoPanelClipSize=-2
   UpgradeDescription(0)="+5 AMMO"
   UpgradeDescription(1)="+15% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+5 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8472,Modifications=((ModType=37,Value=5.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8473,Modifications=((ModType=73,Value=0.150000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8474,Modifications=((ModType=37,Value=5.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_SaberLauncher_MKD_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackShootingLarge'
   AttachmentClass=Class'TribesGame.TrAttachment_SaberLauncher_MKD'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=5.000000,Y=-2.000000,Z=-8.000000)
   SmallWeaponsOffset=(X=12.000000,Y=-4.000000,Z=3.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=-300,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_TrackingMissile_MKD'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.500000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:FirstPersonMesh'
      FOV=60.000000
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
   ItemName="Titan Launcher"
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
   Name="Default__TrDevice_SaberLauncher_MKD"
   ObjectArchetype=TrDevice_ConstantFire'TribesGame.Default__TrDevice_ConstantFire'
}
