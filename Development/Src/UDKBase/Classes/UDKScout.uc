/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKScout extends Scout
	native
	transient;

/** Set during path calculation if double jump is required to traverse this path */
var bool bRequiresDoubleJump;

/** Should be set in Scout's default properties to specify max height off ground reached at apex of double jump */
var float MaxDoubleJumpHeight;

/* UDKScout uses the properties from this class (jump height etc.) to override UDKScout default settings */
var class<UDKPawn> PrototypePawnClass;

/** Name (in PathSizes[] array) associated with size that should be used for calculating JumpPad paths */
var name SizePersonFindName;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
SuggestJumpVelocity()
returns true if succesful jump from start to destination is possible
returns a suggested initial falling velocity in JumpVelocity
Uses GroundSpeed and JumpZ as limits
*/
native function bool SuggestJumpVelocity(out vector JumpVelocity, vector Destination, vector Start, optional bool bRequireFallLanding);

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Scout:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Scout:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__UDKScout"
   ObjectArchetype=Scout'Engine.Default__Scout'
}
