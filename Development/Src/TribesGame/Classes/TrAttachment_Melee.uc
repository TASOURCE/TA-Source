/**
 * 
 */
class TrAttachment_Melee extends TrDeviceAttachment;

simulated function PlayImpactSound(Actor HitActor, SoundCue SoundToPlay, vector FireDir, vector HitLocation )
{
	if( HitActor != none && HitActor.IsA('TrGameObjective') )
	{
		SoundToPlay=SoundCue'AUD_PC_BulletImpact.Melee_Impact.A_CUE_PC_MeleeImpact_Generator_1';
	}

	super.PlayImpactSound(HitActor, SoundToPlay, FireDir, HitLocation);
}

simulated function PlayImpactEffects(vector HitLocation)
{
	local TrPawn TrP;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		HitLocation.Z += TrP.GetEyeHeight();
	}
	super.PlayImpactEffects(HitLocation);
}

defaultproperties
{
   m_LightMed3pPawnAnimSets(0)=None
   m_Heavy3pPawnAnimSets(0)=None
   m_nmRidingAsPassengerFireAnimName="ADD_Melee"
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
      Animations=UTAnimNodeSequence'TribesGame.Default__TrAttachment_Melee:SkeletalMeshComponent0.MeshSequenceA'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0'
   End Object
   Mesh=SkeletalMeshComponent0
   MuzzleFlashLightClass=None
   DefaultImpactEffect=(DecalMaterials=(None),DecalWidth=15.000000,DecalHeight=15.000000)
   WeaponClass=Class'TribesGame.TrDevice_Melee'
   Components(0)=WeaponLoopSound
   Name="Default__TrAttachment_Melee"
   ObjectArchetype=TrDeviceAttachment'TribesGame.Default__TrDeviceAttachment'
}
