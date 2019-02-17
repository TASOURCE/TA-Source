/**
 * 
 */
class TrDevice_RhinoSMG_MKD extends TrDevice_RhinoSMG;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_RhinoSMG:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_RhinoSMG:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=8409
   DBXPActivityId=136
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RhinoSMG_MKD:FireCameraShake'
   InfoPanelDescription="While designed for use in frozen conditions, the Arctic Rhino found popularity among Starwolf warriors when the sole survivor of the Battle of Arx Koston was found by medics to be clutching it."
   InfoPanelDamage=3
   InfoPanelFireRate=8
   Upgrades(0)=(DatabaseItemId=8425)
   Upgrades(1)=(DatabaseItemId=8426)
   Upgrades(2)=(DatabaseItemId=8427)
   Upgrades(3)=(DatabaseItemId=8428)
   m_sContentDataClassName="TribesGameContent.TrDevice_RhinoSMG_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_RhinoSMG_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_RhinoSMG_MKD'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.110000
   FireInterval(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_RhinoSMG:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_RhinoSMG:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Arctic Rhino"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_RhinoSMG:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_RhinoSMG:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_RhinoSMG_MKD"
   ObjectArchetype=TrDevice_RhinoSMG'TribesGame.Default__TrDevice_RhinoSMG'
}
