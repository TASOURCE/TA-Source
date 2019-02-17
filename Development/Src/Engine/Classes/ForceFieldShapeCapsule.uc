/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class ForceFieldShapeCapsule extends ForceFieldShape
	native(ForceField)
	;

var DrawCapsuleComponent Shape;

// UE3 capsule is x up by default. The fill... functions are not right because of the direction. Todo.
event float GetHeight()
{
	return Shape.CapsuleHeight;
}

event float GetRadius()
{
	return Shape.CapsuleRadius;
}

event FillBySphere(float Radius)
{
	Shape.CapsuleRadius = Radius;
	Shape.CapsuleHeight = 0;
}

event FillByBox(vector Extent)
{
	Shape.CapsuleRadius = Sqrt(Extent.X*Extent.X + Extent.Y*Extent.Y);
	Shape.CapsuleHeight = Extent.Z*2;
}

event FillByCapsule(float Height, float Radius)
{
	Shape.CapsuleHeight = Height;
	Shape.CapsuleRadius = Radius;
}

event FillByCylinder(float BottomRadius, float TopRadius, float Height, float HeightOffset)
{
	Shape.CapsuleRadius = FMax(BottomRadius, TopRadius);
	// Shape.CapsuleHeight = Height + Abs(HeightOffset)*2;
	Shape.CapsuleHeight = Height;
}

event PrimitiveComponent GetDrawComponent()
{
	return Shape;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
#if WITH_NOVODEX
	virtual class NxForceFieldShapeDesc * CreateNxDesc();
#endif

}


defaultproperties
{
   Begin Object Class=DrawCapsuleComponent Name=DrawCapsule0
      ReplacementPrimitive=None
      Rotation=(Pitch=0,Yaw=0,Roll=16384)
      Name="DrawCapsule0"
      ObjectArchetype=DrawCapsuleComponent'Engine.Default__DrawCapsuleComponent'
   End Object
   Shape=DrawCapsule0
   Name="Default__ForceFieldShapeCapsule"
   ObjectArchetype=ForceFieldShape'Engine.Default__ForceFieldShape'
}
