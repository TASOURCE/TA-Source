/**
 * 
 */
class TrDevice_HeavySpinfusor extends TrDevice_Spinfusor;

defaultproperties
{
   DBWeaponId=7448
   DBXPActivityId=127
   m_nLowAmmoWarning=4
   m_nCarriedAmmo=20
   m_nMaxCarriedAmmo=20
   m_fReloadTime=1.800000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_HeavySpinfusor:FireCameraShake'
   m_TinyWeaponsOffset=(X=10.000000,Y=0.000000,Z=-5.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=60.000000),Scale=2.500000)
   InfoPanelDescription="Spinfusors are the most common weapons found among the Tribes, and this one was made bigger and harder hitting."
   InfoPanelDamage=8
   InfoPanelFireRate=2
   Upgrades(0)=(DatabaseItemId=8124)
   Upgrades(1)=(DatabaseItemId=8125)
   Upgrades(2)=(DatabaseItemId=8126)
   m_sContentDataClassName="TribesGameContent.TrDevice_HeavySpinfusor_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_HeavySpinfusor:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_HeavySpinfusor'
   PlayerViewOffset=(X=7.000000,Y=0.000000,Z=-5.000000)
   SmallWeaponsOffset=(X=10.000000,Y=4.000000,Z=0.000000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_HeavySpinfusor'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:FirstPersonMesh'
      FOV=50.000000
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
   ItemName="Heavy Spinfusor"
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
   Name="Default__TrDevice_HeavySpinfusor"
   ObjectArchetype=TrDevice_Spinfusor'TribesGame.Default__TrDevice_Spinfusor'
}
