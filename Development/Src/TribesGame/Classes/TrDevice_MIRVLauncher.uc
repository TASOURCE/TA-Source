/**
 * 
 */
class TrDevice_MIRVLauncher extends TrDevice;

defaultproperties
{
   DBWeaponId=7457
   DBXPActivityId=140
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_bEndZoomOnReload=False
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=16
   m_nLowAmmoWarning=5
   m_nCarriedAmmo=15
   m_nMaxCarriedAmmo=15
   m_fReloadTime=2.750000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_MIRVLauncher:FireCameraShake'
   m_TinyWeaponsOffset=(X=12.000000,Y=3.000000,Z=-4.500000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=9.000000,Z=62.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.400000)
   InfoPanelDescription="A modified version of the Fusion Mortar, the MIRV Launcher can spread its damage over a larger area."
   InfoPanelDamage=9
   InfoPanelRadius=10
   InfoPanelFireRate=1
   InfoPanelClipSize=-3
   UpgradeDescription(0)="+5 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+5 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8073,Modifications=((ModType=30,Value=5.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8074,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8075,Modifications=((ModType=30,Value=5.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_MIRVLauncher_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_MIRVLauncher:ForceFeedbackShootingLarge'
   AttachmentClass=Class'TribesGame.TrAttachment_MIRVLauncher'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMortarMuzzleFlashLight'
   PlayerViewOffset=(X=12.000000,Y=1.600000,Z=-7.500000)
   SmallWeaponsOffset=(X=9.000000,Y=3.000000,Z=0.100000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=100,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_MIRVLauncher'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.460000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=45.000000
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
   ItemName="MIRV Launcher"
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
   Name="Default__TrDevice_MIRVLauncher"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
