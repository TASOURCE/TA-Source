/**
 *	ParticleModuleLocationDirect
 *
 *	Sets the location of particles directly.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class ParticleModuleLocationDirect extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** 
 *	The location of the particle at a give time. Retrieved using the particle RelativeTime. 
 *	IMPORTANT: the particle location is set to this value, thereby over-writing any previous module impacts.
 */
var(Location) rawdistributionvector	Location;
/**
 *	An offset to apply to the position retrieved from the Location calculation. 
 *	The offset is retrieved using the EmitterTime. 
 *	The offset will remain constant over the life of the particle.
 */
var(Location) rawdistributionvector	LocationOffset;
/**
 *	Scales the velocity of the object at a given point in the time-line.
 */
var(Location) rawdistributionvector	ScaleFactor;
/** Currently unused. */
var(Location) rawdistributionvector	Direction;

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

}


defaultproperties
{
   Location=(Distribution=DistributionLocation,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   LocationOffset=(Distribution=DistributionLocationOffset,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   ScaleFactor=(Distribution=DistributionScaleFactor,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   Direction=(Distribution=DistributionDirection,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleLocationDirect"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
