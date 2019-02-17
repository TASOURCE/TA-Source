/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleEventReceiverSpawn extends ParticleModuleEventReceiverBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The number of particles to spawn. */
var(Spawn)		rawdistributionfloat		SpawnCount;

/** 
 *	For Death-based event receiving, if this is TRUE, it indicates that the 
 *	ParticleTime of the event should be used to look-up the SpawnCount.
 *	Otherwise (and in all other events received), use the emitter time of 
 *	the event.
 */
var(Spawn)		bool						bUseParticleTime;

/**
 *	If TRUE, use the location of the particle system component for spawning.
 *	if FALSE (default), use the location of the particle event.
 */
var(Location)	bool						bUsePSysLocation;

/**
 *	If TRUE, use the velocity of the dying particle as the start velocity of 
 *	the spawned particle.
 */
var(Velocity)	bool						bInheritVelocity;

/**
 *	If bInheritVelocity is TRUE, scale the velocity with this.
 */
var(Velocity)	rawdistributionvector		InheritVelocityScale;

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
// (cpptext)
// (cpptext)

cpptext
{
	// UObject functionality
	
	// Event Receiver functionality
	/**
	 *	Process the event...
	 *
	 *	@param	Owner		The FParticleEmitterInstance this module is contained in.
	 *	@param	InEvent		The FParticleEventData that occurred.
	 *	@param	DeltaTime	The time slice of this frame.
	 *
	 *	@return	UBOOL		TRUE if the event was processed; FALSE if not.
	 */
	virtual UBOOL ProcessParticleEvent(FParticleEmitterInstance* Owner, FParticleEventData& InEvent, FLOAT DeltaTime);

}


defaultproperties
{
   SpawnCount=(Distribution=RequiredDistributionSpawnCount,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   InheritVelocityScale=(Distribution=RequiredDistributionInheritVelocityScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleEventReceiverSpawn"
   ObjectArchetype=ParticleModuleEventReceiverBase'Engine.Default__ParticleModuleEventReceiverBase'
}
