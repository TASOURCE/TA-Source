/**
 *
 */
class TrDevice_JammerPack extends TrDevice_Pack;

defaultproperties
{
   m_fDefaultPowerPoolCostPerSec=3.500000
   m_PowerPoolInfo(0)=(m_fPowerPoolCostPerSec=8.500000,m_TrFamilyInfo=Class'TribesGame.TrFamilyInfo_Heavy')
   DBWeaponId=7827
   DBXPActivityId=231
   m_EffectInfo(0)=(effectClass=Class'TribesGame.TrEffect_Jammer',Type=ET_Active)
   m_eTargetType(0)=TRDTT_Friend
   m_eTargetType(1)=()
   m_nIconIndex=9
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_JammerPack:FireCameraShake'
   InfoPanelDescription="When active, the Jammer pack hides you and nearby friends from Sensors and HUD markers. It will also remove Stealth from nearby enemy Infiltrators."
   UpgradeDescription(0)="+15% RADIUS"
   UpgradeDescription(1)="-25% ENERGY\nDRAIN"
   UpgradeDescription(2)="+15% RADIUS"
   UpgradeDescription(3)="-25% ENERGY\nDRAIN"
   Upgrades(0)=(IconId=7,DatabaseItemId=8061,Modifications=((ModType=41,Value=0.150000)))
   Upgrades(1)=(IconId=2,DatabaseItemId=8062,Modifications=((ModType=33,Value=0.250000)))
   Upgrades(2)=(IconId=7,DatabaseItemId=8063,Modifications=((ModType=41,Value=0.150000)))
   Upgrades(3)=(IconId=2,DatabaseItemId=8064,Modifications=((ModType=33,Value=0.250000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_JammerPack_Content"
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
   ItemName="Jammer Pack"
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
   Name="Default__TrDevice_JammerPack"
   ObjectArchetype=TrDevice_Pack'TribesGame.Default__TrDevice_Pack'
}
