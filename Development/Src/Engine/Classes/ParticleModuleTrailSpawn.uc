/**
 *	ParticleModuleTrailSpawn
 *	The trail spawn module.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleTrailSpawn extends ParticleModuleTrailBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

//*************************************************************************************************
// Trail Spawning Variables
//*************************************************************************************************
enum ETrail2SpawnMethod
{
	/** Use the emitter spawn settings									*/
	PET2SM_Emitter,
	/** Spawn based on the velocity of the source						*/
	PET2SM_Velocity,
	/** Spawn base on the distanced covered by the source				*/
	PET2SM_Distance
};

/** 
 *	This parameter will map a given distance range [MinInput..MaxInput]
 *	to the given spawn values [MinOutput..MaxOutput]
 *	Anything below the MinOutput will result in no particles being spawned
 *	NOTE: The distance travelled is accumulated. If it takes 10 frames to travel the min.
 *	distance, then MinOutput particles will be spawned every 10 frames...
 *	IMPORTANT! This type must be a floatparticleparam type, but nothing is forcing it now!
 */
var(Spawn)	export noclear		distributionfloatparticleparameter	SpawnDistanceMap;

/** 
 *	The minimum velocity the source must be travelling at in order to spawn particles.
 */
var(Spawn)						float								MinSpawnVelocity;

//*************************************************************************************************
// C++ Text
//*************************************************************************************************
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

//*************************************************************************************************
// Default properties
//*************************************************************************************************

cpptext
{
	virtual void	PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void	PostLoad();

	// Trail
//	virtual void	GetDataPointers(FParticleEmitterInstance* Owner, const BYTE* ParticleBase, 
//			INT& CurrentOffset, FBeam2TypeDataPayload*& BeamData, FVector*& InterpolatedPoints, 
//			FLOAT*& NoiseRate, FVector*& TargetNoisePoints, FVector*& CurrentNoisePoints, 
//			FLOAT*& TaperValues);

			UINT	GetSpawnCount(FParticleTrail2EmitterInstance* TrailInst, FLOAT DeltaTime);

}


defaultproperties
{
   Begin Object Class=DistributionFloatParticleParameter Name=DistributionSpawnDistanceMap
      MinInput=10.000000
      MaxInput=100.000000
      MinOutput=1.000000
      MaxOutput=5.000000
      Constant=1.000000
      Name="DistributionSpawnDistanceMap"
      ObjectArchetype=DistributionFloatParticleParameter'Engine.Default__DistributionFloatParticleParameter'
   End Object
   SpawnDistanceMap=DistributionSpawnDistanceMap
   Name="Default__ParticleModuleTrailSpawn"
   ObjectArchetype=ParticleModuleTrailBase'Engine.Default__ParticleModuleTrailBase'
}
