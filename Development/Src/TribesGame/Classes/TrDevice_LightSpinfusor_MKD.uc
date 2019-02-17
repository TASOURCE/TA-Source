/**
 * 
 */
class TrDevice_LightSpinfusor_MKD extends TrDevice_LightSpinfusor;

defaultproperties
{
   DBWeaponId=8415
   DBXPActivityId=143
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_LightSpinfusor_MKD:FireCameraShake'
   InfoPanelDescription="This light spinfusor has been modified for Dueling, dealing more damage on a direct hit, but having a slightly smaller explosion radius."
   InfoPanelRadius=3
   Upgrades(0)=(DatabaseItemId=8418)
   Upgrades(1)=(DatabaseItemId=8419)
   Upgrades(2)=(DatabaseItemId=8420)
   m_sContentDataClassName="TribesGameContent.TrDevice_LightSpinfusor_MKD_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_LightSpinfusor_MKD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_LightSpinfusor_MKD'
   MuzzleFlashColor=(B=200,G=255,R=170,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMortarMuzzleFlashLight'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_LightSpinfusor_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_LightSpinfusor:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_LightSpinfusor:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Dueling Spinfusor"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_LightSpinfusor:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_LightSpinfusor:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_LightSpinfusor_MKD"
   ObjectArchetype=TrDevice_LightSpinfusor'TribesGame.Default__TrDevice_LightSpinfusor'
}
