/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactorySkeletalMeshCinematic extends ActorFactorySkeletalMesh
	config(Editor)
	hidecategories(Object);

defaultproperties
{
   MenuName="Add SkeletalMeshCinematic"
   MenuPriority=12
   NewActorClass=Class'Engine.SkeletalMeshCinematicActor'
   Name="Default__ActorFactorySkeletalMeshCinematic"
   ObjectArchetype=ActorFactorySkeletalMesh'Engine.Default__ActorFactorySkeletalMesh'
}
