/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryDecalMovable extends ActorFactoryDecal
	config(Editor)
	native(Decal);

defaultproperties
{
   MenuName="Add Movable Decal"
   NewActorClass=Class'Engine.DecalActorMovable'
   Name="Default__ActorFactoryDecalMovable"
   ObjectArchetype=ActorFactoryDecal'Engine.Default__ActorFactoryDecal'
}
