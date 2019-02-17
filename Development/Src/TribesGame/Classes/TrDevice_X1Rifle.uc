/**
 * 
 */
class TrDevice_X1Rifle extends TrDevice_ChainGun;

defaultproperties
{
   m_fBuildupTime=0.500000
   Begin Object Class=UTAmbientSoundComponent Name=ChaingunSpinSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ChainGun:ChaingunSpinSound'
      bAllowSpatialization=False
      Name="ChaingunSpinSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ChainGun:ChaingunSpinSound'
   End Object
   m_AudioComponentWeaponSpin=ChaingunSpinSound
   m_bHasClip=True
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ChainGun:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ChainGun:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=7458
   DBXPActivityId=166
   m_bAllowReloads=True
   m_nCarriedAmmo=320
   m_nMaxCarriedAmmo=320
   m_fReloadTime=2.750000
   m_fPctTimeBeforeReload=0.588000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_X1Rifle:FireCameraShake'
   m_TinyWeaponsOffset=(X=20.000000,Y=-2.000000,Z=-4.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=6.000000,Z=58.000000),Scale=2.100000)
   m_InGamePaperDollInfo=(Scale=2.400000)
   InfoPanelDescription="The X1 LMG provides a Juggernaut with a strong automatic weapon and improved anti-air capability."
   InfoPanelDamage=2
   InfoPanelRadius=-4
   InfoPanelClipSize=8
   UpgradeDescription(0)="+70 AMMO"
   UpgradeDescription(1)="+10 CLIP\nSIZE"
   UpgradeDescription(2)="+70 AMMO"
   UpgradeDescription(3)="-30% RELOAD\nTIME"
   Upgrades(0)=(DatabaseItemId=8079,Modifications=((ModType=37,Value=70.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=8080,Modifications=((ModType=67,Value=10.000000)))
   Upgrades(2)=(DatabaseItemId=8081,Modifications=((ModType=37,Value=70.000000)))
   Upgrades(3)=(DatabaseItemId=8082,Modifications=((ModType=36,Value=0.300000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_X1Rifle_Content"
   MaxAmmoCount=70
   AttachmentClass=Class'TribesGame.TrAttachment_X1Rifle'
   PlayerViewOffset=(X=10.000000,Y=4.000000,Z=-7.000000)
   SmallWeaponsOffset=(X=11.000000,Y=4.000000,Z=1.000000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_X1Rifle'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ChainGun:FirstPersonMesh'
      FOV=55.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ChainGun:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="X1 LMG"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ChainGun:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ChainGun:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Components(1)=ChaingunSpinSound
   Name="Default__TrDevice_X1Rifle"
   ObjectArchetype=TrDevice_ChainGun'TribesGame.Default__TrDevice_ChainGun'
}
