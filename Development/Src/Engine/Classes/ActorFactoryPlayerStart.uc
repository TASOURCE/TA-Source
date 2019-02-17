/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryPlayerStart extends ActorFactory
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

defaultproperties
{
   MenuName="Add PlayerStart"
   MenuPriority=20
   NewActorClass=Class'Engine.PlayerStart'
   bShowInEditorQuickMenu=True
   Name="Default__ActorFactoryPlayerStart"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
