/**
 * 
 */
class TrAttachment_RepairTool extends TrDeviceAttachment;

var bool m_bIsTracerActive;
var ParticleSystemComponent m_pscRepairEffect;

var private vector m_Location;
var private vector m_Tangent;

simulated function KillRepairEffect()
{
	if (m_pscRepairEffect != none)
	{
		m_pscRepairEffect.DeactivateSystem();
	}

	m_bIsTracerActive = false;
}

simulated function SpawnRepairEffect(vector HitLocation, vector HitNormal)
{
	// Spawn the Repair effect.
	m_pscRepairEffect = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(m_TracerBeamTemplate, Mesh, 'WSO_Emit_01', true,,);
	m_pscRepairEffect.SetDepthPriorityGroup(SDPG_World);
	m_pscRepairEffect.SetTickGroup(TG_EffectsUpdateWork);
	m_pscRepairEffect.SetVectorParameter('TracerTangent', HitNormal);
	m_pscRepairEffect.SetVectorParameter('TracerEnd', HitLocation);

	m_Location = HitLocation;
	m_Tangent = HitNormal;
}

simulated function UpdateRepairEffect(float DeltaTime, vector HitLocation, vector HitNormal)
{
	// Interpolate smoothly from current spot to next spot.
	m_Location = VInterpTo(m_Location, HitLocation, DeltaTime, 2);
	m_Tangent = VInterpTo(m_Tangent, HitNormal, DeltaTime, 0.25);
	m_Tangent = VInterpTo(m_Tangent, vect(0,0,0), DeltaTime, 0.25);

	// Update the Repair target end position.
	if (m_pscRepairEffect != none)
	{
		m_pscRepairEffect.SetVectorParameter('TracerTangent', m_Tangent);
		m_pscRepairEffect.SetVectorParameter('TracerEnd', m_Location);
	}
	else
	{
		SpawnRepairEffect(HitLocation, HitNormal);
	}
}

simulated function PlayImpactEffects(vector HitLocation)
{
	local Pawn POwner;
	local TrDevice_RepairTool repairWeapon;
	local vector effectLocation;

	POwner = Pawn(Owner);

	// Are we playing impact effects in 1P or 3P?
	if (m_Location == vect(0,0,0) && POwner != none)
	{
		// 1P, so fetch hit location from the weapon.
		repairWeapon = TrDevice_RepairTool(POwner.Weapon);
		if (repairWeapon != none)
			effectLocation = repairWeapon.m_Location;
	}
	// 3P, so it's easy.
	else if (m_Location != vect(0,0,0))
		effectLocation = m_Location;

	super.PlayImpactEffects(effectLocation);
}

simulated function ThirdPersonFireEffects(vector HitLocation)
{
	local TrPawn POwner;

	POwner = TrPawn(Owner);
	if (POwner == none)
		return;

	if (m_bIsTracerActive)
	{
		UpdateRepairEffect(WorldInfo.DeltaSeconds, HitLocation, POwner.r_FlashNormal);
	}
	else
	{
		m_bIsTracerActive = true;
		SpawnRepairEffect(HitLocation, POwner.r_FlashNormal);
	}

	Super.ThirdPersonFireEffects(HitLocation);
}

simulated event StopThirdPersonFireEffects()
{
	Super.StopThirdPersonFireEffects();

	KillRepairEffect();
}

defaultproperties
{
   m_nmLightMedAimProfileName="LightMed_Pistol"
   m_nmHeavyAimProfileName="Heavy_Pistol"
   m_LightMed3pPawnAnimSets(0)=None
   m_Heavy3pPawnAnimSets(0)=None
   m_nmRidingAsPassengerFireAnimName="ADD_FireRepeat"
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
      Animations=UTAnimNodeSequence'TribesGame.Default__TrAttachment_RepairTool:SkeletalMeshComponent0.MeshSequenceA'
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
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_RepairTool'
   MuzzleFlashDuration=0.000000
   DefaultImpactEffect=(DecalMaterials=(None),DecalWidth=15.000000,DecalHeight=15.000000)
   WeaponClass=Class'TribesGame.TrDevice_RepairTool'
   Components(0)=WeaponLoopSound
   Name="Default__TrAttachment_RepairTool"
   ObjectArchetype=TrDeviceAttachment'TribesGame.Default__TrDeviceAttachment'
}
