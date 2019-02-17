/**
 * 
 */
class TrDevice_EMPGrenade_MKD extends TrDevice_EMPGrenade;

defaultproperties
{
   DBWeaponId=8395
   DBXPActivityId=209
   InfoPanelDescription="EMP Grenades cause damage and Energy drain to those caught in the blast. This variant has a larger radius and drains the same amount, but deals less damage."
   InfoPanelDamage=5
   InfoPanelRadius=8
   Upgrades(0)=(DatabaseItemId=8496)
   Upgrades(1)=(DatabaseItemId=8497)
   Upgrades(2)=(DatabaseItemId=8498)
   m_sContentDataClassName="TribesGameContent.TrDevice_EMPGrenade_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_EMPGrenade_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_EMPGrenade_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_EMPGrenade:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_EMPGrenade:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="EMP-XL Grenade"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_EMPGrenade:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_EMPGrenade:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_EMPGrenade_MKD"
   ObjectArchetype=TrDevice_EMPGrenade'TribesGame.Default__TrDevice_EMPGrenade'
}
