/**
 * 
 */
class TrDevice_HeavyBoltLauncher extends TrDevice;

/** Spinfusor idle sound. */
var SoundCue m_BoltIdleSound;

simulated function SetBoltIdle(bool bEnabled)
{
	local TrPawn POwner;

	POwner = TrPawn(Instigator);
	if( POwner != None )
	{
		// Disc spinning sound.
		POwner.SetWeaponAmbientSound(bEnabled ? m_BoltIdleSound : None);
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == Mesh )
    {
        SetBoltIdle(true);
    }
    
    Super.PostInitAnimTree(SkelComp);
}

simulated event OnAnimPlay(AnimNodeSequence SeqNode)
{
    Super.OnAnimPlay(SeqNode);
    if( SeqNode != None && SeqNode.AnimSeqName == 'reload' )
    {
        SetBoltIdle(false);
    }
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    Super.OnAnimEnd(SeqNode, PlayedTime, ExcessTime);
    if( SeqNode != None && SeqNode.AnimSeqName == 'Reload' )
    {
        SetBoltIdle(true);
    }
}

simulated function PlayWeaponEquip()
{
    Super.PlayWeaponEquip();

    SetBoltIdle(true);
}

simulated function PlayWeaponPutDown()
{
    Super.PlayWeaponPutDown();
    SetBoltIdle(false);
}

simulated function PutDownFast()
{
	super.PutDownFast();
	SetBoltIdle(false);
}

simulated function OnSwitchAwayFromWeapon()
{
	super.OnSwitchAwayFromWeapon();
	SetBoltIdle(false);
}

defaultproperties
{
   DBWeaponId=7452
   DBWeaponTypeId=1
   DBXPActivityId=133
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bReloadSingles=True
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_bEndZoomOnReload=False
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=8
   m_nLowAmmoWarning=4
   m_nCarriedAmmo=20
   m_nMaxCarriedAmmo=20
   m_fReloadTime=1.700000
   m_fPctTimeBeforeReload=0.390000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_HeavyBoltLauncher:FireCameraShake'
   m_TinyWeaponsOffset=(X=20.000000,Y=4.000000,Z=-8.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=6.000000,Z=55.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=1.800000)
   m_InGamePaperDollInfo=(Scale=1.900000)
   InfoPanelDescription="The heavy version of the bolt launcher deals more damage per hit than its lighter counterpart."
   InfoPanelDamage=8
   InfoPanelRadius=4
   InfoPanelFireRate=2
   InfoPanelClipSize=-4
   UpgradeDescription(0)="+5 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+5 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8104,Modifications=((ModType=30,Value=5.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8105,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8106,Modifications=((ModType=30,Value=5.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_HeavyBoltLauncher_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_HeavyBoltLauncher:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_HeavyBoltLauncher'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrSpinfusorMuzzleFlashLight'
   PlayerViewOffset=(X=16.000000,Y=-5.000000,Z=-6.000000)
   SmallWeaponsOffset=(X=10.000000,Y=1.000000,Z=2.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_HeavyBoltLauncher'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.460000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=47.000000
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
   ItemName="Heavy Bolt Launcher"
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
   Name="Default__TrDevice_HeavyBoltLauncher"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
