/**
 *
 */
class TrDevice_ERechargePack_Sentinel extends TrDevice_ERechargePack;

defaultproperties
{
   DBWeaponId=7900
   DBXPActivityId=234
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ERechargePack_Sentinel:FireCameraShake'
   InfoPanelDescription="Increases energy regeneration rate 6%."
   UpgradeDescription(0)="+4% ENERGY\nRECHARGE"
   UpgradeDescription(1)="+4% ENERGY\nRECHARGE"
   UpgradeDescription(2)="+4% ENERGY\nRECHARGE"
   Upgrades(0)=(IconId=2,DatabaseItemId=7952,Modifications=((ModType=38,Value=0.040000)))
   Upgrades(1)=(IconId=2,DatabaseItemId=7953,Modifications=((ModType=38,Value=0.040000)))
   Upgrades(2)=(IconId=2,DatabaseItemId=7954,Modifications=((ModType=38,Value=0.040000)))
   BaseMod=(Modifications=((ModType=38,Value=0.060000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_ERechargePack_Sentinel_Content"
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ERechargePack:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ERechargePack:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Energy Recharge"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ERechargePack:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ERechargePack:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_ERechargePack_Sentinel"
   ObjectArchetype=TrDevice_ERechargePack'TribesGame.Default__TrDevice_ERechargePack'
}
