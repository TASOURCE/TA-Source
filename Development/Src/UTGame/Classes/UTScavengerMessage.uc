/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTScavengerMessage extends UTLocalMessage;

var localized array<string>	MessageText;


static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	return Default.MessageText[Switch];
}

defaultproperties
{
   MessageText(0)="Boost recharging!"
   MessageArea=2
   bIsPartiallyUnique=True
   DrawColor=(B=128,G=255,R=255,A=255)
   FontSize=2
   Name="Default__UTScavengerMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
