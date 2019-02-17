/**
 * 
 */
class TrDevice_ConcussionGrenade_MKD extends TrDevice_ConcussionGrenade;

defaultproperties
{
   DBWeaponId=8396
   DBXPActivityId=206
   m_nCarriedAmmo=2
   m_nMaxCarriedAmmo=2
   InfoPanelDescription="Like the Impact Nitron, Compact Nitrons deal little damage but force flag drops. This variant has significantly less knockback, but the compact size allows 1 extra Nitron to be carried."
   InfoPanelRadius=5
   InfoPanelClipSize=-2
   Upgrades(0)=(DatabaseItemId=8479)
   Upgrades(1)=(DatabaseItemId=8480)
   Upgrades(2)=(DatabaseItemId=8481)
   m_sContentDataClassName="TribesGameContent.TrDevice_ConcussionGrenade_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_ConcussionGrenade_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_ConcussionGrenade_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConcussionGrenade:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConcussionGrenade:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Compact Nitron"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ConcussionGrenade:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ConcussionGrenade:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_ConcussionGrenade_MKD"
   ObjectArchetype=TrDevice_ConcussionGrenade'TribesGame.Default__TrDevice_ConcussionGrenade'
}
