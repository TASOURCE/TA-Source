class TrPerk_Survivalist extends TrPerk;

defaultproperties
{
   DBWeaponId=8167
   DBXPActivityId=259
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Survivalist:FireCameraShake'
   InfoPanelDescription="Heal 10% from picking up ammo drops."
   UpgradeDescription(0)="+5% HEAL\nFROM DROPS"
   UpgradeDescription(1)="+5% HEAL\nFROM DROPS"
   UpgradeDescription(2)="+40% ENERGY\nRECHARGE\nFROM DROPS"
   Upgrades(0)=(IconId=9,DatabaseItemId=8191,Modifications=((ModType=46,Value=0.050000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8192,Modifications=((ModType=46,Value=0.050000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8193,Modifications=((ModType=47,Value=0.400000)))
   BaseMod=(Modifications=((ModType=46,Value=0.100000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Survival"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Survivalist:ForceFeedbackWaveformShooting1'
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
   ItemName="Survivalist"
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
   Name="Default__TrPerk_Survivalist"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
