class TrGame_TrDaD extends TrGame
    config(game);

function ResetScores()
{
}

function SetTeam(Controller Other, UTTeamInfo NewTeam, bool bNewTeam)
{
	super.SetTeam(Other, NewTeam, bNewTeam);
}

//
// Player exits.
//
function Logout( Controller Exiting )
{
	super.Logout(Exiting);
}

function PostBeginPlay()
{
	Super.PostBeginPlay();
}

function ResetLevel()
{
	super.ResetLevel();
}

function RespawnPlayers()
{
	local TrPlayerController TrPC;

	foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
	{
		if( TrPC.GetTeamNum() != 255 || (WorldInfo.NetMode == NM_Standalone) )
		{
			TrPC.ClientPlayerResettingAndRespawning();
			TrPC.DestroyAllOwnedDeployables();
			TrPC.DestroyAllOwnedProjectiles();
		}
	}
}

function ResetRound()
{
	local Actor A;
	local Sequence GameSeq;
	local array<SequenceObject> AllSeqEvents;
	local array<int> ActivateIndices;
	local int i;

	RespawnPlayers();

	ResetScores();

	// Reset all actors (except controllers, the GameInfo, and any other actors specified by ShouldReset())
	foreach AllActors(class'Actor', A)
	{
		if (A != self && !A.IsA('Controller') && ShouldReset(A))
		{
			A.Reset();
		}
	}

	// reset Kismet and activate any Level Reset events
	GameSeq = WorldInfo.GetGameSequence();
	if (GameSeq != None)
	{
		// reset the game sequence
		GameSeq.Reset();

		// find any Level Loaded events that exist
		GameSeq.FindSeqObjectsByClass(class'SeqEvent_LevelLoaded', true, AllSeqEvents);

		// activate them
		ActivateIndices[0] = 2;
		for (i = 0; i < AllSeqEvents.Length; i++)
		{
			SeqEvent_LevelLoaded(AllSeqEvents[i]).CheckActivate(WorldInfo, None, false, ActivateIndices);
		}
	}

	GotoState('MatchInProgress');
	SendMessageToAll(class'TrArenaMessage', 4);

	//reset timelimit
	GameReplicationInfo.RemainingTime = 60 * TimeLimit;
	// if the round lasted less than one minute, we won't be actually changing RemainingMinute
	// which will prevent it from being replicated, so in that case
	// reduce the time limit by one second to ensure that it is unique
	if ( GameReplicationInfo.RemainingTime == GameReplicationInfo.RemainingMinute )
	{
		GameReplicationInfo.RemainingTime--;
	}
	GameReplicationInfo.RemainingMinute = GameReplicationInfo.RemainingTime;
}

function ScoreKill(Controller Killer, Controller Other )
{
    Super.ScoreKill(Killer, Other);
}

function bool CheckScore(PlayerReplicationInfo Scorer)
{
	return false;
}

// Determine winning team for the match.
function int DetermineWinningTeam()
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);
	if( TrGRI.r_DaDCore[0].r_Health == TrGRI.r_DaDCore[1].r_Health )
	{
		// In case of a tie, give win to BE.
		return 0;
	}
	else if( TrGRI.r_DaDCore[0].r_Health > TrGRI.r_DaDCore[1].r_Health )
	{
		// BE wins.
		return 2;
	}
	else
	{
		// DS wins.
		return 1;
	}
}

function GotoPendingRoundStartTimer()
{
	GotoState('PendingRoundStart');
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	if( Reason ~= "TeamScoreLimit" )
	{
		return true;
	}
	return false;
}

function OnCoreBlownUp(byte Team)
{
	local Controller P;

	// Send each controller to the end of the game.
	foreach WorldInfo.AllControllers(class'Controller', P)
	{
		P.GameHasEnded( EndGameFocus, (P.PlayerReplicationInfo != None) && (P.PlayerReplicationInfo.Team != Teams[Team]) );
	}
	EndGame(none, "teamscorelimit");
}

state MatchInProgress
{
}

auto state PendingRoundStart
{
ignores CheckScore, ScoreKill;

	function BeginState(Name PreviousStateName)
	{
		local TrGameReplicationInfo TrGRI;

		TrGRI = TrGameReplicationInfo(GameReplicationInfo);
		if( TrGRI != none )
		{
			TrGRI.SetWarmingUp(true);
		}
		bWarmupRound = true;

		RespawnPlayers();

		if( WorldInfo.NetMode == NM_Standalone )
		{
			SetTeam(GetALocalPlayerController(), Teams[0], true);
			GotoState('MatchInProgress');
			return;
		}

		// Reset countdown timer.
		m_nRoundCountdownRemainingTime = m_nRoundCountdownTime;

		// Stop the main clock.
		GameReplicationInfo.bStopCountDown = true;
	}

	function EndState(Name NextStateName)
	{
		local TrGameReplicationInfo TrGRI;

		TrGRI = TrGameReplicationInfo(GameReplicationInfo);
		if( TrGRI != none )
		{
			// Auto balance teams.
			if( AreTeamsUnbalanced() )
			{
				SendMessageToAll(class'TrAutoBalanceMessage', 2);
				AutoBalanceTeams();
			}

			TrGRI.SetWarmingUp(false);
			bWarmupRound = false;
		}
	}

	function Timer()
	{
		local PlayerController PC;
		local TrGameReplicationInfo TrGRI;

		Global.Timer();

		TrGRI = TrGameReplicationInfo(GameReplicationInfo);
		if( TrGRI != none )
		{
			if( (NumPlayers >= m_nMinNetPlayers && Teams[0].Size > 0 && Teams[1].Size > 0) )
			{
				m_nRoundCountdownRemainingTime -= 1;
				
				if( m_nRoundCountdownRemainingTime <= 0 )
				{
					// Game on!
					ResetRound();
				}
				else
				{
					// Give players the countdown.
					SendMatchCountdown(m_nRoundCountdownRemainingTime);
				}
			}
			else
			{
				foreach WorldInfo.AllControllers(class'PlayerController', PC)
				{
					PC.ReceiveLocalizedMessage(class'TrGameMessage', 5);
				}
			}
		}
	}
}

function SendMatchCountdown(int Seconds)
{
	local TrPlayerController TrPC;
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);
	if( TrGRI != none )
	{
		foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
		{
			TrPC.UpdateGameCountdown(Seconds);
		}
	}
}

function RestartPlayer(Controller NewPlayer)
{
	Super.RestartPlayer(NewPlayer);
}

function int GetGameTypeId()
{
    return 5;
}

function OnGeneratorPowerChange(TrPowerGenerator G)
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);
	if( TrGRI != none )
	{
		if( G.r_bIsPowered )
		{
			TrGRI.r_DaDCore[G.DefenderTeamIndex].m_Shell.StartRotation();
		}
		else
		{
			TrGRI.r_DaDCore[G.DefenderTeamIndex].m_Shell.StopRotation();
		}
	}
}

defaultproperties
{
   bSpawnInTeamArea=True
   Acronym="TrDaD"
   MapPrefixes(0)="TrDaD"
   bTeamGame=True
   HUDType=Class'TribesGame.TrHUDTeam'
   GoalScore=25
   TimeLimit=30
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrDaD'
   Name="Default__TrGame_TrDaD"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
