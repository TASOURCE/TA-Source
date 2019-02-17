/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryInteractiveFoliage extends ActorFactoryStaticMesh
	config(Editor)
	native(Foliage);

defaultproperties
{
   MenuName="Add InteractiveFoliageActor"
   MenuPriority=26
   NewActorClass=Class'Engine.InteractiveFoliageActor'
   Name="Default__ActorFactoryInteractiveFoliage"
   ObjectArchetype=ActorFactoryStaticMesh'Engine.Default__ActorFactoryStaticMesh'
}
