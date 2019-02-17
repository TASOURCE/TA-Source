/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTPlayerInput extends UDKPlayerInput within UTPlayerController;

var float LastDuckTime;
var bool  bHoldDuck;
var Actor.EDoubleClickDir ForcedDoubleClick;

//$$BE Removing unneeded exec commands.

defaultproperties
{
   Name="Default__UTPlayerInput"
   ObjectArchetype=UDKPlayerInput'UDKBase.Default__UDKPlayerInput'
}
