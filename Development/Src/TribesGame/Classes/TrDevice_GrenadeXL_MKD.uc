/**
 * 
 */
class TrDevice_GrenadeXL_MKD extends TrDevice_GrenadeXL;

defaultproperties
{
   DBWeaponId=8399
   DBXPActivityId=218
   InfoPanelDescription="This modified XL grenade has had its fuse shortened, giving enemies less time to respond."
   InfoPanelDamage=8
   InfoPanelRadius=9
   Upgrades(0)=(DatabaseItemId=8490)
   Upgrades(1)=(DatabaseItemId=8491)
   Upgrades(2)=(DatabaseItemId=8492)
   m_sContentDataClassName="TribesGameContent.TrDevice_GrenadeXL_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_GrenadeXL_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_GrenadeXL_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_GrenadeXL:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_GrenadeXL:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Short-Fuse Frag"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_GrenadeXL:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_GrenadeXL:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_GrenadeXL_MKD"
   ObjectArchetype=TrDevice_GrenadeXL'TribesGame.Default__TrDevice_GrenadeXL'
}
