/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryMover extends ActorFactoryDynamicSM
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

defaultproperties
{
   MenuName="Add InterpActor"
   MenuPriority=25
   NewActorClass=Class'Engine.InterpActor'
   Name="Default__ActorFactoryMover"
   ObjectArchetype=ActorFactoryDynamicSM'Engine.Default__ActorFactoryDynamicSM'
}
