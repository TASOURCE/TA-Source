class TrPerk_Pilot extends TrPerk;

defaultproperties
{
   DBWeaponId=8159
   DBXPActivityId=254
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Pilot:FireCameraShake'
   InfoPanelDescription="Vehicles you purchase have 10% extra health."
   UpgradeDescription(0)="+5% VEHICLE\nHEALTH"
   UpgradeDescription(1)="+5% VEHICLE\nHEALTH"
   UpgradeDescription(2)="EJECT FROM\nEXPLODING\nVEHICLES"
   Upgrades(0)=(IconId=9,DatabaseItemId=8179,Modifications=((ModType=15,Value=0.050000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8180,Modifications=((ModType=15,Value=0.050000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8181,Modifications=((ModType=11,Value=1.000000)))
   BaseMod=(Modifications=((ModType=15,Value=0.100000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Pilot"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Pilot:ForceFeedbackWaveformShooting1'
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
   ItemName="Pilot"
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
   Name="Default__TrPerk_Pilot"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
