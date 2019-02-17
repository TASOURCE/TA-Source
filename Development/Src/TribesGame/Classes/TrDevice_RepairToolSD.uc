/**
 * 
 */
class TrDevice_RepairToolSD extends TrDevice_RepairTool;

defaultproperties
{
   m_fRepairPercentage=0.040000
   m_fVehicleRepairPercentage=0.080000
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_RepairTool:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_RepairTool:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=7436
   DBXPActivityId=179
   m_fReloadTime=1.800000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RepairToolSD:FireCameraShake'
   m_MainMenuPaperDollInfo=(Scale=2.600000)
   m_InGamePaperDollInfo=(Scale=2.800000)
   InfoPanelDescription="Repair tools can bring Base Turrets, Generators, and Sensors back online. They can also repair Vehicles. This tool has a higher rate than standard tools."
   UpgradeDescription(0)="+15% REPAIR"
   UpgradeDescription(1)="+15% REPAIR"
   UpgradeDescription(2)="+15% REPAIR"
   Upgrades(0)=(IconId=10,DatabaseItemId=8019,Modifications=((ModType=13,Value=0.150000)))
   Upgrades(1)=(IconId=10,DatabaseItemId=8020,Modifications=((ModType=13,Value=0.150000)))
   Upgrades(2)=(IconId=10,DatabaseItemId=8021,Modifications=((ModType=13,Value=0.150000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_RepairToolSD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_RepairToolSD'
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_RepairToolSD'
   InstantHitDamage(0)=-22.000000
   InstantHitDamage(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_RepairToolSD'
   InstantHitDamageTypes(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_RepairTool:FirstPersonMesh'
      FOV=65.000000
      AnimSets(0)=None
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_RepairTool:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Improved Repair Tool"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_RepairTool:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_RepairTool:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_RepairToolSD"
   ObjectArchetype=TrDevice_RepairTool'TribesGame.Default__TrDevice_RepairTool'
}
