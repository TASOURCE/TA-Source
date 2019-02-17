/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class ForceFieldShapeBox extends ForceFieldShape
	native(ForceField)
	;

var DrawBoxComponent Shape;

event vector GetRadii()
{
	return Shape.BoxExtent;
}

event FillBySphere(float Radius)
{
	Shape.BoxExtent.X = Radius;
	Shape.BoxExtent.Y = Radius;
	Shape.BoxExtent.Z = Radius;
}

event FillByBox(vector Extent)
{
	Shape.BoxExtent = Extent;
}

event FillByCapsule(float Height, float Radius)
{
	Shape.BoxExtent.X = Radius;
	Shape.BoxExtent.Y = Radius;
	Shape.BoxExtent.Z = Radius + Height/2;
}

event FillByCylinder(float BottomRadius, float TopRadius, float Height, float HeightOffset)
{
	Shape.BoxExtent.X = FMax(BottomRadius, TopRadius);
	Shape.BoxExtent.Y = Shape.BoxExtent.X;
	Shape.BoxExtent.Z = Height/2 + Abs(HeightOffset);
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
   Begin Object Class=DrawBoxComponent Name=DrawBox0
      ReplacementPrimitive=None
      Name="DrawBox0"
      ObjectArchetype=DrawBoxComponent'Engine.Default__DrawBoxComponent'
   End Object
   Shape=DrawBox0
   Name="Default__ForceFieldShapeBox"
   ObjectArchetype=ForceFieldShape'Engine.Default__ForceFieldShape'
}
