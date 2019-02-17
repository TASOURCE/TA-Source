/**
 * 
 */
class TrDevice_HeavyAPGrenade_MKD extends TrDevice_HeavyAPGrenade;

defaultproperties
{
   DBWeaponId=8394
   DBXPActivityId=204
   InfoPanelDescription="AP Grenades deal massive damage to humans, but are very poor against Armored targets. This variant has a larger explosion radius."
   InfoPanelDamage=9
   InfoPanelRadius=8
   Upgrades(0)=(DatabaseItemId=8499)
   Upgrades(1)=(DatabaseItemId=8500)
   Upgrades(2)=(DatabaseItemId=8501)
   m_sContentDataClassName="TribesGameContent.TrDevice_HeavyAPGrenade_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_HeavyAPGrenade_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_HeavyAPGrenade_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_HeavyAPGrenade:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_HeavyAPGrenade:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Heavy AP-XL"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_HeavyAPGrenade:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_HeavyAPGrenade:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_HeavyAPGrenade_MKD"
   ObjectArchetype=TrDevice_HeavyAPGrenade'TribesGame.Default__TrDevice_HeavyAPGrenade'
}
