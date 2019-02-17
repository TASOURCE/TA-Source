/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class NxGenericForceFieldBrush extends Volume
	native(ForceField)
	dependson(PrimitiveComponent)
	placeable;


/** Type of Coordinates to define the force field */
// TODO how to use the ForceFieldCoordinates from NxGenericForceField?
enum FFB_ForceFieldCoordinates
{
	FFB_CARTESIAN,
	FFB_SPHERICAL,
	FFB_CYLINDRICAL,
	FFB_TOROIDAL
};


/** Channel id, used to identify which force field exclude volumes apply to this force field */
var()	int		ExcludeChannel;

/** Which types of object to apply this force field to */
var()	RBCollisionChannelContainer	CollideWithChannels;

/** enum indicating what collision filtering channel this force field should be in */
var()	const ERBCollisionChannel	RBChannel;

var()	FFB_ForceFieldCoordinates	Coordinates;

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


/** Value to scale force on fluid */
//var()	float	FluidScale;

/** Value to scale force on cloth */
//var()	float	ClothScale;

/** Value to scale force on rigid body */
//var()	float	RigidBodyScale;

/** Value to scale force on soft body */
//var()	float	SoftBodyScale;

/* Pointer that stores force field */
var const native transient pointer	ForceField{class UserForceField};

/* Array storing pointers to convex meshes */
var array<const native transient pointer>	ConvexMeshes;

/* Array storing pointers to exclusion shapes (used to make them static) */
var array<const native transient pointer>	ExclusionShapes;

/* Array storing pointers to global shape poses (used to make them static) */
var array<const native transient pointer>	ExclusionShapePoses;

/** linear force field kernel */
var const native transient pointer		LinearKernel{class UserForceFieldLinearKernel};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	// match bProjTarget to weapons (zero extent) collision setting
	if (BrushComponent != None)
	{
		bProjTarget = BrushComponent.BlockZeroExtent;
	}
}

simulated function bool StopsProjectile(Projectile P)
{
	return false;
}

cpptext
{
	virtual void InitRBPhys();
	virtual void TermRBPhys(FRBPhysScene* Scene);
	virtual void TickSpecial(FLOAT DeltaSeconds);

}


defaultproperties
{
   ExcludeChannel=1
   CollideWithChannels=(Default=True,Pawn=True,Vehicle=True,Water=True,GameplayPhysics=True,EffectPhysics=True,Untitled1=True,Untitled2=True,Untitled3=True,Cloth=True,FluidDrain=True,SoftBody=True)
   RBChannel=RBCC_Untitled1
   TorusRadius=1.000000
   BrushColor=(B=100,G=255,R=100,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   bStatic=False
   bProjTarget=True
   CollisionComponent=BrushComponent0
   Name="Default__NxGenericForceFieldBrush"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
