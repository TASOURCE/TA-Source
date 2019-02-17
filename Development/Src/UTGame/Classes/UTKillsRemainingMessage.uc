/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTKillsRemainingMessage extends UTLocalMessage;

var SoundNodeWave KillsRemainSounds[3];
var localized string KillsRemainStrings[3];

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	return Default.KillsRemainStrings[Switch];
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local UTHUD HUD;
	
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	HUD = UTHUD(P.myHUD);
	if ( (HUD != None) && HUD.bIsSplitScreen && !HUD.bIsFirstPlayer )
	{
		return;
	}
	UTPlayerController(P).PlayAnnouncement(default.class, Switch);
}
static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
	return Default.KillsRemainSounds[MessageIndex];
}

defaultproperties
{
   MessageArea=2
   AnnouncementPriority=8
   bIsUnique=True
   DrawColor=(B=0,G=0,R=255,A=255)
   FontSize=3
   Name="Default__UTKillsRemainingMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
