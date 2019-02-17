/**
 * 
 */
class TrDevice_Spinfusor extends TrDevice;

/** SkelControl handling spinning the disc. */
var TrSkelControl_SpinControl m_DiscSpinControl;

/** SkelControl handling the visibility of the disc. */
var SkelControlSingleBone m_DiscVisibilityControl;

/** Spinfusor idle sound. */
var SoundCue m_SpinfusorIdleSound;

function UpdateReplicatedCarriedAmmo()
{
	super.UpdateReplicatedCarriedAmmo();

    // Authoritative side hook for setting disc visibility.
    if( Role==ROLE_Authority && WorldInfo.NetMode != NM_DedicatedServer )
	{
		SetDiscVisibility(m_nCarriedAmmo != 0);
    }
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == Mesh )
    {
        m_DiscSpinControl = TrSkelControl_SpinControl(SkelComp.FindSkelControl('DiscSpinControl'));
        m_DiscVisibilityControl = SkelControlSingleBone(SkelComp.FindSkelControl('DiscVisibility'));

        SetDiscSpinning(true);
    }
    
    Super.PostInitAnimTree(SkelComp);
}

simulated event OnAnimPlay(AnimNodeSequence SeqNode)
{
    Super.OnAnimPlay(SeqNode);
    if( SeqNode != None && SeqNode.AnimSeqName == 'reload' )
    {
        SetDiscVisibility(true);
        SetDiscSpinning(false);
    }
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    Super.OnAnimEnd(SeqNode, PlayedTime, ExcessTime);
    if( SeqNode != None && SeqNode.AnimSeqName == 'Reload' )
    {
        SetDiscSpinning(true);
    }
}

simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
    Super.PlayFireEffects(FireModeNum, HitLocation);

    SetDiscVisibility(false);
}

simulated function PlayWeaponEquip()
{
    Super.PlayWeaponEquip();

    SetDiscSpinning(true);
    //SetDiscVisibility(ammoCount > 0 || m_nCarriedAmmo > 0);
}

simulated function SetDiscVisibility(bool bVisible)
{
	if (m_DiscVisibilityControl != none)
		m_DiscVisibilityControl.SetSkelControlActive(!bVisible);
}

simulated function SetDiscSpinning(bool bEnabled)
{
	local TrPawn POwner;

	if( m_DiscSpinControl != none )
	{
		m_DiscSpinControl.Spin(bEnabled);
	}

	POwner = TrPawn(Instigator);
	if( POwner != None )
	{
		// Disc spinning sound.
		POwner.SetWeaponAmbientSound(bEnabled ? m_SpinfusorIdleSound : None);
	}
}

/**
 * Show the weapon being put away
 */
simulated function PlayWeaponPutDown()
{
    Super.PlayWeaponPutDown();
    SetDiscSpinning(false);
}

simulated function PutDownFast()
{
	super.PutDownFast();
	SetDiscSpinning(false);
}

simulated function OnSwitchAwayFromWeapon()
{
	super.OnSwitchAwayFromWeapon();
	SetDiscSpinning(false);
}

defaultproperties
{
   DBWeaponId=7401
   DBXPActivityId=151
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bReloadSingles=True
   m_bAllowFireWhileZoomed=True
   m_bEndZoomOnReload=False
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.000000
   m_fAccuracyCorrectionRate=0.000000
   m_nReticuleIndex=1
   m_nLowAmmoWarning=5
   m_nCarriedAmmo=18
   m_nMaxCarriedAmmo=18
   m_fReloadTime=1.500000
   m_fPctTimeBeforeReload=0.390000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Spinfusor:FireCameraShake'
   m_TinyWeaponsOffset=(X=15.000000,Y=3.000000,Z=-6.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.600000)
   InfoPanelDescription="The Spinfusor is the most popular weapon used in the Wilderzone. Versatile, it packs a powerful punch."
   InfoPanelDamage=7
   InfoPanelRadius=4
   InfoPanelFireRate=3
   InfoPanelClipSize=-4
   UpgradeDescription(0)="+5 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+5 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=7992,Modifications=((ModType=30,Value=5.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=7993,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=7994,Modifications=((ModType=30,Value=5.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Spinfusor_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_Spinfusor:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_Spinfusor'
   MaxPitchLag=-600.000000
   MaxYawLag=-600.000000
   RotChgSpeed=2.500000
   ReturnChgSpeed=3.500000
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrSpinfusorMuzzleFlashLight'
   PlayerViewOffset=(X=-2.000000,Y=-1.500000,Z=-5.000000)
   SmallWeaponsOffset=(X=3.000000,Y=1.000000,Z=1.500000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Spinfusor'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.460000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
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
   ItemName="Spinfusor"
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
   Name="Default__TrDevice_Spinfusor"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
