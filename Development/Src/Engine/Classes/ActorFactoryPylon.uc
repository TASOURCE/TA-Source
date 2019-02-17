/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryPylon extends ActorFactory
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

defaultproperties
{
   MenuName="Add Pylon"
   NewActorClass=Class'Engine.Pylon'
   bShowInEditorQuickMenu=True
   Name="Default__ActorFactoryPylon"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
