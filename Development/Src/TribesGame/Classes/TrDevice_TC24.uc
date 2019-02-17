class TrDevice_TC24 extends TrDevice;

defaultproperties
{
   DBWeaponId=8699
   DBXPActivityId=267
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=8
   m_nLowAmmoWarning=1
   m_nCarriedAmmo=24
   m_nMaxCarriedAmmo=24
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_TC24:FireCameraShake'
   m_TinyWeaponsOffset=(X=15.000000,Y=2.000000,Z=-6.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.100000)
   m_InGamePaperDollInfo=(Scale=2.100000)
   InfoPanelDescription="The TC24 can fire four short range explosive projectiles before having to reload."
   InfoPanelDamage=5
   InfoPanelRadius=2
   InfoPanelFireRate=5
   InfoPanelClipSize=5
   UpgradeDescription(0)="+4 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+4 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8709,Modifications=((ModType=30,Value=4.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8710,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8711,Modifications=((ModType=30,Value=4.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_TC24_Content"
   MaxAmmoCount=4
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_TC24:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_TC24'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=15.000000,Y=0.000000,Z=-3.000000)
   SmallWeaponsOffset=(X=12.000000,Y=3.000000,Z=1.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_TC24'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.600000
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
   ItemName="TC24"
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
   Name="Default__TrDevice_TC24"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
