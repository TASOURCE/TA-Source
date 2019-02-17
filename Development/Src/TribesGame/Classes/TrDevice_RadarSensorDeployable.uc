/**
 * 
 */
class TrDevice_RadarSensorDeployable extends TrDevice_Deployable;

defaultproperties
{
   c_DeployableHologramClass=Class'TribesGame.TrDeployableHologram_RadarSensor'
   m_fOtherDeployableProximityCheck=64.000000
   m_WeaponDeployables(0)=Class'TribesGame.TrDeployable_RadarSensor'
   m_WeaponDeployables(1)=()
   m_nCreditCost=500
   m_nIconIndex=15
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RadarSensorDeployable:FireCameraShake'
   Upgrades(0)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(1)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(2)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(3)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(4)=(DatabaseItemId=99999,Modifications=((ModType=1)))
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
   ItemName="Radar Sensor"
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
   Name="Default__TrDevice_RadarSensorDeployable"
   ObjectArchetype=TrDevice_Deployable'TribesGame.Default__TrDevice_Deployable'
}
