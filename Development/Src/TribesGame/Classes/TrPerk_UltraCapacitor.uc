/**
 * 
 */
class TrPerk_UltraCapacitor extends TrPerk;

defaultproperties
{
   DBWeaponId=8168
   DBXPActivityId=260
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_UltraCapacitor:FireCameraShake'
   InfoPanelDescription="+10 Extra energy to be used by itself or with Ultra Capacitor I for maximum pool."
   BaseMod=(Modifications=((ModType=10,Value=10.000000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_UltraCapacitor2"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_UltraCapacitor:ForceFeedbackWaveformShooting1'
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
   ItemName="Ultra Capacitor II"
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
   Name="Default__TrPerk_UltraCapacitor"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
