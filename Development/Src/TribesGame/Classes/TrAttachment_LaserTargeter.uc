/**
 * 
 */
class TrAttachment_LaserTargeter extends TrDeviceAttachment;

var bool m_bIsTracerActive;
var ParticleSystemComponent m_pscLaserEffect;

simulated function KillLaserEffect()
{
	if (m_pscLaserEffect != none)
	{
		m_pscLaserEffect.DeactivateSystem();
	}

	m_bIsTracerActive = false;
}

simulated function SpawnLaserEffect(vector HitLocation)
{
    local TrPlayerPawn TrP;

	// Determine team beam effect color.
    TrP = TrPlayerPawn(Owner);
	if (TrP == none)
	{
		m_TracerBeamTemplate=ParticleSystem'WEP_LaserTargeter_3p.Effects.P_Beam';
	}
	else if (TrP.GetTeamNum() == GetALocalPlayerController().GetTeamNum())
	{
		m_TracerBeamTemplate=ParticleSystem'WEP_LaserTargeter_3p.Effects.P_Beam';
	}
	else
	{
		m_TracerBeamTemplate=ParticleSystem'WEP_LaserTargeter_3p.Effects.P_Beam_Enemy';
	}

	// Spawn the laser effect.
	m_pscLaserEffect = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(m_TracerBeamTemplate, Mesh, 'WSO_Emit_01', true,,);
	m_pscLaserEffect.SetDepthPriorityGroup(SDPG_World);
	m_pscLaserEffect.SetTickGroup(TG_EffectsUpdateWork);
	m_pscLaserEffect.SetVectorParameter('TracerEnd', HitLocation);
}

simulated function UpdateLaserEffect(vector HitLocation)
{
	m_pscLaserEffect.SetVectorParameter('TracerEnd', HitLocation);
}

simulated function ThirdPersonFireEffects(vector HitLocation)
{
	if (m_bIsTracerActive)
	{
		UpdateLaserEffect(HitLocation);
	}
	else
	{
		m_bIsTracerActive = true;
		SpawnLaserEffect(HitLocation);
	}

	Super.ThirdPersonFireEffects(HitLocation);
}

simulated event StopThirdPersonFireEffects()
{
	Super.StopThirdPersonFireEffects();

	KillLaserEffect();
}

defaultproperties
{
   m_nmLightMedAimProfileName="LightMed_Pistol"
   m_nmHeavyAimProfileName="Heavy_Pistol"
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
      Animations=UTAnimNodeSequence'TribesGame.Default__TrAttachment_LaserTargeter:SkeletalMeshComponent0.MeshSequenceA'
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
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashDuration=0.000000
   WeaponClass=Class'TribesGame.TrDevice_LaserTargeter'
   Components(0)=WeaponLoopSound
   Name="Default__TrAttachment_LaserTargeter"
   ObjectArchetype=TrDeviceAttachment'TribesGame.Default__TrDeviceAttachment'
}
