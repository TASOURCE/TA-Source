/**
 * 
 */
class TrAttachment_CustomEagle extends TrDeviceAttachment;

defaultproperties
{
   m_nmLightMedAimProfileName="LightMed_Pistol"
   m_nmHeavyAimProfileName="Heavy_Pistol"
   m_bSpawnTracerBeams=True
   m_LightMed3pPawnAnimSets(0)=None
   m_Heavy3pPawnAnimSets(0)=None
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDeviceAttachment:WeaponLoopSound'
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDeviceAttachment:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0'
      Begin Object Class=UTAnimNodeSequence Name=MeshSequenceA Archetype=UTAnimNodeSequence'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0.MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=UTAnimNodeSequence'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0.MeshSequenceA'
      End Object
      Animations=UTAnimNodeSequence'TribesGame.Default__TrAttachment_CustomEagle:SkeletalMeshComponent0.MeshSequenceA'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      MaxDrawDistance=5000.000000
      CachedMaxDrawDistance=5000.000000
      MotionBlurScale=0.000000
      bAllowAmbientOcclusion=False
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0'
   End Object
   Mesh=SkeletalMeshComponent0
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashDuration=0.330000
   ImpactEffects(0)=(MaterialType="Composite",DecalMaterials=(None),DecalWidth=35.000000,DecalHeight=35.000000)
   ImpactEffects(1)=(MaterialType="Concrete",DecalMaterials=(None),DecalWidth=15.000000,DecalHeight=15.000000)
   ImpactEffects(2)=(MaterialType="Dirt")
   ImpactEffects(3)=(MaterialType="Grass")
   ImpactEffects(4)=(MaterialType="Metal",DecalMaterials=(None),DecalWidth=18.000000,DecalHeight=18.000000)
   ImpactEffects(5)=(MaterialType="MetalGrate",DecalMaterials=(None),DecalWidth=12.000000,DecalHeight=12.000000)
   ImpactEffects(6)=(MaterialType="Rock",DecalMaterials=(None),DecalWidth=11.000000,DecalHeight=11.000000)
   ImpactEffects(7)=(MaterialType="Water")
   ImpactEffects(8)=(MaterialType="Pawn")
   ImpactEffects(9)=(MaterialType="PawnHead")
   ImpactEffects(10)=(MaterialType="ForceField")
   DefaultImpactEffect=(DecalMaterials=(None),DecalWidth=15.000000,DecalHeight=15.000000)
   WeaponClass=Class'TribesGame.TrDevice_CustomEagle'
   Components(0)=WeaponLoopSound
   Name="Default__TrAttachment_CustomEagle"
   ObjectArchetype=TrDeviceAttachment'TribesGame.Default__TrDeviceAttachment'
}
