/**
 * 
 */
class TrDevice_SpikeGrenade_MKD extends TrDevice_SpikeGrenade;

defaultproperties
{
   DBWeaponId=8397
   DBXPActivityId=193
   InfoPanelDescription="This Fractal Grenade has a slightly longer duration, but does less damage per blast."
   InfoPanelDamage=9
   Upgrades(0)=(DatabaseItemId=8505)
   Upgrades(1)=(DatabaseItemId=8506)
   Upgrades(2)=(DatabaseItemId=8507)
   m_sContentDataClassName="TribesGameContent.TrDevice_SpikeGrenade_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_SpikeGrenade_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_SpikeGrenade_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_SpikeGrenade:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_SpikeGrenade:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Extended Fractal"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_SpikeGrenade:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_SpikeGrenade:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_SpikeGrenade_MKD"
   ObjectArchetype=TrDevice_SpikeGrenade'TribesGame.Default__TrDevice_SpikeGrenade'
}
