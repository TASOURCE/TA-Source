/**
 * 
 */
class TrDevice_NJ4SMG_MKD extends TrDevice_NJ4SMG;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_NJ4SMG:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_NJ4SMG:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=8408
   DBXPActivityId=171
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_NJ4SMG_MKD:FireCameraShake'
   InfoPanelDescription="Conditioning for arid environments has given this custom NJ4 an increased fire rate, at the cost of how much damage is dealt."
   InfoPanelDamage=1
   InfoPanelFireRate=9
   Upgrades(0)=(DatabaseItemId=8465)
   Upgrades(1)=(DatabaseItemId=8466)
   Upgrades(2)=(DatabaseItemId=8467)
   Upgrades(3)=(DatabaseItemId=8468)
   m_sContentDataClassName="TribesGameContent.TrDevice_NJ4SMG_MKD_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_NJ4SMG_MKD:ForceFeedbackWaveformShooting1'
   AttachmentClass=Class'TribesGame.TrAttachment_NJ4SMG_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_NJ4SMG_MKD'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.100000
   FireInterval(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_NJ4SMG:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_NJ4SMG:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Desert NJ4"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_NJ4SMG:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_NJ4SMG:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_NJ4SMG_MKD"
   ObjectArchetype=TrDevice_NJ4SMG'TribesGame.Default__TrDevice_NJ4SMG'
}
