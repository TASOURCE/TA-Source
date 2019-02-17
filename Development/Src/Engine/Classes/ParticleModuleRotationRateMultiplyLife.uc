/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleRotationRateMultiplyLife extends ParticleModuleRotationRateBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The scale factor that should be applied to the rotation rate.
 *	The value is retrieved using the RelativeTime of the particle.
 */
var(Rotation) rawdistributionfloat	LifeMultiplier;

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

	/**
	 *	Called when the module is created, this function allows for setting values that make
	 *	sense for the type of emitter they are being used in.
	 *
	 *	@param	Owner			The UParticleEmitter that the module is being added to.
	 */
	virtual void SetToSensibleDefaults(UParticleEmitter* Owner);

}


defaultproperties
{
   LifeMultiplier=(Distribution=DistributionLifeMultiplier,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleRotationRateMultiplyLife"
   ObjectArchetype=ParticleModuleRotationRateBase'Engine.Default__ParticleModuleRotationRateBase'
}
