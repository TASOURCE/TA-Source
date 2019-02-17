/**
 * 
 */
class TrDevice_StickyGrenade_MKD extends TrDevice_StickyGrenade;

defaultproperties
{
   DBWeaponId=8398
   DBXPActivityId=201
   InfoPanelDescription="Sticky grenades deal a massive amount of damage to armored targets such as Base Turrets, Generators, and Vehicles. This version has been modified for a wider damage spread."
   InfoPanelDamage=9
   InfoPanelRadius=9
   Upgrades(0)=(DatabaseItemId=8486)
   Upgrades(1)=(DatabaseItemId=8487)
   Upgrades(2)=(DatabaseItemId=8488)
   Upgrades(3)=(DatabaseItemId=8489)
   m_sContentDataClassName="TribesGameContent.TrDevice_StickyGrenade_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_StickyGrenade_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_StickyGrenade_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_StickyGrenade:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_StickyGrenade:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Sticky XL"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_StickyGrenade:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_StickyGrenade:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_StickyGrenade_MKD"
   ObjectArchetype=TrDevice_StickyGrenade'TribesGame.Default__TrDevice_StickyGrenade'
}
