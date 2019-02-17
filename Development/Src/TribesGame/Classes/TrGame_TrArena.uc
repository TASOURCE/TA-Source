class TrGame_TrArena extends TrGame
    config(game);

const MAX_NUM_ARENA_PLAYERS_PER_TEAM = 8;

/** How many enemies were alive when last man standing occurs */
var int m_nNumEnemiesAliveAtLastManStanding[2];

/** Has the team entered last man standing mode. */
var byte m_bHasTeamBenchedAPlayer[2];

/** How many rounds are needed to win? */
var int m_nGoalWonRounds;


simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    super.ApplyServerSettings();

	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
        m_nGoalWonRounds = TrGRI.r_ServerConfig.ArenaRounds;

        if (TrGRI.r_ServerConfig.GameScores[TGT_ARN] > 0)
        {
            GoalScore = TrGRI.r_ServerConfig.GameScores[TGT_ARN];
        }
    }
}

function ResetScores()
{
	local TrGameReplicationInfo TrGRI;
	local int PlayerIdx;
	local TrPlayerController TrPC;
	local TrPlayerReplicationInfo TrPRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

    bFirstBloodAchieved = false;
	Teams[0].Score = GoalScore;
	Teams[1].Score = GoalScore;
	Teams[0].bForceNetUpdate = TRUE;
	Teams[1].bForceNetUpdate = TRUE;
	m_bHasTeamBenchedAPlayer[0]=0;
	m_bHasTeamBenchedAPlayer[1]=0;
    m_nNumEnemiesAliveAtLastManStanding[0]=0;
    m_nNumEnemiesAliveAtLastManStanding[1]=0;
	RepopulatePlayerLists();

	foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
	{
		// Reset everyone's credits.
		TrPC.r_nCurrentCredits = 0;

		// Reset last man standing flag.
		TrPRI = TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			TrPRI.r_bIsLastManStanding = false;
		}
	}

	// Reset everyone's number of spawns left.
	for( PlayerIdx = 0; PlayerIdx < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIdx ++ )
	{
		if( TrGRI.r_BEPlayerList[PlayerIdx] != none )
		{
			TrGRI.r_BEPlayerList[PlayerIdx].r_nArenaSpawnsLeft = 1;
			TrGRI.r_BEPlayerList[PlayerIdx].r_bIsCrossedOffArenaList = false;
		}

		if( TrGRI.r_DSPlayerList[PlayerIdx] != none )
		{
			TrGRI.r_DSPlayerList[PlayerIdx].r_nArenaSpawnsLeft = 1;
			TrGRI.r_DSPlayerList[PlayerIdx].r_bIsCrossedOffArenaList = false;
		}
	}
}

function RepopulatePlayerLists()
{
	local TrPlayerController TrPC;
	local int TeamNum, i, BECount, DSCount;
	local TrGameReplicationInfo TrGRI;
	local TrPlayerReplicationInfo TrPRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

	for( i = 0; i < MAX_NUM_ARENA_PLAYERS_PER_TEAM; i++ )
	{
		// Clear out our lists.
		TrGRI.r_BEPlayerList[i] = none;
		TrGRI.r_DSPlayerList[i] = none;
	}

	foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
	{
		TeamNum = TrPC.GetTeamNum();
		if( TeamNum == 0 )
		{
			TrPRI = TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo);
			if( TrPRI != none )
			{
				TrGRI.r_BEPlayerList[BECount] = TrPRI;
				BECount ++;
			}
		}
		else if( TeamNum == 1 )
		{
			TrPRI = TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo);
			if( TrPRI != none )
			{
				TrGRI.r_DSPlayerList[DSCount] = TrPRI;
				DSCount ++;
			}
		}

		// Play appropdiate music.
		TrPC.TrClientMusicEvent(1);
	}
}

