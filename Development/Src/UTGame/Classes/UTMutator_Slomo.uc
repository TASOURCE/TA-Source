// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
class UTMutator_Slomo extends UTMutator;

/** Game speed modifier. */
var()	float	GameSpeed;

function InitMutator(string Options, out string ErrorMessage)
{
	WorldInfo.Game.SetGameSpeed(GameSpeed);
	Super.InitMutator(Options, ErrorMessage);
}

defaultproperties
{
   GameSpeed=0.800000
   GroupNames(0)="GAMESPEED"
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__UTMutator_Slomo"
   ObjectArchetype=UTMutator'UTGame.Default__UTMutator'
}
