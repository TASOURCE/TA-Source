class TrDevice_MotionSensorDeployable extends TrDevice_Mine;

defaultproperties
{
   DBWeaponId=7426
   DBXPActivityId=220
   m_nIconIndex=22
   m_MainMenuPaperDollInfo=(Translation=(X=1.000000,Y=5.000000,Z=45.000000),Rotation=(Pitch=-3640,Yaw=0,Roll=-16380),Scale=2.600000)
   m_InGamePaperDollInfo=(Translation=(X=120.000000,Y=-50.000000,Z=37.000000),Rotation=(Pitch=-3640,Yaw=8192,Roll=-16384),Scale=2.200000)
   InfoPanelDescription="Motion Sensors drain energy from enemies when tripped, and provide a warning when tripped or destroyed."
   InfoPanelDamage=1
   InfoPanelRadius=7
   UpgradeDescription(2)="+1 AMMO"
   Upgrades(0)=(DatabaseItemId=8031)
   Upgrades(1)=(DatabaseItemId=8032)
   Upgrades(2)=(IconId=4,DatabaseItemId=8033,Modifications=((ModType=29,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_MotionSensorDeployable_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_MotionSensor'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_MotionSensor'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Mine:FirstPersonMesh'
      FOV=65.000000
      AnimSets(0)=None
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Mine:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Motion Sensor"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Mine:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Mine:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_MotionSensorDeployable"
   ObjectArchetype=TrDevice_Mine'TribesGame.Default__TrDevice_Mine'
}