function SetTeam(Controller Other, UTTeamInfo NewTeam, bool bNewTeam)
{
	local TrPlayerReplicationInfo TrPRI;
	local TrPlayerController TrPC;

	super.SetTeam(Other, NewTeam, bNewTeam);

	RepopulatePlayerLists();

	TrPC = TrPlayerController(Other);
	TrPRI = TrPlayerReplicationInfo(Other.PlayerReplicationInfo);
	if( TrPRI != none )
	{
		if( Teams[Other.GetTeamNum()].Score > 0 )
		{
			TrPRI.r_nArenaSpawnsLeft = 1;
			TrPRI.r_bIsCrossedOffArenaList = false;
			if( !TrPC.r_bNeedLoadout )
			{
				TrPlayerController(Other).ClientPlayerResettingAndRespawning();
			}
		}
		else
		{
			TrPRI.r_nArenaSpawnsLeft = 0;
			TrPRI.r_bIsCrossedOffArenaList = true;
		}
	}
}

//
// Player exits.
//
function Logout( Controller Exiting )
{
	local TrGameReplicationInfo TrGRI;
	local int PlayerIdx;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

	// Remove the exiting player from the PRI lists.
	for( PlayerIdx = 0; PlayerIdx < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIdx ++ )
	{
		if( TrGRI.r_BEPlayerList[PlayerIdx] == Exiting.PlayerReplicationInfo )
		{
			TrGRI.r_BEPlayerList[PlayerIdx] = none;
			break;
		}
		else if( TrGRI.r_DSPlayerList[PlayerIdx] == Exiting.PlayerReplicationInfo )
		{
			TrGRI.r_DSPlayerList[PlayerIdx] = none;
			break;
		}
	}
	CheckScore(none);

	super.Logout(Exiting);
}

function PostBeginPlay()
{
	Super.PostBeginPlay();

	ResetScores();
}

