class TrArmorMod_Pathfinder extends TrArmorMod;

defaultproperties
{
   DBWeaponId=7836
   DBXPActivityId=187
   m_FireCameraShake=CameraShake'TribesGame.Default__TrArmorMod_Pathfinder:FireCameraShake'
   InfoPanelDescription="Pathfinder Armor favors Energy and Mass reduction, helping Pathfinders boost themselves to greater speed."
   UpgradeDescription(0)="-25% REGENERATION\nDELAY"
   UpgradeDescription(1)="+10 ENERGY"
   UpgradeDescription(2)="+25% HEALTH\nREGEN\nRATE"
   UpgradeDescription(3)="+100 HEALTH"
   UpgradeDescription(4)="-10% MASS"
   Upgrades(0)=(IconId=10,DatabaseItemId=7893,Modifications=((ModType=49,Value=0.250000)))
   Upgrades(1)=(IconId=2,DatabaseItemId=7894,Modifications=((ModType=10,Value=10.000000)))
   Upgrades(2)=(IconId=8,DatabaseItemId=7895,Modifications=((ModType=39,Value=0.250000)))
   Upgrades(3)=(IconId=8,DatabaseItemId=7896,Modifications=((ModType=2,Value=100.000000)))
   Upgrades(4)=(IconId=1,DatabaseItemId=7897,Modifications=((ModType=3,Value=-0.100000)))
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrArmorMod_Pathfinder:ForceFeedbackWaveformShooting1'
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
   ItemName="PATHFINDER MK I"
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
   Name="Default__TrArmorMod_Pathfinder"
   ObjectArchetype=TrArmorMod'TribesGame.Default__TrArmorMod'
}
