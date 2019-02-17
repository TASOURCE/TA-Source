/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// Keypoint, the base class of invisible actors which mark things.
//=============================================================================
class Keypoint extends Actor
	abstract
	placeable
	native;
	
var SpriteComponent SpriteComp;

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Keypoint'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   bHidden=True
   Name="Default__Keypoint"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
