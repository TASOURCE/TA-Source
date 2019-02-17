/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class RadialBlurActor extends Actor
	placeable;

/**
 *	Actor used to spawn radial screen blur 
 */

/** Blur component created for the actor */
var() RadialBlurComponent	RadialBlur;

defaultproperties
{
   Begin Object Class=RadialBlurComponent Name=RadialBlurComp
      Name="RadialBlurComp"
      ObjectArchetype=RadialBlurComponent'Engine.Default__RadialBlurComponent'
   End Object
   RadialBlur=RadialBlurComp
   Components(0)=RadialBlurComp
   Begin Object Class=SpriteComponent Name=Sprite
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__RadialBlurActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
