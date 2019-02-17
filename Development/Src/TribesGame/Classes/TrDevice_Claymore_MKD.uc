/**
 * 
 */
class TrDevice_Claymore_MKD extends TrDevice_Claymore;

defaultproperties
{
   DBWeaponId=8402
   DBXPActivityId=214
   InfoPanelDescription="This Claymore has been modified for greater trigger and explosion distance, but has smaller trigger angle."
   InfoPanelDamage=7
   InfoPanelRadius=7
   Upgrades(0)=(DatabaseItemId=8482)
   Upgrades(1)=(DatabaseItemId=8483)
   Upgrades(2)=(DatabaseItemId=8484)
   m_sContentDataClassName="TribesGameContent.TrDevice_Claymore_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_Claymore_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Claymore_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Focused Claymore"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Claymore_MKD"
   ObjectArchetype=TrDevice_Claymore'TribesGame.Default__TrDevice_Claymore'
}
