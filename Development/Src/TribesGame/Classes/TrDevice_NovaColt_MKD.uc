/**
 * 
 */
class TrDevice_NovaColt_MKD extends TrDevice_NovaColt;

defaultproperties
{
   DBWeaponId=8403
   DBXPActivityId=175
   m_nCarriedAmmo=96
   m_nMaxCarriedAmmo=96
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_NovaColt_MKD:FireCameraShake'
   InfoPanelDescription="A variant of the Nova Blaster that has a better fire rate and a larger clip, but deals less damage per shot."
   InfoPanelDamage=4
   InfoPanelFireRate=6
   InfoPanelClipSize=3
   UpgradeDescription(0)="+32 AMMO"
   Upgrades(0)=(DatabaseItemId=8453,Modifications=((Value=32.000000)))
   Upgrades(1)=(DatabaseItemId=8454)
   Upgrades(2)=(DatabaseItemId=8455)
   m_sContentDataClassName="TribesGameContent.TrDevice_NovaColt_MKD_Content"
   MaxAmmoCount=16
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_NovaColt_MKD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_NovaColt_MKD'
   MuzzleFlashColor=(B=64,G=128,R=255,A=255)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_NovaColt_MKD'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.250000
   FireInterval(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_NovaColt:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_NovaColt:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Nova Blaster MX"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_NovaColt:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_NovaColt:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_NovaColt_MKD"
   ObjectArchetype=TrDevice_NovaColt'TribesGame.Default__TrDevice_NovaColt'
}
