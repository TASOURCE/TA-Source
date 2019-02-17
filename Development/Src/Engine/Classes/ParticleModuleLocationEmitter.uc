//=============================================================================
// ParticleModuleLocationEmitter
//
// A location module that uses particles from another emitters particles as
// spawn points for its particles.
//
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ParticleModuleLocationEmitter extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

//=============================================================================
// Variables
//=============================================================================
// LocationEmitter

/** The name of the emitter to use that the source location for particle. */
var(Location)						export		noclear	name					EmitterName;

enum ELocationEmitterSelectionMethod
{
	ELESM_Random,
	ELESM_Sequential
};
/** 
 *	The method to use when selecting a spawn target particle from the emitter.
 *	Can be one of the following:
 *		ELESM_Random		Randomly select a particle from the source emitter.
 *		ELESM_Sequential	Step through each particle from the source emitter in order.
 */
var(Location)	ELocationEmitterSelectionMethod									SelectionMethod;

/** If TRUE, the spawned particle should inherit the velocity of the source particle. */
var(Location)	bool															InheritSourceVelocity;
/** Amount to scale the source velocity by when inheriting it. */
var(Location)	float															InheritSourceVelocityScale;
/** If TRUE, the spawned particle should inherit the rotation of the source particle. */
var(Location)	bool															bInheritSourceRotation;
/** Amount to scale the source rotation by when inheriting it. */
var(Location)	float															InheritSourceRotationScale;

//=============================================================================
// C++ functions
//=============================================================================
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//=============================================================================
// Script functions
//=============================================================================

//=============================================================================
// Default properties
//=============================================================================

cpptext
{
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);
	virtual UINT	RequiredBytesPerInstance(FParticleEmitterInstance* Owner = NULL);

}


defaultproperties
{
   InheritSourceVelocityScale=1.000000
   InheritSourceRotationScale=1.000000
   bSpawnModule=True
   Name="Default__ParticleModuleLocationEmitter"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
