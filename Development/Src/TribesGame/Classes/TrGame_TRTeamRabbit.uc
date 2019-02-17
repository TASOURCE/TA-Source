/**
 * Rabbit.
 */
class TrGame_TRTeamRabbit extends TrGame
    config(game);

/** Should a flag spawn at the location of the next player to be killed? */
var bool m_bSpawnFlagOnNextKill;

/** The team rabbit flag. */
var TrFlagTeamRabbit m_TeamRabbitFlag;

/** Which team is buffed? */
var byte m_nBuffedTeamIndex;

/** How much to buff? */
var int m_nBuffAmount;

/** Has the announcer rally been said? */
var transient bool m_bPlayedAnnouncerRally;

const MESSAGE_SCORE_SWITCH_LIMIT = 0xFFF;
const MESSAGE_SCORE_SWITCH_TEAM = 17;

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

function ResetScores()
{
	Teams[0].Score = GoalScore;
	Teams[1].Score = GoalScore;
	Teams[0].bForceNetUpdate = TRUE;
	Teams[1].bForceNetUpdate = TRUE;
}

simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    super.ApplyServerSettings();

	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
        if (TrGRI.r_ServerConfig.GameScores[TGT_TDM] > 0)
        {
            GoalScore = TrGRI.r_ServerConfig.GameScores[TGT_TDM];
        }
    }
}

function SpawnFlag(Vector SpawnLocation, Vector InitialVelocity)
{
	if( m_TeamRabbitFlag != none )
	{
		m_TeamRabbitFlag.Destroy();
		m_TeamRabbitFlag = none;
	}

	SpawnLocation.Z += 100.0;

	m_TeamRabbitFlag = Spawn(class'TrFlagTeamRabbit', self,,SpawnLocation);
	if( m_TeamRabbitFlag == none )
	{
		;
		return;
	}

	m_TeamRabbitFlag.Velocity = m_TeamRabbitFlag.m_fInheritVelocityPct * InitialVelocity;
	m_TeamRabbitFlag.Velocity.Z += 350.0;

	TrGameReplicationInfo(GameReplicationInfo).m_Flags[0] = m_TeamRabbitFlag;
	m_bSpawnFlagOnNextKill = false;
}

auto state PendingRoundStart
{
ignores SpawnFlag;
	function Killed( Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> damageType )
	{
		super.Killed(Killer, KilledPlayer, KilledPawn, damageType);
	}
}

// Monitor killed messages for fraglimit
function Killed( Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> damageType )
{
	local TrPlayerPawn KilledPlayerPawn;

	super.Killed(Killer, KilledPlayer, KilledPawn, damageType);

	KilledPlayerPawn = TrPlayerPawn(KilledPawn);

	if( Killer != KilledPlayer && Killer.GetTeamNum() != KilledPlayer.GetTeamNum() )
	{
		if( m_bSpawnFlagOnNextKill && KilledPlayerPawn != none )
		{
			SpawnFlag(KilledPlayerPawn.Location, KilledPlayerPawn.Velocity);
		}
	}
}

function FlagDestoyed()
{
	m_nBuffedTeamIndex = default.m_nBuffedTeamIndex;
	m_TeamRabbitFlag = none;
	m_bSpawnFlagOnNextKill = true;
    
	TrGameReplicationInfo(GameReplicationInfo).m_Flags[0] = none;
}

function PickedUpFlag(Controller Holder)
{
	local PlayerController P;
	local TrPlayerController TrPC;

    TrPC = TrPlayerController(Holder);

	if (TrPC != none)
	{
		TrPC.m_AccoladeManager.FlagGrabDeathMatch();
	    TrPC.ClientShowFlagIcon(true);
        
        // Give the holding player credits every so often for being such a hero
        SetTimer(12.0f, true, 'AwardFlagHolder');
	}

	foreach WorldInfo.AllControllers(class'PlayerController', P)
	{
		if( P == Holder )
		{
			P.ReceiveLocalizedMessage(class'TrTeamRabbitMessage', 0);
		}
		else if( P.GetTeamNum() == Holder.GetTeamNum() )
		{
			P.ReceiveLocalizedMessage(class'TrTeamRabbitMessage', 2);
		}
		else
		{
			P.ReceiveLocalizedMessage(class'TrTeamRabbitMessage', 1);
		}
	}

	m_nBuffedTeamIndex = Holder.GetTeamNum();
}

