/**
 * Capture the flag.
 */
class TrGame_TRCTF extends TrGame
    config(game);

var TrFlagCTF m_Flags[2];

var class<UTLocalMessage> AnnouncerMessageClass;

replication
{
	if (bNetInitial && Role == ROLE_Authority)
		m_Flags;
}

function PostBeginPlay()
{
	local int i;

	Super.PostBeginPlay();

	for ( i=0; i<2; i++ )
	{
		m_Flags[i].Team = Teams[i];
		Teams[i].HomeBase = UTGameObjective(m_Flags[i].HomeBase);
		Teams[i].TeamFlag = m_Flags[i];
	}
}

simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    super.ApplyServerSettings();

	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
        if (TrGRI.r_ServerConfig.GameScores[TGT_CTF] > 0)
        {
            GoalScore = TrGRI.r_ServerConfig.GameScores[TGT_CTF];
        }
    }
}

/** return a value based on how much this pawn needs help */
function int GetHandicapNeed(Pawn Other)
{
	if ( (Other.PlayerReplicationInfo == None) || (Other.PlayerReplicationInfo.Team == None) )
	{
		return 0;
	}

	// base handicap on how far team is behind in powercore health
	return Teams[1 - Other.PlayerReplicationInfo.Team.TeamIndex].Score - Other.PlayerReplicationInfo.Team.Score;
}

/**
 * Returns through outparameters what location message to play
 * Returns true if it returned message information
 */
function bool GetLocationFor(Pawn StatusPawn, out Actor LocationObject, out int MessageIndex, int LocationSpeechOffset)
{
	local UTPickupFactory F;
	local UDKGameObjective Best;
	local UTBot B;

	// see if it's a bot heading for an objective or a power up
	B = UTBot(StatusPawn.Controller);
	if ( B != None )
	{
		F = UTPickupFactory(StatusPawn.Controller.RouteGoal);
		if ( (F != None) && F.bHasLocationSpeech )
		{
			MessageIndex = 0;
			LocationObject = F;
			return true;
		}
	}

	if ( (m_Flags[0].HomeBase != None) && (m_Flags[1].HomeBase != None) )
	{
		Best = (VSizeSq(StatusPawn.Location - m_Flags[0].HomeBase.Location) < VSizeSq(StatusPawn.Location - m_Flags[1].HomeBase.Location))
				? m_Flags[0].HomeBase
				: m_Flags[1].HomeBase;

		MessageIndex = UTGameObjective(Best).GetLocationMessageIndex(B, StatusPawn);
		LocationObject = Best;
		return true;
	}

	MessageIndex = 10;
	return true;
}

function RegisterFlag(UTCarriedObject F, int TeamIndex)
{
	local TrGameReplicationInfo TrGRI;

	m_Flags[TeamIndex] = TrFlagCTF(F);

	TrGRI = TrGameReplicationInfo(GameReplicationInfo);
	if (TrGRI != none)
		TrGRI.m_Flags[TeamIndex] = m_Flags[TeamIndex];
}

function bool NearGoal(Controller C)
{
	local UTGameObjective B;

	B = UTTeamInfo(C.PlayerReplicationInfo.Team).HomeBase;
	return ( UTCTFBase(B).myFlag.bHome && (VSize(C.Pawn.Location - B.Location) < 1000) );
}

function bool WantFastSpawnFor(AIController B)
{
	if ( NumBots < 6 )
		return true;
	if ( NumBots > 16 )
		return false;

	return !UTCTFSquadAI(UTBot(B).Squad).FriendlyFlag.bHome;
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	//local TrFlagBase BestFlag;
	local Controller P;
	local bool bForceEnd;

	// Game cannot end from gameplay reasons when roaming.
	if( m_bRoamingMap )
	{
		return false;
	}

	if ( CheckModifiedEndGame(Winner, Reason) )
		return false;

	if( bOverTime )
	{
		if( GameReplicationInfo.RemainingTime <= 0 )
		{
			bForceEnd = true;
		}
	}

	if( !bForceEnd )
	{
		if ( Teams[1].Score == Teams[0].Score )
		{
			// Don't allow overtime with automated perf testing.
			if( IsAutomatedPerfTesting() )
			{
				GameReplicationInfo.Winner = Teams[0];
			}
			else
			{
				if ( !bOverTimeBroadcast && !bOverTime )
				{
					StartupStage = 7;
					bOverTimeBroadcast = true;
				}
				return false;
			}
		}
		else if ( Teams[1].Score > Teams[0].Score )
		{
			// If Team 1 is up by one point, but Team 1's flag is not at home, let the match continue.
			if( (Teams[1].Score - Teams[0].Score == 1) && (!m_Flags[1].bHome) )
			{
				return false;
			}

			GameReplicationInfo.Winner = Teams[1];
		}
		else
		{
			// If Team 0 is up by one point, but Team 0's flag is not at home, let the match continue.
			if( (Teams[0].Score - Teams[1].Score == 1) && (!m_Flags[0].bHome) )
			{
				return false;
			}

			GameReplicationInfo.Winner = Teams[0];
		}
	}

	EndTime = WorldInfo.TimeSeconds + EndTimeDelay;
	foreach WorldInfo.AllControllers(class'Controller', P)
	{
		P.GameHasEnded( EndGameFocus, (P.PlayerReplicationInfo != None) && (P.PlayerReplicationInfo.Team == GameReplicationInfo.Winner) );
	}

	return true;
}

