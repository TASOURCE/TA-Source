class TrArmorMod_Sentinel extends TrArmorMod;

defaultproperties
{
   DBWeaponId=7837
   DBXPActivityId=189
   m_FireCameraShake=CameraShake'TribesGame.Default__TrArmorMod_Sentinel:FireCameraShake'
   InfoPanelDescription="Upgrades to Armor increase Health, Energy, and other vitals."
   UpgradeDescription(0)="-25% REGENERATION\nDELAY"
   UpgradeDescription(1)="+10% RUN\nSPEED"
   UpgradeDescription(2)="+25% HEALTH\nREGEN\nRATE"
   UpgradeDescription(3)="+100 HEALTH"
   UpgradeDescription(4)="+10 ENERGY"
   Upgrades(0)=(IconId=10,DatabaseItemId=7955,Modifications=((ModType=49,Value=0.250000)))
   Upgrades(1)=(IconId=1,DatabaseItemId=7956,Modifications=((ModType=16,Value=0.100000)))
   Upgrades(2)=(IconId=8,DatabaseItemId=7957,Modifications=((ModType=39,Value=0.250000)))
   Upgrades(3)=(IconId=8,DatabaseItemId=7958,Modifications=((ModType=2,Value=100.000000)))
   Upgrades(4)=(IconId=2,DatabaseItemId=7959,Modifications=((ModType=10,Value=10.000000)))
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrArmorMod_Sentinel:ForceFeedbackWaveformShooting1'
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
   ItemName="SENTINEL MK I"
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
   Name="Default__TrArmorMod_Sentinel"
   ObjectArchetype=TrArmorMod'TribesGame.Default__TrArmorMod'
}
