/**
 * Rabbit.
 */
class TrGame_TRRabbit extends TrGame
    config(game);

struct ScoreStruct
{
	var TrPlayerController C;
	var float score;
};

/** The flag. */
var TrFlagRabbit m_Flag;

/** How much time the holder must have possession before scoring a point. */
var float m_fScoreInterval;

/** Current flag holder. */
var PlayerReplicationInfo m_HolderPRI;
var PlayerReplicationInfo m_Leader;

simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    super.ApplyServerSettings();

	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
        if (TrGRI.r_ServerConfig.GameScores[TGT_RAB] > 0)
        {
            GoalScore = TrGRI.r_ServerConfig.GameScores[TGT_RAB];
        }
    }
}

function RegisterFlag(TrFlagRabbit F)
{
	local TrGameReplicationInfo TrGRI;

	m_Flag = F;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);
	if (TrGRI != none)
		TrGRI.m_Flags[0] = F;
}

function PickedUpFlag(Controller Holder)
{
	local TrGameReplicationInfo GRI;

	// Revoke last rabbit's rights to aftermath kills if he is still dead
    ClearTimer('ChangePreviousRabbitTeam');
	ChangePreviousRabbitTeam();

    m_HolderPRI = Holder.PlayerReplicationInfo;

    // JCR - Tween up the new flag icon
    if (TrPlayerController(Holder) != none) TrPlayerController(Holder).ClientShowFlagIcon(true);

	GRI = TrGameReplicationInfo(GameReplicationInfo);
	if( GRI != none )
	{
		GRI.m_CurrentRabbitPRI = m_HolderPRI;
	}

    // Set the team for the new holder
    SetTeam(Holder, Teams[1], true);
    
    // Score one point for picking up the flag.
    ScoreFlagHold(true);

    // Keep scoring until the flag is dropped.
    SetTimer(m_fScoreInterval, true, 'ScoreFlagTimer');
}

function DroppedFlag() 
{
	local TrGameReplicationInfo GRI;
	local TrPlayerController TrPC;

	BroadcastLocalizedMessage(class'TrRabbitScoreMessage',6,m_HolderPRI,None,None);

	// Allow dead flag holder to get aftermath kills (but not timer points) unless a new rabbit appears
    ClearTimer('ScoreFlagHold');

	TrPC = TrPlayerController(m_HolderPRI.Owner);
	if( TrPC != none )
	{    
        // JCR - Tween away the new flag icon
        TrPC.ClientShowFlagIcon(false);

		if( TrPC.IsDead() )
		{
			SetTimer(TrPC.MinRespawnDelay/2, false, 'ChangePreviousRabbitTeam');
		}
		else
		{
			ChangePreviousRabbitTeam();
		}
	}

	GRI = TrGameReplicationInfo(GameReplicationInfo);
	if( GRI != none )
	{
		GRI.m_CurrentRabbitPRI = none;
	}
}

function SetTeam(Controller Other, UTTeamInfo NewTeam, bool bNewTeam)
{
	local TrDeployable TrDeploy;

	super.SetTeam(Other, NewTeam, bNewTeam);

	// BZ 8439: Deployables will change team along with the player.
	foreach DynamicActors(class'TrDeployable', TrDeploy)
	{
		if (TrDeploy.m_Controller == Other)
		{
			TrDeploy.DefenderTeamIndex = NewTeam.GetTeamNum();
			TrDeploy.bNetDirty = true;
		}
	}
}

function ScoreFlagTimer()
{
	ScoreFlagHold(false);
}

function ScoreFlagHold(bool firstPass)
{
    local TrPlayerController PC;
    if( m_HolderPRI != None )
    {
        m_HolderPRI.Score += 1;
        m_HolderPRI.bForceNetUpdate = TRUE;
        CheckScore(m_HolderPRI);
        
        PC = TrPlayerController(m_HolderPRI.Owner);
        if( PC != None )
        {
			if (firstPass)
				BroadcastLocalizedMessage(class'TrRabbitScoreMessage', 0, m_HolderPRI );
			else
				PC.ReceiveLocalizedMessage(class'TrRabbitScoreMessage', 2 );

			// Update the new holder's New Player Assist points.
			PC.UpdateNewPlayerAssistPoints(1);
        }
    }
    else
    {
        ;
    }
}

function ScoreKill(Controller Killer, Controller Other)
{
    BroadcastLocalizedMessage(class'TrRabbitScoreMessage', 3, None, None);
    Super.ScoreKill(Killer, Other);
}

function ChangePreviousRabbitTeam()
{
	if (m_HolderPRI != none)
	{
		// Ensure player is on the right team if he was the rabbit
		SetTeam(Controller(m_HolderPRI.Owner), Teams[0], true);
		m_HolderPRI = none;
	}
}

simulated function ScoreStruct MakeScoreStruct(TrPlayerController c, float score)
{
	local ScoreStruct r;
	r.C=c;
	r.score=score;
	return r;
}

