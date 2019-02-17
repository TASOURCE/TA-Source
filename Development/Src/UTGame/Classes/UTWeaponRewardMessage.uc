/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTWeaponRewardMessage extends UTLocalMessage;

var	localized string 	RewardString[11];
var SoundNodeWave RewardSounds[11];

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
   RewardString(1)="Flak Master!"
   RewardString(2)="Head Hunter!"
   RewardString(3)="Combo King!"
   RewardString(4)="Bio Hazard!"
   RewardString(5)="JackHammer!"
   RewardString(6)="Shaft Master!"
   RewardString(7)="Gun Slinger!"
   RewardString(8)="Big Game Hunter!"
   RewardString(9)="Blue Streak!"
   RewardString(10)="Rocket Scientist!"
   MessageArea=3
   AnnouncementPriority=6
   bIsUnique=True
   DrawColor=(B=128,G=255,R=255,A=255)
   FontSize=2
   Name="Default__UTWeaponRewardMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
