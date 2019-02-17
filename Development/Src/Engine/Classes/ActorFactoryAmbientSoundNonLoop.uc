/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryAmbientSoundNonLoop extends ActorFactoryAmbientSoundSimple
	config( Editor )
	collapsecategories
	hidecategories( Object )
	native;

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
   MenuName="Add AmbientSoundNonLoop"
   MenuPriority=10
   NewActorClass=Class'Engine.AmbientSoundNonLoop'
   Name="Default__ActorFactoryAmbientSoundNonLoop"
   ObjectArchetype=ActorFactoryAmbientSoundSimple'Engine.Default__ActorFactoryAmbientSoundSimple'
}
