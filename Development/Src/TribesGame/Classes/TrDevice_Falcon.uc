/**
 * 
 */
class TrDevice_Falcon extends TrDevice_ConstantFire;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_bHasLoopingFireAnim=False
   DBWeaponId=7419
   DBXPActivityId=173
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_fDefaultAccuracy=0.980000
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.110000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=20
   m_nCarriedAmmo=100
   m_nMaxCarriedAmmo=100
   m_fReloadTime=1.800000
   m_fPctTimeBeforeReload=0.588000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Falcon:FireCameraShake'
   m_TinyWeaponsOffset=(X=15.000000,Y=0.000000,Z=-6.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16380,Roll=0),Scale=2.600000)
   InfoPanelDescription="A fully automatic Pistol, the Falcon adds versatility to any Sentinel caught in a duel."
   InfoPanelDamage=2
   InfoPanelRadius=-4
   InfoPanelFireRate=8
   InfoPanelClipSize=4
   UpgradeDescription(0)="+40 AMMO"
   UpgradeDescription(1)="+4 CLIP\nSIZE"
   UpgradeDescription(2)="+40 AMMO"
   UpgradeDescription(3)="-15% RELOAD\nTIME"
   Upgrades(0)=(IconId=4,DatabaseItemId=7939,Modifications=((ModType=37,Value=40.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=7940,Modifications=((ModType=67,Value=4.000000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=7941,Modifications=((ModType=37,Value=40.000000)))
   Upgrades(3)=(IconId=10,DatabaseItemId=7942,Modifications=((ModType=36,Value=0.150000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Falcon_Content"
   bSniping=True
   MaxAmmoCount=20
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackShootingSmall'
   AttachmentClass=Class'TribesGame.TrAttachment_Falcon'
   MaxPitchLag=-600.000000
   MaxYawLag=-600.000000
   RotChgSpeed=2.500000
   ReturnChgSpeed=3.500000
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=12.000000,Y=2.000000,Z=-6.000000)
   SmallWeaponsOffset=(X=10.000000,Y=1.000000,Z=1.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=-300,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Falcon'
   WeaponProjectiles(1)=()
   FireOffset=(X=3.000000,Y=0.000000,Z=-0.000000)
   bInstantHit=True
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
   ItemName="Falcon"
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
   Name="Default__TrDevice_Falcon"
   ObjectArchetype=TrDevice_ConstantFire'TribesGame.Default__TrDevice_ConstantFire'
}
