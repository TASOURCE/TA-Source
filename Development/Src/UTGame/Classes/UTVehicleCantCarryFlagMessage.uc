/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTVehicleCantCarryFlagMessage extends UTLocalMessage;

var localized string FlagMessage;
var SoundNodeWave FlagAnnouncement;

static simulated function ClientReceive( PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1,
						optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	UTPlayerController(P).PlayAnnouncement(default.class, Switch);
}

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
	return default.FlagAnnouncement;
}

static function byte AnnouncementLevel(byte MessageIndex)
{
	return 2;
}

static function string GetString( optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1,
					optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	return default.FlagMessage;
}

defaultproperties
{
   FlagMessage="You cannot carry the flag in this vehicle"
   MessageArea=2
   DrawColor=(B=255,G=160,R=0,A=255)
   FontSize=1
   Name="Default__UTVehicleCantCarryFlagMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
