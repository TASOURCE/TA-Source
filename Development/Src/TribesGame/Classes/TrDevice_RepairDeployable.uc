class TrDevice_RepairDeployable extends TrDevice_Mine;

defaultproperties
{
   DBWeaponId=8698
   DBXPActivityId=266
   m_nIconIndex=22
   m_MainMenuPaperDollInfo=(Translation=(X=1.000000,Y=5.000000,Z=45.000000),Rotation=(Pitch=-3640,Yaw=0,Roll=0),Scale=2.600000)
   m_InGamePaperDollInfo=(Translation=(X=120.000000,Y=-50.000000,Z=37.000000),Rotation=(Pitch=-3640,Yaw=0,Roll=0),Scale=2.200000)
   InfoPanelDescription="This small device will automatically repair any damaged structures or targets around it."
   InfoPanelDamage=0
   InfoPanelRadius=0
   InfoPanelFireRate=0
   InfoPanelClipSize=0
   UpgradeDescription(0)="+5% REPAIR"
   UpgradeDescription(1)="+5% REPAIR"
   UpgradeDescription(2)="+5% REPAIR"
   Upgrades(0)=(IconId=10,DatabaseItemId=8706,Modifications=((ModType=92,Value=0.050000)))
   Upgrades(1)=(IconId=10,DatabaseItemId=8707,Modifications=((ModType=92,Value=0.050000)))
   Upgrades(2)=(IconId=10,DatabaseItemId=8708,Modifications=((ModType=92,Value=0.050000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_RepairDeployable_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_RepairDeployable'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_RepairDeployable'
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
   ItemName="Repair Kit"
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
   Name="Default__TrDevice_RepairDeployable"
   ObjectArchetype=TrDevice_Mine'TribesGame.Default__TrDevice_Mine'
}
