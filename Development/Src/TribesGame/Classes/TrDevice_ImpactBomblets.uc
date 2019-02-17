/**
 * 
 */
class TrDevice_ImpactBomblets extends TrDevice_AutoFire;

defaultproperties
{
   m_fPullPinTime=0.150000
   DBWeaponId=8244
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_nCarriedAmmo=1
   m_nMaxCarriedAmmo=1
   m_nIconIndex=21
   m_TinyWeaponsOffset=(X=12.000000,Y=3.000000,Z=-12.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=-3640,Yaw=-16000,Roll=0),Scale=3.500000)
   Upgrades(0)=(IconId=6,DatabaseItemId=8274,Modifications=((ModType=29,Value=1.000000)))
   Upgrades(1)=(IconId=7,DatabaseItemId=8275,Modifications=((ModType=55,Value=0.100000)))
   Upgrades(2)=(IconId=6,DatabaseItemId=8276,Modifications=((ModType=29,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_ImpactBomblets_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   AttachmentClass=Class'TribesGame.TrAttachment_ImpactBomblets'
   SmallWeaponsOffset=(X=0.000000,Y=0.000000,Z=-1.500000)
   WideScreenOffsetScaling=1.000000
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_ImpactBomblets'
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
   Name="Default__TrDevice_ImpactBomblets"
   ObjectArchetype=TrDevice_AutoFire'TribesGame.Default__TrDevice_AutoFire'
}
