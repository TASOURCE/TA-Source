/**
 * Training
 */
class TrGame_TrTraining extends TrGame
	config(Game);

//function ScoreKill(Controller Killer, Controller Other );
function bool CheckScore(PlayerReplicationInfo Scorer);

function byte PickTeam(byte num, Controller C)
{
    return 0;
}

/** 
 *  Called from HandleSeamlessTravelPlayer -- this is called to select the new team for the
 *  controller.
 */
function byte PickTeamForMigration(Controller C)
{
	return 0;
}

function EndGame(PlayerReplicationInfo Winner, string Reason )
{
	local TrPlayerController TrPC;

	if( Reason ~= "kismet" )
	{
		GotoState('MatchOver');
	
		// Allow replication to happen before reporting scores, stats, etc.
		SetTimer( 1.5,false,nameof(PerformEndGameHandling) );

		// Automatically take the user back to the home screen
		SetTimer( 6.0,false,nameof(AutoEndGame) );

		foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
		{
			TrPC.GotoState('RoundEnded');
		}

		bGameEnded = true;
		EndLogging(Reason);
	}
}

state MatchOver
{
	function BeginState(Name PreviousStateName)
	{
        PlayEndOfMatchMessage();

        // Don't do normal end of match treatment
	}
    
	function Timer()
	{
        // Don't do normal end of match treatment
	}
}

function AutoEndGame()
{
    LocalLeaveGame();
}

function PlayEndOfMatchMessage()
{
	BroadcastLocalizedMessage(class'TrVictoryMessage', 8);
}

defaultproperties
{
   Acronym="TrTraining"
   MapPrefixes(0)="TrTraining"
   bTeamGame=True
   GoalScore=0
   TimeLimit=0
   PlayerControllerClass=Class'TribesGame.TrPlayerController_Training'
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrSiege'
   Name="Default__TrGame_TrTraining"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
