/**
 *	Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleAttractorParticle extends ParticleModuleAttractorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The source emitter for attractors
 */
var(Attractor)	export	noclear	name				EmitterName;

/**
 *	The radial range of the attraction around the source particle.
 *	Particle-life relative.
 */
var(Attractor)	rawdistributionfloat				Range;

/**
 *	The strength curve is a function of distance or of time.
 */
var(Attractor)	bool								bStrengthByDistance;

/**
 *	The strength of the attraction (negative values repel).
 *	Particle-life relative if StrengthByDistance is false.
 */
var(Attractor)	rawdistributionfloat				Strength;

/**	If TRUE, the velocity adjustment will be applied to the base velocity.	*/
var(Attractor)	bool								bAffectBaseVelocity;

enum EAttractorParticleSelectionMethod
{
	EAPSM_Random,
	EAPSM_Sequential
};
/**
 *	The method to use when selecting an attractor target particle from the emitter.
 *	One of the following:
 *	Random		- Randomly select a particle from the source emitter.  
 *	Sequential  - Select a particle using a sequential order. 
 */
var(Location)	EAttractorParticleSelectionMethod	SelectionMethod;

/**
 *	Whether the particle should grab a new particle if it's source expires.
 */
var(Attractor)	bool								bRenewSource;

/**
 *	Whether the particle should inherit the source veloctiy if it expires.
 */
var(Attractor)	bool								bInheritSourceVel;

var				int									LastSelIndex;

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

}


defaultproperties
{
   Range=(Distribution=DistributionRange,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   bStrengthByDistance=True
   Strength=(Distribution=DistributionStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleAttractorParticle"
   ObjectArchetype=ParticleModuleAttractorBase'Engine.Default__ParticleModuleAttractorBase'
}
