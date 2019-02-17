/**
 * 
 */
class TrPerk_Determination extends TrPerk;

defaultproperties
{
   bFree=True
   DBWeaponId=8157
   DBXPActivityId=249
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Determination:FireCameraShake'
   InfoPanelDescription="Gain an extra +100 Health on each respawn if you don't get a kill or touch the flag, up to +300 health. Suicides negate this effect."
   BaseMod=(Modifications=((ModType=27,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Determination"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Determination:ForceFeedbackWaveformShooting1'
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
   ItemName="Determination"
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
   Name="Default__TrPerk_Determination"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
