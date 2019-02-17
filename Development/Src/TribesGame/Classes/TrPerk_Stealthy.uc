/**
 * 
 */
class TrPerk_Stealthy extends TrPerk;

defaultproperties
{
   DBWeaponId=8164
   DBXPActivityId=246
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Stealthy:FireCameraShake'
   InfoPanelDescription="Sensors detect you at 50% less range, allowing you to get closer before being marked."
   UpgradeDescription(0)="+20% SENSOR\nEVASION\nRANGE"
   UpgradeDescription(1)="+20% SENSOR\nEVASION\nRANGE"
   UpgradeDescription(2)="+30% TIME FOR\nTURRETS TO\nTARGET YOU"
   Upgrades(0)=(IconId=9,DatabaseItemId=8206,Modifications=((ModType=32,Value=0.200000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8207,Modifications=((ModType=32,Value=0.200000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8208,Modifications=((ModType=56,Value=0.300000)))
   BaseMod=(Modifications=((ModType=32,Value=0.500000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Stealthy"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Stealthy:ForceFeedbackWaveformShooting1'
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
   ItemName="Stealthy"
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
   Name="Default__TrPerk_Stealthy"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
