/**
 * 
 */
class TrDevice_SN7_MKD extends TrDevice_SN7;

defaultproperties
{
   DBWeaponId=8404
   DBXPActivityId=162
   m_bForceReplicateAmmoOnFire=True
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SN7_MKD:FireCameraShake'
   InfoPanelDescription="Another popular Starwolf conversion, the Arctic SN7 is often carried to Blood Eagle worlds, where it inevitably trades owners."
   InfoPanelDamage=5
   InfoPanelClipSize=1
   UpgradeDescription(0)="+20 AMMO"
   Upgrades(0)=(DatabaseItemId=8456,Modifications=((Value=20.000000)))
   Upgrades(1)=(DatabaseItemId=8457)
   Upgrades(2)=(DatabaseItemId=8458)
   m_sContentDataClassName="TribesGameContent.TrDevice_SN7_MKD_Content"
   MaxAmmoCount=10
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SN7_MKD:ForceFeedbackShootingSmall'
   AttachmentClass=Class'TribesGame.TrAttachment_SN7_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_SN7_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_SN7:FirstPersonMesh'
      FOV=60.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_SN7:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Arctic SN7"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_SN7:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_SN7:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_SN7_MKD"
   ObjectArchetype=TrDevice_SN7'TribesGame.Default__TrDevice_SN7'
}
