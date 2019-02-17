/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTStartupMessage extends UTLocalMessage;

var localized string Stage[7], NotReady, SinglePlayer;

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local UTPlayerController UTP;
	local UTHUD HUD;
	
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	UTP = UTPlayerController(P);
	if ( UTP == None )
		return;
	HUD = UTHUD(P.myHUD);
	if ( (HUD != None) && HUD.bIsSplitScreen && !HUD.bIsFirstPlayer )
	{
		return;
	}

	// don't play sound if quickstart=true, so no 'play' voiceover at start of tutorials
	if ( Switch == 5 )
	{
		if ( (P.WorldInfo != none) && ((UTGame(P.WorldInfo.Game) == None) || !UTGame(P.WorldInfo.Game).SkipPlaySound()) )
			UTP.PlayAnnouncement(Default.Class, 1);
	}
	else if ( (Switch > 1) && (Switch < 5) )
		UTP.PlayBeepSound();
}

//$$ML: -- removed function for warning spam. Look at P4Diff to see old value.

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local int i, PlayerCount;
	local GameReplicationInfo GRI;

	if ( (RelatedPRI_1 != None) && (RelatedPRI_1.WorldInfo.NetMode == NM_Standalone) )
	{
		  if ( (UTGame(RelatedPRI_1.WorldInfo.Game) != None) && UTGame(RelatedPRI_1.WorldInfo.Game).bQuickstart )
			  return "";
		if ( Switch < 2 )
			return Default.SinglePlayer;
		}
	else if ( Switch == 0 && RelatedPRI_1 != None )
	{
		GRI = RelatedPRI_1.WorldInfo.GRI;
		if (GRI == None)
			return Default.Stage[0];
		for (i = 0; i < GRI.PRIArray.Length; i++)
		{
			if ( GRI.PRIArray[i] != None && !GRI.PRIArray[i].bOnlySpectator
			     && !GRI.PRIArray[i].bBot && (!GRI.PRIArray[i].bIsSpectator || GRI.PRIArray[i].bWaitingPlayer) )
				PlayerCount++;
		}
		if (UTGameReplicationInfo(GRI).MinNetPlayers - PlayerCount > 0)
			return Default.Stage[0]@"("$(UTGameReplicationInfo(GRI).MinNetPlayers - PlayerCount)$")";
	}
	else if ( switch == 1 )
	{
		if ( (RelatedPRI_1 == None) || !RelatedPRI_1.bWaitingPlayer )
			return Default.Stage[0];
		else if ( RelatedPRI_1.bReadyToPlay )
			return Default.Stage[1];
		else
			return Default.NotReady;
	}
	return Default.Stage[Switch];
}

defaultproperties
{
   Stage(0)="Waiting for other players."
   Stage(1)="Waiting for other ready signals."
   Stage(2)="The match is about to begin...3"
   Stage(3)="The match is about to begin...2"
   Stage(4)="The match is about to begin...1"
   Stage(5)="The match has begun!"
   Stage(6)="The match has begun!"
   NotReady="You are NOT READY. Press Fire!"
   SinglePlayer="Press [FIRE] to start!"
   AnnouncementPriority=20
   bIsUnique=True
   bIsConsoleMessage=False
   FontSize=2
   Name="Default__UTStartupMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
