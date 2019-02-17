class TrDevice_ThumperD_MKD extends TrDevice_ThumperD;

defaultproperties
{
   DBWeaponId=8417
   DBXPActivityId=178
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ThumperD_MKD:FireCameraShake'
   InfoPanelDescription="Another Thumper variant, with more damage but less explosion radius."
   InfoPanelDamage=7
   InfoPanelRadius=4
   Upgrades(0)=(DatabaseItemId=8459)
   Upgrades(1)=(DatabaseItemId=8460)
   Upgrades(2)=(DatabaseItemId=8461)
   m_sContentDataClassName="TribesGameContent.TrDevice_ThumperD_MKD_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_ThumperD_MKD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_ThumperD_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_ThumperD_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ThumperD:FirstPersonMesh'
      FOV=55.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ThumperD:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Thumper DX"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ThumperD:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ThumperD:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_ThumperD_MKD"
   ObjectArchetype=TrDevice_ThumperD'TribesGame.Default__TrDevice_ThumperD'
}
