/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryPathNode extends ActorFactory
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

defaultproperties
{
   MenuName="Add PathNode"
   NewActorClass=Class'Engine.PathNode'
   bShowInEditorQuickMenu=True
   Name="Default__ActorFactoryPathNode"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
