/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSourceMovement extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** 
 *	The scale factor to apply to the source movement before adding to the particle location.
 *	The value is looked up using the particles RELATIVE time [0..1].
 */
var(SourceMovement) rawdistributionvector	SourceMovementScale;

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
	/**
	 *	Called on an emitter when all other update operations have taken place
	 *	INCLUDING bounding box calculations!
	 *	
	 *	@param	Owner		The FParticleEmitterInstance that 'owns' the particle.
	 *	@param	Offset		The modules offset into the data payload of the particle.
	 *	@param	DeltaTime	The time since the last update.
	 */
	virtual void	FinalUpdate(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

}


defaultproperties
{
   SourceMovementScale=(Distribution=DistributionSourceMovementScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   bFinalUpdateModule=True
   Name="Default__ParticleModuleSourceMovement"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
