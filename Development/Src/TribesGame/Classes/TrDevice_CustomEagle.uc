/**
 * 
 */
class TrDevice_CustomEagle extends TrDevice;

simulated function InstantFire()
{
	super.InstantFire();
	StopFire(0);
}

defaultproperties
{
   DBWeaponId=7439
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bForceReplicateAmmoOnFire=True
   m_bIsKickbackAdditive=True
   m_bAllowHoldDownFire=False
   m_fDefaultAccuracy=0.990000
   m_fAccuracyLossOnShot=0.060000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=15
   m_nCarriedAmmo=100
   m_nMaxCarriedAmmo=100
   m_fKickbackBlendOutTime=5.000000
   m_v2WeaponLagInterpSpeed=(X=3.000000,Y=3.000000)
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_CustomEagle:FireCameraShake'
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=4.000000)
   Upgrades(0)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(1)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(2)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(3)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(4)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   m_sContentDataClassName="TribesGameContent.TrDevice_CustomEagle_Content"
   bSniping=True
   MaxAmmoCount=10
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_CustomEagle:ForceFeedbackShootingSmall'
   AttachmentClass=Class'TribesGame.TrAttachment_CustomEagle'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=7.000000,Y=0.000000,Z=-5.000000)
   SmallWeaponsOffset=(X=0.000000,Y=0.000000,Z=3.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=-300,Yaw=0,Roll=0)
   FireInterval(0)=0.150000
   FireInterval(1)=()
   InstantHitDamage(0)=180.000000
   InstantHitDamage(1)=()
   InstantHitMomentum(0)=1000.000000
   InstantHitMomentum(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_CustomEagle'
   InstantHitDamageTypes(1)=()
   FireOffset=(X=20.000000,Y=5.000000,Z=0.000000)
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
   ItemName="Custom Eagle"
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
   Name="Default__TrDevice_CustomEagle"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
