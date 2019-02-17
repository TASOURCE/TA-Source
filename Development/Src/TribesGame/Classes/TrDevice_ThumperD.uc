class TrDevice_ThumperD extends TrDevice;

defaultproperties
{
   DBWeaponId=7462
   DBXPActivityId=177
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=8
   m_nLowAmmoWarning=1
   m_nCarriedAmmo=10
   m_nMaxCarriedAmmo=10
   m_fReloadTime=1.500000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ThumperD:FireCameraShake'
   m_TinyWeaponsOffset=(X=10.000000,Y=2.000000,Z=-5.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=63.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=3.000000)
   m_InGamePaperDollInfo=(Scale=3.250000)
   InfoPanelDescription="A more compact version of the Thumper, the D-Variant offers less damage and knockback acceleration than a typical Spinfusor."
   InfoPanelDamage=6
   InfoPanelRadius=5
   InfoPanelFireRate=3
   InfoPanelClipSize=-2
   UpgradeDescription(0)="+5 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+5 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=7989,Modifications=((ModType=37,Value=5.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=7990,Modifications=((ModType=73,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=7991,Modifications=((ModType=37,Value=5.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_ThumperD_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_ThumperD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_ThumperD'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=20.000000,Y=3.000000,Z=-7.000000)
   SmallWeaponsOffset=(X=10.000000,Y=2.000000,Z=0.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_ThumperD'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.460000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=55.000000
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
   ItemName="Thumper D"
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
   Name="Default__TrDevice_ThumperD"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
