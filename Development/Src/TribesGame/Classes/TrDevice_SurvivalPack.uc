class TrDevice_SurvivalPack extends TrDevice_EnergyPack;

defaultproperties
{
   DBWeaponId=8255
   DBXPActivityId=225
   m_EffectInfo(0)=(effectClass=Class'TribesGame.TrEffect_MinorPowerPoolBuff')
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SurvivalPack:FireCameraShake'
   InfoPanelDescription="Equipping this pack increases maximum energy pool by 15, and can be modified for extra Health, Energy Regeneration, and Speed."
   UpgradeDescription(0)="+200 HEALTH"
   UpgradeDescription(1)="+25% RUN\nSPEED"
   UpgradeDescription(2)="+15% ENERGY\nREGEN"
   Upgrades(0)=(IconId=8,DatabaseItemId=8309,Modifications=((ModType=2,Value=200.000000)))
   Upgrades(1)=(IconId=1,DatabaseItemId=8310,Modifications=((ModType=16,Value=0.250000)))
   Upgrades(2)=(IconId=2,DatabaseItemId=8311,Modifications=((ModType=38,Value=0.150000)))
   BaseMod=(Modifications=((ModType=10,Value=15.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_SurvivalPack_Content"
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_EnergyPack:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_EnergyPack:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Survival Pack"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_EnergyPack:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_EnergyPack:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_SurvivalPack"
   ObjectArchetype=TrDevice_EnergyPack'TribesGame.Default__TrDevice_EnergyPack'
}
