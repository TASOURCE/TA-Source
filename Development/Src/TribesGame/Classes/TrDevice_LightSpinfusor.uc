/**
 * 
 */
class TrDevice_LightSpinfusor extends TrDevice_Spinfusor;

defaultproperties
{
   DBWeaponId=7422
   DBXPActivityId=142
   m_nLowAmmoWarning=4
   m_fReloadTime=1.240000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_LightSpinfusor:FireCameraShake'
   m_TinyWeaponsOffset=(X=16.000000,Y=1.000000,Z=-7.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=63.000000),Scale=2.700000)
   m_InGamePaperDollInfo=(Scale=3.000000)
   InfoPanelDescription="Lightweight and quick firing, the Light Spinfusor is the weapon of choice for Pathfinders."
   InfoPanelDamage=6
   InfoPanelFireRate=4
   Upgrades(0)=(DatabaseItemId=7855)
   Upgrades(1)=(DatabaseItemId=7860)
   Upgrades(2)=(DatabaseItemId=7857)
   m_sContentDataClassName="TribesGameContent.TrDevice_LightSpinfusor_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_LightSpinfusor:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_LightSpinfusor'
   PlayerViewOffset=(X=-5.000000,Y=-4.000000,Z=-1.500000)
   SmallWeaponsOffset=(X=5.000000,Y=0.000000,Z=1.000000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_LightSpinfusor'
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
   ItemName="Light Spinfusor"
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
   Name="Default__TrDevice_LightSpinfusor"
   ObjectArchetype=TrDevice_Spinfusor'TribesGame.Default__TrDevice_Spinfusor'
}
