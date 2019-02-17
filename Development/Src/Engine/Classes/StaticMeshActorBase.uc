/**
 * Base class for static actors which contain StaticMeshComponents.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class StaticMeshActorBase extends Actor
	ClassGroup(StaticMeshes)
	native
	abstract;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/**
	 * Initializes this actor when play begins.  This version marks the actor as ready to execute script, but skips
	 * the rest of the stuff that actors normally do in PostBeginPlay().
	 */
	virtual void PostBeginPlay();

}


defaultproperties
{
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   bWorldGeometry=True
   bRouteBeginPlayEvenIfStatic=False
   bGameRelevant=True
   bMovable=False
   bCollideActors=True
   bBlockActors=True
   bEdShouldSnap=True
   Name="Default__StaticMeshActorBase"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
