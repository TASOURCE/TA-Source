/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** this plays the "X minutes/seconds remaining" announcements */
class UTTimerMessage extends UTLocalMessage
	abstract;

var array<ObjectiveAnnouncementInfo> Announcements;

static simulated function ClientReceive( PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1,
					optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	local AudioComponent CurrentAnnouncementComponent;
	local UTHUD HUD;
	
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	if ( default.Announcements[Switch].AnnouncementSound != None )
	{
		HUD = UTHUD(P.myHUD);
		if ( (HUD != None) && HUD.bIsSplitScreen && !HUD.bIsFirstPlayer )
		{
			return;
		}
		
		if ( Switch < 11 )
		{
			// don't prioritize final countdown with other announcements
            //$$ML:
			//CurrentAnnouncementComponent = P.CreateAudioComponent(SoundCue'A_Announcer_Reward_Cue.SoundCues.AnnouncerCue', false, false);
            CurrentAnnouncementComponent = None;

			// CurrentAnnouncementComponent will be none if -nosound option used
			if ( CurrentAnnouncementComponent != None )
			{
				CurrentAnnouncementComponent.SetWaveParameter('Announcement', default.Announcements[Switch].AnnouncementSound);
				//AnnouncerSoundCue.Duration = default.Announcements[Switch].AnnouncementSound.Duration;
				CurrentAnnouncementComponent.bAutoDestroy = true;
				CurrentAnnouncementComponent.bShouldRemainActiveIfDropped = true;
				CurrentAnnouncementComponent.bAllowSpatialization = false;
				CurrentAnnouncementComponent.bAlwaysPlay = TRUE;
				CurrentAnnouncementComponent.Play();
			}
		}
		else
		{
			UTPlayerController(P).PlayAnnouncement(default.class, Switch);
		}
	}
}

static function string GetString( optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1,
					optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	return default.Announcements[Switch].AnnouncementText;
}

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
	return default.Announcements[MessageIndex].AnnouncementSound;
}

static function int GetFontSize( int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer )
{
	if ( Switch == 17 )
	{
		return 4;
	}
	if ( Switch > 10 )
	{
		return default.FontSize;
	}
	return 2;
}

defaultproperties
{
   bIsUnique=True
   bIsConsoleMessage=False
   FontSize=1
   Name="Default__UTTimerMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
