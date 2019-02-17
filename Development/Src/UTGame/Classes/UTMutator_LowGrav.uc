// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
class UTMutator_LowGrav extends UTMutator;

/** Gravity along Z axis applied to objects in physics volumes which had default gravity. */
var()	float	GravityZ;

function InitMutator(string Options, out string ErrorMessage)
{
	WorldInfo.WorldGravityZ = GravityZ;
	Super.InitMutator(Options, ErrorMessage);
}

defaultproperties
{
   GravityZ=-100.000000
   GroupNames(0)="JUMPING"
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__UTMutator_LowGrav"
   ObjectArchetype=UTMutator'UTGame.Default__UTMutator'
}
