//=============================================================================
// A sticky note.  Level designers can place these in the level and then
// view them as a batch in the error/warnings window.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class Note extends Actor
	placeable
	native;

var() notforconsole string Text;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
#if WITH_EDITOR
	virtual void CheckForErrors();
#endif

}


defaultproperties
{
   Begin Object Class=ArrowComponent Name=Arrow
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(0)=Arrow
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Note'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   bHidden=True
   bNoDelete=True
   bMovable=False
   Name="Default__Note"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
