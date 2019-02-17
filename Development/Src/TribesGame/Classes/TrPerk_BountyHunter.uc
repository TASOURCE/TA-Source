class TrPerk_BountyHunter extends TrPerk;

defaultproperties
{
   DBWeaponId=8153
   DBXPActivityId=239
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_BountyHunter:FireCameraShake'
   InfoPanelDescription="Earn an extra 100 credits for enemy kills."
   UpgradeDescription(0)="+50 CREDITS\nEARNED"
   UpgradeDescription(1)="+50 CREDITS\nEARNED"
   UpgradeDescription(2)="+100 CREDITS\nFOR BELT\nKILLS"
   Upgrades(0)=(IconId=9,DatabaseItemId=8188,Modifications=((ModType=24,Value=50.000000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8189,Modifications=((ModType=24,Value=50.000000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8190,Modifications=((ModType=65,Value=100.000000)))
   BaseMod=(Modifications=((ModType=24,Value=100.000000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Bounty"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_BountyHunter:ForceFeedbackWaveformShooting1'
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
   ItemName="Bounty Hunter"
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
   Name="Default__TrPerk_BountyHunter"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
