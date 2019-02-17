/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTVehicleKillMessage extends UTLocalMessage;

var localized string KillString[8];
var SoundNodeWave KillSounds[8];

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	return Default.KillString[Min(Switch,7)];
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
	UTPlayerController(P).PlayAnnouncement(default.class, Min(Switch,7));
}

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
	return Default.KillSounds[MessageIndex];
}

defaultproperties
{
   KillString(0)="Road Kill!"
   KillString(1)="Hit and Run!"
   KillString(2)="Road Rage!"
   KillString(3)="Vehicular Manslaughter!"
   KillString(4)="Pancake!"
   KillString(5)="Eagle Eye!"
   KillString(6)="Top Gun!"
   KillString(7)="Road Rampage!"
   MessageArea=3
   AnnouncementPriority=10
   bIsUnique=True
   DrawColor=(B=0,G=0,R=255,A=255)
   FontSize=2
   Name="Default__UTVehicleKillMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
