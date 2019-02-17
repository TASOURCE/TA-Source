class TrPerk_Reach extends TrPerk;

defaultproperties
{
   DBWeaponId=7916
   DBXPActivityId=243
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Reach:FireCameraShake'
   InfoPanelDescription="Reach increases the range in which you can pickup flags."
   UpgradeDescription(0)="+10% REACH"
   UpgradeDescription(1)="+10% REACH"
   UpgradeDescription(2)="REACH WORKS\nON AMMO\nDROPS"
   Upgrades(0)=(IconId=9,DatabaseItemId=8152,Modifications=((ModType=82,Value=1.000000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8171,Modifications=((ModType=82,Value=1.000000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8172,Modifications=((ModType=75,Value=1.000000)))
   BaseMod=(Modifications=((ModType=82,Value=1.000000),(ModType=5,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Reach"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Reach:ForceFeedbackWaveformShooting1'
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
   ItemName="Reach"
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
   Name="Default__TrPerk_Reach"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
