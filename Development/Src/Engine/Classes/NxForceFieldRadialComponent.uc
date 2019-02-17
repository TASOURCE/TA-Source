/**
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 */

class NxForceFieldRadialComponent extends NxForceFieldComponent
	native(ForceField);


/** Render the size of force field */
//var() DrawSphereComponent RenderComponentSphere;

// var() editinline ForceFieldShape Shape;

/** Strength of the force applied by this actor. Positive forces are applied outwards. */
var()	interp float	ForceStrength;

/** Radius of influence of the force. */
var()	interp float	ForceRadius;

/** */
var()	interp float	SelfRotationStrength;

/** Way in which the force falls off as objects are further away from the location. */
var()	PrimitiveComponent.ERadialImpulseFalloff	ForceFalloff;

/** custom force field kernel */
var const native transient pointer		Kernel{class NxForceFieldKernelRadial};


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
	virtual void CreateKernel();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif

}


defaultproperties
{
   ForceStrength=200.000000
   ForceRadius=200.000000
   SelfRotationStrength=200.000000
   Shape=ForceFieldShapeSphere'Engine.Default__NxForceFieldRadialComponent:Shape0'
   ReplacementPrimitive=None
   Name="Default__NxForceFieldRadialComponent"
   ObjectArchetype=NxForceFieldComponent'Engine.Default__NxForceFieldComponent'
}
