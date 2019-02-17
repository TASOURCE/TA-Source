/**
 * 
 */
class TrDevice_DropJammerDeployable extends TrDevice_Deployable;

defaultproperties
{
   c_DeployableHologramClass=Class'TribesGame.TrDeployableHologram_DropJammer'
   m_fOtherDeployableProximityCheck=64.000000
   DBWeaponId=7456
   DBXPActivityId=233
   m_WeaponDeployables(0)=Class'TribesGame.TrDeployable_DropJammer'
   m_WeaponDeployables(1)=()
   m_nCreditCost=500
   m_nIconIndex=14
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_DropJammerDeployable:FireCameraShake'
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=35.000000),Rotation=(Pitch=0,Yaw=-8120,Roll=0),Scale=1.400000,CharacterLightingContrastFactor=0.750000)
   m_InGamePaperDollInfo=(Translation=(X=120.000000,Y=-50.000000,Z=27.000000),Rotation=(Pitch=0,Yaw=-16384,Roll=0),Scale=1.500000)
   InfoPanelDescription="Jammers hide you from enemy sensors and HUD markers, as well as reveal enemy players in stealth."
   UpgradeDescription(0)="+15% RADIUS"
   UpgradeDescription(1)="+15% RADIUS"
   UpgradeDescription(2)="+1 JAMMER\nDEPLOYED"
   Upgrades(0)=(IconId=7,DatabaseItemId=7949,Modifications=((ModType=40,Value=0.150000)))
   Upgrades(1)=(IconId=7,DatabaseItemId=7950,Modifications=((ModType=40,Value=0.150000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=7951,Modifications=((ModType=45,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_DropJammer_Content"
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
   ItemName="Drop Jammer"
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
   Name="Default__TrDevice_DropJammerDeployable"
   ObjectArchetype=TrDevice_Deployable'TribesGame.Default__TrDevice_Deployable'
}
