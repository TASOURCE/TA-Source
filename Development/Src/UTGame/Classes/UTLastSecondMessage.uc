/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTLastSecondMessage extends UTLocalMessage;

var localized string LastSecondRed, LastSecondBlue;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if ( TeamInfo(OptionalObject) == None )
		return "";
	if ( TeamInfo(OptionalObject).TeamIndex == 0 )
		return Default.LastSecondRed;
	else
		return Default.LastSecondBlue;
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	UTPlayerController(P).PlayAnnouncement(default.class,Switch );

	if ( P.PlayerReplicationInfo == RelatedPRI_1 )
		UTPlayerController(P).ClientMusicEvent(2);
	else
		UTPlayerController(P).ClientMusicEvent(10);
}

//$$ML: -- removed function for warning spam. Look at P4Diff to see old value.

defaultproperties
{
   LastSecondRed="Last second save by Red!"
   LastSecondBlue="Last second save by Blue!"
   MessageArea=2
   AnnouncementPriority=12
   bIsUnique=True
   DrawColor=(B=255,G=160,R=0,A=255)
   FontSize=2
   Name="Default__UTLastSecondMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
