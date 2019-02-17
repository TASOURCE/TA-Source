class TrArmorMod_Infiltrator extends TrArmorMod;

defaultproperties
{
   DBWeaponId=7838
   DBXPActivityId=185
   m_FireCameraShake=CameraShake'TribesGame.Default__TrArmorMod_Infiltrator:FireCameraShake'
   InfoPanelDescription="Infiltrator Armor favors more protection than other light armors, helping the Infiltrator survive close quarters fights."
   UpgradeDescription(0)="-25% REGENERATION\nDELAY"
   UpgradeDescription(1)="+10 ENERGY"
   UpgradeDescription(2)="+100 HEALTH"
   UpgradeDescription(3)="+10% RUN\nSPEED"
   UpgradeDescription(4)="+100 HEALTH"
   Upgrades(0)=(IconId=10,DatabaseItemId=7980,Modifications=((ModType=49,Value=0.250000)))
   Upgrades(1)=(IconId=2,DatabaseItemId=7981,Modifications=((ModType=10,Value=10.000000)))
   Upgrades(2)=(IconId=8,DatabaseItemId=7982,Modifications=((ModType=2,Value=100.000000)))
   Upgrades(3)=(IconId=1,DatabaseItemId=7983,Modifications=((ModType=16,Value=0.100000)))
   Upgrades(4)=(IconId=8,DatabaseItemId=7984,Modifications=((ModType=2,Value=100.000000)))
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrArmorMod_Infiltrator:ForceFeedbackWaveformShooting1'
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
   ItemName="INFILTRATOR MK I"
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
   Name="Default__TrArmorMod_Infiltrator"
   ObjectArchetype=TrArmorMod'TribesGame.Default__TrArmorMod'
}
