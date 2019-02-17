/**
 * 
 */
class TrDevice_ArxBuster_MKD extends TrDevice_ArxBuster;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ArxBuster:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ArxBuster:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=8391
   DBXPActivityId=145
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ArxBuster_MKD:FireCameraShake'
   InfoPanelDescription="Modified for dry climates, the Dust Devil -as it's popularly called- is a special variant on the stock Arx Buster."
   InfoPanelDamage=6
   InfoPanelRadius=5
   Upgrades(0)=(DatabaseItemId=8437)
   Upgrades(1)=(DatabaseItemId=8438)
   Upgrades(2)=(DatabaseItemId=8439)
   m_sContentDataClassName="TribesGameContent.TrDevice_ArxBuster_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_ArxBuster_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_ArxBuster_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ArxBuster:FirstPersonMesh'
      FOV=47.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ArxBuster:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Dust Devil"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ArxBuster:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ArxBuster:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_ArxBuster_MKD"
   ObjectArchetype=TrDevice_ArxBuster'TribesGame.Default__TrDevice_ArxBuster'
}
