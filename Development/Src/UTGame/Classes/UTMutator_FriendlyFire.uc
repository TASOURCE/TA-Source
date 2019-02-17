// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
class UTMutator_FriendlyFire extends UTMutator;

var float FriendlyFireScale;

function bool MutatorIsAllowed()
{
	return UTTeamGame(WorldInfo.Game) != None && Super.MutatorIsAllowed();
}

function InitMutator(string Options, out string ErrorMessage)
{
	UTTeamGame(WorldInfo.Game).FriendlyFireScale = FriendlyFireScale;
	super.InitMutator(Options, ErrorMessage);
}

defaultproperties
{
   FriendlyFireScale=0.500000
   GroupNames(0)="FRIENDLYFIRE"
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTMutator:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__UTMutator_FriendlyFire"
   ObjectArchetype=UTMutator'UTGame.Default__UTMutator'
}