function DroppedFlag()
{
	local PlayerController P;

    ClearTimer('AwardFlagHolder');

    TrPlayerController(m_TeamRabbitFlag.Holder.Owner).ClientShowFlagIcon(false);    
	
	foreach WorldInfo.AllControllers(class'PlayerController', P)
	{
		P.ReceiveLocalizedMessage(class'TrTeamRabbitMessage', 4);
	}
	
	m_nBuffedTeamIndex = 255;
}

function AwardFlagHolder()
{
	local TrPlayerController TrPC;

    TrPC = TrPlayerController(m_TeamRabbitFlag.Holder.Owner);

	if (TrPC != none)
	{
		TrPC.m_AccoladeManager.FlagHeld();
	}
}

function ScoreKill(Controller Killer, Controller Other )
{
    local TrPlayerReplicationInfo ScorerPRI;
	local TrPawn TrP;
	local TrPlayerController TrKiller, TrPC;
	local int TeamToDeductPointsFrom, NumPointsToDeduct, MessageScoreSwitchFriendly, MessageScoreSwitchEnemy, ScoreToPack;
	local int PreviousScore[2];

	PreviousScore[0] = Teams[0].Score;
	PreviousScore[1] = Teams[1].Score;

    Super.ScoreKill(Killer, Other);

	TrKiller = TrPlayerController(Killer);
	if (TrKiller == Other)
	{
		// Suicide, find the last damager.
		TrP = TrPawn(TrKiller.Pawn);
		if( TrP != none )
		{
			TrPC = TrP.GetLastDamager();
			if (TrPC != none)
			{
				TrKiller = TrPC;
			}
		}
	}

    ScorerPRI = TrPlayerReplicationInfo(TrKiller.PlayerReplicationInfo);

    // Apply the team score
	if (TrKiller != none && TrKiller != Other)
	{
		NumPointsToDeduct = 1.0;

		// Deduct points from the team that had someone die.
		TeamToDeductPointsFrom = Other.GetTeamNum();

		if( m_nBuffedTeamIndex == ScorerPRI.Team.TeamIndex )
		{
			TrKiller.ReceiveLocalizedMessage(class'TrTeamRabbitMessage', 3);
			NumPointsToDeduct *= m_nBuffAmount;
		}
		Teams[TeamToDeductPointsFrom].Score = Max(Teams[TeamToDeductPointsFrom].Score - NumPointsToDeduct, 0);
		Teams[TeamToDeductPointsFrom].bForceNetUpdate = TRUE;

		// Broadcast messages to player controllers every ten kills. So, e.g. 71->69 broadcasts.
		if( (Teams[TeamToDeductPointsFrom].Score < MESSAGE_SCORE_SWITCH_LIMIT) &&
			(Teams[TeamToDeductPointsFrom].Score > 9) &&
			(Teams[TeamToDeductPointsFrom].Score % 10 > PreviousScore[TeamToDeductPointsFrom] % 10) || 
			(Teams[TeamToDeductPointsFrom].Score % 10 == 0) ||
			(PreviousScore[TeamToDeductPointsFrom] - Teams[TeamToDeductPointsFrom].Score >= 10) )
		{
			ScoreToPack = Teams[TeamToDeductPointsFrom].Score & MESSAGE_SCORE_SWITCH_LIMIT;
			MessageScoreSwitchFriendly = 1 << MESSAGE_SCORE_SWITCH_TEAM;
			MessageScoreSwitchFriendly = MessageScoreSwitchFriendly | ScoreToPack;
			MessageScoreSwitchEnemy = 2 << MESSAGE_SCORE_SWITCH_TEAM;
			MessageScoreSwitchEnemy = MessageScoreSwitchEnemy | ScoreToPack;
			foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
			{
				if( TrPC.GetTeamNum() == TeamToDeductPointsFrom )
				{
					TrPC.ReceiveLocalizedMessage(class'TrTeamRabbitMessage', MessageScoreSwitchFriendly,,,Teams[TeamToDeductPointsFrom]);
				}
				else
				{
					TrPC.ReceiveLocalizedMessage(class'TrTeamRabbitMessage', MessageScoreSwitchEnemy,,,Teams[TeamToDeductPointsFrom]);
				}
			}
		}
                    
        // We're giving everyone on the team some credits for the score
        foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
        {
            if (TrPC.GetTeamNum() != TeamToDeductPointsFrom)
            {
                TrPC.AwardTeamRabbitAssistCredits(NumPointsToDeduct);
            }
        }

		if( !m_bPlayedAnnouncerRally && (Teams[TeamToDeductPointsFrom].Score < 11) )
		{
			foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
			{
				if( TrPC.GetTeamNum() == TeamToDeductPointsFrom )
				{
					if( TrPC.GetTeamNum() == 0 )
					{
						// Blood Eagle warning.
						TrPC.PlayAnnouncerSound(SoundCue'AUD_VOX_BE_Leader.A_CUE_Gen_Neg_E', true);
					}
					else if( TrPC.GetTeamNum() == 1 )
					{
						// Diamond Sword warning.
						TrPC.PlayAnnouncerSound(SoundCue'AUD_VOX_DS_Leader.A_CUE_Gen_Neg_E', true);
					}
				}
				else
				{
					if( TrPC.GetTeamNum() == 0 )
					{
						// Blood Eagle victory soon.
						TrPC.PlayAnnouncerSound(SoundCue'AUD_VOX_BE_Leader.A_CUE_Gen_Pos_A', true);
					}
					else if( TrPC.GetTeamNum() == 1 )
					{
						// Diamond Sword victory soon.
						TrPC.PlayAnnouncerSound(SoundCue'AUD_VOX_DS_Leader.A_CUE_Gen_Pos_A', true);
					}
				}
			}
			m_bPlayedAnnouncerRally = true;
		}
	}

	if (CheckScore(ScorerPRI))
	{
		// $$LOCALIZE
		TrPlayerController(Killer).ProcessCreditEvent(FinalBlowEvent,false);
	}
}

