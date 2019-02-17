/**
 * 
 */
class TrAttachment_Melee_DS extends TrAttachment_Melee;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrAttachment_Melee:WeaponLoopSound'
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrAttachment_Melee:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'TribesGame.Default__TrAttachment_Melee:SkeletalMeshComponent0'
      Begin Object Class=UTAnimNodeSequence Name=MeshSequenceA Archetype=UTAnimNodeSequence'TribesGame.Default__TrAttachment_Melee:SkeletalMeshComponent0.MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=UTAnimNodeSequence'TribesGame.Default__TrAttachment_Melee:SkeletalMeshComponent0.MeshSequenceA'
      End Object
      Animations=UTAnimNodeSequence'TribesGame.Default__TrAttachment_Melee_DS:SkeletalMeshComponent0.MeshSequenceA'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      MotionBlurScale=0.000000
      bAllowAmbientOcclusion=False
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrAttachment_Melee:SkeletalMeshComponent0'
   End Object
   Mesh=SkeletalMeshComponent0
   WeaponClass=Class'TribesGame.TrDevice_Melee_DS'
   Components(0)=WeaponLoopSound
   Name="Default__TrAttachment_Melee_DS"
   ObjectArchetype=TrAttachment_Melee'TribesGame.Default__TrAttachment_Melee'
}
