/**
 * 
 */
class TrDevice_StickyGrenade extends TrDevice_AutoFire;

defaultproperties
{
   m_fPullPinTime=0.150000
   DBWeaponId=7402
   DBXPActivityId=200
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_nCarriedAmmo=2
   m_nMaxCarriedAmmo=2
   m_nIconIndex=18
   m_TinyWeaponsOffset=(X=12.000000,Y=3.000000,Z=-12.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=60.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=5.000000)
   InfoPanelDescription="Sticky grenades deal a massive amount of damage to armored targets such as Base Turrets, Generators, and Vehicles. Not bad against humans either."
   InfoPanelDamage=10
   InfoPanelRadius=8
   InfoPanelFireRate=5
   InfoPanelClipSize=-2
   UpgradeDescription(0)="+1 AMMO"
   UpgradeDescription(1)="+10% RADIUS"
   UpgradeDescription(2)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(3)="+1 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=7970,Modifications=((ModType=29,Value=1.000000)))
   Upgrades(1)=(IconId=7,DatabaseItemId=7971,Modifications=((ModType=55,Value=0.100000)))
   Upgrades(2)=(IconId=5,DatabaseItemId=7972,Modifications=((ModType=68,Value=0.200000)))
   Upgrades(3)=(IconId=4,DatabaseItemId=7973,Modifications=((ModType=29,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_StickyGrenade_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   AttachmentClass=Class'TribesGame.TrAttachment_StickyGrenade'
   PlayerViewOffset=(X=12.000000,Y=3.000000,Z=-12.000000)
   SmallWeaponsOffset=(X=0.000000,Y=0.000000,Z=-1.500000)
   WideScreenOffsetScaling=1.000000
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_StickyGrenade'
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
   ItemName="Sticky Grenades"
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
   Name="Default__TrDevice_StickyGrenade"
   ObjectArchetype=TrDevice_AutoFire'TribesGame.Default__TrDevice_AutoFire'
}
