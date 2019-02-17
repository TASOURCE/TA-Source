/**
 * 
 */
class TrDevice_SpinfusorD_MKD extends TrDevice_SpinfusorD;

defaultproperties
{
   DBWeaponId=8413
   DBXPActivityId=165
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SpinfusorD_MKD:FireCameraShake'
   InfoPanelDescription="Many tribal warriors disdain the modified Spinfusors issued them, and in protest have modified the Spinfusor MKDs to have performance similar to a standard Spinfusor."
   InfoPanelDamage=7
   InfoPanelRadius=4
   Upgrades(0)=(DatabaseItemId=8469)
   Upgrades(1)=(DatabaseItemId=8470)
   Upgrades(2)=(DatabaseItemId=8471)
   m_sContentDataClassName="TribesGameContent.TrDevice_SpinfusorD_MKD_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SpinfusorD_MKD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_SpinfusorD_MKD'
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrSpinfusorMuzzleFlashLight'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_SpinfusorD_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_SpinfusorD:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_SpinfusorD:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Spinfusor MK-X"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_SpinfusorD:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_SpinfusorD:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_SpinfusorD_MKD"
   ObjectArchetype=TrDevice_SpinfusorD'TribesGame.Default__TrDevice_SpinfusorD'
}
