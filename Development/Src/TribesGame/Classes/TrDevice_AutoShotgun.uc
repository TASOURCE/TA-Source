/**
 * 
 */
class TrDevice_AutoShotgun extends TrDevice_Shotgun;

defaultproperties
{
   DBWeaponId=7449
   DBXPActivityId=155
   m_bReloadSingles=False
   m_nCarriedAmmo=42
   m_nMaxCarriedAmmo=42
   m_fReloadTime=1.800000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_AutoShotgun:FireCameraShake'
   m_TinyWeaponsOffset=(X=20.000000,Y=4.000000,Z=-8.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=7.000000,Z=58.000000))
   InfoPanelDescription="This shotgun is clip loaded, rather than single shell, allowing for a more steady rate of fire."
   InfoPanelDamage=4
   InfoPanelRadius=-2
   InfoPanelClipSize=3
   UpgradeDescription(0)="+14 AMMO"
   UpgradeDescription(2)="+14 AMMO"
   UpgradeDescription(3)="-25% RELOAD\nTIME"
   Upgrades(0)=(DatabaseItemId=8127,Modifications=((Value=14.000000)))
   Upgrades(1)=(IconId=4,DatabaseItemId=8128)
   Upgrades(2)=(DatabaseItemId=8129,Modifications=((Value=14.000000)))
   Upgrades(3)=(IconId=10,DatabaseItemId=8130,Modifications=((ModType=36,Value=0.250000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_AutoShotgun_Content"
   MaxAmmoCount=7
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_AutoShotgun:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_AutoShotgun'
   PlayerViewOffset=(X=7.000000,Y=2.000000,Z=-9.000000)
   SmallWeaponsOffset=(X=13.000000,Y=2.000000,Z=1.000000)
   FireInterval(0)=0.500000
   FireInterval(1)=()
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_AutoShotgun'
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
   ItemName="Automatic Shotgun"
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
   Name="Default__TrDevice_AutoShotgun"
   ObjectArchetype=TrDevice_Shotgun'TribesGame.Default__TrDevice_Shotgun'
}
