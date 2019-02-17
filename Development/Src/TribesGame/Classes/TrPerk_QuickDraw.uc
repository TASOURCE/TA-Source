class TrPerk_QuickDraw extends TrPerk;

defaultproperties
{
   DBWeaponId=8161
   DBXPActivityId=256
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_QuickDraw:FireCameraShake'
   InfoPanelDescription="Reduces the amount of time it takes to switch weapons by 30%."
   UpgradeDescription(0)="+10% SWITCH\nSPEED"
   UpgradeDescription(1)="+10% SWITCH\nSPEED"
   UpgradeDescription(2)="+20% GRENADE\nTHROW SPEED"
   Upgrades(0)=(IconId=9,DatabaseItemId=8209,Modifications=((ModType=21,Value=0.100000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8210,Modifications=((ModType=21,Value=0.100000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8211,Modifications=((ModType=79,Value=0.200000)))
   BaseMod=(Modifications=((ModType=21,Value=0.300000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_QuickDraw"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_QuickDraw:ForceFeedbackWaveformShooting1'
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
   ItemName="Quick Draw"
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
   Name="Default__TrPerk_QuickDraw"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
