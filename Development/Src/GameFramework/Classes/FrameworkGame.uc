/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class FrameworkGame extends GameInfo
	config(game)
	native;

struct native RequiredMobileInputConfig
{
	var config string GroupName;
	var config init array<string> RequireZoneNames;
	var config bool bIsAttractModeGroup;
};

/** Holds a list of MobileInputZones to load */
var config array<RequiredMobileInputConfig> RequiredMobileInputConfigs;

//$$ PLATCOMM
event TgStartGame(out string Reason);
event TgEndGame(out string Reason);
event TgTimer(out string sTimerCommand);
event TgChangeScore(int nTeam, optional int nCount = 1);
event TgChangeTime(int nSeconds);
event TgGetSpectators(out array<string> List);

defaultproperties
{
   Name="Default__FrameworkGame"
   ObjectArchetype=GameInfo'Engine.Default__GameInfo'
}
