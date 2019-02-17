/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleAttractorPoint extends ParticleModuleAttractorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**	The position of the point attractor from the source of the emitter.		*/
var(Attractor)				rawdistributionvector	Position;

/**	The radial range of the attractor.										*/
var(Attractor)				rawdistributionfloat	Range;

/**	The strength of the point attractor.									*/
var(Attractor)				rawdistributionfloat	Strength;

/**	The strength curve is a function of distance or of time.				*/
var(Attractor) bool									StrengthByDistance;

/**	If TRUE, the velocity adjustment will be applied to the base velocity.	*/
var(Attractor) bool									bAffectBaseVelocity;

/**	If TRUE, set the velocity.												*/
var(Attractor) bool									bOverrideVelocity;

/**	If TRUE, treat the position as world space.  So don't transform the the point to localspace. */
var(Attractor) bool									bUseWorldSpacePosition;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);
	virtual void	Render3DPreview(FParticleEmitterInstance* Owner, const FSceneView* View,FPrimitiveDrawInterface* PDI);

}


defaultproperties
{
   Position=(Distribution=DistributionPosition,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   Range=(Distribution=DistributionRange,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Strength=(Distribution=DistributionStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   StrengthByDistance=True
   bUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleAttractorPoint"
   ObjectArchetype=ParticleModuleAttractorBase'Engine.Default__ParticleModuleAttractorBase'
}
