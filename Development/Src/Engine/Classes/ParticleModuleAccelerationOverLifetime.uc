/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleAccelerationOverLifetime extends ParticleModuleAccelerationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** 
 *	The acceleration of the particle over its lifetime.
 *	Value is obtained using the RelativeTime of the partice.
 *	The current and base velocity values of the particle 
 *	are then updated using the formula 
 *		velocity += acceleration* DeltaTime
 *	where DeltaTime is the time passed since the last frame.
 */
var(Acceleration) rawdistributionvector	AccelOverLife;

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
   AccelOverLife=(Distribution=DistributionAccelOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bUpdateModule=True
   Name="Default__ParticleModuleAccelerationOverLifetime"
   ObjectArchetype=ParticleModuleAccelerationBase'Engine.Default__ParticleModuleAccelerationBase'
}
