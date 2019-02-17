class TrArmorMod_Juggernaut extends TrArmorMod;

defaultproperties
{
   DBWeaponId=7842
   DBXPActivityId=186
   m_FireCameraShake=CameraShake'TribesGame.Default__TrArmorMod_Juggernaut:FireCameraShake'
   InfoPanelDescription="Upgrades to Armor increase Health, Energy, and other vitals."
   UpgradeDescription(0)="+100 HEALTH"
   UpgradeDescription(1)="-25% REGENERATION\nDELAY"
   UpgradeDescription(2)="+10 ENERGY"
   UpgradeDescription(3)="+25% HEALTH\nREGEN\nRATE"
   UpgradeDescription(4)="+100 HEALTH"
   Upgrades(0)=(IconId=8,DatabaseItemId=8095,Modifications=((ModType=2,Value=100.000000)))
   Upgrades(1)=(IconId=10,DatabaseItemId=8096,Modifications=((ModType=49,Value=0.250000)))
   Upgrades(2)=(IconId=2,DatabaseItemId=8097,Modifications=((ModType=10,Value=10.000000)))
   Upgrades(3)=(IconId=8,DatabaseItemId=8098,Modifications=((ModType=39,Value=0.250000)))
   Upgrades(4)=(IconId=8,DatabaseItemId=8099,Modifications=((ModType=2,Value=100.000000)))
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrArmorMod_Juggernaut:ForceFeedbackWaveformShooting1'
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
   ItemName="JUGGERNAUT MK I"
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
   Name="Default__TrArmorMod_Juggernaut"
   ObjectArchetype=TrArmorMod'TribesGame.Default__TrArmorMod'
}