function bool CheckScore(PlayerReplicationInfo Scorer)
{
	if( Teams[0].Score <= 0 || Teams[1].Score <= 0 )
	{
		EndGame(Scorer,"teamscorelimit");
		return true;
	}

	return false;
}

//(Reason ~= "TimeLimit")
function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local Controller P;
	local TeamInfo LosingTeam, WinningTeam;
	local bool bGameIsOver;

	// Check overtime.
	if( bOverTime )
	{
		if( Reason ~= "TimeLimit" && Teams[0].Score == Teams[1].Score )
		{
			// Even overtime is done and we are still tied. End the game in a draw.
			// Send each controller to the end of the game.
			foreach WorldInfo.AllControllers(class'Controller', P)
			{
				P.GameHasEnded( EndGameFocus, false );
			}
			return true;
		}
		else
		{
			if( Teams[0].Score < Teams[1].Score || Teams[0].Score == 0 )
			{
				// Diamond Sword wins because their score was higher.
				LosingTeam = Teams[0];
				WinningTeam = Teams[1];
				bGameIsOver = true;
			}
			else
			{
				// Blood Eagle wins because their score was higher.
				LosingTeam = Teams[1];
				WinningTeam = Teams[0];
				bGameIsOver = true;
			}
		}
	}
	else
	{
		if( Reason ~= "TimeLimit" )
		{
			if( Teams[0].Score == Teams[1].Score )
			{
				// Overtime.

			}
			else if( Teams[0].Score < Teams[1].Score || Teams[0].Score == 0 )
			{
				// Diamond Sword wins because their score was higher.
				LosingTeam = Teams[0];
				WinningTeam = Teams[1];
				bGameIsOver = true;
			}
			else
			{
				// Blood Eagle wins because their score was higher.
				LosingTeam = Teams[1];
				WinningTeam = Teams[0];
				bGameIsOver = true;
			}
		}
		else if( Winner != none )
		{
			LosingTeam = Winner.Team == Teams[0] ? Teams[1] : Teams[0];
			WinningTeam = Winner.Team;

			if( LosingTeam.Score <= 0.0 )
			{
				bGameIsOver = true;
			}
		}
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

function float RatePlayerStart(PlayerStart P, byte Team, Controller Player)
{
	local float Score;

	if( m_TeamRabbitFlag != none )
	{

		// Primary starts are more desireable
		Score = P.bPrimaryStart ? 30 : 20;

		if ( (P == LastStartSpot) || (P == LastPlayerStartSpot) )
		{
			// avoid re-using starts
			Score -= 15.0;
		}

		// Avoid starts that are far away from the flag.
		if( VSize(m_TeamRabbitFlag.Location - P.Location) > 32000.0 )
		{
			Score -= 10;
		}
		return FMax(Score, 0.2);
	}
	
	return Super.RatePlayerStart(P, Team, Player);
}

function int GetGameTypeId()
{
    return 2;
}

defaultproperties
{
   m_bSpawnFlagOnNextKill=True
   m_nBuffedTeamIndex=255
   m_nBuffAmount=2
   Acronym="TrTeamRabbit"
   MapPrefixes(0)="TrTeamRabbit"
   bTeamGame=True
   HUDType=Class'TribesGame.TrHUDTeam'
   GoalScore=100
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrTeamRabbit'
   Name="Default__TrGame_TRTeamRabbit"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
