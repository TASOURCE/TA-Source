/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSubUVDirect extends ParticleModuleSubUVBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The upper-left corner of the texture coordinates desired.
 *	Value is retrieved using RelativeTime of the particle.
 */
var(SubUV) rawdistributionvector	SubUVPosition;
/**
 *	The size of the texture sample desired.
 *	Value is retrieved using RelativeTime of the particle.
 */
var(SubUV) rawdistributionvector	SubUVSize;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);
	virtual void	UpdateSprite(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);
	virtual void	UpdateMesh(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

}


defaultproperties
{
   SubUVPosition=(Distribution=DistributionSubImagePosition,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   SubUVSize=(Distribution=DistributionSubImageSize,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bUpdateModule=True
   Name="Default__ParticleModuleSubUVDirect"
   ObjectArchetype=ParticleModuleSubUVBase'Engine.Default__ParticleModuleSubUVBase'
}
