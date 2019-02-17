/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleAttractorLine extends ParticleModuleAttractorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The first endpoint of the line. */
var(Attractor) vector												EndPoint0;
/** The second endpoint of the line. */
var(Attractor) vector												EndPoint1;
/** The range of the line attractor. */
var(Attractor) rawdistributionfloat	Range;
/** The strength of the line attractor. */
var(Attractor) rawdistributionfloat	Strength;

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
   Range=(Distribution=DistributionRange,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Strength=(Distribution=DistributionStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   bUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleAttractorLine"
   ObjectArchetype=ParticleModuleAttractorBase'Engine.Default__ParticleModuleAttractorBase'
}
