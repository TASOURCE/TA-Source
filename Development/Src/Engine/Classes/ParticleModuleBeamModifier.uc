/**
 *	ParticleModuleBeamModifier
 *
 *	This module implements a single modifier for a beam emitter.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class ParticleModuleBeamModifier extends ParticleModuleBeamBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**	What to modify. */
enum BeamModifierType
{
	/** Modify the source of the beam.				*/
	PEB2MT_Source,
	/** Modify the target of the beam.				*/
	PEB2MT_Target
};

/**	Whether this module modifies the Source or the Target. */
var(Modifier)		BeamModifierType				ModifierType;

struct native BeamModifierOptions
{
	/** If TRUE, modify the value associated with this grouping.	*/
	var()	bool	bModify;
	/** If TRUE, scale the associated value by the given value.		*/
	var()	bool	bScale;
	/** If TRUE, lock the modifier to the life of the particle.		*/
	var()	bool	bLock;
};

/** The options associated with the position.								*/
var(Position)	BeamModifierOptions		PositionOptions;

/** The value to use when modifying the position.							*/
var(Position)	rawdistributionvector	Position;

/** The options associated with the Tangent.								*/
var(Tangent)	BeamModifierOptions		TangentOptions;

/** The value to use when modifying the Tangent.							*/
var(Tangent)	rawdistributionvector	Tangent;

/** If TRUE, don't transform the tangent modifier into the tangent basis.	*/
var(Tangent)	bool					bAbsoluteTangent;

/** The options associated with the Strength.								*/
var(Strength)	BeamModifierOptions		StrengthOptions;

/** The value to use when modifying the Strength.							*/
var(Strength)	rawdistributionfloat	Strength;

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
	virtual UINT	RequiredBytes(FParticleEmitterInstance* Owner = NULL);
	virtual void	PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	virtual void	AutoPopulateInstanceProperties(UParticleSystemComponent* PSysComp);

	/** 
	 *	Fill an array with each Object property that fulfills the FCurveEdInterface interface.
	 *
	 *	@param	OutCurve	The array that should be filled in.
	 */
	virtual void	GetCurveObjects(TArray<FParticleCurvePair>& OutCurves);
	
	/** 
	 *	Add all curve-editable Objects within this module to the curve editor.
	 *
	 *	@param	EdSetup		The CurveEd setup to use for adding curved.
	 */
	virtual	void	AddModuleCurvesToEditor(UInterpCurveEdSetup* EdSetup);


			void	GetDataPointers(FParticleEmitterInstance* Owner, const BYTE* ParticleBase, 
						INT& CurrentOffset, FBeam2TypeDataPayload*& BeamDataPayload, 
						FBeamParticleModifierPayloadData*& SourceModifierPayload,
						FBeamParticleModifierPayloadData*& TargetModifierPayload);
			void	GetDataPointerOffsets(FParticleEmitterInstance* Owner, const BYTE* ParticleBase, 
						INT& CurrentOffset, INT& BeamDataOffset, INT& SourceModifierOffset, 
						INT& TargetModifierOffset);

	/**
	 *	Retrieve the ParticleSysParams associated with this module.
	 *
	 *	@param	ParticleSysParamList	The list of FParticleSysParams to add to
	 */
	virtual void GetParticleSysParamsUtilized(TArray<FString>& ParticleSysParamList);

}


defaultproperties
{
   Position=(Distribution=DistributionPosition,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   Tangent=(Distribution=DistributionTangent,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   Strength=(Distribution=DistributionStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Name="Default__ParticleModuleBeamModifier"
   ObjectArchetype=ParticleModuleBeamBase'Engine.Default__ParticleModuleBeamBase'
}
