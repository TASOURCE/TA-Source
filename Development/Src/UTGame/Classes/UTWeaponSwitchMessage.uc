/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
//
// OptionalObject is an Pickup class
//
class UTWeaponSwitchMessage extends UTLocalMessage;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if ( Actor(OptionalObject) != None )
	{
		return Actor(OptionalObject).GetHumanReadableName();
	}
	return "";
}

defaultproperties
{
   MessageArea=4
   bIsUnique=True
   bIsConsoleMessage=False
   FontSize=2
   Name="Default__UTWeaponSwitchMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
