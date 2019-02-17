/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class NxGenericForceFieldCapsule extends NxGenericForceField
	native(ForceField)
	placeable;


/** Used to preview the radius of the force. */
var	DrawCapsuleComponent			RenderComponent;

/** Radius of influence of the force. */
var()	float	CapsuleHeight;
var()	float	CapsuleRadius;

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
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif
	virtual FPointer DefineForceFieldShapeDesc();

}


defaultproperties
{
   Begin Object Class=DrawCapsuleComponent Name=DrawCapsule0
      CapsuleColor=(B=255,G=70,R=64,A=255)
      ReplacementPrimitive=None
      Name="DrawCapsule0"
      ObjectArchetype=DrawCapsuleComponent'Engine.Default__DrawCapsuleComponent'
   End Object
   RenderComponent=DrawCapsule0
   CapsuleHeight=200.000000
   CapsuleRadius=200.000000
   Components(0)=DrawCapsule0
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
   Name="Default__NxGenericForceFieldCapsule"
   ObjectArchetype=NxGenericForceField'Engine.Default__NxGenericForceField'
}
