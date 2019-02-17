/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class DecalActorBase extends Actor
	native(Decal)
	ClassGroup(Decals)
	abstract;

var() editconst const DecalComponent Decal;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// UObject interface.
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	// AActor interface.
	virtual void PostEditMove(UBOOL bFinished);

	/**
	 * Function that gets called from within Map_Check to allow this actor to check itself
	 * for any potential errors and register them with map check dialog.
	 */
#if WITH_EDITOR
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
	virtual void CheckForErrors();
#endif

}


defaultproperties
{
   Begin Object Class=DecalComponent Name=NewDecalComponent
      bStaticDecal=True
      DecalTransform=DecalTransform_OwnerAbsolute
      ReplacementPrimitive=None
      Name="NewDecalComponent"
      ObjectArchetype=DecalComponent'Engine.Default__DecalComponent'
   End Object
   Decal=NewDecalComponent
   Components(0)=NewDecalComponent
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_DecalActorIcon'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.150000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(2)=ArrowComponent0
   CollisionType=COLLIDE_CustomDefault
   TickGroup=TG_DuringAsyncWork
   bStatic=True
   bMovable=False
   Name="Default__DecalActorBase"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
