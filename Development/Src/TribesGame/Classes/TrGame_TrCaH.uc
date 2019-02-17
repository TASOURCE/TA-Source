class TrGame_TrCaH extends TrGame
    config(game);

var array<TrCaHCapturePoint> m_CapturePoints;

/** Remaining time for the tickets to be counted. */
var transient int m_nRemainingTicketTime;

/** Amount of time between ticket counting. */
var int m_nTicketCountTime;

/** Amount of time between taking over a point and when it awards a score. */
var int m_nPostCapturePointTime;

/** Differing goalscores based on the number of capture points. */
var config int m_3PointGoalScore;
var config int m_4PointGoalScore;
var config int m_5PointGoalScore;

function PreBeginPlay()
{
	local TrCaHCapturePoint CapturePoint;

	ForEach DynamicActors(class'TrCaHCapturePoint', CapturePoint)
	{
		m_CapturePoints.AddItem(CapturePoint);
	}

	// Change the score based on the number of control points.
	if( m_CapturePoints.Length <= 3 )
	{
		if (GameReplicationInfo != none) GameReplicationInfo.GoalScore = m_3PointGoalScore;
		GoalScore = m_3PointGoalScore;
	}
	else if( m_CapturePoints.Length == 4 )
	{
		if (GameReplicationInfo != none) GameReplicationInfo.GoalScore = m_4PointGoalScore;
		GoalScore = m_4PointGoalScore;
	}
	else
	{
		if (GameReplicationInfo != none) GameReplicationInfo.GoalScore = m_5PointGoalScore;
		GoalScore = m_5PointGoalScore;
	}
    
	Super.PreBeginPlay();
}

simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    super.ApplyServerSettings();

	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
        if (TrGRI.r_ServerConfig.GameScores[TGT_CAH] > 0)
        {
            GoalScore = TrGRI.r_ServerConfig.GameScores[TGT_CAH];
        }
    }
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

function ScoreKill(Controller Killer, Controller Other )
{
    Super.ScoreKill(Killer, Other);
}

function bool CheckScore(PlayerReplicationInfo Scorer)
{
	return false;
}

function GotoPendingRoundStartTimer()
{
	GotoState('PendingRoundStart');
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local bool bGameIsOver;
	local Controller P;

	if( Reason ~= "TeamScoreLimit" || Reason ~= "Timelimit" )
	{
		bGameIsOver = true;
	}

	if( bGameIsOver )
	{
		// Send each controller to the end of the game.
		foreach WorldInfo.AllControllers(class'Controller', P)
		{
			P.GameHasEnded( EndGameFocus, DetermineWinningTeam() == P.GetTeamNum() );
		}
	}

	return bGameIsOver;
}

function AwardPoint(byte TeamIndex);

state MatchInProgress
{
	function AwardPoint(byte TeamIndex)
	{
		Teams[TeamIndex].Score += 1;
		Teams[TeamIndex].bForceNetUpdate = TRUE;

		if( Teams[0].Score >= GoalScore || Teams[1].Score >= GoalScore )
		{
			EndGame(none, "TeamScoreLimit");
		}
	}
}

