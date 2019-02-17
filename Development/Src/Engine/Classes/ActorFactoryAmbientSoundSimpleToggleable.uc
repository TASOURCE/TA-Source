/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryAmbientSoundSimpleToggleable extends ActorFactoryAmbientSoundSimple
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
   MenuName="Add AmbientSoundSimpleToggleable"
   MenuPriority=10
   NewActorClass=Class'Engine.AmbientSoundSimpleToggleable'
   Name="Default__ActorFactoryAmbientSoundSimpleToggleable"
   ObjectArchetype=ActorFactoryAmbientSoundSimple'Engine.Default__ActorFactoryAmbientSoundSimple'
}
