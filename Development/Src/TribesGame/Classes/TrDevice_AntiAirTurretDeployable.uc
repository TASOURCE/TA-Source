/**
 * 
 */
class TrDevice_AntiAirTurretDeployable extends TrDevice_Deployable;

defaultproperties
{
   c_DeployableHologramClass=Class'TribesGame.TrDeployableHologram_AntiAirTurret'
   m_fOtherDeployableProximityCheck=1024.000000
   DBWeaponId=7417
   DBXPActivityId=237
   m_WeaponDeployables(0)=Class'TribesGame.TrDeployable_AntiAirTurret'
   m_WeaponDeployables(1)=()
   m_nCreditCost=1500
   m_nIconIndex=5
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_AntiAirTurretDeployable:FireCameraShake'
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=35.000000),Rotation=(Pitch=0,Yaw=16384,Roll=0),Scale=0.650000)
   m_InGamePaperDollInfo=(Translation=(X=120.000000,Y=-50.000000,Z=35.000000),Rotation=(Pitch=0,Yaw=-16384,Roll=0),Scale=0.650000)
   InfoPanelDescription="The EXR Turret has a longer range than the Light Turret and fires a small explosive rocket. It deals less focused damage than the Light Turret, but makes up for it with flexibility."
   UpgradeDescription(0)="-15% TURRET\nLOCK\nDELAY"
   UpgradeDescription(1)="+1 TURRET\nDEPLOY\nLIMIT"
   UpgradeDescription(2)="+25% TURRET\nVERSUS\nARMORED"
   Upgrades(0)=(IconId=10,DatabaseItemId=8268,Modifications=((ModType=56,Value=0.150000)))
   Upgrades(1)=(IconId=3,DatabaseItemId=8269,Modifications=((ModType=45,Value=1.000000)))
   Upgrades(2)=(IconId=5,DatabaseItemId=8270,Modifications=((ModType=66,Value=0.250000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_AntiAirTurretDeployable_Content"
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Deployable:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Deployable:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="EXR Turret"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Deployable:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Deployable:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_AntiAirTurretDeployable"
   ObjectArchetype=TrDevice_Deployable'TribesGame.Default__TrDevice_Deployable'
}
