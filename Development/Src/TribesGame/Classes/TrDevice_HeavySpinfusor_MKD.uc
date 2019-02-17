/**
 * 
 */
class TrDevice_HeavySpinfusor_MKD extends TrDevice_HeavySpinfusor;

defaultproperties
{
   DBWeaponId=8414
   DBXPActivityId=128
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_HeavySpinfusor_MKD:FireCameraShake'
   InfoPanelDescription="A favorite among heavies, the Devastator variant deals a little less damage overall, but packs a significantly harder punch on a direct hit, and has a larger explosion radius."
   InfoPanelDamage=7
   InfoPanelRadius=5
   Upgrades(0)=(DatabaseItemId=8447)
   Upgrades(1)=(DatabaseItemId=8448)
   Upgrades(2)=(DatabaseItemId=8449)
   m_sContentDataClassName="TribesGameContent.TrDevice_HeavySpinfusor_MKD_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_HeavySpinfusor_MKD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_HeavySpinfusor_MKD'
   MuzzleFlashColor=(B=77,G=199,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_Gold'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_HeavySpinfusor_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_HeavySpinfusor:FirstPersonMesh'
      FOV=50.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_HeavySpinfusor:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Devastator Spinfusor"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_HeavySpinfusor:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_HeavySpinfusor:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_HeavySpinfusor_MKD"
   ObjectArchetype=TrDevice_HeavySpinfusor'TribesGame.Default__TrDevice_HeavySpinfusor'
}
