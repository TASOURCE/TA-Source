// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
class UTMutator_WeaponsRespawn extends UTMutator;

function InitMutator(string Options, out string ErrorMessage)
{
	UTGame(WorldInfo.Game).bWeaponStay = false;
	super.InitMutator(Options, ErrorMessage);
}

defaultproperties
{
   GroupNames(0)="WEAPONRESPAWN"
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__UTMutator_WeaponsRespawn"
   ObjectArchetype=UTMutator'UTGame.Default__UTMutator'
}
