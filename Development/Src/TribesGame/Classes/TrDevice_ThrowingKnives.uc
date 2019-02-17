/**
 * 
 */
class TrDevice_ThrowingKnives extends TrDevice;

var SkelControlSingleBone m_KnifeVisibilityTopControl;
var SkelControlSingleBone m_KnifeVisibilityBottomControl;

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	super.PostInitAnimTree(SkelComp);

    if( SkelComp == Mesh )
    {
		m_KnifeVisibilityTopControl = SkelControlSingleBone(SkelComp.FindSkelControl('knifeVisibility_Top'));
		m_KnifeVisibilityBottomControl = SkelControlSingleBone(SkelComp.FindSkelControl('knifeVisibility_Bottom'));
    }
}

simulated function UpdateSkelControlKnives(bool bForceFullAmmo)
{
	if( bForceFullAmmo || m_RemainingAmmoInClip >= 3 )
	{
		m_KnifeVisibilityBottomControl.SetSkelControlActive(false);
		m_KnifeVisibilityTopControl.SetSkelControlActive(false);
	}
	else
	{
		if( m_RemainingAmmoInClip < 3 )
		{
			m_KnifeVisibilityBottomControl.SetSkelControlActive(true);
		}
		
		if( m_RemainingAmmoInClip < 2 )
		{
			m_KnifeVisibilityTopControl.SetSkelControlActive(true);
		}
	}
}

simulated function OnFireSkelControlKnivesAnimNotify()
{
	UpdateSkelControlKnives(false);
}

simulated function OnSkelControlKnivesAnimNotify()
{
	UpdateSkelControlKnives(true);
}

simulated function PlayWeaponEquip()
{
	UpdateSkelControlKnives(false);
	super.PlayWeaponEquip();
}

simulated function Projectile ProjectileFire()
{
	local Projectile ProjRet;
	ProjRet = super.ProjectileFire();
	StopFire(0);
	return ProjRet;
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
   DBWeaponId=8256
   DBXPActivityId=163
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.100000
   m_fAccuracyCorrectionRate=0.280000
   m_nReticuleIndex=15
   m_nLowAmmoWarning=2
   m_nCarriedAmmo=25
   m_nMaxCarriedAmmo=25
   m_fKickbackBlendOutTime=5.000000
   m_v2WeaponLagInterpSpeed=(X=3.000000,Y=3.000000)
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ThrowingKnives:FireCameraShake'
   m_TinyWeaponsOffset=(X=15.000000,Y=-1.000000,Z=-5.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=60.000000),Rotation=(Pitch=-4004,Yaw=-21845,Roll=-8192),Scale=2.700000)
   m_InGamePaperDollInfo=(Rotation=(Pitch=-4004,Yaw=-21845,Roll=-8192),Scale=3.000000)
   InfoPanelDescription="Throwing Knives deal impressive damage on a direct hit, and have a small splash damage radius as well."
   InfoPanelDamage=6
   InfoPanelRadius=-4
   InfoPanelFireRate=5
   InfoPanelClipSize=1
   UpgradeDescription(0)="+10 AMMO"
   UpgradeDescription(1)="-30% RELOAD\nTIME"
   UpgradeDescription(2)="+1 CLIP\nSIZE"
   Upgrades(0)=(IconId=4,DatabaseItemId=8312,Modifications=((ModType=37,Value=10.000000)))
   Upgrades(1)=(IconId=10,DatabaseItemId=8313,Modifications=((ModType=36,Value=0.300000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8314,Modifications=((ModType=67,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_ThrowingKnives_Content"
   bSniping=True
   MaxAmmoCount=5
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_ThrowingKnives:ForceFeedbackShootingSmall'
   AttachmentClass=Class'TribesGame.TrAttachment_ThrowingKnives'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashLightClass=None
   PlayerViewOffset=(X=15.000000,Y=-5.000000,Z=-6.500000)
   SmallWeaponsOffset=(X=2.000000,Y=-1.000000,Z=3.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=-300,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_ThrowingKnives'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.500000
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
   ItemName="Throwing Knives"
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
   Name="Default__TrDevice_ThrowingKnives"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
