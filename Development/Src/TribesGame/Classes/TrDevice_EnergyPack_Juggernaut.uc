class TrDevice_EnergyPack_Juggernaut extends TrDevice_EnergyPack;

defaultproperties
{
   DBWeaponId=7901
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_EnergyPack_Juggernaut:FireCameraShake'
   InfoPanelDescription="Increases maximum energy pool by 20, and can be modified for more."
   UpgradeDescription(0)="+5 ENERGY"
   UpgradeDescription(1)="+5 ENERGY"
   UpgradeDescription(2)="+5 ENERGY"
   Upgrades(0)=(IconId=2,DatabaseItemId=8092,Modifications=((ModType=10,Value=5.000000)))
   Upgrades(1)=(IconId=2,DatabaseItemId=8093,Modifications=((ModType=10,Value=5.000000)))
   Upgrades(2)=(IconId=2,DatabaseItemId=8094,Modifications=((ModType=10,Value=5.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_EnergyPack_Juggernaut_Content"
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
   ItemName="Energy Pack"
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
   Name="Default__TrDevice_EnergyPack_Juggernaut"
   ObjectArchetype=TrDevice_EnergyPack'TribesGame.Default__TrDevice_EnergyPack'
}
