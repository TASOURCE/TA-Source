/**
 * 
 */
class TrDevice_LightTwinfusor extends TrDevice_Twinfusor;

defaultproperties
{
   DBWeaponId=8245
   DBXPActivityId=261
   m_fReloadTime=1.400000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_LightTwinfusor:FireCameraShake'
   m_TinyWeaponsOffset=(X=15.000000,Y=2.000000,Z=-6.000000)
   InfoPanelDescription="Quickly finding popularity across the Wilderzone, the Twinfusor series fires two disks per reload. This light version has been modified for Pathfinders."
   Upgrades(0)=(DatabaseItemId=8277)
   Upgrades(1)=(DatabaseItemId=8278)
   Upgrades(2)=(DatabaseItemId=8279)
   m_sContentDataClassName="TribesGameContent.TrDevice_LightTwinfusor_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_LightTwinfusor:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_LightTwinfusor'
   PlayerViewOffset=(X=1.000000,Y=1.000000,Z=-4.000000)
   SmallWeaponsOffset=(X=10.000000,Y=2.000000,Z=0.500000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_LightTwinfusor'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Twinfusor:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Twinfusor:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Light Twinfusor"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Twinfusor:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Twinfusor:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_LightTwinfusor"
   ObjectArchetype=TrDevice_Twinfusor'TribesGame.Default__TrDevice_Twinfusor'
}
