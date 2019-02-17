class TrDevice_UtilityPack_Soldier extends TrDevice_EnergyPack;

defaultproperties
{
   DBWeaponId=8223
   DBXPActivityId=236
   m_EffectInfo(0)=(effectClass=Class'TribesGame.TrEffect_UtilityPackBuff')
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_UtilityPack_Soldier:FireCameraShake'
   InfoPanelDescription="Equipping this pack increases maximum energy pool by 20, and can be modified for extra Health, Ammo, and Speed."
   UpgradeDescription(0)="+1 GRENADE\nAMMO"
   UpgradeDescription(1)="+100 HEALTH"
   UpgradeDescription(2)="+10% RUN\nSPEED"
   Upgrades(0)=(IconId=4,DatabaseItemId=8224,Modifications=((ModType=29,Value=1.000000)))
   Upgrades(1)=(IconId=8,DatabaseItemId=8225,Modifications=((ModType=2,Value=100.000000)))
   Upgrades(2)=(IconId=1,DatabaseItemId=8226,Modifications=((ModType=16,Value=0.100000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_UtilityPack_Soldier_Content"
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
   ItemName="Utility Pack"
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
   Name="Default__TrDevice_UtilityPack_Soldier"
   ObjectArchetype=TrDevice_EnergyPack'TribesGame.Default__TrDevice_EnergyPack'
}
