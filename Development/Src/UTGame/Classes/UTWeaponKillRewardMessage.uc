/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTWeaponKillRewardMessage extends UTLocalMessage;

var	localized string 	RewardString[2];
var SoundNodeWave RewardSounds[2];

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	return Default.RewardString[Switch];
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
	UTPlayerController(P).PlayAnnouncement(default.class, Switch);
	UTPlayerController(P).ClientMusicEvent(6);
}

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
	return Default.RewardSounds[MessageIndex];
}

defaultproperties
{
   RewardString(0)="Head Shot!"
   RewardString(1)="Bullseye!"
   MessageArea=3
   AnnouncementPriority=10
   bIsUnique=True
   DrawColor=(B=128,G=255,R=255,A=255)
   FontSize=2
   Name="Default__UTWeaponKillRewardMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
