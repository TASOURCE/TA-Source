/**
 * 
 */
class TrDevice_Twinfusor extends TrDevice;

/** Spinfusor idle sound. */
var SoundCue m_SpinfusorIdleSound;

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == Mesh )
    {
        SetDiscSpinning(true);
    }
    
    Super.PostInitAnimTree(SkelComp);
}

simulated event OnAnimPlay(AnimNodeSequence SeqNode)
{
    Super.OnAnimPlay(SeqNode);
    if( SeqNode != None && (SeqNode.AnimSeqName == 'reload' || SeqNode.AnimSeqName == 'reloadpartial') )
    {
        SetDiscSpinning(false);
    }
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    Super.OnAnimEnd(SeqNode, PlayedTime, ExcessTime);
    if( SeqNode != None && (SeqNode.AnimSeqName == 'reload' || SeqNode.AnimSeqName == 'reloadpartial') )
    {
        SetDiscSpinning(true);
    }
}

simulated function SetDiscSpinning(bool bEnabled)
{
	local TrPawn POwner;

	POwner = TrPawn(Instigator);
	if( POwner != None )
	{
		// Disc spinning sound.
		POwner.SetWeaponAmbientSound(bEnabled ? m_SpinfusorIdleSound : None);
	}
}

simulated function PlayWeaponEquip()
{
    Super.PlayWeaponEquip();

    SetDiscSpinning(true);
}

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
   DBWeaponId=8257
   DBXPActivityId=262
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bAllowFireWhileZoomed=True
   m_bEndZoomOnReload=False
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.000000
   m_fAccuracyCorrectionRate=0.000000
   m_nReticuleIndex=1
   m_nLowAmmoWarning=1
   m_nCarriedAmmo=24
   m_nMaxCarriedAmmo=24
   m_fReloadTime=1.600000
   m_fPctTimeBeforeReload=0.390000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Twinfusor:FireCameraShake'
   m_TinyWeaponsOffset=(X=16.000000,Y=2.000000,Z=-6.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=63.000000),Scale=2.700000)
   m_InGamePaperDollInfo=(Scale=3.000000)
   InfoPanelDescription="Quickly finding popularity across the Wilderzone, the Twinfusor fires two disks per reload. Sleek and sexy, much of the success is being attributed to its simple marketing slogan: 'Think Twice'"
   InfoPanelDamage=5
   InfoPanelRadius=4
   InfoPanelFireRate=5
   InfoPanelClipSize=-5
   UpgradeDescription(0)="+6 AMMO"
   UpgradeDescription(1)="+20% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+6 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8316,Modifications=((ModType=30,Value=6.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8317,Modifications=((ModType=69,Value=0.200000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8318,Modifications=((ModType=30,Value=6.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Twinfusor_Content"
   MaxAmmoCount=2
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_Twinfusor:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_Twinfusor'
   MaxPitchLag=-600.000000
   MaxYawLag=-600.000000
   RotChgSpeed=2.500000
   ReturnChgSpeed=3.500000
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=77,G=199,R=255,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_Gold'
   PlayerViewOffset=(X=7.000000,Y=3.000000,Z=-4.000000)
   SmallWeaponsOffset=(X=5.000000,Y=1.000000,Z=0.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Twinfusor'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.350000
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
   ItemName="Twinfusor"
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
   Name="Default__TrDevice_Twinfusor"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
