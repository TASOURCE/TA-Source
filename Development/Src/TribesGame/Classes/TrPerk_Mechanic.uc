class TrPerk_Mechanic extends TrPerk;

defaultproperties
{
   DBWeaponId=8170
   DBXPActivityId=253
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Mechanic:FireCameraShake'
   InfoPanelDescription="Repair tools can be used to damage enemy generators, base defenses, and vehicles. When used on turrets, will disable them from shooting. The final rank of this perk gives a 25% damage reduction when multi-crewing vehicles."
   UpgradeDescription(0)="+5% REPAIR\nRATE"
   UpgradeDescription(1)="+5% REPAIR\nRATE"
   UpgradeDescription(2)="+25% PROTECTION\nMULTI-CREW"
   Upgrades(0)=(IconId=9,DatabaseItemId=8215,Modifications=((ModType=13,Value=0.100000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8216,Modifications=((ModType=13,Value=0.100000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8217,Modifications=((ModType=76,Value=0.250000)))
   BaseMod=(Modifications=((ModType=77,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Mechanic"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Mechanic:ForceFeedbackWaveformShooting1'
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
   ItemName="Mechanic"
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
   Name="Default__TrPerk_Mechanic"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
