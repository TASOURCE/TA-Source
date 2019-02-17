/**
 * 
 */
class TrDevice_ForceFieldDeployable extends TrDevice_Deployable;

defaultproperties
{
   c_DeployableHologramClass=Class'TribesGame.TrDeployableHologram_ForceField'
   m_vDeployVolumePlacementExtent=(X=256.000000,Y=30.000000,Z=40.000000)
   m_fOtherDeployableProximityCheck=1024.000000
   DBWeaponId=7411
   DBXPActivityId=226
   m_WeaponDeployables(0)=Class'TribesGame.TrDeployable_ForceField'
   m_WeaponDeployables(1)=()
   m_nCreditCost=500
   m_nIconIndex=11
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ForceFieldDeployable:FireCameraShake'
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=30.000000),Rotation=(Pitch=0,Yaw=0,Roll=0),Scale=0.450000,CharacterLightingContrastFactor=0.900000)
   m_InGamePaperDollInfo=(Translation=(X=120.000000,Y=-50.000000,Z=25.000000),Rotation=(Pitch=0,Yaw=0,Roll=0),Scale=0.400000)
   InfoPanelDescription="Force Fields block all weapons fire. Humans can move through force fields, but will take damage based on how fast they are going when they do."
   UpgradeDescription(0)="+350 HEALTH"
   UpgradeDescription(1)="+1 MAX\nDEPLOYED"
   UpgradeDescription(2)="+350 HEALTH"
   Upgrades(0)=(IconId=8,DatabaseItemId=8116,Modifications=((ModType=28,Value=350.000000)))
   Upgrades(1)=(IconId=7,DatabaseItemId=8117,Modifications=((ModType=45,Value=1.000000)))
   Upgrades(2)=(IconId=8,DatabaseItemId=8118,Modifications=((ModType=28,Value=350.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_ForceFieldDeployable_Content"
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Deployable:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Deployable:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Force Field"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Deployable:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Deployable:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_ForceFieldDeployable"
   ObjectArchetype=TrDevice_Deployable'TribesGame.Default__TrDevice_Deployable'
}
