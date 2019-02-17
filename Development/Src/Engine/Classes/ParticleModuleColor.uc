/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleColor extends ParticleModuleColorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** Initial color for a particle as a function of Emitter time. */
var(Color) rawdistributionvector	StartColor;
/** Initial alpha for a particle as a function of Emitter time. */
var(Color) rawdistributionfloat		StartAlpha;
/** If TRUE, the alpha value will be clamped to the [0..1] range. */
var(Color) bool						bClampAlpha;

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
	virtual void	PostLoad();
	virtual	void	PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual	void	AddModuleCurvesToEditor(UInterpCurveEdSetup* EdSetup);
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

}


defaultproperties
{
   StartColor=(Distribution=DistributionStartColor,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   StartAlpha=(Distribution=DistributionStartAlpha,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   bClampAlpha=True
   bSpawnModule=True
   bCurvesAsColor=True
   Name="Default__ParticleModuleColor"
   ObjectArchetype=ParticleModuleColorBase'Engine.Default__ParticleModuleColorBase'
}
