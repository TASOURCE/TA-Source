/**
 * 
 */
class TrDevice_LightSpinfusor_100X extends TrDevice_Spinfusor;

defaultproperties
{
   DBWeaponId=8696
   DBXPActivityId=265
   m_nLowAmmoWarning=4
   m_fReloadTime=1.240000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_LightSpinfusor_100X:FireCameraShake'
   m_TinyWeaponsOffset=(X=16.000000,Y=1.000000,Z=-7.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=63.000000),Scale=2.700000)
   m_InGamePaperDollInfo=(Scale=3.000000)
   InfoPanelDescription="This Spinfusor variant inherits 100% of the user's velocity. Some may find it harder to use, but others swear by it."
   InfoPanelDamage=6
   InfoPanelFireRate=4
   Upgrades(0)=(DatabaseItemId=8700)
   Upgrades(1)=(DatabaseItemId=8701)
   Upgrades(2)=(DatabaseItemId=8702)
   m_sContentDataClassName="TribesGameContent.TrDevice_LightSpinfusor_100X_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_LightSpinfusor_100X:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_LightSpinfusor_100X'
   PlayerViewOffset=(X=-5.000000,Y=-4.000000,Z=-1.500000)
   SmallWeaponsOffset=(X=5.000000,Y=0.000000,Z=1.000000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_LightSpinfusor_100X'
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
   ItemName="Blinksfusor"
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
   Name="Default__TrDevice_LightSpinfusor_100X"
   ObjectArchetype=TrDevice_Spinfusor'TribesGame.Default__TrDevice_Spinfusor'
}