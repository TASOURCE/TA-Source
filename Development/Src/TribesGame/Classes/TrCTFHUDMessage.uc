/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class TrCTFHUDMessage extends UTLocalMessage;

// CTF Messages
//
// Switch 0: You have the flag message.
// Switch 1: Enemy has the flag message.
// Switch 2: You and enemy have flag message.
// Switch 3: Reminder that you have the flag.

enum CTF_HUD_MESSAGE
{
	CTF_YouHaveTheFlag,
	CTF_EnemyHasTheFlag,
	CTF_YouAndEnemyHaveTheFlag
};

var(Message) localized string YouHaveFlagString;
var(Message) localized string EnemyHasFlagString;
var(Message) localized string BothFlagsString;
var(Message) localized string YouHaveFlagReminderString;
var(Message) color RedColor, YellowColor;

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
    switch( Switch )
    {
    case 0:
        // This controller has the flag.
		Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        TrPlayerController(P).TrClientMusicEvent(2);
        break;
    case 3:
		Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		break;
    }
}

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
	switch (Switch)
	{
	case 0: return default.YouHaveFlagString;
	case 1: return default.EnemyHasFlagString;
	case 2: return default.BothFlagsString;
	case 3: return default.YouHaveFlagReminderString;
	}

	return "";
}

static function bool AddAnnouncement(UTAnnouncer Announcer, int MessageIndex, optional PlayerReplicationInfo PRI, optional Object OptionalObject) {}

defaultproperties
{
   YouHaveFlagString="You have the enemy flag"
   EnemyHasFlagString="has our flag"
   BothFlagsString="All Flags taken"
   YouHaveFlagReminderString="Take the flag to your flag stand"
   RedColor=(B=0,G=0,R=255,A=255)
   YellowColor=(B=0,G=255,R=255,A=255)
   MessageArea=4
   bIsUnique=True
   bIsConsoleMessage=False
   Lifetime=4.000000
   DrawColor=(B=255,G=160,R=0,A=255)
   FontSize=1
   Name="Default__TrCTFHUDMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
