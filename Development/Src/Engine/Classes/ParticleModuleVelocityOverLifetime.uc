/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleVelocityOverLifetime extends ParticleModuleVelocityBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The scaling  value applied to the velocity.
 *	Value is retrieved using the RelativeTime of the particle.
 */
var(Velocity) rawdistributionvector	VelOverLife;
/**
 *	If true, the velocity will be SET to the value from the above dist.
 *	If false, the velocity will be scaled by the above dist.
 */
var(Velocity) export			bool			Absolute;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

}


defaultproperties
{
   VelOverLife=(Distribution=DistributionVelOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleVelocityOverLifetime"
   ObjectArchetype=ParticleModuleVelocityBase'Engine.Default__ParticleModuleVelocityBase'
}
