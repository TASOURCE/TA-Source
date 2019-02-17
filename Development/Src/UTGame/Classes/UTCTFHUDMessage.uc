/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTCTFHUDMessage extends UTLocalMessage;

// CTF Messages
//
// Switch 0: You have the flag message.
// Switch 1: Enemy has the flag message.
// Switch 2: You and enemy have flag message.

var(Message) localized string YouHaveFlagString;
var(Message) localized string EnemyHasFlagString;
var(Message) localized string BothFlagsString;
var(Message) color RedColor, YellowColor;

static function color GetColor(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if (Switch == 0)
		return Default.YellowColor;
	else
		return Default.RedColor;
}

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if ( Switch == 0 )
	    return Default.YouHaveFlagString;
    else if ( Switch == 1 )
	    return Default.EnemyHasFlagString;
	else
		return Default.BothFlagsString;
}

static function bool AddAnnouncement(UTAnnouncer Announcer, int MessageIndex, optional PlayerReplicationInfo PRI, optional Object OptionalObject) {}

defaultproperties
{
   YouHaveFlagString="You have the flag, return to base!"
   EnemyHasFlagString="The enemy has your flag, recover it!"
   BothFlagsString="Hold enemy flag until your flag is returned!"
   RedColor=(B=0,G=0,R=255,A=255)
   YellowColor=(B=0,G=255,R=255,A=255)
   bIsUnique=True
   bIsConsoleMessage=False
   Lifetime=1.000000
   DrawColor=(B=255,G=160,R=0,A=255)
   FontSize=1
   Name="Default__UTCTFHUDMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
