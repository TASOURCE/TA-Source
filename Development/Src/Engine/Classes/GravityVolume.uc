/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class GravityVolume extends PhysicsVolume
	native
	placeable;

/**
 *	Simple PhysicsVolume that modifies the gravity inside it.
 */

/** Gravity along Z axis applied to objects inside this volume. */
var()	float	GravityZ;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual FLOAT GetGravityZ() { return GravityZ; }

}


defaultproperties
{
   GravityZ=-520.000000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=BrushComponent0
   Name="Default__GravityVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}
