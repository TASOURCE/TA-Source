/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleTypeDataTrail extends ParticleModuleTypeDataBase
	native(Particle)
	editinlinenew
	collapsecategories
	hidecategories(Object);

//@todo. Remove these once trails are finialized - START
var(Trail)	bool								RenderGeometry;
var(Trail)	bool								RenderLines;
var(Trail)	bool								RenderTessellation;
//@todo. Remove these once trails are finialized - END

var(Trail)	bool								Tapered;
var(Trail)	int									TessellationFactor;
var(Trail)	rawdistributionfloat				Tension;

var(Trail)	bool								SpawnByDistance;
var(Trail)	vector								SpawnDistance;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual FParticleEmitterInstance* CreateInstance(UParticleEmitter* InEmitterParent, UParticleSystemComponent* InComponent);

	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   RenderGeometry=True
   TessellationFactor=1
   Tension=(Distribution=DistributionTension,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   SpawnDistance=(X=5.000000,Y=5.000000,Z=5.000000)
   Name="Default__ParticleModuleTypeDataTrail"
   ObjectArchetype=ParticleModuleTypeDataBase'Engine.Default__ParticleModuleTypeDataBase'
}
