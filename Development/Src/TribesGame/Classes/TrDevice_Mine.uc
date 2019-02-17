/**
 * 
 */
class TrDevice_Mine extends TrDevice_AutoFire;

defaultproperties
{
   m_fPullPinTime=0.200000
   DBWeaponId=7392
   DBXPActivityId=195
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_nCarriedAmmo=1
   m_nMaxCarriedAmmo=1
   m_nIconIndex=30
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=-3640,Yaw=-4096,Roll=0),Scale=2.500000)
   m_InGamePaperDollInfo=(Scale=2.300000)
   InfoPanelDescription="Mines explode when enemies travel over them, and give the Doombringer added defensive capabilities."
   InfoPanelDamage=8
   InfoPanelRadius=5
   InfoPanelFireRate=5
   InfoPanelClipSize=-1
   UpgradeDescription(0)="+1 AMMO"
   UpgradeDescription(1)="+10% RADIUS"
   UpgradeDescription(2)="+20% DAMAGE\nVERSUS\nARMORED"
   Upgrades(0)=(IconId=4,DatabaseItemId=8113,Modifications=((ModType=29,Value=1.000000)))
   Upgrades(1)=(IconId=7,DatabaseItemId=8114,Modifications=((ModType=55,Value=0.100000)))
   Upgrades(2)=(IconId=5,DatabaseItemId=8115,Modifications=((ModType=68,Value=0.200000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Mine_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   AttachmentClass=Class'TribesGame.TrAttachment_Mine'
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Mine'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Mines"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Mine"
   ObjectArchetype=TrDevice_AutoFire'TribesGame.Default__TrDevice_AutoFire'
}
