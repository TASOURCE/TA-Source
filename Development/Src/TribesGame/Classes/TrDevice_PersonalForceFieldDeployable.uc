/**
 * 
 */
class TrDevice_PersonalForceFieldDeployable extends TrDevice_Deployable;

defaultproperties
{
   c_DeployableHologramClass=Class'TribesGame.TrDeployableHologram_PersonalForceField'
   m_fOtherDeployableProximityCheck=1024.000000
   DBWeaponId=7460
   DBXPActivityId=226
   m_WeaponDeployables(0)=Class'TribesGame.TrDeployable_PersonalForceField'
   m_WeaponDeployables(1)=()
   m_nCreditCost=500
   m_nIconIndex=11
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_PersonalForceFieldDeployable:FireCameraShake'
   Upgrades(0)=(DatabaseItemId=8116,Modifications=((ModType=1)))
   Upgrades(1)=(DatabaseItemId=8117,Modifications=((ModType=1)))
   Upgrades(2)=(DatabaseItemId=8118,Modifications=((ModType=1)))
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
   ItemName="Personal Forcefield"
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
   Name="Default__TrDevice_PersonalForceFieldDeployable"
   ObjectArchetype=TrDevice_Deployable'TribesGame.Default__TrDevice_Deployable'
}
