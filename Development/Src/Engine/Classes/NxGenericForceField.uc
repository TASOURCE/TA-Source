/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class NxGenericForceField extends NxForceField
	native(ForceField)
	abstract;

/** Type of Coordinates that can be used to define the force field */
/*enum FFG_ForceFieldCoordinates
{
	FFG_CARTESIAN,
	FFG_SPHERICAL,
	FFG_CYLINDRICAL,
	FFG_TOROIDAL
};*/

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
var const native transient pointer		LinearKernel{class UserForceFieldLinearKernel};

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
	virtual void InitRBPhys();
	virtual void TermRBPhys(FRBPhysScene* Scene);

	virtual void TickSpecial(FLOAT DeltaSeconds);

	virtual void DefineForceFunction(FPointer ForceFieldDesc);
	virtual FPointer DefineForceFieldShapeDesc();

}


defaultproperties
{
   TorusRadius=1.000000
   Name="Default__NxGenericForceField"
   ObjectArchetype=NxForceField'Engine.Default__NxForceField'
}
