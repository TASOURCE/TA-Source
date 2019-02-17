class TrPerk_Rage extends TrPerk;

defaultproperties
{
   DBWeaponId=8232
   DBXPActivityId=242
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Rage:FireCameraShake'
   InfoPanelDescription="If you are near your flag when an enemy picks it up, you become enraged. Enraged grants you an instant +50 Energy. For 15 seconds you have 20% less mass and are immune to the next self-damage you take, which removes the Rage Effect."
   UpgradeDescription(0)="+25 ENERGY"
   UpgradeDescription(1)="+25 ENERGY"
   UpgradeDescription(2)="+50% HEAL\nAT START\nOF RAGE"
   Upgrades(0)=(IconId=9,DatabaseItemId=8236,Modifications=((ModType=87,Value=25.000000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8237,Modifications=((ModType=87,Value=25.000000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8238,Modifications=((ModType=89,Value=0.500000)))
   BaseMod=(Modifications=((ModType=86,Value=1.000000),(ModType=88,Value=15.000000),(ModType=87,Value=50.000000),(ModType=91,Value=-0.200000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Rage"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Rage:ForceFeedbackWaveformShooting1'
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
   ItemName="Rage"
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
   Name="Default__TrPerk_Rage"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
