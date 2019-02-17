/**
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 */

class NxForceFieldGenericComponent extends NxForceFieldComponent
	DependsOn(NxForceFieldGeneric)
	native(ForceField);

/* the Shape's internal 3 directional radii, for level designers to know the rough size of the force field*/
var() float RoughExtentX;
var() float RoughExtentY;
var() float RoughExtentZ;

/** Type of Coordinates to define the force field */
var()	FFG_ForceFieldCoordinates	Coordinates;

/** Constant force vector that is applied inside force volume */
var()	vector	Constant;


/** Rows of matrix that defines force depending on position */
var()	vector	PositionMultiplierX;
var()	vector	PositionMultiplierY;
var()	vector	PositionMultiplierZ;

/** Vector that defines force depending on position */
var()	vector	PositionTarget;


/** Rows of matrix that defines force depending on velocity */
var()	vector	VelocityMultiplierX;
var()	vector	VelocityMultiplierY;
var()	vector	VelocityMultiplierZ;

/** Vector that defines force depending on velocity */
var()	vector	VelocityTarget;

/** Vector that scales random noise added to the force */
var()	vector	Noise;

/** Linear falloff for vector in chosen coordinate system */
var()	vector	FalloffLinear;

/** Quadratic falloff for vector in chosen coordinate system */
var()	vector	FalloffQuadratic;

/** Radius of torus in case toroidal coordinate system is used */
var()	float	TorusRadius;

/** linear force field kernel */
var const native transient pointer		Kernel{class UserForceFieldLinearKernel};


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

cpptext
{
	virtual void  TermComponentRBPhys (FRBPhysScene *InScene);
	virtual void DefineForceFunction(FPointer ForceFieldDesc);
	virtual FPointer DefineForceFieldShapeDesc();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void CreateKernel();
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif

}


defaultproperties
{
   RoughExtentX=200.000000
   RoughExtentY=200.000000
   RoughExtentZ=200.000000
   TorusRadius=1.000000
   Shape=ForceFieldShapeBox'Engine.Default__NxForceFieldGenericComponent:Shape0'
   ReplacementPrimitive=None
   Name="Default__NxForceFieldGenericComponent"
   ObjectArchetype=NxForceFieldComponent'Engine.Default__NxForceFieldComponent'
}
