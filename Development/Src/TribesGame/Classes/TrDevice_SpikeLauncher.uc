/**
 * 
 */
class TrDevice_SpikeLauncher extends TrDevice;

/** Spinfusor idle sound. */
var SoundCue m_SpikeIdleSound;

simulated function SetSpikeIdle(bool bEnabled)
{
	local TrPawn POwner;

	POwner = TrPawn(Instigator);
	if( POwner != None )
	{
		// Disc spinning sound.
		POwner.SetWeaponAmbientSound(bEnabled ? m_SpikeIdleSound : None);
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == Mesh )
    {
        SetSpikeIdle(true);
    }
    
    Super.PostInitAnimTree(SkelComp);
}

simulated event OnAnimPlay(AnimNodeSequence SeqNode)
{
    Super.OnAnimPlay(SeqNode);
    if( SeqNode != None && SeqNode.AnimSeqName == 'reload' )
    {
        SetSpikeIdle(false);
    }
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    Super.OnAnimEnd(SeqNode, PlayedTime, ExcessTime);
    if( SeqNode != None && SeqNode.AnimSeqName == 'Reload' )
    {
        SetSpikeIdle(true);
    }
}

simulated function PlayWeaponEquip()
{
    Super.PlayWeaponEquip();
    SetSpikeIdle(true);
}

/**
 * Show the weapon being put away
 */
simulated function PlayWeaponPutDown()
{
    Super.PlayWeaponPutDown();
    SetSpikeIdle(false);
}

simulated function PutDownFast()
{
	super.PutDownFast();
	SetSpikeIdle(false);
}

simulated function OnSwitchAwayFromWeapon()
{
	super.OnSwitchAwayFromWeapon();
	SetSpikeIdle(false);
}

defaultproperties
{
   DBWeaponId=8357
   DBXPActivityId=129
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bReloadSingles=True
   m_bEndZoomOnReload=False
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.000000
   m_fAccuracyCorrectionRate=0.000000
   m_nReticuleIndex=8
   m_nLowAmmoWarning=2
   m_nCarriedAmmo=10
   m_nMaxCarriedAmmo=10
   m_fReloadTime=1.400000
   m_fPctTimeBeforeReload=0.390000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SpikeLauncher:FireCameraShake'
   m_TinyWeaponsOffset=(X=15.000000,Y=1.000000,Z=-5.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.600000)
   InfoPanelDescription="Fires a charged round that sticks to walls and releases multiple shockwaves. Detonates instantly in a focused blast if it hits an enemy."
   InfoPanelDamage=10
   InfoPanelRadius=6
   InfoPanelFireRate=3
   InfoPanelClipSize=-3
   UpgradeDescription(0)="+5 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+5 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8386,Modifications=((ModType=30,Value=5.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8387,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8388,Modifications=((ModType=30,Value=5.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_SpikeLauncher_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SpikeLauncher:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_SpikeLauncher'
   MaxPitchLag=-600.000000
   MaxYawLag=-600.000000
   RotChgSpeed=2.500000
   ReturnChgSpeed=3.500000
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=0,G=0,R=0,A=255)
   MuzzleFlashLightClass=None
   PlayerViewOffset=(X=2.000000,Y=2.000000,Z=-5.000000)
   SmallWeaponsOffset=(X=5.000000,Y=2.000000,Z=1.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_SpikeLauncher'
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
   ItemName="Gladiator"
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
   Name="Default__TrDevice_SpikeLauncher"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