function ResetLevel()
{
	super.ResetLevel();
	ResetScores();
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
	local TrPlayerController TrPC, TrKiller, TrVictim, ControllerIterator;
	local int TeamToDeductPointsFrom, ScoringTeam, PlayerIdx, RemainingScoringTeamPlayers, RemainingVictimTeamPlayers;
	local TrGameReplicationInfo TrGRI;
	local bool bStruckPlayerOffList;
	local TrPlayerReplicationInfo TrPRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

    Super.ScoreKill(Killer, Other);

	TeamToDeductPointsFrom = Other.GetTeamNum();
    ScoringTeam = TeamToDeductPointsFrom > 0 ? 0 : 1;
    
    TrKiller = TrPlayerController(Killer);
    TrVictim = TrPlayerController(Other);

	// Destroy all deployables and mines from victim.
	if( TrVictim != none )
	{
		TrVictim.DestroyAllOwnedDeployables();
		TrVictim.DestroyAllOwnedMines();
	}

	if( Teams[TeamToDeductPointsFrom].Score > 0 )
	{
		if( Teams[TeamToDeductPointsFrom].Score == 11 )
		{
			// We are going to cross over to 10 respawns left.
			foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
			{
				if( TrPC.GetTeamNum() == TeamToDeductPointsFrom )
				{
					TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 0);
				}
			}
		}
		else if( Teams[TeamToDeductPointsFrom].Score == 6 )
		{
			// We are going to cross over to 5 respawns left.
			foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
			{
				if( TrPC.GetTeamNum() == TeamToDeductPointsFrom )
				{
					TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 1);
				}
			}
		}

		Teams[TeamToDeductPointsFrom].Score = Max(Teams[TeamToDeductPointsFrom].Score - 1, 0);

		if( Teams[TeamToDeductPointsFrom].Score == 0 )
		{
			foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
			{
				if( TrPC.GetTeamNum() == TeamToDeductPointsFrom )
				{
				    TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 2);
				}
				else
				{
					TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 8);
				}
			}
		}
	}

	if( Teams[TeamToDeductPointsFrom].Score <= 0 )
	{
		// Consider striking the victim off the list.
		for( PlayerIdx = 0; PlayerIdx < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIdx++ )
		{
			if( TeamToDeductPointsFrom == 0 && TrGRI.r_BEPlayerList[PlayerIdx] != none && TrGRI.r_BEPlayerList[PlayerIdx] == Other.PlayerReplicationInfo )
			{
				// If we have no more spawns left for this player, strike them from the list.
				if( TrGRI.r_BEPlayerList[PlayerIdx].r_nArenaSpawnsLeft <= 0 )
				{
					TrGRI.r_BEPlayerList[PlayerIdx].r_bIsCrossedOffArenaList = true;
					m_bHasTeamBenchedAPlayer[0] = 1;
					bStruckPlayerOffList = true;

					// Give the Bench Em accolade to the killer.
					if (TrKiller != none && TrKiller != TrVictim)
					{
						TrKiller.m_AccoladeManager.QueueAccolade(class'TrAccolade_BenchEm');
					}
				}
			}
			else if( TeamToDeductPointsFrom == 1 && TrGRI.r_DSPlayerList[PlayerIdx] != none && TrGRI.r_DSPlayerList[PlayerIdx] == Other.PlayerReplicationInfo )
			{
				// If we have no more spawns left for this player, strike them from the list.
				if( TrGRI.r_DSPlayerList[PlayerIdx].r_nArenaSpawnsLeft <= 0 )
				{
					TrGRI.r_DSPlayerList[PlayerIdx].r_bIsCrossedOffArenaList = true;
					m_bHasTeamBenchedAPlayer[1] = 1;
					bStruckPlayerOffList = true;
				}
			}
		}
	}

	foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
	{
		// Play appropdiate music.
		TrPC.TrClientMusicEvent(1);
	}

	RemainingScoringTeamPlayers = GetNumRemainingAlivePlayers(ScoringTeam);
	RemainingVictimTeamPlayers = GetNumRemainingAlivePlayers(TeamToDeductPointsFrom);

	if( bStruckPlayerOffList && Teams[TeamToDeductPointsFrom].Score <= 0 && RemainingVictimTeamPlayers == 1 )
	{
		TrPC = none;

		// We only have one peson left on this team, so he is the last man standing.
		for( PlayerIdx = 0; PlayerIdx < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIdx++ )
		{
			// Find the remaining player.
			if( TeamToDeductPointsFrom == 0 && TrGRI.r_BEPlayerList[PlayerIdx] != none && !TrGRI.r_BEPlayerList[PlayerIdx].r_bIsCrossedOffArenaList )
			{
				TrPC = TrPlayerController(TrGRI.r_BEPlayerList[PlayerIdx].Owner);
				break;
			}
			else if( TeamToDeductPointsFrom == 1 && TrGRI.r_DSPlayerList[PlayerIdx] != none && !TrGRI.r_DSPlayerList[PlayerIdx].r_bIsCrossedOffArenaList )
			{
				TrPC = TrPlayerController(TrGRI.r_DSPlayerList[PlayerIdx].Owner);
				break;
			}
		}

		if( TrPC != none )
		{
			TrPRI = TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo);
			if( TrPRI != none )
			{ 
				TrPRI.r_bIsLastManStanding = true;
			}

			// Tell our last man standing that he's the last hope.
			TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 3);

			foreach WorldInfo.AllControllers(class'TrPlayerController', ControllerIterator)
			{
				// Tell the other team members there is only one left.
				if( ControllerIterator.GetTeamNum() != TrPC.GetTeamNum() )
				{
					ControllerIterator.ReceiveLocalizedMessage(class'TrArenaMessage', 7);
				}
			}

			// Last man standing accolade.
			TrPC.m_AccoladeManager.QueueAccolade(class'TrAccolade_LastManStanding');
		}

		// Cache the number of enemies alive (useful for calculating accolades).
		m_nNumEnemiesAliveAtLastManStanding[TeamToDeductPointsFrom] = RemainingScoringTeamPlayers;
	}

	if( Teams[TeamToDeductPointsFrom].Score <= 0 )
	{
		if( RemainingVictimTeamPlayers == 0 )
		{
			// Victim's team is out of lives (everyone has been struck off the list)..
			if (TrKiller != none && TrKiller != TrVictim )
			{
				// Give the killer the Final Blow accolade.
				TrKiller.m_AccoladeManager.QueueAccolade(class'TrAccolade_FinalBlow');
			}

			if (TrVictim != none && TrVictim != TrKiller && (RemainingScoringTeamPlayers > 3 || Teams[ScoringTeam].Score > 0) )
			{
				// Scorer's team has more than 3 remaining players, so award the victim a Tribal Honor accolade.
				TrVictim.m_AccoladeManager.QueueAccolade(class'TrAccolade_TribalHonor');
			}

			if( RemainingScoringTeamPlayers == 1 )
			{
				// Scorer is the only one on the scorer's team.
				TrPC = none;
				for( PlayerIdx = 0; PlayerIdx < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIdx++ )
				{
					// Find the remaining player.
					if( ScoringTeam == 0 && TrGRI.r_BEPlayerList[PlayerIdx] != none && !TrGRI.r_BEPlayerList[PlayerIdx].r_bIsCrossedOffArenaList )
					{
						TrPC = TrPlayerController(TrGRI.r_BEPlayerList[PlayerIdx].Owner);
						break;
					}
					else if( ScoringTeam == 1 && TrGRI.r_DSPlayerList[PlayerIdx] != none && !TrGRI.r_DSPlayerList[PlayerIdx].r_bIsCrossedOffArenaList )
					{
						TrPC = TrPlayerController(TrGRI.r_DSPlayerList[PlayerIdx].Owner);
						break;
					}
				}

				if( TrPC != none )
				{
					switch( m_nNumEnemiesAliveAtLastManStanding[ScoringTeam] )
					{
						case 0:  // Pass Through.
						case 1:  break;
						case 2:  TrPC.m_AccoladeManager.QueueAccolade(class'TrAccolade_DoubleDown');     break;
						case 3:  TrPC.m_AccoladeManager.QueueAccolade(class'TrAccolade_NotAmongEquals'); break;
						case 4:  TrPC.m_AccoladeManager.QueueAccolade(class'TrAccolade_OneManArmy');     break;
						default: TrPC.m_AccoladeManager.QueueAccolade(class'TrAccolade_Miracle');        break;
					}
				}
			}
			else if( Teams[ScoringTeam].Score > 0 || m_bHasTeamBenchedAPlayer[ScoringTeam] == 0 )
            {
				// We have multiple friendlies on the scoring team alive, so award each with United We Stand.
                foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
		        {
			        if( TrPC.GetTeamNum() == ScoringTeam )
			        {
                        TrPC.m_AccoladeManager.QueueAccolade(class'TrAccolade_UnitedWeStand');
			        }
		        }
            }
		}
	}
	CheckScore(Killer.PlayerReplicationInfo);
}

