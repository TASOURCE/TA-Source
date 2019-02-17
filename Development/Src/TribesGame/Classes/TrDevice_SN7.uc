/**
 * 
 */
class TrDevice_SN7 extends TrDevice;

simulated function Projectile ProjectileFire()
{
	local Projectile ProjRet;
	ProjRet = super.ProjectileFire();
	StopFire(0);
	return ProjRet;
}

defaultproperties
{
   DBWeaponId=7418
   DBXPActivityId=161
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.100000
   m_fAccuracyCorrectionRate=0.280000
   m_nReticuleIndex=15
   m_nLowAmmoWarning=6
   m_nCarriedAmmo=60
   m_nMaxCarriedAmmo=60
   m_fKickbackBlendOutTime=5.000000
   m_v2WeaponLagInterpSpeed=(X=3.000000,Y=3.000000)
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SN7:FireCameraShake'
   m_TinyWeaponsOffset=(X=12.000000,Y=2.000000,Z=-3.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.700000)
   m_InGamePaperDollInfo=(Scale=3.000000)
   InfoPanelDescription="A precision weapon, the SN7 is perfect for finishing off an enemy after an ambush."
   InfoPanelDamage=4
   InfoPanelRadius=-4
   InfoPanelFireRate=6
   InfoPanelClipSize=2
   UpgradeDescription(0)="+24 AMMO"
   UpgradeDescription(1)="-30% RELOAD\nTIME"
   UpgradeDescription(2)="+4 CLIP\nSIZE"
   Upgrades(0)=(IconId=4,DatabaseItemId=7967,Modifications=((ModType=37,Value=24.000000)))
   Upgrades(1)=(IconId=10,DatabaseItemId=7968,Modifications=((ModType=36,Value=0.300000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=7969,Modifications=((ModType=67,Value=4.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_SN7_Content"
   bSniping=True
   MaxAmmoCount=12
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SN7:ForceFeedbackShootingSmall'
   AttachmentClass=Class'TribesGame.TrAttachment_SN7'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashLightClass=None
   PlayerViewOffset=(X=12.000000,Y=6.000000,Z=-10.000000)
   SmallWeaponsOffset=(X=3.000000,Y=1.000000,Z=4.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=-300,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_SN7'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.200000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=0.000000,Z=-0.000000)
   bInstantHit=True
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=60.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="SN7 Silenced Pistol"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_SN7"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
