/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class NxTornadoAngularForceFieldCapsule extends NxTornadoAngularForceField
	native(ForceField)
	placeable;

/** Used to preview the radius of the force. */
var()	DrawCapsuleComponent			RenderComponent;

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
	virtual void TickSpecial(FLOAT DeltaSeconds);
	virtual void TermRBPhys(FRBPhysScene* Scene);

	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif
	virtual FPointer DefineForceFieldShapeDesc();


}


defaultproperties
{
   Begin Object Class=DrawCapsuleComponent Name=DrawCapsule0
      ReplacementPrimitive=None
      Name="DrawCapsule0"
      ObjectArchetype=DrawCapsuleComponent'Engine.Default__DrawCapsuleComponent'
   End Object
   RenderComponent=DrawCapsule0
   ForceHeight=200.000000
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
   Name="Default__NxTornadoAngularForceFieldCapsule"
   ObjectArchetype=NxTornadoAngularForceField'Engine.Default__NxTornadoAngularForceField'
}
