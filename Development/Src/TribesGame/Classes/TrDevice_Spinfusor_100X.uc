/**
 * 
 */
class TrDevice_Spinfusor_100X extends TrDevice_Spinfusor;

defaultproperties
{
   DBWeaponId=8697
   DBXPActivityId=264
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Spinfusor_100X:FireCameraShake'
   m_TinyWeaponsOffset=(X=9.000000,Y=3.000000,Z=-4.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=55.000000),Scale=2.650000)
   InfoPanelDescription="Some Soldiers like to bring an extra Spinfusor as a secondary. This variant has a reduced direct-hit damage bonus compared to Thumpers or other Spinfusors, but retains all other benefits of the Disk."
   Upgrades(0)=(DatabaseItemId=8703,Modifications=((ModType=37)))
   Upgrades(1)=(DatabaseItemId=8704,Modifications=((ModType=73)))
   Upgrades(2)=(DatabaseItemId=8705,Modifications=((ModType=37)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Spinfusor_100X_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_Spinfusor_100X:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_Spinfusor_100X'
   PlayerViewOffset=(X=-1.000000,Y=0.000000,Z=-6.000000)
   SmallWeaponsOffset=(X=4.000000,Y=2.000000,Z=2.000000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Spinfusor_100X'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Spare Spinfusor"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Spinfusor_100X"
   ObjectArchetype=TrDevice_Spinfusor'TribesGame.Default__TrDevice_Spinfusor'
}
