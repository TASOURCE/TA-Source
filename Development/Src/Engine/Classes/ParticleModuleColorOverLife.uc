/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleColorOverLife extends ParticleModuleColorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The color to apply to the particle, as a function of the particle RelativeTime. */
var(Color)					rawdistributionvector	ColorOverLife;
/** The alpha to apply to the particle, as a function of the particle RelativeTime. */
var(Color)					rawdistributionfloat	AlphaOverLife;
/** If TRUE, the alpha value will be clamped to the [0..1] range. */
var(Color)					bool					bClampAlpha;

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
   ColorOverLife=(Distribution=DistributionColorOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   AlphaOverLife=(Distribution=DistributionAlphaOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   bClampAlpha=True
   bSpawnModule=True
   bUpdateModule=True
   bCurvesAsColor=True
   Name="Default__ParticleModuleColorOverLife"
   ObjectArchetype=ParticleModuleColorBase'Engine.Default__ParticleModuleColorBase'
}
