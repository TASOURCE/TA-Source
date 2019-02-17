/**
 * This specialized online game search class is used to generate a query for the player list of most recently visited servers.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTGameSearchPersonal extends UTGameSearchCommon;

defaultproperties
{
   GameSettingsClass=Class'UTGame.UTGameSettingsPersonal'
   Name="Default__UTGameSearchPersonal"
   ObjectArchetype=UTGameSearchCommon'UTGame.Default__UTGameSearchCommon'
}
