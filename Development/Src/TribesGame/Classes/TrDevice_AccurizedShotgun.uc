/**
 * 
 */
class TrDevice_AccurizedShotgun extends TrDevice_Shotgun;

defaultproperties
{
   m_fInnerDefaultAccuracy=0.930000
   DBWeaponId=8239
   DBXPActivityId=269
   m_fDefaultAccuracy=0.860000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_AccurizedShotgun:FireCameraShake'
   InfoPanelDescription="Shotguns deal massive damage over short distances. This modified version deals less damage, but has higher accuracy and tighter spread than normal."
   Upgrades(0)=(DatabaseItemId=8258)
   Upgrades(1)=(DatabaseItemId=8259)
   Upgrades(2)=(DatabaseItemId=8260)
   m_sContentDataClassName="TribesGameContent.TrDevice_AccurizedShotgun_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_AccurizedShotgun:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_AccurizedShotgun'
   InstantHitDamage(0)=70.000000
   InstantHitDamage(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_AccurizedShotgun'
   InstantHitDamageTypes(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Shotgun:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=2.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Shotgun:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Accurized Shotgun"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Shotgun:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Shotgun:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_AccurizedShotgun"
   ObjectArchetype=TrDevice_Shotgun'TribesGame.Default__TrDevice_Shotgun'
}
