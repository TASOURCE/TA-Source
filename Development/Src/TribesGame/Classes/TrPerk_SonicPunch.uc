class TrPerk_SonicPunch extends TrPerk;

defaultproperties
{
   DBWeaponId=8231
   DBXPActivityId=257
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_SonicPunch:FireCameraShake'
   InfoPanelDescription="Your melee attacks now cause a shock-wave that knocks back nearby enemies. With the final upgrade of this perk the shockwave will force flag drops on enemy players."
   UpgradeDescription(0)="INCREASE\nKNOCKBACK"
   UpgradeDescription(1)="INCREASE\nKNOCKBACK"
   UpgradeDescription(2)="FORCES\nFLAG DROP"
   Upgrades(0)=(IconId=9,DatabaseItemId=8233,Modifications=((ModType=85,Value=150.000000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8234,Modifications=((ModType=85,Value=150.000000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8235,Modifications=((ModType=53,Value=1.000000)))
   BaseMod=(Modifications=((ModType=83,Value=1.000000),(ModType=84,Value=315.000000),(ModType=85,Value=450.000000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_SonicPunch"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_SonicPunch:ForceFeedbackWaveformShooting1'
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPerk:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPerk:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Sonic Punch"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrPerk:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrPerk:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrPerk_SonicPunch"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
