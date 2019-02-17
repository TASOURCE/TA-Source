/**
 * 
 */
class TrDevice_NovaSlug extends TrDevice;

simulated function InstantFire()
{
	super.InstantFire();
	StopFire(0);
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
   DBWeaponId=7431
   DBXPActivityId=157
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowHoldDownFire=False
   m_fDefaultAccuracy=0.980000
   m_fAccuracyLossOnShot=0.450000
   m_fAccuracyLossMax=0.100000
   m_fAccuracyCorrectionRate=0.380000
   m_nReticuleIndex=15
   m_nLowAmmoWarning=1
   m_nCarriedAmmo=48
   m_nMaxCarriedAmmo=48
   m_fKickbackBlendOutTime=5.000000
   m_v2WeaponLagInterpSpeed=(X=3.000000,Y=3.000000)
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_NovaSlug:FireCameraShake'
   m_TinyWeaponsOffset=(X=13.000000,Y=2.000000,Z=-6.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=60.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.800000)
   InfoPanelDescription="A classic 6-shooter reborn, the Nova Colt fires a super high velocity round that does massive damage."
   InfoPanelDamage=3
   InfoPanelRadius=-5
   InfoPanelFireRate=5
   InfoPanelClipSize=2
   UpgradeDescription(0)="+12 AMMO"
   UpgradeDescription(1)="-25% RELOAD\nTIME"
   UpgradeDescription(2)="+12 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8131,Modifications=((ModType=37,Value=12.000000)))
   Upgrades(1)=(IconId=10,DatabaseItemId=8132,Modifications=((ModType=36,Value=0.250000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8133,Modifications=((ModType=37,Value=12.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_NovaSlug_Content"
   bSniping=True
   MaxAmmoCount=6
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_NovaSlug:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_NovaSlug'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=4.000000,Y=4.000000,Z=-8.000000)
   SmallWeaponsOffset=(X=8.000000,Y=0.000000,Z=0.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   FireInterval(0)=0.240000
   FireInterval(1)=()
   InstantHitDamage(0)=190.000000
   InstantHitDamage(1)=()
   InstantHitMomentum(0)=1000.000000
   InstantHitMomentum(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_NovaSlug'
   InstantHitDamageTypes(1)=()
   FireOffset=(X=3.000000,Y=0.000000,Z=-0.000000)
   bInstantHit=True
   WeaponRange=10000.000000
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
   ItemName="Nova Colt"
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
   Name="Default__TrDevice_NovaSlug"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
