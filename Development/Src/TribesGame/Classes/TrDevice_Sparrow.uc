/**
 * 
 */
class TrDevice_Sparrow extends TrDevice;

simulated function InstantFire()
{
	super.InstantFire();
	StopFire(0);
}

defaultproperties
{
   DBWeaponId=7433
   DBXPActivityId=182
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowHoldDownFire=False
   m_fDefaultAccuracy=0.980000
   m_fAccuracyLossOnShot=0.450000
   m_fAccuracyLossMax=0.100000
   m_fAccuracyCorrectionRate=0.380000
   m_nReticuleIndex=15
   m_nLowAmmoWarning=8
   m_nCarriedAmmo=144
   m_nMaxCarriedAmmo=144
   m_fKickbackBlendOutTime=5.000000
   m_v2WeaponLagInterpSpeed=(X=3.000000,Y=3.000000)
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Sparrow:FireCameraShake'
   m_TinyWeaponsOffset=(X=13.000000,Y=0.000000,Z=-5.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=3.000000)
   m_InGamePaperDollInfo=(Scale=2.800000)
   InfoPanelDescription="The Sparrow fires near instantaneous supersonic rounds, making it an exceptional finishing weapon against wounded enemies."
   InfoPanelDamage=3
   InfoPanelRadius=-4
   InfoPanelFireRate=9
   InfoPanelClipSize=4
   UpgradeDescription(0)="+44 AMMO"
   UpgradeDescription(1)="+4 CLIP\nSIZE"
   UpgradeDescription(2)="-30% RELOAD\nTIME"
   Upgrades(0)=(IconId=4,DatabaseItemId=8025,Modifications=((ModType=37,Value=44.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=8026,Modifications=((ModType=67,Value=4.000000)))
   Upgrades(2)=(IconId=10,DatabaseItemId=8027,Modifications=((ModType=36,Value=0.300000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Sparrow_Content"
   bSniping=True
   MaxAmmoCount=24
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_Sparrow:ForceFeedbackShootingSmall'
   AttachmentClass=Class'TribesGame.TrAttachment_Sparrow'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=13.000000,Y=2.000000,Z=-9.000000)
   SmallWeaponsOffset=(X=8.000000,Y=-2.000000,Z=2.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   FireInterval(0)=0.160000
   FireInterval(1)=()
   InstantHitDamage(0)=90.000000
   InstantHitDamage(1)=()
   InstantHitMomentum(0)=1000.000000
   InstantHitMomentum(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_Sparrow'
   InstantHitDamageTypes(1)=()
   FireOffset=(X=20.000000,Y=0.000000,Z=-0.000000)
   bInstantHit=True
   WeaponRange=10000.000000
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
   ItemName="Sparrow"
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
   Name="Default__TrDevice_Sparrow"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
