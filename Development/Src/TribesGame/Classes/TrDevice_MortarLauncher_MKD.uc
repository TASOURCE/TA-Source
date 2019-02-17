/**
 * 
 */
class TrDevice_MortarLauncher_MKD extends TrDevice_MortarLauncher;

defaultproperties
{
   DBWeaponId=8400
   DBXPActivityId=139
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_MortarLauncher_MKD:FireCameraShake'
   InfoPanelDescription="The FMD, a very popular personal conversion kit, enhances the fusion mortar giving it a faster projectile that deals more damage, but has a smaller explosion radius."
   InfoPanelDamage=10
   InfoPanelRadius=8
   Upgrades(0)=(DatabaseItemId=8440)
   Upgrades(1)=(DatabaseItemId=8441)
   Upgrades(2)=(DatabaseItemId=8442)
   m_sContentDataClassName="TribesGameContent.TrDevice_MortarLauncher_MKD_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_MortarLauncher_MKD:ForceFeedbackShootingLarge'
   AttachmentClass=Class'TribesGame.TrAttachment_MortarLauncher_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_MortarLauncher_MKD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_MortarLauncher:FirstPersonMesh'
      FOV=45.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_MortarLauncher:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Fusion Mortar Deluxe"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_MortarLauncher:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_MortarLauncher:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_MortarLauncher_MKD"
   ObjectArchetype=TrDevice_MortarLauncher'TribesGame.Default__TrDevice_MortarLauncher'
}
