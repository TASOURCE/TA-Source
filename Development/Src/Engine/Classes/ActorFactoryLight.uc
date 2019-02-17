/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryLight extends ActorFactory
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

defaultproperties
{
   MenuName="Add Light (Point)"
   MenuPriority=20
   NewActorClass=Class'Engine.PointLight'
   bShowInEditorQuickMenu=True
   Name="Default__ActorFactoryLight"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
