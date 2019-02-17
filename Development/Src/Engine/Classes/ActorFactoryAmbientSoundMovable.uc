/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryAmbientSoundMovable extends ActorFactoryAmbientSound
	config( Editor )
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
   MenuName="Add AmbientSoundMovable"
   MenuPriority=10
   NewActorClass=Class'Engine.AmbientSoundMovable'
   bShowInEditorQuickMenu=False
   Name="Default__ActorFactoryAmbientSoundMovable"
   ObjectArchetype=ActorFactoryAmbientSound'Engine.Default__ActorFactoryAmbientSound'
}