function bool CheckScore(PlayerReplicationInfo Scorer)
{
	// A team loses if their score is zero and if they have no more alive players.
	if( IsBloodEagleOutOfLives() || IsDiamondSwordOutOfLives() )
	{
		EndTheRound(Scorer);
		return true;
	}

	return false;
}

// Determine winning team for the match.
function int DetermineWinningTeam()
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);
	if( TrGRI.r_nRoundScore[0] == TrGRI.r_nRoundScore[1] )
	{
		// In case of a tie, give win to BE.
		return 0;
	}
	else if( TrGRI.r_nRoundScore[0] > TrGRI.r_nRoundScore[1] )
	{
		// BE wins.
		return 0;
	}
	else
	{
		// DS wins.
		return 1;
	}
}

// Determine winning team for the round.
function int GetRoundWinningTeam()
{
	local int RemainingBEPlayers, RemainingDSPlayers;
	if( IsDiamondSwordOutOfLives() )
	{
		return 0;
	}
	else if( IsBloodEagleOutOfLives() )
	{
		return 1;
	}
	else
	{
		// Each team still has players left.
		if( Teams[0].Score > Teams[1].Score )
		{
			return 0;
		}
		else if( Teams[1].Score > Teams[0].Score )
		{
			return 1;
		}
		else
		{
			// Each team is in last man standing mode.
			RemainingBEPlayers = GetNumRemainingAlivePlayers(0);
			RemainingDSPlayers = GetNumRemainingAlivePlayers(1);
			if( RemainingBEPlayers > RemainingDSPlayers )
			{
				return 0;
			}
			else if( RemainingDSPlayers > RemainingBEPlayers )
			{
				return 1;
			}
			else
			{
				// Draw game.
				return 255;
			}
		}
	}
}

