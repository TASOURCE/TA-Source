/**
 *
 */
class TrDevice_EnergyPack extends TrDevice_Pack
	abstract;

defaultproperties
{
   m_EffectInfo(0)=(effectClass=Class'TribesGame.TrEffect_MaxPowerPoolBuff',Type=ET_Equip)
   m_nIconIndex=7
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_EnergyPack:FireCameraShake'
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Energy"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_EnergyPack"
   ObjectArchetype=TrDevice_Pack'TribesGame.Default__TrDevice_Pack'
}
