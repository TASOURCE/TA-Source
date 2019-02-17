/**
 *	ParticleModuleBeamTarget
 *
 *	This module implements a single target for a beam emitter.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class ParticleModuleBeamTarget extends ParticleModuleBeamBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The method flag. */
var(Target)			Beam2SourceTargetMethod			TargetMethod;

/** The target point sources of each beam, when using the end point method. */
var(Target)			name							TargetName;

/** Default target-point information to use if the beam method is endpoint. */
var(Target)			rawdistributionvector			Target;

/** Whether to treat the as an absolute position in world space. */
var(Target)			bool							bTargetAbsolute;

/** Whether to lock the Target to the life of the particle. */
var(Target)			bool							bLockTarget;

/** The method to use for the Target tangent. */
var(Target)			Beam2SourceTargetTangentMethod	TargetTangentMethod;

/** The tangent for the Target point for each beam. */
var(Target)			rawdistributionvector			TargetTangent;

/** Whether to lock the Target to the life of the particle. */
var(Target)			bool							bLockTargetTangent;

/** The strength of the tangent from the Target point for each beam. */
var(Target)			rawdistributionfloat			TargetStrength;

/** Whether to lock the Target to the life of the particle. */
var(Target)			bool							bLockTargetStength;

/** Default target-point information to use if the beam method is endpoint. */
var(Target)			float							LockRadius;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);
	virtual void	PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	virtual void	AutoPopulateInstanceProperties(UParticleSystemComponent* PSysComp);

			void	GetDataPointers(FParticleEmitterInstance* Owner, const BYTE* ParticleBase, 
						INT& CurrentOffset, 
						FBeamParticleSourceTargetPayloadData*& ParticleSource);
						
			UBOOL	ResolveTargetData(FParticleBeam2EmitterInstance* BeamInst, 
						FBeam2TypeDataPayload* BeamData, const BYTE* ParticleBase, 
						INT& CurrentOffset, INT	ParticleIndex, UBOOL bSpawning,
						FBeamParticleModifierPayloadData* ModifierData);

	/**
	 *	Retrieve the ParticleSysParams associated with this module.
	 *
	 *	@param	ParticleSysParamList	The list of FParticleSysParams to add to
	 */
	virtual void GetParticleSysParamsUtilized(TArray<FString>& ParticleSysParamList);

}


defaultproperties
{
   Target=(Distribution=DistributionTarget,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(50.000000,50.000000,50.000000,50.000000,50.000000,50.000000,50.000000,50.000000))
   TargetTangent=(Distribution=DistributionTargetTangent,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,1.000000,1.000000,0.000000,0.000000,1.000000,0.000000,0.000000))
   TargetStrength=(Distribution=DistributionTargetStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(25.000000,25.000000,25.000000,25.000000))
   LockRadius=10.000000
   Name="Default__ParticleModuleBeamTarget"
   ObjectArchetype=ParticleModuleBeamBase'Engine.Default__ParticleModuleBeamBase'
}