function EndTheRound(PlayerReplicationInfo RoundWinner)
{
	local TrPlayerController TrPC;
	local int WinningTeam;
	local TrGameReplicationInfo TrGRI;

	if( IsTimerActive('GotoPendingRoundStartTimer') )
	{
		return;
	}

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);
	if( TrGRI != none )
	{
		WinningTeam = GetRoundWinningTeam();

		if( WinningTeam > 1 )
		{
			// Round was a stalemate. Award each team a win.
			TrGRI.r_nRoundScore[0]++;
			TrGRI.r_nRoundScore[1]++;

			if( TrGRI.r_nRoundScore[0] >= m_nGoalWonRounds || TrGRI.r_nRoundScore[1] >= m_nGoalWonRounds )
			{
				EndGame(RoundWinner, "teamscorelimit");
			}
			else
			{
				foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
				{
					if (TrPC.PlayerReplicationInfo != None && !TrPC.PlayerReplicationInfo.bOnlySpectator)
					{
						TrPC.ClientArenaRoundEnded(0);
					}
				}

				// Show the winning team graphic and then go to the pending round state.
				SetTimer(5.0, false, 'GotoPendingRoundStartTimer');
			}
		}
		else
		{
			if( WinningTeam <= 1 )
			{
				TrGRI.r_nRoundScore[WinningTeam]++;

				if( TrGRI.r_nRoundScore[WinningTeam] >= m_nGoalWonRounds )
				{
					EndGame(RoundWinner, "teamscorelimit");
				}
				else
				{	
					foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
					{
						if (TrPC.PlayerReplicationInfo != None && !TrPC.PlayerReplicationInfo.bOnlySpectator)
						{
							TrPC.ClientArenaRoundEnded(WinningTeam == 0 ? 2 : 1);
						}
					}

					// Show the winning team graphic and then go to the pending round state.
					SetTimer(5.0, false, 'GotoPendingRoundStartTimer');
				}
			}
		}
	}
}

function GotoPendingRoundStartTimer()
{
	GotoState('PendingRoundStart');
}

function int GetNumRemainingAlivePlayers(int TeamIndex)
{
	local int Count, PlayerIndex;
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

	for( PlayerIndex = 0; PlayerIndex < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIndex++ )
	{
		if( TeamIndex == 0 && TrGRI.r_BEPlayerList[PlayerIndex] != none && !TrGRI.r_BEPlayerList[PlayerIndex].r_bIsCrossedOffArenaList )
		{
			Count++;
		}

		if( TeamIndex == 1 && TrGRI.r_DSPlayerList[PlayerIndex] != none && !TrGRI.r_DSPlayerList[PlayerIndex].r_bIsCrossedOffArenaList )
		{
			Count++;
		}
	}
	return Count;
}

function bool IsBloodEagleOutOfLives()
{
	local int PlayerIndex;
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

	if( Teams[0].Score <= 0 )
	{
		for( PlayerIndex = 0; PlayerIndex < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIndex++ )
		{
			if( TrGRI.r_BEPlayerList[PlayerIndex] != none )
			{
				if( TrGRI.r_BEPlayerList[PlayerIndex].r_nArenaSpawnsLeft > 0 )
				{
					// We have a respawn left.
					return false;
				}
				if( !TrGRI.r_BEPlayerList[PlayerIndex].r_bIsCrossedOffArenaList )
				{
					// We aren't crossed off the list yet.
					return false;
				}
			}
		}
		
		// Our score is 0 and no one has respawns left and everyone on the team is dead.
		return true;
	}
	return false;
}

function bool IsDiamondSwordOutOfLives()
{
	local int PlayerIndex;
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

	if( Teams[1].Score <= 0 )
	{
		for( PlayerIndex = 0; PlayerIndex < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIndex++ )
		{
			if( TrGRI.r_DSPlayerList[PlayerIndex] != none )
			{
				if( TrGRI.r_DSPlayerList[PlayerIndex].r_nArenaSpawnsLeft > 0 )
				{
					// We have a respawn left.
					return false;
				}
				if( !TrGRI.r_DSPlayerList[PlayerIndex].r_bIsCrossedOffArenaList )
				{
					// We aren't crossed off the list yet.
					return false;
				}
			}
		}
		
		// Our score is 0 and no one has respawns left and everyone on the team is dead.
		return true;
	}
	return false;
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local bool bGameIsOver;
	local Controller P;
	local TeamInfo WinningTeam;
	local int WinningTeamIndex;

	//`log("REASON:"@Reason);

	WinningTeamIndex = DetermineWinningTeam();
	if( WinningTeamIndex == 1 )
	{
		// Diamond Sword wins because Blood Eagles have no one left and are out of respawns.
		WinningTeam = Teams[1];
		bGameIsOver = true;
	}
	else if( WinningTeamIndex == 0)
	{
		// Diamond Sword wins because Blood Eagles have no one left and are out of respawns.
		WinningTeam = Teams[0];
		bGameIsOver = true;
	}

	if( bGameIsOver )
	{
		// Send each controller to the end of the game.
		foreach WorldInfo.AllControllers(class'Controller', P)
		{
			P.GameHasEnded( EndGameFocus, (P.PlayerReplicationInfo != None) && (P.PlayerReplicationInfo.Team == WinningTeam) );
		}
	}

	return bGameIsOver;
}

