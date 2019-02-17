/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class NxGenericForceFieldBox extends NxGenericForceField
	native(ForceField)
	placeable;


/** Used to preview the radius of the force. */
var	DrawBoxComponent			RenderComponent;

/** Radius of influence of the force. */
var()	interp vector	BoxExtent;

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
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif
	virtual FPointer DefineForceFieldShapeDesc();

}


defaultproperties
{
   Begin Object Class=DrawBoxComponent Name=DrawBox0
      BoxColor=(B=255,G=70,R=64,A=255)
      ReplacementPrimitive=None
      Name="DrawBox0"
      ObjectArchetype=DrawBoxComponent'Engine.Default__DrawBoxComponent'
   End Object
   RenderComponent=DrawBox0
   BoxExtent=(X=200.000000,Y=200.000000,Z=200.000000)
   Components(0)=DrawBox0
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
   Name="Default__NxGenericForceFieldBox"
   ObjectArchetype=NxGenericForceField'Engine.Default__NxGenericForceField'
}
