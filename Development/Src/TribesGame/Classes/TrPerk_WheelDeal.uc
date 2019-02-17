class TrPerk_WheelDeal extends TrPerk;

defaultproperties
{
   DBWeaponId=8169
   DBXPActivityId=248
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_WheelDeal:FireCameraShake'
   InfoPanelDescription="Reduces the cost of vehicles by 10%."
   UpgradeDescription(0)="+10% REDUCTION"
   UpgradeDescription(1)="+10% REDUCTION"
   UpgradeDescription(2)="+25% ENERGY\nON VEHICLES"
   Upgrades(0)=(IconId=9,DatabaseItemId=8182,Modifications=((ModType=50,Value=0.100000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8183,Modifications=((ModType=50,Value=0.100000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8184,Modifications=((ModType=74,Value=0.250000)))
   BaseMod=(Modifications=((ModType=50,Value=0.100000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_WheelDeal"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_WheelDeal:ForceFeedbackWaveformShooting1'
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
   ItemName="Wheel Deal"
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
   Name="Default__TrPerk_WheelDeal"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
