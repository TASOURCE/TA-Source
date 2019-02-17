/**
 * 
 */
class TrDevice_NovaColt extends TrDevice;

simulated function bool ShouldRefire()
{
	return false;
}

simulated function FireAmmunition()
{
	if( Role == ROLE_Authority )
	{
		r_bReadyToFire = false;
	}
	Super.FireAmmunition();
}

simulated function StartFire(byte FireModeNum)
{
	if( Role < ROLE_Authority )
	{
		m_bWantsToFire = true;
	}
	super.StartFire(FireModeNum);
}

defaultproperties
{
   DBWeaponId=7394
   DBXPActivityId=174
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowHoldDownFire=False
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.100000
   m_fAccuracyCorrectionRate=0.280000
   m_nReticuleIndex=15
   m_nLowAmmoWarning=4
   m_nCarriedAmmo=72
   m_nMaxCarriedAmmo=72
   m_fReloadTime=2.000000
   m_fKickbackBlendOutTime=5.000000
   m_v2WeaponLagInterpSpeed=(X=3.000000,Y=3.000000)
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_NovaColt:FireCameraShake'
   m_TinyWeaponsOffset=(X=13.000000,Y=2.000000,Z=-6.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=60.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.800000)
   InfoPanelDescription="The Nova Blaster fires a fast-moving bolt of energy that will ricochet off of most surfaces."
   InfoPanelDamage=5
   InfoPanelRadius=-4
   InfoPanelFireRate=5
   InfoPanelClipSize=2
   UpgradeDescription(0)="+24 AMMO"
   UpgradeDescription(1)="+4 CLIP\nSIZE"
   UpgradeDescription(2)="-30% RELOAD\nTIME"
   Upgrades(0)=(IconId=4,DatabaseItemId=7936,Modifications=((ModType=37,Value=24.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=7937,Modifications=((ModType=67,Value=4.000000)))
   Upgrades(2)=(IconId=10,DatabaseItemId=7938,Modifications=((ModType=36,Value=0.300000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_NovaColt_Content"
   MaxAmmoCount=12
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_NovaColt:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_NovaColt'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=0,G=10,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_NovaColt'
   PlayerViewOffset=(X=10.000000,Y=4.000000,Z=-11.000000)
   SmallWeaponsOffset=(X=8.000000,Y=0.000000,Z=0.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_NovaColt'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.350000
   FireInterval(1)=()
   FireOffset=(X=-15.000000,Y=8.000000,Z=-6.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=65.000000
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
   ItemName="Nova Blaster"
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
   Name="Default__TrDevice_NovaColt"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
