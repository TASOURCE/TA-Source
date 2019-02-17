/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSpawn extends ParticleModuleSpawnBase
	native(Particle)
	editinlinenew
	hidecategories(Object)
	hidecategories(ParticleModuleSpawnBase);

/** The rate at which to spawn particles. */
var(Spawn)						rawdistributionfloat	Rate;

/** The scalar to apply to the rate. */
var(Spawn)						rawdistributionfloat	RateScale;

/** The method to utilize when burst-emitting particles. */
var(Burst)						EParticleBurstMethod	ParticleBurstMethod;

/** The array of burst entries. */
var(Burst)	export noclear		array<ParticleBurst>	BurstList;

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
	virtual void	PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	/**
	 *	Retrieve the spawn amount this module is contributing.
	 *	Note that if multiple Spawn-specific modules are present, if any one
	 *	of them ignores the SpawnRate processing it will be ignored.
	 *
	 *	@param	Owner		The particle emitter instance that is spawning.
	 *	@param	Offset		The offset into the particle payload for the module.
	 *	@param	OldLeftover	The bit of timeslice left over from the previous frame.
	 *	@param	DeltaTime	The time that has expired since the last frame.
	 *	@param	Number		The number of particles to spawn. (OUTPUT)
	 *	@param	Rate		The spawn rate of the module. (OUTPUT)
	 *
	 *	@return	UBOOL		FALSE if the SpawnRate should be ignored.
	 *						TRUE if the SpawnRate should still be processed.
	 */
	virtual UBOOL GetSpawnAmount(FParticleEmitterInstance* Owner, INT Offset, FLOAT OldLeftover, 
		FLOAT DeltaTime, INT& Number, FLOAT& Rate);

	virtual UBOOL	GenerateLODModuleValues(UParticleModule* SourceModule, FLOAT Percentage, UParticleLODLevel* LODLevel);

}


defaultproperties
{
   Rate=(Distribution=RequiredDistributionSpawnRate,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(20.000000,20.000000,20.000000,20.000000))
   RateScale=(Distribution=RequiredDistributionSpawnRateScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   LODDuplicate=False
   Name="Default__ParticleModuleSpawn"
   ObjectArchetype=ParticleModuleSpawnBase'Engine.Default__ParticleModuleSpawnBase'
}
