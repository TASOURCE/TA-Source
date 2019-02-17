/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTScout extends UDKScout;

defaultproperties
{
   MaxDoubleJumpHeight=85.000000
   PrototypePawnClass=Class'UTGame.UTPawn'
   SizePersonFindName="Human"
   PathSizes(0)=(Desc="Crouched",Radius=22.000000,Height=29.000000)
   PathSizes(1)=(Desc="Human",Radius=22.000000,Height=44.000000)
   PathSizes(2)=(Desc="Small",Radius=72.000000,Height=44.000000)
   PathSizes(3)=(Desc="Common",Radius=100.000000,Height=44.000000)
   PathSizes(4)=(Desc="Max",Radius=140.000000,Height=100.000000)
   PathSizes(5)=(Desc="Vehicle",Radius=260.000000,Height=100.000000)
   TestJumpZ=322.000000
   TestGroundSpeed=440.000000
   NavMeshGen_EntityHalfHeight=44.000000
   MaxStepHeight=26.000000
   MaxJumpHeight=49.000000
   WalkableFloorZ=0.780000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UDKBase.Default__UDKScout:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UDKBase.Default__UDKScout:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__UTScout"
   ObjectArchetype=UDKScout'UDKBase.Default__UDKScout'
}