function ScoreFlag(Controller Scorer, TrFlagBase theFlag)
{
	local float Dist,oppDist;
	local int i, GoalsScored, assistCount;
	local float ppp,numtouch;
	local vector FlagLoc;
	local UTPlayerReplicationInfo ScorerPRI;
	local TrPawn TrP;
	local TrPlayerController PC;
	local TrPlayerController TrPC;
	local TrPlayerController assistPC;

	if (Role == ROLE_Authority && WorldInfo.NetMode == NM_DedicatedServer)
	{
		;
		ScriptTrace();
	}

	ScorerPRI = UTPlayerReplicationInfo(Scorer.PlayerReplicationInfo);
	PC = TrPlayerController(Scorer);

	// We've scored, so have this person ignore flag touches for a bit to prevent multiple flag caps.
	TrP = TrPawn(Scorer.Pawn);
	if (TrP != none)
	{
		TrP.LockFromFlagPickup(0.5f);
	}

	if ( ScorerPRI.Team == theFlag.Team )
	{
        // Give that player the flag return accolade
	    PC.m_AccoladeManager.FlagReturn();

		FlagLoc = TheFlag.Position().Location;
		Dist = vsize(FlagLoc - TheFlag.HomeBase.Location);
		oppDist = vsize(FlagLoc - Teams[1-TheFlag.Team.TeamIndex].HomeBase.Location);

		//this gets routed somewhere else - do not broadcast here
		//BroadcastLocalizedMessage( AnnouncerMessageClass, 1+7*TheFlag.Team.TeamIndex, ScorerPRI, None, TheFlag.Team );
		ScorerPRI.IncrementEventStat('EVENT_RETURNEDFLAG');
		if (Dist>1024)
		{
			// figure out who's closer
			if (Dist<=oppDist)	// In your team's zone
			{
				ScorerPRI.Score += 3;
			}
			else
			{
				ScorerPRI.Score += 5;

				if (oppDist<=1024)	// Denial
				{
  					ScorerPRI.Score += 7;
				}

			}
		}

		// If we are in overtime, this flag return could end the match.
		if( bOverTime )
		{
			EndGame(ScorerPRI,"OvertimeFlagReturn");
		}

		return;
	}

	// Figure out Team based scoring.
	if (TheFlag.FirstTouch!=None)	// Original Player to Touch it gets 5
	{
		TheFlag.FirstTouch.PlayerReplicationInfo.Score += 5;
		TheFlag.FirstTouch.PlayerReplicationInfo.bForceNetUpdate = TRUE;
	}

	// Guy who caps gets 5
	ScorerPRI.bForceNetUpdate = TRUE;
	ScorerPRI.Score += 5;

	for (i = 0; i < theFlag.Assists.Length; i++)
	{
		if (theFlag.Assists[i] != PC)
		{
            assistCount++;
		}
	}
    
	for (i = 0; i < TheFlag.Assists.Length; i++)
	{
		if (TheFlag.Assists[i] != PC)
		{
            assistPC = TrPlayerController(theFlag.Assists[i]);

            if (assistPC != none)
            {
                assistPC.m_AccoladeManager.FlagAssist(assistCount);
            }
		}
	}

	GoalsScored = ScorerPRI.IncrementEventStat('EVENT_SCOREDFLAG');

    // Give that player the flag capture accolade
	PC.m_AccoladeManager.FlagCapture(theFlag.Assists.Length == 1);

    // See if we set a record for flag cap time
    Stats.SetSpeedFlagCap(PC, WorldInfo.TimeSeconds - theFlag.m_TimeAwaySeconds);

	if ( GoalsScored == 3 )
	{
		ScorerPRI.IncrementEventStat('EVENT_HATTRICK');
		if ( PC != None )
		{
			PC.ReceiveLocalizedMessage(TeamScoreMessageClass, 6, ScorerPRI);
		}
	}
	else
	{
		if ( PC != None )
		{
			PC.ReceiveLocalizedMessage(TeamScoreMessageClass, 7, ScorerPRI);
		}
	}

	// Each player gets 20/x but it's guaranteed to be at least 1 point but no more than 5 points
	if ( TheFlag.Assists.Length > 0 )
	{
		numtouch=0;
		for (i=0;i<TheFlag.Assists.length;i++)
		{
			if (TheFlag.Assists[i]!=None)
				numtouch = numtouch + 1.0;
		}

		if ( numtouch > 0 )
		{
			ppp = FClamp(20/numtouch,1,5);

			for (i=0;i<TheFlag.Assists.length;i++)
			{
				if (TheFlag.Assists[i]!=None)
				{
					TheFlag.Assists[i].PlayerReplicationInfo.Score += int(ppp);
				}
			}
		}
	}

    // We're giving everyone on the team some credits for the score
    foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
    {
        if (TrPC.GetTeamNum() == PC.GetTeamNum())
        {
            TrPC.AwardTeamAssistCredits();
        }
    }

	// Apply the team score
	ScorerPRI.Team.Score += 1.0;
	ScorerPRI.Team.bForceNetUpdate = TRUE;

	CheckScore(ScorerPRI);

    if ( bOverTime )
    {
		EndGame(ScorerPRI,"timelimit");
    }
	else if ( UTGameReplicationInfo(GameReplicationInfo).bStoryMode )
	{
		if ( ScorerPRI.Team.TeamIndex == 0 )
		{
			// player team scored - increase bot skill
			AdjustedDifficulty = FMin(7.0,AdjustedDifficulty + 0.5);
		}
		else
		{
			 // bot team scored - decrease bot skill
			AdjustedDifficulty = FMax(0, AdjustedDifficulty - 0.5);
		}
		AdjustedDifficulty = FClamp(AdjustedDifficulty, GameDifficulty - 1.25, GameDifficulty + 1.25);
	}
	AnnounceScore(ScorerPRI.Team.TeamIndex);
}

