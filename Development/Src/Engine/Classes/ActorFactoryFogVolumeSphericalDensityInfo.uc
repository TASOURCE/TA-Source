/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryFogVolumeSphericalDensityInfo extends ActorFactoryFogVolumeConstantDensityInfo
	config(Editor)
	native(FogVolume);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual AActor* CreateActor( const FVector* const Location, const FRotator* const Rotation, const class USeqAct_ActorFactory* const ActorFactoryData );

}


defaultproperties
{
   MenuName="Add FogVolumeSphericalDensityInfo"
   NewActorClass=Class'Engine.FogVolumeSphericalDensityInfo'
   Name="Default__ActorFactoryFogVolumeSphericalDensityInfo"
   ObjectArchetype=ActorFactoryFogVolumeConstantDensityInfo'Engine.Default__ActorFactoryFogVolumeConstantDensityInfo'
}
