/**
 * 
 */
class TrDevice_BaseTurretDeployable extends TrDevice_Deployable;

defaultproperties
{
   c_DeployableHologramClass=Class'TribesGame.TrDeployableHologram_BaseTurret'
   m_fPlacementScale=5.000000
   m_fOtherDeployableProximityCheck=3000.000000
   m_fOutsideCheckDistance=2048.000000
   DBWeaponId=7412
   m_WeaponDeployables(0)=Class'TribesGame.TrDeployable_BaseTurret'
   m_WeaponDeployables(1)=()
   m_nCreditCost=4000
   m_nIconIndex=138
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_BaseTurretDeployable:FireCameraShake'
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
   ItemName="Base Turret"
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
   Name="Default__TrDevice_BaseTurretDeployable"
   ObjectArchetype=TrDevice_Deployable'TribesGame.Default__TrDevice_Deployable'
}