state MatchOver
{
	function BeginState(Name PreviousStateName)
	{
		local int i;

		super.BeginState(PreviousStateName);

		for( i = 0; i < m_CapturePoints.Length; i++ )
		{
			m_CapturePoints[i].ClearTimer('PostCapturePointTimer');
			m_CapturePoints[i].ClearTimer('AwardPointTimer');
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

/** Called when a control point has been held. */
function OnCapturePointHeld(TrCaHCapturePoint HeldPoint)
{
	local TrCaHCapturePoint CP;
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);

	if( TrGRI != none )
	{
		// Just to be on the safe side, refresh the GRI's point counters for all points.
		TrGRI.r_nNumCapturePointsHeld[0] = 0;
		TrGRI.r_nNumCapturePointsHeld[1] = 0;

		foreach m_CapturePoints(CP)
		{
			if( CP.DefenderTeamIndex == 0 )
			{
				TrGRI.r_nNumCapturePointsHeld[0]++;
			}
			else if( CP.DefenderTeamIndex == 1 )
			{
				TrGRI.r_nNumCapturePointsHeld[1]++;
			}
		}
	}

	/** Don't play sounds at the moment. This was an experiment that we may revisit.
	foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
	{
		if( TrPC.GetTeamNum() == HeldPoint.DefenderTeamIndex )
		{
			TrPC.ClientPlaySound(SoundCue'Aud_menu.CapturePoint.A_CUE_UI_CapturePoint_Message_PointTaken');
		}
		else
		{
			TrPC.ClientPlaySound(SoundCue'Aud_menu.CapturePoint.A_CUE_UI_CapturePoint_Message_YouCapturePoint');
		}
	}
	*/

	if( HeldPoint != none && HeldPoint.m_LastCapturedBy != none )
	{
		// Award an accolade to the player who captured the point.
		HeldPoint.m_LastCapturedBy.m_AccoladeManager.QueueAccolade(class'TrAccolade_CaptureAndHold');
	}
}

/** Called when a control point has changed teams. */
function OnCapturePointOwnershipChanged(TrCaHCapturePoint PointThatChanged, TrPawn TrP)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(TrP.Controller);
	if( TrPC != none )
	{
		// Notify the pawn who just captured this point.
		TrPC.ReceiveLocalizedMessage(class'TrCaHMessage', 1);
	}
}

function float RatePlayerStart(PlayerStart P, byte Team, Controller Player)
{
	local float Score;
	local TrPlayerStart TrPS;

	// Primary starts are more desireable
	Score = 0;

	if ( (P == LastStartSpot) || (P == LastPlayerStartSpot) )
	{
		// avoid re-using starts
		Score -= 5.0;
	}

	TrPS = TrPlayerStart(P);
	if( TrPS != none )
	{
		if( TrPS.CaHCapturePoint == none )
		{
			Score += 20.0;
		}
		else
		{
			if( TrPS.CaHCapturePoint.DefenderTeamIndex == Team && TrPS.CaHCapturePoint.r_bIsHeld )
			{
				Score += 30.0;
			}
		}
	}

	return Score;
}

/** ChoosePlayerStart()
* Return the 'best' player start for this player to start from.  PlayerStarts are rated by RatePlayerStart().
* @param Player is the controller for whom we are choosing a playerstart
* @param InTeam specifies the Player's team (if the player hasn't joined a team yet)
* @returns NavigationPoint chosen as player start (usually a PlayerStart)
 */
function PlayerStart ChoosePlayerStart( Controller Player, optional byte InTeam )
{
	local PlayerStart P, BestStart;
	local float BestRating, NewRating;
	local array<PlayerStart> PlayerStarts;
	local int i, RandStart;
	local byte Team;
	local TrPlayerStart TrPS;

	// use InTeam if player doesn't have a team yet
	Team = ( (Player != None) && (Player.PlayerReplicationInfo != None) && (Player.PlayerReplicationInfo.Team != None) )
			? byte(Player.PlayerReplicationInfo.Team.TeamIndex)
			: InTeam;

	// make array of enabled playerstarts
	foreach WorldInfo.AllNavigationPoints(class'PlayerStart', P)
	{
		TrPS = TrPlayerStart(P);
		if ( TrPS != none && P.bEnabled && (Team == 255 || TrPS.CaHCapturePoint == none || TrPS.CaHCapturePoint.DefenderTeamIndex == Team) )
		{
			PlayerStarts[PlayerStarts.Length] = P;
		}
	}

	// Avoid randomness for profiling.
	if( bFixedPlayerStart )
	{
		RandStart = 0;
	}
	// start at random point to randomize finding "good enough" playerstart
	else
	{
		RandStart = Rand(PlayerStarts.Length);
	}

	for ( i=RandStart; i<PlayerStarts.Length; i++ )
	{
		P = PlayerStarts[i];
		NewRating = RatePlayerStart(P,Team,Player);
		if ( NewRating >= 30 )
		{
			// this PlayerStart is good enough
			return P;
		}
		if ( NewRating > BestRating )
		{
			BestRating = NewRating;
			BestStart = P;
		}
	}
	for ( i=0; i<RandStart; i++ )
	{
		P = PlayerStarts[i];
		NewRating = RatePlayerStart(P,Team,Player);
		if ( NewRating >= 30 )
		{
			// this PlayerStart is good enough
			return P;
		}
		if ( NewRating > BestRating )
		{
			BestRating = NewRating;
			BestStart = P;
		}
	}
	return BestStart;
}

defaultproperties
{
   m_nTicketCountTime=5
   m_nPostCapturePointTime=5
   m_3PointGoalScore=300
   m_4PointGoalScore=400
   m_5PointGoalScore=500
   Acronym="TrCaH"
   MapPrefixes(0)="TrCaH"
   bTeamGame=True
   HUDType=Class'TribesGame.TrHUDTeam'
   GoalScore=400
   TimeLimit=30
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrCaH'
   Name="Default__TrGame_TrCaH"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
