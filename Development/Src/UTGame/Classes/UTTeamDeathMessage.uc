/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTTeamDeathMessage extends UTDeathMessage
	abstract;

// this subclass has different default config properties

defaultproperties
{
   bNoConsoleDeathMessages=True
   Name="Default__UTTeamDeathMessage"
   ObjectArchetype=UTDeathMessage'UTGame.Default__UTDeathMessage'
}
