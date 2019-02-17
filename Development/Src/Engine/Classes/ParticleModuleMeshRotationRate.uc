/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleMeshRotationRate extends ParticleModuleRotationRateBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	Initial rotation rate, in rotations per second.
 *	The value is retrieved using the EmitterTime.
 */
var(Rotation) rawdistributionvector	StartRotationRate;

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
	/**
	 *	Extended version of spawn, allows for using a random stream for distribution value retrieval
	 *
	 *	@param	Owner				The particle emitter instance that is spawning
	 *	@param	Offset				The offset to the modules payload data
	 *	@param	SpawnTime			The time of the spawn
	 *	@param	InRandomStream		The random stream to use for retrieving random values
	 */
	void SpawnEx(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime, class FRandomStream* InRandomStream);

	/**
	 *	Called when the module is created, this function allows for setting values that make
	 *	sense for the type of emitter they are being used in.
	 *
	 *	@param	Owner			The UParticleEmitter that the module is being added to.
	 */
	virtual void SetToSensibleDefaults(UParticleEmitter* Owner);

	/**
	 *	Return TRUE if this module impacts rotation of Mesh emitters
	 *	@return	UBOOL		TRUE if the module impacts mesh emitter rotation
	 */
	virtual UBOOL	TouchesMeshRotation() const	{ return TRUE; }

}


defaultproperties
{
   StartRotationRate=(Distribution=DistributionStartRotationRate,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=(0.000000,360.000000,0.000000,0.000000,0.000000,360.000000,360.000000,360.000000,0.000000,0.000000,0.000000,360.000000,360.000000,360.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleMeshRotationRate"
   ObjectArchetype=ParticleModuleRotationRateBase'Engine.Default__ParticleModuleRotationRateBase'
}
