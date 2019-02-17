class TrPerk_Egocentric extends TrPerk;

defaultproperties
{
   DBWeaponId=7917
   DBXPActivityId=250
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Egocentric:FireCameraShake'
   InfoPanelDescription="15% Protection from Self Damage."
   UpgradeDescription(0)="+10% PROTECTION\nSELF DAMAGE"
   UpgradeDescription(1)="+10% PROTECTION\nSELF DAMAGE"
   UpgradeDescription(2)="IGNORE SELF\nWHITEOUT\nAND EMP"
   Upgrades(0)=(IconId=9,DatabaseItemId=8173,Modifications=((ModType=12,Value=0.100000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8174,Modifications=((ModType=12,Value=0.100000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8175,Modifications=((ModType=80,Value=1.000000)))
   BaseMod=(Modifications=((ModType=12,Value=0.150000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Egocentric"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Egocentric:ForceFeedbackWaveformShooting1'
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
   ItemName="Egocentric"
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
   Name="Default__TrPerk_Egocentric"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
