/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleRotationOverLifetime extends ParticleModuleRotationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** 
 *	The rotation of the particle (1.0 = 360 degrees).
 *	The value is retrieved using the RelativeTime of the particle.
 */
var(Rotation) rawdistributionfloat	RotationOverLife;

/**
 *	If TRUE,  the particle rotation is multiplied by the value retrieved from RotationOverLife.
 *	If FALSE, the particle rotation is incremented by the value retrieved from RotationOverLife.
 */
var(Rotation)					bool				Scale;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

}


defaultproperties
{
   RotationOverLife=(Distribution=DistributionRotOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Scale=True
   bUpdateModule=True
   Name="Default__ParticleModuleRotationOverLifetime"
   ObjectArchetype=ParticleModuleRotationBase'Engine.Default__ParticleModuleRotationBase'
}
