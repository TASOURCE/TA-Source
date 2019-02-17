//=============================================================================
// RigidBodyBase: The base class of all rigid bodies.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class RigidBodyBase extends Actor
	ClassGroup(Physics)
	native
	abstract;

defaultproperties
{
   CollisionType=COLLIDE_CustomDefault
   Name="Default__RigidBodyBase"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
