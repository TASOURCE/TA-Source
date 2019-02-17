/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactorySkeletalMeshMAT extends ActorFactorySkeletalMesh
	config(Editor)
	hidecategories(Object);

defaultproperties
{
   MenuName="Add SkeletalMeshMAT"
   MenuPriority=12
   NewActorClass=Class'Engine.SkeletalMeshActorMAT'
   Name="Default__ActorFactorySkeletalMeshMAT"
   ObjectArchetype=ActorFactorySkeletalMesh'Engine.Default__ActorFactorySkeletalMesh'
}
