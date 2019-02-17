/**
 * 
 */
class TrDevice_PlasmaCannon extends TrDevice_ConstantFire;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_bHasLoopingFireAnim=False
   DBWeaponId=8250
   DBXPActivityId=158
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=24
   m_nLowAmmoWarning=4
   m_nCarriedAmmo=30
   m_nMaxCarriedAmmo=30
   m_fReloadTime=2.750000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_PlasmaCannon:FireCameraShake'
   m_TinyWeaponsOffset=(X=11.000000,Y=3.000000,Z=-3.500000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=7.000000,Z=58.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.500000)
   InfoPanelDescription="Big brother to the Plasma Gun, the Plasma Cannon is a flexible weapon, firing massive balls of energy that explode on contact."
   InfoPanelDamage=5
   InfoPanelRadius=2
   InfoPanelFireRate=3
   InfoPanelClipSize=3
   UpgradeDescription(0)="+10 AMMO"
   UpgradeDescription(1)="+2 CLIP\nSIZE"
   UpgradeDescription(2)="+20 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8292,Modifications=((ModType=37,Value=10.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=8293,Modifications=((ModType=67,Value=2.000000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8294,Modifications=((ModType=37,Value=20.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_PlasmaCannon_Content"
   MaxAmmoCount=10
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_PlasmaCannon'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashLightClass=None
   PlayerViewOffset=(X=12.000000,Y=0.000000,Z=-4.500000)
   SmallWeaponsOffset=(X=8.000000,Y=3.000000,Z=1.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_PlasmaCannon'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.850000
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
   ItemName="Plasma Cannon"
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
   Name="Default__TrDevice_PlasmaCannon"
   ObjectArchetype=TrDevice_ConstantFire'TribesGame.Default__TrDevice_ConstantFire'
}
