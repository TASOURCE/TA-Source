/**
 * 
 */
class TrAttachment_X1Rifle extends TrAttachment_ChainGun;

defaultproperties
{
   m_nmHeavyAimProfileName="Heavy_LMG"
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrAttachment_ChainGun:WeaponLoopSound'
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrAttachment_ChainGun:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'TribesGame.Default__TrAttachment_ChainGun:SkeletalMeshComponent0'
      Begin Object Class=UTAnimNodeSequence Name=MeshSequenceA Archetype=UTAnimNodeSequence'TribesGame.Default__TrAttachment_ChainGun:SkeletalMeshComponent0.MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=UTAnimNodeSequence'TribesGame.Default__TrAttachment_ChainGun:SkeletalMeshComponent0.MeshSequenceA'
      End Object
      Animations=UTAnimNodeSequence'TribesGame.Default__TrAttachment_X1Rifle:SkeletalMeshComponent0.MeshSequenceA'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrAttachment_ChainGun:SkeletalMeshComponent0'
   End Object
   Mesh=SkeletalMeshComponent0
   MuzzleFlashColor=(B=0,G=255,R=100,A=255)
   WeaponClass=Class'TribesGame.TrDevice_X1Rifle'
   Components(0)=WeaponLoopSound
   Name="Default__TrAttachment_X1Rifle"
   ObjectArchetype=TrAttachment_ChainGun'TribesGame.Default__TrAttachment_ChainGun'
}
