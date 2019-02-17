/**
 * 
 */
class TrDevice_PrismMineDeployable extends TrDevice_Claymore;

defaultproperties
{
   DBWeaponId=7440
   DBXPActivityId=199
   m_nCarriedAmmo=2
   m_nMaxCarriedAmmo=2
   m_nIconIndex=27
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=8192,Yaw=-24576,Roll=0),Scale=2.750000)
   m_InGamePaperDollInfo=(Rotation=(Pitch=8192,Yaw=-24576,Roll=0),Scale=2.750000)
   InfoPanelDescription="Several Tribal curses were invented just to describe Infiltrators who sneak around enemy bases placing mines."
   InfoPanelRadius=7
   Upgrades(0)=(DatabaseItemId=7974)
   Upgrades(1)=(DatabaseItemId=7975)
   Upgrades(2)=(DatabaseItemId=7976)
   m_sContentDataClassName="TribesGameContent.TrDevice_PrismMineDeployable_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_PrismMine'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_PrismMine'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Prism Mine"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_PrismMineDeployable"
   ObjectArchetype=TrDevice_Claymore'TribesGame.Default__TrDevice_Claymore'
}
