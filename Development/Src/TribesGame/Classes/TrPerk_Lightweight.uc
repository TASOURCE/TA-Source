/**
 * 
 */
class TrPerk_Lightweight extends TrPerk;

defaultproperties
{
   DBWeaponId=8646
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Lightweight:FireCameraShake'
   InfoPanelDescription="POSITIVE: Decreases mass by 30% all the time, resulting in more powerful explosive jumps. NEGATIVE: This perk triples the delay after taking damage before your health regeneration starts. Recommended for advanced players only."
   BaseMod=(Modifications=((ModType=3,Value=-0.300000),(ModType=49,Value=-2.000000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Lightweight"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Lightweight:ForceFeedbackWaveformShooting1'
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
   ItemName="Lightweight"
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
   Name="Default__TrPerk_Lightweight"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
