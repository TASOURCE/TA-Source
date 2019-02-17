/**
 *
 *	Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class MaterialInstanceTimeVaryingActor extends Actor
	placeable
	hidecategories(Movement)
	hidecategories(Advanced)
	hidecategories(Collision)
	hidecategories(Display)
	hidecategories(Actor)
	hidecategories(Attachment);

/** Pointer to MaterialInterface that we want to activate */
var()	MaterialInstanceTimeVarying	MatInst;

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.MatInstActSprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   TickGroup=TG_DuringAsyncWork
   bNoDelete=True
   Name="Default__MaterialInstanceTimeVaryingActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
