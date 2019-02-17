//=============================================================================
// ParticleModuleLocationPrimitiveSphere
// Location primitive spawning within a Sphere.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ParticleModuleLocationPrimitiveSphere extends ParticleModuleLocationPrimitiveBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The radius of the sphere. Retrieved using EmitterTime. */
var(Location) rawdistributionfloat	StartRadius;

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
	virtual void	Render3DPreview(FParticleEmitterInstance* Owner, const FSceneView* View,FPrimitiveDrawInterface* PDI);

}


defaultproperties
{
   StartRadius=(Distribution=DistributionStartRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(50.000000,50.000000,50.000000,50.000000))
   VelocityScale=(Distribution=DistributionVelocityScale)
   StartLocation=(Distribution=DistributionStartLocation)
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleLocationPrimitiveSphere"
   ObjectArchetype=ParticleModuleLocationPrimitiveBase'Engine.Default__ParticleModuleLocationPrimitiveBase'
}
