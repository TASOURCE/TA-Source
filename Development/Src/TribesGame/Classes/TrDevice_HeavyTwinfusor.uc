/**
 * 
 */
class TrDevice_HeavyTwinfusor extends TrDevice_Twinfusor;

defaultproperties
{
   DBWeaponId=8656
   DBXPActivityId=263
   m_fReloadTime=1.900000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_HeavyTwinfusor:FireCameraShake'
   m_TinyWeaponsOffset=(X=15.000000,Y=3.000000,Z=-6.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.600000)
   InfoPanelDescription="Quickly finding popularity across the Wilderzone, the Twinfusor series fires two disks per reload. This heavy version has been modified for Juggernauts."
   Upgrades(0)=(DatabaseItemId=8657,Modifications=((ModType=37)))
   Upgrades(1)=(DatabaseItemId=8658,Modifications=((ModType=73)))
   Upgrades(2)=(DatabaseItemId=8659,Modifications=((ModType=37)))
   m_sContentDataClassName="TribesGameContent.TrDevice_HeavyTwinfusor_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_HeavyTwinfusor:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_HeavyTwinfusor'
   PlayerViewOffset=(X=4.000000,Y=2.000000,Z=-6.000000)
   SmallWeaponsOffset=(X=3.000000,Y=2.000000,Z=2.500000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_HeavyTwinfusor'
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
   ItemName="Heavy Twinfusor"
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
   Name="Default__TrDevice_HeavyTwinfusor"
   ObjectArchetype=TrDevice_Twinfusor'TribesGame.Default__TrDevice_Twinfusor'
}
