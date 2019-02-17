/**
 * 
 */
class TrDevice_RepairToolSD_MKD extends TrDevice_RepairToolSD;

defaultproperties
{
   m_fRepairPercentage=0.030000
   m_fVehicleRepairPercentage=0.070000
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_RepairToolSD:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_RepairToolSD:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=8405
   DBXPActivityId=180
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RepairToolSD_MKD:FireCameraShake'
   InfoPanelDescription="Repair tools can bring Base Turrets, Generators, and Sensors back online. They can also repair Vehicles. This tool has been modified for a longer range, but repairs slightly slower."
   Upgrades(0)=(DatabaseItemId=8462)
   Upgrades(1)=(DatabaseItemId=8463)
   Upgrades(2)=(DatabaseItemId=8464)
   m_sContentDataClassName="TribesGameContent.TrDevice_RepairToolSD_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_RepairToolSD_MKD'
   MuzzleFlashColor=(B=77,G=199,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_Gold'
   MuzzleFlashDuration=0.330000
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_RepairToolSD_MKD'
   InstantHitDamageTypes(1)=()
   WeaponRange=1024.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_RepairToolSD:FirstPersonMesh'
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
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_RepairToolSD:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Long Range Repair Tool"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_RepairToolSD:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_RepairToolSD:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_RepairToolSD_MKD"
   ObjectArchetype=TrDevice_RepairToolSD'TribesGame.Default__TrDevice_RepairToolSD'
}
