/**
 *
 */
class TrDevice_HeavyShieldPack extends TrDevice_Pack;

defaultproperties
{
   m_fDefaultPowerPoolCostPerSec=8.500000
   m_PowerPoolInfo(0)=(m_fPowerPoolCostPerSec=8.500000,m_TrFamilyInfo=Class'TribesGame.TrFamilyInfo_Heavy')
   DBWeaponId=7826
   DBXPActivityId=223
   m_EffectInfo(0)=(effectClass=Class'TribesGame.TrEffect_HeavyShield',Type=ET_Active)
   m_eTargetType(0)=TRDTT_Friend
   m_eTargetType(1)=()
   m_nIconIndex=8
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_HeavyShieldPack:FireCameraShake'
   InfoPanelDescription="When a shield pack is activated, damage is applied to your energy pool rather than your health."
   UpgradeDescription(0)="IMPROVE\nSHIELD\nEFFECT"
   UpgradeDescription(1)="-50% ENERGY\nDRAIN"
   UpgradeDescription(2)="IMPROVE\nSHIELD\nEFFECT"
   Upgrades(0)=(IconId=3,DatabaseItemId=8144,Modifications=((ModType=62,Value=0.018000)))
   Upgrades(1)=(IconId=2,DatabaseItemId=8145,Modifications=((ModType=33,Value=0.500000)))
   Upgrades(2)=(IconId=3,DatabaseItemId=8146,Modifications=((ModType=62,Value=0.018000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_HeavyShieldPack_Content"
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Heavy Shield Pack"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_HeavyShieldPack"
   ObjectArchetype=TrDevice_Pack'TribesGame.Default__TrDevice_Pack'
}
