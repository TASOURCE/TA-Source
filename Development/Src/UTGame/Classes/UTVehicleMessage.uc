/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTVehicleMessage extends UTLocalMessage;

var localized array<string> MessageText;

var array<Color> DrawColors;

var array<SoundNodeWave> MessageAnnouncements;

var array<int> CustomMessageArea;



static simulated function ClientReceive(
										PlayerController P,
										optional int Switch,
										optional PlayerReplicationInfo RelatedPRI_1,
										optional PlayerReplicationInfo RelatedPRI_2,
										optional Object OptionalObject
										)
{
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	if (default.MessageAnnouncements[Switch] != None)
	{
		UTPlayerController(P).PlayAnnouncement(default.class, Switch);
	}
}


static function byte AnnouncementLevel(byte MessageIndex)
{
	return 2;
}

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


static function color GetColor(
							   optional int Switch,
							   optional PlayerReplicationInfo RelatedPRI_1,
							   optional PlayerReplicationInfo RelatedPRI_2,
								optional Object OptionalObject
							   )
{
	return Default.DrawColors[Switch];
}

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
	return default.MessageAnnouncements[MessageIndex];
}

defaultproperties
{
   MessageText(0)="Viper self destruct system not yet engaged."
   MessageText(1)="Vehicle is Locked."
   MessageText(2)="You are in the way of a vehicle spawning."
   MessageText(3)="Leviathan is online."
   MessageText(4)="Hijacked!"
   MessageText(5)="Carjacked!"
   DrawColors(0)=(B=128,G=255,R=255,A=255)
   DrawColors(1)=(B=255,G=160,R=0,A=255)
   DrawColors(2)=(B=0,G=0,R=255,A=255)
   DrawColors(3)=(B=0,G=0,R=255,A=255)
   DrawColors(4)=(B=255,G=255,R=255,A=255)
   DrawColors(5)=(B=255,G=255,R=255,A=255)
   MessageArea=2
   AnnouncementPriority=5
   bIsPartiallyUnique=True
   bIsConsoleMessage=False
   FontSize=2
   Name="Default__UTVehicleMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
