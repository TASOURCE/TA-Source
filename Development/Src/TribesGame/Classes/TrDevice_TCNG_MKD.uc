/**
 * 
 */
class TrDevice_TCNG_MKD extends TrDevice_TCNG;

defaultproperties
{
   DBWeaponId=8416
   DBXPActivityId=222
   InfoPanelDescription="Technician Rudelus Torvin designed this grenade with a shorter fuse, and wider explosion radius. He long ago had his eyebrows singed off."
   InfoPanelDamage=8
   InfoPanelRadius=6
   Upgrades(0)=(DatabaseItemId=8493)
   Upgrades(1)=(DatabaseItemId=8494)
   Upgrades(2)=(DatabaseItemId=8495)
   m_sContentDataClassName="TribesGameContent.TrDevice_TCNG_MKD_Content"
   WeaponProjectiles(0)=Class'TribesGame.TrProj_TCNG_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_TCNG:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_TCNG:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="TCNG Quickfuse"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_TCNG:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_TCNG:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_TCNG_MKD"
   ObjectArchetype=TrDevice_TCNG'TribesGame.Default__TrDevice_TCNG'
}
