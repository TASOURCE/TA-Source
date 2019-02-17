class TrArmorMod_Soldier extends TrArmorMod;

defaultproperties
{
   DBWeaponId=7839
   DBXPActivityId=191
   m_FireCameraShake=CameraShake'TribesGame.Default__TrArmorMod_Soldier:FireCameraShake'
   InfoPanelDescription="Upgrades to Armor increase Health, Energy, and other vitals."
   UpgradeDescription(0)="-25% REGENERATION\nDELAY"
   UpgradeDescription(1)="+50 HEALTH"
   UpgradeDescription(2)="+25% HEALTH\nREGEN\nRATE"
   UpgradeDescription(3)="+5 ENERGY"
   UpgradeDescription(4)="+50 HEALTH"
   Upgrades(0)=(IconId=10,DatabaseItemId=8007,Modifications=((ModType=49,Value=0.250000)))
   Upgrades(1)=(IconId=8,DatabaseItemId=8008,Modifications=((ModType=2,Value=50.000000)))
   Upgrades(2)=(IconId=8,DatabaseItemId=8009,Modifications=((ModType=39,Value=0.250000)))
   Upgrades(3)=(IconId=2,DatabaseItemId=8010,Modifications=((ModType=10,Value=5.000000)))
   Upgrades(4)=(IconId=8,DatabaseItemId=8011,Modifications=((ModType=2,Value=50.000000)))
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrArmorMod_Soldier:ForceFeedbackWaveformShooting1'
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrArmorMod:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrArmorMod:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="SOLDIER MK I"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrArmorMod:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrArmorMod:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrArmorMod_Soldier"
   ObjectArchetype=TrArmorMod'TribesGame.Default__TrArmorMod'
}
