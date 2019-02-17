/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTEntryGame extends UTTeamGame
    native; //$$ native.

function bool NeedPlayers()
{
	return false;
}

//$$BE
//exec function AddBots(int num) {}

function StartMatch()
{}

// Parse options for this game...
event InitGame( string Options, out string ErrorMessage )
{
	if ( ParseOption( Options, "PerformUnitTests" ) ~= "1" )
	{
		if ( MyAutoTestManager == None )
		{
			MyAutoTestManager = spawn(AutoTestManagerClass);
		}
		MyAutoTestManager.InitializeOptions(Options);
	}
}

auto State PendingMatch
{
	function RestartPlayer(Controller aPlayer)
	{
	}

	function Timer()
    {
    }

    function BeginState(Name PreviousStateName)
    {
		bWaitingToStartMatch = true;
		UTGameReplicationInfo(GameReplicationInfo).bWarmupRound = false;
		StartupStage = 0;
		bQuickStart = false;
    }

	function EndState(Name NextStateName)
	{
		UTGameReplicationInfo(GameReplicationInfo).bWarmupRound = false;
	}
}

defaultproperties
{
   bExportMenuData=False
   bUseClassicHUD=True
   ConsolePlayerControllerClass=Class'UTGame.UTEntryPlayerController'
   HUDType=Class'UTGame.UTEntryHUD'
   PlayerControllerClass=Class'UTGame.UTEntryPlayerController'
   Name="Default__UTEntryGame"
   ObjectArchetype=UTTeamGame'UTGame.Default__UTTeamGame'
}
