/**
 * 
 */
class TrDevice_SawedOffShotgun extends TrDevice_Shotgun;

defaultproperties
{
   DBWeaponId=7427
   DBXPActivityId=181
   m_bReloadSingles=False
   m_bCanEarlyAbortReload=False
   m_nLowAmmoWarning=1
   m_nCarriedAmmo=60
   m_nMaxCarriedAmmo=60
   m_fReloadTime=1.600000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SawedOffShotgun:FireCameraShake'
   m_fFireIntervalForLastShotInClip=0.200000
   m_TinyWeaponsOffset=(X=25.000000,Y=8.000000,Z=-12.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=60.000000))
   m_InGamePaperDollInfo=(Scale=2.800000)
   InfoPanelDescription="The Sawed-Off Shotgun deals incredible damage at close range."
   InfoPanelRadius=-2
   InfoPanelFireRate=5
   UpgradeDescription(1)="-20% RELOAD\nTIME"
   Upgrades(0)=(DatabaseItemId=8022)
   Upgrades(1)=(IconId=10,DatabaseItemId=8023,Modifications=((ModType=36,Value=0.200000)))
   Upgrades(2)=(DatabaseItemId=8024)
   m_sContentDataClassName="TribesGameContent.TrDevice_SawedOffShotgun_Content"
   MaxAmmoCount=2
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SawedOffShotgun:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_SawedOffShotgun'
   PlayerViewOffset=(X=-5.000000,Y=1.000000,Z=-7.000000)
   SmallWeaponsOffset=(X=9.000000,Y=1.000000,Z=1.000000)
   WidescreenRotationOffset=(Pitch=500,Yaw=0,Roll=0)
   FireInterval(0)=0.500000
   FireInterval(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_SawedOffShotgun'
   InstantHitDamageTypes(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Shotgun:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=2.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Shotgun:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Sawed-Off Shotgun"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Shotgun:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Shotgun:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_SawedOffShotgun"
   ObjectArchetype=TrDevice_Shotgun'TribesGame.Default__TrDevice_Shotgun'
}