// No autobalancing mid-match.
function CheckForAutoBalance();

state MatchInProgress
{
	function bool CanEnterSpectate(TrPlayerController TrPC, bool bNeutral)
	{
		if( bNeutral && (TrPC.GetTeamNum() == 1 || TrPC.GetTeamNum() == 0) )
		{
			// Only allow players to go to neutral spectating when the match is not in progress.
			TrPC.ClientEndTeamSelect(TrPC.GetTeamNum());
			TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 6);
			return false;
		}
		return true;
	}

	function bool RequestTeam(byte RequestedTeamNum, Controller C)
	{
		local int i;
		local TrGameReplicationInfo TrGRI;
		local TrPlayerController TrPC;

		if( C.GetTeamNum() == 255 || RequestedTeamNum == 255 )
		{
			return super.RequestTeam(RequestedTeamNum, C);
		}

		TrGRI = TrGameReplicationInfo(GameReplicationInfo);
		TrPC = TrPlayerController(C);

		if( TrPC != none && TrGRI != none )
		{
			for( i = 0; i < MAX_NUM_ARENA_PLAYERS_PER_TEAM; i++ )
			{
				if( TrPC.PlayerReplicationInfo == TrGRI.r_BEPlayerList[i] || TrPC.PlayerReplicationInfo == TrGRI.r_DSPlayerList[i] )
				{
					// Don't allow switching teams while a round is in progress.
					TrPC.ClientEndTeamSelect(TrPC.GetTeamNum());
					TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 6);
					return false;
				}
			}
		}
		return super.RequestTeam(RequestedTeamNum, C);
	}

	function Timer()
	{
		local PlayerController P;

		if( m_bRoamingMap )
		{
			if ( ForceRespawn() )
			{
				foreach WorldInfo.AllControllers(class'PlayerController', P)
				{
					if (P.Pawn == None && !P.PlayerReplicationInfo.bOnlySpectator && !P.IsTimerActive('DoForcedRespawn'))
					{
						P.ServerReStartPlayer();
					}
				}
			}
		}
		else
		{
			if ( TimeLimit > 0 )
			{
				GameReplicationInfo.bStopCountDown = false;
				if ( GameReplicationInfo.RemainingTime <= 0 )
				{
					EndTheRound(none);
				}
			}
		}
	}
}

auto state PendingRoundStart
{
ignores CheckScore, ScoreKill, EndTheRound;

	function BeginState(Name PreviousStateName)
	{
		local TrGameReplicationInfo TrGRI;
		local TrPlayerController TrPC;

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
		bSpawnInTeamArea = true;

		// Stop the main clock.
		GameReplicationInfo.bStopCountDown = true;

        foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
        {
	        TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 9);
        }
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

			TrGRI.r_nCurrentRound++;
			TrGRI.SetWarmingUp(false);
			bWarmupRound = false;
			bSpawnInTeamArea = false;
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
			else if( NumPlayers >= m_nMinNetPlayers && AreTeamsUnbalanced() )
			{
				// Teams are unbalanced but we have enough in the match to play a round, so autobalance.
				SendMessageToAll(class'TrAutoBalanceMessage', 2);
				AutoBalanceTeams();

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

	function bool AllowRespawn(TrPlayerController TrPC)
	{
		return true;
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
			TrPC.ReceiveLocalizedMessage(class'TrGameNextRoundMessage', Seconds,,,TrGRI);
		}
	}
}

