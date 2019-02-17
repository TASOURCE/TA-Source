/**
 * 
 */
class TrAttachment_HeavySpinfusor extends TrDeviceAttachment;

defaultproperties
{
   m_nmLightMedAimProfileName="LiteMed_SpinFusor"
   m_nmHeavyAimProfileName="Heavy_SpinFusor"
   m_LightMed3pPawnAnimSets(0)=None
   m_Heavy3pPawnAnimSets(0)=None
   m_nmRidingAsPassengerFireAnimName="ADD_FireReload"
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
      Animations=UTAnimNodeSequence'TribesGame.Default__TrAttachment_HeavySpinfusor:SkeletalMeshComponent0.MeshSequenceA'
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
   MuzzleFlashLightClass=Class'TribesGame.TrSpinfusorMuzzleFlashLight'
   MuzzleFlashDuration=0.330000
   WeaponClass=Class'TribesGame.TrDevice_HeavySpinfusor'
   Components(0)=WeaponLoopSound
   Name="Default__TrAttachment_HeavySpinfusor"
   ObjectArchetype=TrDeviceAttachment'TribesGame.Default__TrDeviceAttachment'
}
