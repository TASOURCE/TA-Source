/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class NxRadialForceField extends NxForceField
	native(ForceField)
	placeable;


/** Used to preview the radius of the force. */
var	DrawSphereComponent			RenderComponent;

/** Strength of the force applied by this actor. Positive forces are applied outwards. */
var()	interp float	ForceStrength;

/** Radius of influence of the force. */
var()	interp float	ForceRadius;

/** Way in which the force falls off as objects are further away from the location. */
var()	PrimitiveComponent.ERadialImpulseFalloff	ForceFalloff;

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

cpptext
{
	virtual void InitRBPhys();
	virtual void TermRBPhys(FRBPhysScene* Scene);

	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void TickSpecial(FLOAT DeltaSeconds);
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif
	virtual void DefineForceFunction(FPointer ForceFieldDesc);
	virtual FPointer DefineForceFieldShapeDesc();

}


defaultproperties
{
   Begin Object Class=DrawSphereComponent Name=DrawSphere0
      SphereColor=(B=255,G=70,R=64,A=255)
      SphereRadius=200.000000
      ReplacementPrimitive=None
      Name="DrawSphere0"
      ObjectArchetype=DrawSphereComponent'Engine.Default__DrawSphereComponent'
   End Object
   RenderComponent=DrawSphere0
   ForceStrength=10.000000
   ForceRadius=200.000000
   Components(0)=DrawSphere0
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_RadForce'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   Name="Default__NxRadialForceField"
   ObjectArchetype=NxForceField'Engine.Default__NxForceField'
}
