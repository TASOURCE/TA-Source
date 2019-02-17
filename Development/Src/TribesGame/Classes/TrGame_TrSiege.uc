/**
 * Siege
 */
class TrGame_TrSiege extends TrGame
    config(game);

/** List of power generators that handle phase 1. */
var transient array<TrPowerGenerator_Siege> m_Phase1OnlineGenerators;

/** The time it took for round 1 attackers to defeat the defenders. */
var transient float m_bRoundOneTimeSecs;

/** When round one ended, was the core destroyed? */
var transient bool m_bWasCoreDestroyedInRoundOne;

/** 
 *  Current game stage.
 *  Phase 0: Attackers must destroy all generators to gain access to the base
 *  Phase 1: Attackers must destroy the cental core to win the base
 */
var protected int m_CurrentPhase;

function PostBeginPlay()
{
	local TrPowerGenerator_Siege G;

	Super.PostBeginPlay();

	ForEach AllActors( class 'TrPowerGenerator_Siege', G )
	{
		m_Phase1OnlineGenerators.AddItem(G);
	}
}

function OnGeneratorBlownUp(TrPowerGenerator_Siege G)
{
	m_Phase1OnlineGenerators.RemoveItem(G);

	if( m_Phase1OnlineGenerators.Length == 0 )
	{
		// No more power generators in phase 0, go to phase 1.
		SetPhase(1);
	}
}

function OnCoreBlownUp()
{
	if( IsInRoundOne() )
	{
		// End of round one.
		RoundOneOver(true);
	}
	else
	{
		// End of the game. The attacking team won.
		EndGame(none, "AttackingTeamWins");
	}
}

function bool IsInRoundOne()
{
	return m_bRoundOneTimeSecs == -1.0;
}

function RoundOneOver(bool bDestroyedCore)
{
	local TrPowerGenerator_Siege G;
	local TrSiegeCore C;

	m_bRoundOneTimeSecs = FClamp(TimeLimit*60.0 - GameReplicationInfo.RemainingTime, 0.0, TimeLimit*60.0);
	
	m_bWasCoreDestroyedInRoundOne = bDestroyedCore;

	// Everyone swap teams.
	SwapTeams();

	// Reset generators.
	ForEach AllActors( class 'TrPowerGenerator_Siege', G )
	{
		G.Reset();
	}

	// Reset the core.
	ForEach AllActors( class 'TrSiegeCore', C )
	{
		C.Reset();
	}

	// Reset anything that is handled through the GRI.
	TrGameReplicationInfo(GameReplicationInfo).OnResetGame();

	ResetGame();

	// Set the timelimit
	GameReplicationInfo.RemainingTime = m_bRoundOneTimeSecs;

	;
}

function ResetGame()
{
	local TrPowerGenerator_Siege G;

	ForEach AllActors( class 'TrPowerGenerator_Siege', G )
	{
		m_Phase1OnlineGenerators.AddItem(G);
	}

	m_CurrentPhase=0;
}

function SetPhase(int PhaseNumber)
{
	local int OldPhase;

	OldPhase = m_CurrentPhase;
	m_CurrentPhase = PhaseNumber;

	switch( PhaseNumber )
	{
		case 1:
			if( OldPhase == 0 )
			{
				;
				TrGameReplicationInfo(GameReplicationInfo).OnPhase0SiegeEnded();
			}
			break;
	}
}

function SwapTeams()
{
	local TrPlayerController PC;
	local int T;

	foreach WorldInfo.AllControllers(class'TrPlayerController', PC)
	{
		T = PC.GetTeamNum();
		if( T == 0 || T == 1 )
		{
			// Swap the team.
			T = T == 0 ? 1 : 0;
			ChangeTeam(PC, T, true);
		}
	}
}

state MatchInProgress
{
	function Timer()
	{
		local PlayerController P;

		Global.Timer();

		if ( !bFinalStartup )
		{
			bFinalStartup = true;
			PlayStartupMessage();
		}
		// force respawn failsafe
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

		// Check to see if the time limit has been reached.
		if( TimeLimit > 0 )
		{
			GameReplicationInfo.bStopCountDown = false;

			if ( GameReplicationInfo.RemainingTime <= 0.0 )
			{
				// If in round 1, end the round.
				if( IsInRoundOne() )
				{
					RoundOneOver(false);
				}
				else
				{
					if( m_bWasCoreDestroyedInRoundOne )
					{
						// Attacking team did not destroy the core in time. Defending team wins.
						EndGame(none, "DefendingTeamWins");
					}
					else
					{
						// Since neither team destroyed the core, end in stalemate.
						EndGame(none, "Stalemate");
					}
				}
			}
		}
	}
}

function EndGame(PlayerReplicationInfo Winner, string Reason )
{
	if( Reason ~= "AttackingTeamWins" )
	{
		;
	}
	else if( Reason ~= "DefendingTeamWins" )
	{
		;
	}
	else
	{
		;
	}
}

defaultproperties
{
   Acronym="TrSiege"
   MapPrefixes(0)="TrSiege"
   bTeamGame=True
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrSiege'
   Name="Default__TrGame_TrSiege"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
