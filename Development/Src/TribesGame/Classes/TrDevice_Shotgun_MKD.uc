/**
 * 
 */
class TrDevice_Shotgun_MKD extends TrDevice_Shotgun;

defaultproperties
{
   DBWeaponId=8411
   DBXPActivityId=169
   m_nLowAmmoWarning=1
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Shotgun_MKD:FireCameraShake'
   InfoPanelDescription="This weapon didn't gain popularity until it won the duel between Blood Eagle Nira Magnus and The Usurper. Magnus won by clubbing The Usurper in the face after she ran out of ammo."
   InfoPanelDamage=8
   InfoPanelClipSize=1
   UpgradeDescription(0)="+8 AMMO"
   UpgradeDescription(2)="+8 AMMO"
   Upgrades(0)=(DatabaseItemId=8450,Modifications=((Value=8.000000)))
   Upgrades(1)=(DatabaseItemId=8451)
   Upgrades(2)=(DatabaseItemId=8452,Modifications=((Value=8.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Shotgun_MKD_Content"
   MaxAmmoCount=4
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_Shotgun_MKD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_Shotgun_MKD'
   InstantHitDamage(0)=90.000000
   InstantHitDamage(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_Shotgun_MKD'
   InstantHitDamageTypes(1)=()
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
   ItemName="Holdout Shotgun"
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
   Name="Default__TrDevice_Shotgun_MKD"
   ObjectArchetype=TrDevice_Shotgun'TribesGame.Default__TrDevice_Shotgun'
}
