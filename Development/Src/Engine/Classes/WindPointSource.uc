/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class WindPointSource extends Info
	native
	showcategories(Movement)
	ClassGroup(Wind)
	placeable;

var() const editconst WindPointSourceComponent	Component;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
#if WITH_EDITOR
	// AActor interface.
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif

}


defaultproperties
{
   Begin Object Class=WindPointSourceComponent Name=WindPointSourceComponent0
      PreviewRadiusComponent=DrawLightRadiusComponent'Engine.Default__WindPointSource:DrawSphereComponent0'
      Name="WindPointSourceComponent0"
      ObjectArchetype=WindPointSourceComponent'Engine.Default__WindPointSourceComponent'
   End Object
   Component=WindPointSourceComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=DrawLightRadiusComponent Name=DrawSphereComponent0
      ReplacementPrimitive=None
      Name="DrawSphereComponent0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__DrawLightRadiusComponent'
   End Object
   Components(1)=DrawSphereComponent0
   Components(2)=WindPointSourceComponent0
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   Name="Default__WindPointSource"
   ObjectArchetype=Info'Engine.Default__Info'
}
