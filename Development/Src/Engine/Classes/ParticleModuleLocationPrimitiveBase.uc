//=============================================================================
// ParticleModuleLocationPrimitiveBase
// Base class for setting particle spawn locations based on primitives.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ParticleModuleLocationPrimitiveBase extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** If TRUE, the positive X axis is valid for spawning. */
var(Location) bool					Positive_X;
/** If TRUE, the positive Y axis is valid for spawning. */
var(Location) bool					Positive_Y;
/** If TRUE, the positive Z axis is valid for spawning. */
var(Location) bool					Positive_Z;
/** If TRUE, the negative X axis is valid for spawning. */
var(Location) bool					Negative_X;
/** If TRUE, the negative Y axis is valid for spawning. */
var(Location) bool					Negative_Y;
/** If TRUE, the negative Zaxis is valid for spawning. */
var(Location) bool					Negative_Z;
/** If TRUE, particles will only spawn on the surface of the primitive. */
var(Location) bool					SurfaceOnly;
/** If TRUE, the particle should get its velocity from the position within the primitive. */
var(Location) bool					Velocity;
/** The scale applied to the velocity. (Only used if 'Velocity' is checked). */
var(Location) rawdistributionfloat	VelocityScale;
/** The location of the bounding primitive relative to the position of the emitter. */
var(Location) rawdistributionvector	StartLocation;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	DetermineUnitDirection(FParticleEmitterInstance* Owner, FVector& vUnitDir, class FRandomStream* InRandomStream);

}


defaultproperties
{
   Positive_X=True
   Positive_Y=True
   Positive_Z=True
   Negative_X=True
   Negative_Y=True
   Negative_Z=True
   VelocityScale=(Distribution=DistributionVelocityScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   StartLocation=(Distribution=DistributionStartLocation,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   Name="Default__ParticleModuleLocationPrimitiveBase"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
