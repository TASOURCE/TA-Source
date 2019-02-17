/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTIdleKickWarningMessage extends UTLocalMessage;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	UTPlayerController(OptionalObject).LastKickWarningTime = UTPlayerController(OptionalObject).WorldInfo.TimeSeconds;
    return class'GameMessage'.Default.KickWarning;
}

defaultproperties
{
   MessageArea=2
   bIsUnique=True
   bIsConsoleMessage=False
   Lifetime=1.000000
   DrawColor=(B=64,G=255,R=255,A=255)
   FontSize=2
   Name="Default__UTIdleKickWarningMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
