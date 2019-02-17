/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class NxForceFieldGeneric extends NxForceField
	native(ForceField)
	placeable;

var() editinline ForceFieldShape Shape;

var ActorComponent DrawComponent;

/* the Shape's internal 3 directional radii, for level designers to know the rough size of the force field*/
var() float RoughExtentX;
var() float RoughExtentY;
var() float RoughExtentZ;

/** Type of Coordinates that can be used to define the force field */
enum FFG_ForceFieldCoordinates
{
	FFG_CARTESIAN,
	FFG_SPHERICAL,
	FFG_CYLINDRICAL,
	FFG_TOROIDAL
};

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
// (cpptext)
// (cpptext)
// (cpptext)


/** 
 * This is used to InitRBPhys for a dynamically spawned ForceField.
 * Used for starting RBPhsys on dyanmically spawned force fields.  This will probably need to set some transient pointer to NULL  
 **/
native function DoInitRBPhys();

cpptext
{
	virtual void InitRBPhys();
	virtual void TermRBPhys(FRBPhysScene* Scene);

	virtual void DefineForceFunction(FPointer ForceFieldDesc);
	virtual FPointer DefineForceFieldShapeDesc();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif
	virtual void PostLoad();

}


defaultproperties
{
   RoughExtentX=200.000000
   RoughExtentY=200.000000
   RoughExtentZ=200.000000
   TorusRadius=1.000000
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_RadForce'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Name="Default__NxForceFieldGeneric"
   ObjectArchetype=NxForceField'Engine.Default__NxForceField'
}
