/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleTypeDataBeam2 extends ParticleModuleTypeDataBase
	native(Particle)
	editinlinenew
	dontcollapsecategories
	hidecategories(Object);

enum EBeam2Method
{
	PEB2M_Distance, 
    PEB2M_Target, 
	PEB2M_Branch
};

//*************************************************************************************************
// General Beam Variables
//*************************************************************************************************
/** 
 *	The method with which to form the beam(s). Must be one of the following:
 *		PEB2M_Distance	- Use the distance property to emit a beam along the X-axis of the emitter.
 *		PEB2M_Target	- Emit a beam from the source to the supplied target.
 *		PEB2M_Branch	- Currently unimplemented.
 */
var(Beam)			EBeam2Method				BeamMethod;

/** The number of times to tile the texture along each beam									*/
var(Beam)			int							TextureTile;

/** The distance per texture tile															*/
var(Beam)			float						TextureTileDistance;

/** The number of sheets to render															*/
var(Beam)			int							Sheets;

/** The number of live beams																*/
var(Beam)			int							MaxBeamCount;

/** The speed at which the beam should move from source to target when firing up.
 *	'0' indicates instantaneous
 */
var(Beam)			float						Speed;

/** 
 * Indicates whether the beam should be interpolated.
 *     <= 0 --> no
 *     >  0 --> yes (and is equal to the number of interpolation steps that should be taken.
 */
var(Beam)			int							InterpolationPoints;

/** If true, there will ALWAYS be a beam...													*/
var(Beam)			bool						bAlwaysOn;

/** 
 *	The approach to use for determining the Up vector(s) for the beam.
 *
 *	0 indicates that the Up vector should be calculated at EVERY point in the beam.
 *	1 indicates a single Up vector should be determined at the start of the beam and used at every point.
 *	N indicates an Up vector should be calculated every N points of the beam and interpolated between them.
 *	    [NOTE: This mode is currently unsupported.]
 */
var(Beam)			int							UpVectorStepSize;

//*************************************************************************************************
// Beam Branching Variables
//*************************************************************************************************
/** The name of the emitter to branch from (if mode is PEB2M_Branch)
 * MUST BE IN THE SAME PARTICLE SYSTEM!
 */
var(Branching)		name						BranchParentName;

//*************************************************************************************************
// Beam Distance Variables
//*************************************************************************************************
/** 
 *	The distance along the X-axis to stretch the beam
 *	Distance is only used if BeamMethod is PEB2M_Distance
 */
var(Distance)		rawdistributionfloat		Distance;

//*************************************************************************************************
// Beam Multi-target Variables
//*************************************************************************************************
struct BeamTargetData
{
	/** Name of the target.																	*/
	var()	name		TargetName;
	/** Percentage chance the target will be selected (100 = always).						*/
	var()	float		TargetPercentage;
};

//*************************************************************************************************
// Beam Tapering Variables
//*************************************************************************************************
enum EBeamTaperMethod
{
	PEBTM_None, 
	PEBTM_Full,
	PEBTM_Partial
};

/**
 *	Tapering mode - one of the following:
 *	PEBTM_None		- No tapering is applied
 *	PEBTM_Full		- Taper the beam relative to source-->target, regardless of current beam length
 *	PEBTM_Partial	- Taper the beam relative to source-->location, 0=source,1=endpoint
 */
var(Taper)			EBeamTaperMethod			TaperMethod;

/** Tapering factor, 0 = source of beam, 1 = target											*/
var(Taper)			rawdistributionfloat		TaperFactor;

/**
 *  Tapering scaling
 *	This is intended to be either a constant, uniform or a ParticleParam.
 *	If a curve is used, 0/1 mapping of source/target... which could be integrated into
 *	the taper factor itself, and therefore makes no sense.
 */
var(Taper)			rawdistributionfloat		TaperScale;


//*************************************************************************************************
// Beam Rendering Variables
//*************************************************************************************************
var(Rendering)		bool						RenderGeometry;
var(Rendering)		bool						RenderDirectLine;
var(Rendering)		bool						RenderLines;
var(Rendering)		bool						RenderTessellation;

//*************************************************************************************************
// C++ Text
//*************************************************************************************************
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

//*************************************************************************************************
// Default properties
//*************************************************************************************************

cpptext
{
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);
	virtual void	PreUpdate(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);
	virtual UINT	RequiredBytes(FParticleEmitterInstance* Owner = NULL);

	virtual void	PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	virtual FParticleEmitterInstance* CreateInstance(UParticleEmitter* InEmitterParent, UParticleSystemComponent* InComponent);

	// For Cascade
	virtual	void	AddModuleCurvesToEditor(UInterpCurveEdSetup* EdSetup);

	// Beam
	virtual void	GetDataPointers(FParticleEmitterInstance* Owner, const BYTE* ParticleBase, 
			INT& CurrentOffset, FBeam2TypeDataPayload*& BeamData, FVector*& InterpolatedPoints, 
			FLOAT*& NoiseRate, FLOAT*& NoiseDeltaTime, FVector*& TargetNoisePoints, 
			FVector*& NextNoisePoints, FLOAT*& TaperValues, FLOAT*& NoiseDistanceScale,
			FBeamParticleModifierPayloadData*& SourceModifier,
			FBeamParticleModifierPayloadData*& TargetModifier);
	virtual void	GetDataPointerOffsets(FParticleEmitterInstance* Owner, const BYTE* ParticleBase, 
			INT& CurrentOffset, INT& BeamDataOffset, INT& InterpolatedPointsOffset, INT& NoiseRateOffset, 
			INT& NoiseDeltaTimeOffset, INT& TargetNoisePointsOffset, INT& NextNoisePointsOffset, 
			INT& TaperCount, INT& TaperValuesOffset, INT& NoiseDistanceScaleOffset);

			void	GetNoiseRange(FVector& NoiseMin, FVector& NoiseMax);

}


defaultproperties
{
   BeamMethod=PEB2M_Target
   TextureTile=1
   Sheets=1
   Speed=10.000000
   RenderGeometry=True
   Distance=(Distribution=DistributionDistance,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(25.000000,25.000000,25.000000,25.000000))
   TaperFactor=(Distribution=DistributionTaperFactor,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   TaperScale=(Distribution=DistributionTaperScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   Name="Default__ParticleModuleTypeDataBeam2"
   ObjectArchetype=ParticleModuleTypeDataBase'Engine.Default__ParticleModuleTypeDataBase'
}
