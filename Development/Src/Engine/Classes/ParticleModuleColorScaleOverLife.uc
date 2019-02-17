/**
 *	ParticleModuleColorScaleOverLife
 *
 *	The base class for all Beam modules.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class ParticleModuleColorScaleOverLife extends ParticleModuleColorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The scale factor for the color.													*/
var(Color)				rawdistributionvector	ColorScaleOverLife;

/** The scale factor for the alpha.													*/
var(Color)				rawdistributionfloat	AlphaScaleOverLife;

/** Whether it is EmitterTime or ParticleTime related.								*/
var(Color)				bool					bEmitterTime;

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
   ColorScaleOverLife=(Distribution=DistributionColorScaleOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   AlphaScaleOverLife=(Distribution=DistributionAlphaScaleOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   bSpawnModule=True
   bUpdateModule=True
   bCurvesAsColor=True
   Name="Default__ParticleModuleColorScaleOverLife"
   ObjectArchetype=ParticleModuleColorBase'Engine.Default__ParticleModuleColorBase'
}
