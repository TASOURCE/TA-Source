/**
 * 
 */
class TrDevice_ArxShotgun extends TrDevice_Shotgun;

defaultproperties
{
   m_nMinShotCount=1
   DBWeaponId=7454
   m_bSpawnTracerBeams=False
   m_fDefaultAccuracy=1.000000
   m_fAccuracyLossMax=0.000000
   m_fAccuracyCorrectionRate=0.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ArxShotgun:FireCameraShake'
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=45.000000),Rotation=(Pitch=4004,Yaw=-16384,Roll=0),Scale=2.600000)
   InfoPanelDamage=0
   InfoPanelRadius=0
   InfoPanelFireRate=0
   InfoPanelClipSize=0
   m_sContentDataClassName="TribesGameContent.TrDevice_ArxShotgun_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_ArxShotgun:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_ArxShotgun'
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_ArxShotgun'
   WeaponProjectiles(1)=()
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
   ItemName="Arx Shotgun"
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
   Name="Default__TrDevice_ArxShotgun"
   ObjectArchetype=TrDevice_Shotgun'TribesGame.Default__TrDevice_Shotgun'
}