//
//	returns true if the scoring player is in the lead
//
simulated function bool SortPlayerScores(PlayerReplicationInfo scorer)
{
	local TrGameReplicationInfo gri;
    local TrPlayerController C;
	local ScoreStruct temp;
	local int i,j,scoreCount;
	local array<scoreStruct> scoreList;

    foreach WorldInfo.AllControllers(class'TrPlayerController', C)
    {
	    if (C.PlayerReplicationInfo != None)
		{
			scoreList.AddItem(MakeScoreStruct(C,C.PlayerReplicationInfo.Score));
		}
	}

	scoreCount = scoreList.Length;

	for (i=0; i<scoreCount-1; i++)
	{
		for (j=i+1; j<scoreCount; j++)
		{
			if (scoreList[i].score<scoreList[j].score)
			{
				temp = scoreList[i];
				scoreList[i]=scoreList[j];
				scoreList[j]=temp;
			}
		}
	}

	if (Role==ROLE_Authority)
	{
		gri = TrGameReplicationInfo(GameReplicationInfo);
		if (gri!=none)
		{
			for (i=0;i<scoreCount;i++)
			{
                // JR - Need to come back and clean up this mess
				if (i < ArrayCount(gri.m_RabbitLeaderBoard) && /*JR*/ scoreList[i].C.PlayerReplicationInfo.Score > 0)
					gri.m_RabbitLeaderBoard[i]=scoreList[i].C.PlayerReplicationInfo;
				TrPlayerReplicationInfo(scoreList[i].C.PlayerReplicationInfo).m_nRabbitRank = i;
			}
		}
	}

	return (scorer==scoreList[0].C.PlayerReplicationInfo);
}

function bool CheckScore(PlayerReplicationInfo Scorer)
{
	local bool bScorerIsLeader;

    if( bGameEnded )
    {
        return true;
    }

	// is the scorer in the lead?
	bScorerIsLeader = SortPlayerScores(Scorer);

	if (bScorerIsLeader)
	{
		if (m_Leader!=Scorer)
		{
			m_Leader = Scorer;
			BroadcastLocalizedMessage(class'TrRabbitScoreMessage',4,Scorer,None,None);
		}
	}

	// check game end condition
    if( Scorer != None && GoalScore > 0 )
	{
        if( Scorer.Score >= GoalScore )
        {
            EndGame(Scorer,"fraglimit");
        }
        else if ( bOverTime && bScorerIsLeader )
        {
			EndGame(Scorer,"fraglimit");
        }
    }
    return true;
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local bool winnerFound;
	local TrPlayerController TrPC;
	local TrPlayerReplicationInfo TrPRIHighScore;

	// Game cannot end from gameplay reasons when roaming.
	if( m_bRoamingMap )
	{
		return false;
	}

	TrPRIHighScore = none;
	winnerFound = false;

	if (Reason ~= "TimeLimit")
	{
		foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
		{
			if (TrPC.PlayerReplicationInfo != none)
			{
				if (TrPRIHighScore == none || TrPC.PlayerReplicationInfo.Score > TrPRIHighScore.Score)
					TrPRIHighScore = TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo);
				// Duplicate high scores found, no winner!
				else if (TrPC.PlayerReplicationInfo != TrPRIHighScore && TrPC.PlayerReplicationInfo.Score == TrPRIHighScore.Score)
					return false;
			}
		}

		Winner = TrPRIHighScore;
		winnerFound = true;
	}
    else if (Winner != none && Winner.Score >= GoalScore)
    {
		winnerFound = true;
    }

	// A winner has been found!
	if (winnerFound)
	{
        m_sWinnerName = Winner.PlayerName;
        EndTime = WorldInfo.TimeSeconds + EndTimeDelay;
	    GameReplicationInfo.Winner = Winner;
        SetEndGameFocus(Winner);
        ClearTimer('ScoreFlagHold');
        bGameEnded = true;

        return true;
	}

	return false;
}

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

function PlayEndOfMatchMessage()
{
	local PlayerReplicationInfo PRIWinner;

	PRIWinner = PlayerReplicationInfo(GameReplicationInfo.Winner);
	if( PRIWinner != none )
	{
		BroadcastLocalizedMessage(class'TrVictoryMessage', 6, PRIWinner);
	}
}


auto State PendingMatch
{
    function BeginState(Name PreviousStateName)
    {
		super.BeginState(PreviousStateName);

		TrGameReplicationInfo(GameReplicationInfo).CanPlaceDeployables(false);
    }
}

function DiscardInventory( Pawn Other, optional controller Killer )
{
	local TrPlayerReplicationInfo TrPRI;
	local TrPlayerController OtherController;

	TrPRI = TrPlayerReplicationInfo(Other.PlayerReplicationInfo);
	OtherController = TrPlayerController(Other.Controller);
	if( TrPRI != None && !TrPRI.bHasFlag && OtherController != none )
	{
		// Never have a suicide penalty for rabbit-chasers.
		OtherController.m_bLastDeathWasUserSuicide = false;
	}
	Super.DiscardInventory(Other);
}

function float RatePlayerStart(PlayerStart P, byte Team, Controller Player)
{
	local float Score;

	// Primary starts are more desireable
	Score = P.bPrimaryStart ? 30 : 20;

	if ( (P == LastStartSpot) || (P == LastPlayerStartSpot) )
	{
		// avoid re-using starts
		Score -= 15.0;
	}

	// Avoid starts that are far away from the flag.
	if( VSize(m_Flag.Location - P.Location) > 32000.0 )
	{
		Score -= 10;
	}
	return FMax(Score, 0.2);
}

function int GetGameTypeId()
{
    return 3;
}

defaultproperties
{
   m_fScoreInterval=11.250000
   m_bShouldAutoBalance=False
   Acronym="TrRabbit"
   MapPrefixes(0)="TrRabbit"
   GoalScore=30
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrRabbit'
   Name="Default__TrGame_TRRabbit"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
