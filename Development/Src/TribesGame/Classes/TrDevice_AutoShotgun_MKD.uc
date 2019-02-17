/**
 * 
 */
class TrDevice_AutoShotgun_MKD extends TrDevice_AutoShotgun;

defaultproperties
{
   DBWeaponId=8412
   DBXPActivityId=156
   m_nCarriedAmmo=30
   m_nMaxCarriedAmmo=30
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_AutoShotgun_MKD:FireCameraShake'
   InfoPanelDescription="Popular among smaller tribes with fewer resources, The Hammer was modified to be more ammo efficient. Ironically, the phrase 'Dropping the Hammer' refers to warriors who are cowardly in combat."
   InfoPanelDamage=5
   InfoPanelClipSize=2
   UpgradeDescription(0)="+10 AMMO"
   UpgradeDescription(2)="+10 AMMO"
   Upgrades(0)=(DatabaseItemId=8475,Modifications=((Value=10.000000)))
   Upgrades(1)=(DatabaseItemId=8476)
   Upgrades(2)=(DatabaseItemId=8477,Modifications=((Value=10.000000)))
   Upgrades(3)=(DatabaseItemId=8478)
   m_sContentDataClassName="TribesGameContent.TrDevice_AutoShotgun_MKD_Content"
   MaxAmmoCount=5
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_AutoShotgun_MKD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_AutoShotgun_MKD'
   InstantHitDamage(0)=60.000000
   InstantHitDamage(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_AutoShotgun_MKD'
   InstantHitDamageTypes(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AutoShotgun:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=2.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AutoShotgun:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="The Hammer"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AutoShotgun:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AutoShotgun:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_AutoShotgun_MKD"
   ObjectArchetype=TrDevice_AutoShotgun'TribesGame.Default__TrDevice_AutoShotgun'
}
