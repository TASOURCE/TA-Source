/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryCoverLink extends ActorFactory
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

defaultproperties
{
   MenuName="Add CoverLink"
   NewActorClass=Class'Engine.CoverLink'
   bShowInEditorQuickMenu=True
   Name="Default__ActorFactoryCoverLink"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
