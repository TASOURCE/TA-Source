class TrDevice_Melee_MC extends TrDevice_Melee;

var string ContentDeviceClassString;

defaultproperties
{
   ContentDeviceClassString="TribesGameContent.TrDevice_Melee_MC_Content"
   m_TinyWeaponsOffset=(X=12.000000,Y=0.000000,Z=-5.000000)
   AttachmentClass=Class'TribesGame.TrAttachment_Melee_MC'
   PlayerViewOffset=(X=0.000000,Y=0.000000,Z=-0.000000)
   SmallWeaponsOffset=(X=0.000000,Y=0.000000,Z=0.000000)
   WideScreenOffsetScaling=1.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Melee:FirstPersonMesh'
      FOV=65.000000
      AnimSets(0)=None
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Melee:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Melee:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Melee:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Melee_MC"
   ObjectArchetype=TrDevice_Melee'TribesGame.Default__TrDevice_Melee'
}