/** The game type can decide if the time is right for a requested respawn. */
function bool AllowRespawn(TrPlayerController TrPC)
{
	local int TeamNum, PlayerIdx;
	local TrGameReplicationInfo TrGRI;

	if( WorldInfo.NetMode == NM_Standalone )
	{
		return true;
	}

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

	TeamNum = TrPC.GetTeamNum();

	if( !(TeamNum == 0 || TeamNum == 1) )
	{
		// Must have a team to respawn.
		return false;
	}

	if( Teams[TeamNum].Score <= 0 )
	{
		if( TeamNum == 0 )
		{
			for( PlayerIdx = 0; PlayerIdx < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIdx++ )
			{
				if( TrGRI.r_BEPlayerList[PlayerIdx] != none && TrGRI.r_BEPlayerList[PlayerIdx] == TrPC.PlayerReplicationInfo )
				{
					// Found the PRI for the player wanting to respawn.
					return !TrGRI.r_BEPlayerList[PlayerIdx].r_bIsCrossedOffArenaList;
				}
			}
		}
		if( TeamNum == 1 )
		{
			for( PlayerIdx = 0; PlayerIdx < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIdx++ )
			{
				if( TrGRI.r_DSPlayerList[PlayerIdx] != none && TrGRI.r_DSPlayerList[PlayerIdx] == TrPC.PlayerReplicationInfo )
				{
					// Found the PRI for the player wanting to respawn.
					return !TrGRI.r_DSPlayerList[PlayerIdx].r_bIsCrossedOffArenaList;
				}
			}
		}
	}
	return true;
}

/** Called when the server has spawned a player. */
function OnServerSpawnedPlayer(TrPlayerController TrPC)
{
	local int PlayerIndex, TeamNum;
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);
	TeamNum = TrPC.GetTeamNum();

	if( Teams[TeamNum].Score <= 0 )
	{
		for( PlayerIndex = 0; PlayerIndex < MAX_NUM_ARENA_PLAYERS_PER_TEAM; PlayerIndex++ )
		{
			if( TeamNum == 0 )
			{
				if( TrGRI.r_BEPlayerList[PlayerIndex] != none && TrPC.PlayerReplicationInfo == TrGRI.r_BEPlayerList[PlayerIndex] )
				{
					TrGRI.r_BEPlayerList[PlayerIndex].r_nArenaSpawnsLeft--;
				}
			}
			else if( TeamNum == 1)
			{
				if( TrGRI.r_DSPlayerList[PlayerIndex] != none && TrPC.PlayerReplicationInfo == TrGRI.r_DSPlayerList[PlayerIndex] )
				{
					TrGRI.r_DSPlayerList[PlayerIndex].r_nArenaSpawnsLeft--;
				}
			}
		}
	}
	
	// Let the player know that no respawns remain.
	if( TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo).r_nArenaSpawnsLeft == 0 )
	{
		TrPC.ReceiveLocalizedMessage(class'TrArenaMessage', 5);
	}
}

function int GetGameTypeId()
{
    return 4;
}

function SendMatchOver()
{
	local TrGameReplicationInfo TrGRI;
	local TrPlayerController TrPC;
	local int WinningTeam;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

	if( TrGRI.r_nRoundScore[0] == TrGRI.r_nRoundScore[1] )
	{
		// Stalemate.
		WinningTeam = 0;
	}
	else if( TrGRI.r_nRoundScore[0] > TrGRI.r_nRoundScore[1] )
	{
		// Blood Eagle wins.
		WinningTeam = 2;
	}
	else if( TrGRI.r_nRoundScore[1] > TrGRI.r_nRoundScore[0] )
	{
		// Diamond Sword wins.
		WinningTeam = 1;
	}


	foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
	{
        TrPC.ClientMatchOver(WinningTeam, m_sWinnerName);
	}
}

defaultproperties
{
   m_nGoalWonRounds=2
   m_fForcedRespawnTime=15.000000
   Acronym="TrArena"
   MapPrefixes(0)="TrArena"
   bTeamGame=True
   HUDType=Class'TribesGame.TrHUDTeam'
   GoalScore=25
   TimeLimit=10
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrArena'
   Name="Default__TrGame_TrArena"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
