/**
 * 
 */
class TrDevice_BoltLauncher extends TrDevice;

defaultproperties
{
   DBWeaponId=7425
   DBXPActivityId=141
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=8
   m_nLowAmmoWarning=5
   m_nCarriedAmmo=18
   m_nMaxCarriedAmmo=18
   m_fReloadTime=1.500000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_BoltLauncher:FireCameraShake'
   m_TinyWeaponsOffset=(X=25.000000,Y=4.000000,Z=-8.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=2.000000,Z=50.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=1.800000)
   m_InGamePaperDollInfo=(Translation=(X=120.000000,Y=-50.000000,Z=43.000000),Scale=2.000000)
   InfoPanelDescription="While some would say it's not as elegant as a disc, this Bolt packs a strong punch."
   InfoPanelDamage=7
   InfoPanelRadius=4
   InfoPanelFireRate=3
   InfoPanelClipSize=-4
   UpgradeDescription(0)="+5 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+5 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=7850,Modifications=((ModType=30,Value=5.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=7851,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=7852,Modifications=((ModType=30,Value=5.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_BoltLauncher_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_BoltLauncher:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_BoltLauncher'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashLightClass=None
   PlayerViewOffset=(X=15.000000,Y=-5.000000,Z=-7.000000)
   SmallWeaponsOffset=(X=10.000000,Y=0.000000,Z=1.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_BoltLauncher'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.460000
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
   ItemName="Bolt Launcher"
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
   Name="Default__TrDevice_BoltLauncher"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
