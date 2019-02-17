/**
 * 
 */
class TrDevice_Stealth extends TrDevice_Pack;

var float m_fPulseSpeedThreshold;

simulated function PostBeginPlay()
{
	local TrPawn TrP;

	TrP = TrPawn(Instigator);
	if (TrP != none)
	{
		TrP.r_fPulseStealthSpeedThreshold = m_fPulseSpeedThreshold;
	}

	super.PostBeginPlay();
}

defaultproperties
{
   m_fPulseSpeedThreshold=2400.000000
   m_fDefaultPowerPoolCostPerSec=5.000000
   DBWeaponId=7833
   DBXPActivityId=227
   m_EffectInfo(0)=(effectClass=Class'TribesGame.TrEffect_Stealth',Type=ET_Active)
   m_eTargetType(0)=TRDTT_Friend
   m_eTargetType(1)=()
   m_nIconIndex=9
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Stealth:FireCameraShake'
   InfoPanelDescription="When activated, this pack renders you invisible to all enemies. You'll appear briefly when taking damage, firing a weapon, or at speeds over 173kph."
   UpgradeDescription(0)="-8% ENERGY\nDRAIN"
   UpgradeDescription(1)="-8% ENERGY\nDRAIN"
   UpgradeDescription(2)="-8% ENERGY\nDRAIN"
   Upgrades(0)=(IconId=2,DatabaseItemId=7977,Modifications=((ModType=33,Value=0.080000)))
   Upgrades(1)=(IconId=2,DatabaseItemId=7978,Modifications=((ModType=33,Value=0.080000)))
   Upgrades(2)=(IconId=2,DatabaseItemId=7979,Modifications=((ModType=33,Value=0.080000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_StealthPack_Content"
   FireInterval(0)=0.300000
   FireInterval(1)=()
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
   ItemName="Stealth"
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
   Name="Default__TrDevice_Stealth"
   ObjectArchetype=TrDevice_Pack'TribesGame.Default__TrDevice_Pack'
}
