/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class VolumeTimer extends Info;

var PhysicsVolume V;

event PostBeginPlay()
{
	Super.PostBeginPlay();
	V = PhysicsVolume(Owner);
	SetTimer(V.PainInterval, true);
}

event Timer()
{
	V.TimerPop(self);
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__VolumeTimer"
   ObjectArchetype=Info'Engine.Default__Info'
}
