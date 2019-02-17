/**
 * 
 */
class TrDevice_DiskToss extends TrDevice_AutoFire;

defaultproperties
{
   DBWeaponId=7459
   DBXPActivityId=202
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_nCarriedAmmo=1
   m_nMaxCarriedAmmo=1
   m_nIconIndex=31
   m_TinyWeaponsOffset=(X=12.000000,Y=3.000000,Z=-12.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=-3640,Yaw=-4480,Roll=-3640),Scale=5.000000)
   InfoPanelDescription="Freehand throwing a Spinfusor disc may seem crazy, but for Juggernauts it is a favored sport and a valued show of strength. Discs explode on contact with any surface. S+2."
   InfoPanelDamage=7
   InfoPanelRadius=4
   InfoPanelFireRate=1
   InfoPanelClipSize=-2
   UpgradeDescription(0)="+1 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+1 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8086,Modifications=((ModType=29,Value=1.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8087,Modifications=((ModType=68,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8088,Modifications=((ModType=29,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_DiskToss_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   AttachmentClass=Class'TribesGame.TrAttachment_Grenade'
   PlayerViewOffset=(X=10.000000,Y=0.000000,Z=-8.000000)
   SmallWeaponsOffset=(X=0.000000,Y=0.000000,Z=-1.500000)
   WideScreenOffsetScaling=1.000000
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_DiskToss'
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
   ItemName="Spinfusor Disc"
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
   Name="Default__TrDevice_DiskToss"
   ObjectArchetype=TrDevice_AutoFire'TribesGame.Default__TrDevice_AutoFire'
}
