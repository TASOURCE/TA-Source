/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleVelocityInheritParent extends ParticleModuleVelocityBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The scale to apply tot he parent velocity prior to adding it to the particle velocity during spawn.
 *	Value is retrieved using the EmitterTime of the emitter.
 */
var(Velocity) rawdistributionvector	Scale;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);

}


defaultproperties
{
   Scale=(Distribution=DistributionScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   bSpawnModule=True
   Name="Default__ParticleModuleVelocityInheritParent"
   ObjectArchetype=ParticleModuleVelocityBase'Engine.Default__ParticleModuleVelocityBase'
}
