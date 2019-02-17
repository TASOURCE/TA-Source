/**
 * Provides a possible key binding for the game.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTUIDataProvider_KeyBinding extends UTUIResourceDataProvider
	PerObjectConfig;

/** Command to bind the key to. */
var config string Command;

/** Whether this bind must be bound to leave the screen or not. */
var config bool bIsCrucialBind;

defaultproperties
{
   Name="Default__UTUIDataProvider_KeyBinding"
   ObjectArchetype=UTUIResourceDataProvider'UTGame.Default__UTUIResourceDataProvider'
}
