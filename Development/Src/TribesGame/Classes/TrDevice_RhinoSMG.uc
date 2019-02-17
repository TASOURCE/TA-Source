/**
 * 
 */
class TrDevice_RhinoSMG extends TrDevice_ConstantFire;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_bHasLoopingFireAnim=False
   DBWeaponId=7397
   DBXPActivityId=135
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bHighlightEnemies=False
   m_bIsKickbackAdditive=True
   m_fDefaultAccuracy=0.980000
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.110000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=20
   m_nLowAmmoWarning=12
   m_nCarriedAmmo=156
   m_nMaxCarriedAmmo=156
   m_fReloadTime=1.800000
   m_fPctTimeBeforeReload=0.588000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RhinoSMG:FireCameraShake'
   m_TinyWeaponsOffset=(X=6.000000,Y=4.000000,Z=-3.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=60.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.800000)
   m_InGamePaperDollInfo=(Scale=3.000000)
   InfoPanelDescription="A silenced SMG, the Rhino has a low report, revealing the Infiltrator from stealth for only a few seconds when fired."
   InfoPanelDamage=2
   InfoPanelRadius=-4
   InfoPanelFireRate=9
   InfoPanelClipSize=5
   UpgradeDescription(0)="+52 AMMO"
   UpgradeDescription(1)="+4 CLIP\nSIZE"
   UpgradeDescription(2)="+52 AMMO"
   UpgradeDescription(3)="-15% RELOAD\nTIME"
   Upgrades(0)=(IconId=4,DatabaseItemId=7960,Modifications=((ModType=30,Value=52.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=7961,Modifications=((ModType=64,Value=4.000000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=7962,Modifications=((ModType=30,Value=52.000000)))
   Upgrades(3)=(IconId=10,DatabaseItemId=7963,Modifications=((ModType=31,Value=0.150000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_RhinoSMG_Content"
   bSniping=True
   bTargetFrictionEnabled=True
   bTargetAdhesionEnabled=True
   MaxAmmoCount=26
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_RhinoSMG'
   MaxPitchLag=-600.000000
   MaxYawLag=-600.000000
   RotChgSpeed=2.500000
   ReturnChgSpeed=3.500000
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashLightClass=None
   PlayerViewOffset=(X=-5.000000,Y=2.000000,Z=-5.000000)
   SmallWeaponsOffset=(X=1.000000,Y=2.000000,Z=1.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_RhinoSMG'
   WeaponProjectiles(1)=()
   FireOffset=(X=3.000000,Y=0.000000,Z=-0.000000)
   bInstantHit=True
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:FirstPersonMesh'
      FOV=65.000000
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
   ItemName="Rhino SMG"
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
   Name="Default__TrDevice_RhinoSMG"
   ObjectArchetype=TrDevice_ConstantFire'TribesGame.Default__TrDevice_ConstantFire'
}
