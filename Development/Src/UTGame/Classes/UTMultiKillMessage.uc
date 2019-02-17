/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTMultiKillMessage extends UTLocalMessage;

var	localized string 	KillString[5];
var SoundNodeWave KillSound[5];

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	return Default.KillString[Min(Switch-1, 4)];
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if (P.GamePlayEndedState())
	{
		;
		// ScriptTrace();
	}

	if ( Switch < 2 )
		UTPlayerController(P).ClientMusicEvent(9);
	else if ( Switch < 4 )
		UTPlayerController(P).ClientMusicEvent(11);
	else
		UTPlayerController(P).ClientMusicEvent(12);

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	UTPlayerController(P).PlayAnnouncement(default.class, Min(Switch-1,4));
}

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
	return Default.KillSound[MessageIndex];
}

static function int GetFontSize( int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer )
{
	return Clamp(Switch, 2, 4);
}

/**
 * Don't let multiple multikill messages stack up
 */
static function bool ShouldBeRemoved(UTQueuedAnnouncement MyAnnouncement, class<UTLocalMessage> NewAnnouncementClass, int NewMessageIndex)
{
	return (default.Class == NewAnnouncementClass);
}

/**
  * move ahead of all queued messages (except for UTVehicleKillMessage or UTWeaponKillRewardMessage)
  * play immediately if already playing multikill message
  * returns true if announcement at head of queue should be played immediately
  */
static function bool AddAnnouncement(UTAnnouncer Announcer, int MessageIndex, optional PlayerReplicationInfo PRI, optional Object OptionalObject)
{
	super.AddAnnouncement(Announcer, MessageIndex, PRI, OptionalObject);

	return (Announcer.PlayingAnnouncementClass == default.Class);
}

defaultproperties
{
   KillString(0)="Double Kill!"
   KillString(1)="Multi Kill!"
   KillString(2)="Mega Kill!!"
   KillString(3)="ULTRA KILL!!"
   KillString(4)="MONSTER KILL!!!"
   MessageArea=2
   AnnouncementPriority=8
   bIsUnique=True
   DrawColor=(B=0,G=0,R=255,A=255)
   FontSize=3
   Name="Default__UTMultiKillMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
