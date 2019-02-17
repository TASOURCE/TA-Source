/**
 * 
 */
class TrDevice_Grenade_MKD extends TrDevice_Grenade;

defaultproperties
{
   DBWeaponId=8393
   DBXPActivityId=197
   InfoPanelDescription="A manufacturing defect causes this grenade to explode in a much larger radius than normal. It's actually quite popular."
   InfoPanelDamage=8
   InfoPanelRadius=8
   Upgrades(0)=(DatabaseItemId=8502)
   Upgrades(1)=(DatabaseItemId=8503)
   Upgrades(2)=(DatabaseItemId=8504)
   m_sContentDataClassName="TribesGameContent.TrDevice_Grenade_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_Grenade_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Grenade_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Grenade:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Grenade:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Defective Frag"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Grenade:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Grenade:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Grenade_MKD"
   ObjectArchetype=TrDevice_Grenade'TribesGame.Default__TrDevice_Grenade'
}
