/**
 *	ParticleModuleBeamNoise
 *
 *	This module implements noise for a beam emitter.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class ParticleModuleBeamNoise extends ParticleModuleBeamBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** Is low frequency noise enabled. */
var(LowFreq)		bool						bLowFreq_Enabled;

/** The frequency of noise points. */
var(LowFreq)		int							Frequency;
/** 
 *	If not 0, then the frequency will select a random value in the range
 *		[Frequency_LowRange..Frequency]
 */
var(LowFreq)		int							Frequency_LowRange;

/** The noise point ranges. */
var(LowFreq)		rawdistributionvector		NoiseRange;

/** A scale factor that will be applied to the noise range. */
var(LowFreq)		rawdistributionfloat		NoiseRangeScale;

/** 
 *	If TRUE,  the NoiseRangeScale will be grabbed based on the emitter time.
 *	If FALSE, the NoiseRangeScale will be grabbed based on the particle time.
 */
var(LowFreq)		bool						bNRScaleEmitterTime;

/** The speed with which to move each noise point. */
var(LowFreq)		rawdistributionvector		NoiseSpeed;

/** Whether the noise movement should be smooth or 'jerky'. */
var(LowFreq)		bool						bSmooth;

/** Default target-point information to use if the beam method is endpoint. */
var(LowFreq)		float						NoiseLockRadius;

/** INTERNAL - Whether the noise points should be locked. */
var			const	bool						bNoiseLock;

/** Whether the noise points should be oscillate. */
var(LowFreq)		bool						bOscillate;

/** How long the  noise points should be locked - 0.0 indicates forever. */
var(LowFreq)		float						NoiseLockTime;

/** The tension to apply to the tessellated noise line. */
var(LowFreq)		float						NoiseTension;

/** If TRUE, calculate tangents at each noise point. */
var(LowFreq)		bool						bUseNoiseTangents;

/** The strength of noise tangents, if enabled. */
var(LowFreq)		rawdistributionfloat		NoiseTangentStrength;

/** The amount of tessellation between noise points. */
var(LowFreq)		int							NoiseTessellation;

/** 
 *	Whether to apply noise to the target point (or end of line in distance mode...)
 *	If TRUE, the beam could potentially 'leave' the target...
 */
var(LowFreq)		bool						bTargetNoise;

/** 
 *	The distance at which to deposit noise points.
 *	If 0.0, then use the static frequency value.
 *	If not, distribute noise points at the given distance, up to the static Frequency value.
 *	At that point, evenly distribute them along the beam.
 */
var(LowFreq)		float						FrequencyDistance;

/** If TRUE, apply the noise scale to the beam. */
var(LowFreq)		bool						bApplyNoiseScale;

/** 
 *	The scale factor to apply to noise range.
 *	The lookup value is determined by dividing the number of noise points present by the 
 *	maximum number of noise points (Frequency).
 */
var(LowFreq)		rawdistributionfloat		NoiseScale;

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
	virtual void	SetToSensibleDefaults(UParticleEmitter* Owner);
	virtual void	PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
			void	GetNoiseRange(FVector& NoiseMin, FVector& NoiseMax);

}


defaultproperties
{
   NoiseRange=(Distribution=DistributionNoiseRange,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(50.000000,50.000000,50.000000,50.000000,50.000000,50.000000,50.000000,50.000000))
   NoiseRangeScale=(Distribution=DistributionNoiseRangeScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   NoiseSpeed=(Distribution=DistributionNoiseSpeed,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(50.000000,50.000000,50.000000,50.000000,50.000000,50.000000,50.000000,50.000000))
   NoiseLockRadius=1.000000
   NoiseTension=0.500000
   NoiseTangentStrength=(Distribution=DistributionNoiseTangentStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(250.000000,250.000000,250.000000,250.000000))
   NoiseTessellation=1
   NoiseScale=(Distribution=DistributionNoiseScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Name="Default__ParticleModuleBeamNoise"
   ObjectArchetype=ParticleModuleBeamBase'Engine.Default__ParticleModuleBeamBase'
}
