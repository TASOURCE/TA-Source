/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class WindDirectionalSource extends Info
	ClassGroup(Wind)
	placeable;

var() const editconst WindDirectionalSourceComponent	Component;

defaultproperties
{
   Begin Object Class=WindDirectionalSourceComponent Name=WindDirectionalSourceComponent0
      Name="WindDirectionalSourceComponent0"
      ObjectArchetype=WindDirectionalSourceComponent'Engine.Default__WindDirectionalSourceComponent'
   End Object
   Component=WindDirectionalSourceComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=WindDirectionalSourceComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(2)=ArrowComponent0
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   Name="Default__WindDirectionalSource"
   ObjectArchetype=Info'Engine.Default__Info'
}