State MatchOver
{
	function AnnounceScore(int ScoringTeam)
	{
	}

	function ScoreFlag(Controller Scorer, TrFlagBase theFlag)
	{
	}
}

function ViewObjective(PlayerController PC)
{
	local actor a;
	if (PC.ViewTarget != none &&
	      (PC.ViewTarget == m_Flags[0] || (PC.ViewTarget == m_Flags[0].Holder) || PC.VIewTarget == m_Flags[0].HomeBase) )
	{
		a = m_Flags[1].HomeBase.GetBestViewTarget();
		PC.SetViewTarget( a );
		if ( UTPlayerController(PC) != None )
		{
			UTPlayerController(PC).ClientSetBehindView(true);
		}
	}
	else
	{
		a = m_Flags[0].HomeBase.GetBestViewTarget();
		PC.SetViewTarget( a );
		if ( UTPlayerController(PC) != None )
		{
			UTPlayerController(PC).ClientSetBehindView(true);
		}
	}
}

function Actor GetAutoObjectiveFor(UTPlayerController PC)
{
	if (UTTeamInfo(PC.PlayerReplicationInfo.Team) != None)
	{
		if ( UTPlayerReplicationInfo(PC.PlayerReplicationInfo).bHasFlag )
		{
			return UTTeamInfo(PC.PlayerReplicationInfo.Team).HomeBase;
		}
		else
		{
			return Teams[1 - PC.PlayerReplicationInfo.Team.TeamIndex].HomeBase;
		}
	}
	else
	{
		return None;
	}
}

function AnnounceScore(int ScoringTeam)
{
	local TrPlayerController PC;
	local int OtherTeam, MessageIndex;

	if ( TeamScoreMessageClass == None )
	{
		return;
	}

	OtherTeam = 1 - ScoringTeam;

	if ( Teams[ScoringTeam].Score == Teams[OtherTeam].Score + 1 )
	{
		MessageIndex = 4 + ScoringTeam;
	}
	else if ( Teams[ScoringTeam].Score == Teams[OtherTeam].Score + 2 )
	{
		MessageIndex = 2 + ScoringTeam;
	}
	else
	{
		MessageIndex = ScoringTeam;
	}

	foreach WorldInfo.AllControllers(class'TrPlayerController', PC)
	{
		PC.ReceiveLocalizedMessage(TeamScoreMessageClass, MessageIndex);
	}
}

// override so we can insert special messages
function bool CheckScore(PlayerReplicationInfo Scorer)
{
	if (super.CheckScore(Scorer))
		return true;

	if (bPlayTeamAudio)
	{
		if (!bPlayedBEWinning && Teams[0].Score == GoalScore-1)
		{
			bPlayedBEWinning=true;
			BroadcastLocalizedMessage(class'TrMiscellaneousMessage', TrMISC_BloodEagleCloseToWin);
		}
		else if (!bPlayedDSWinning && Teams[1].Score == GoalScore-1)
		{
			bPlayedDSWinning=true;
			BroadcastLocalizedMessage(class'TrMiscellaneousMessage', TrMISC_DiamondSwordCloseToWin);
		}
	}

	return false;
}

function int GetGameTypeId()
{
    return 1;
}

defaultproperties
{
   AnnouncerMessageClass=Class'TribesGame.TrCTFMessage'
   bPlayTeamAudio=True
   bScoreTeamKills=False
   bSpawnInTeamArea=True
   TeamScoreMessageClass=Class'TribesGame.TrCTFScoreMessage'
   bScoreDeaths=False
   Acronym="TrCTF"
   MapPrefixes(0)="TrCTF"
   bTeamGame=True
   GoalScore=5
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrCTF'
   Name="Default__TrGame_TRCTF"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
