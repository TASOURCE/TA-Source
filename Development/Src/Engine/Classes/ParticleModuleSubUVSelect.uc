/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSubUVSelect extends ParticleModuleSubUVBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The horizontal (X) and vertical (Y) index of the sub-image desired.
 *	Value is retrieved using the RelativeTime of the particle.
 */
var(SubUV) rawdistributionvector	SubImageSelect;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

}


defaultproperties
{
   SubImageSelect=(Distribution=DistributionSubImageSelect,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bUpdateModule=True
   Name="Default__ParticleModuleSubUVSelect"
   ObjectArchetype=ParticleModuleSubUVBase'Engine.Default__ParticleModuleSubUVBase'
}
