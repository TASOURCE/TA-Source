class TrDaDStats extends Object within TrHud;

var int MyTeam;
var int RemainingTime;
var bool bIsActive;
var bool bForcingUpdate;

var int TeamScore[2];
var int RoundScore[2];
var int RoundNum;

var GfxTrHud m_MoviePlayer;
var TrPlayerController TrPC;

struct DaDScoreInfo
{
	var bool	bGeneratorOnline;
	var int     GeneratorRemainingTime;
	var bool    bCapacitorAOnline;
	var bool    bCapacitorBOnline;
	var bool    bCapacitorCOnline;
	var int     CoreHealthPct;
};
var DaDScoreInfo FriendlyDaDScore;
var DaDScoreInfo EnemyDaDScore;

function Initialize(TrPlayerController PC, GfxTrHud MP)
{
    TrPC = PC;
    m_MoviePlayer = MP;
}

function Show()
{
    if (bIsActive)
    {
        m_MoviePlayer.DaDStatsShow(true);
    }
}

function Hide()
{
    m_MoviePlayer.DaDStatsShow(false);
}

function Tick()
{
	local TrGameReplicationInfo GRI;
	GRI = TrGameReplicationInfo(TrPC.WorldInfo.GRI);

	if ( GRI == None ) return;

    UpdateTeam();
    UpdateTeamScore(GRI);
    UpdateTime(GRI);
}

function UpdateTeam()
{
	if( TrPC.PlayerReplicationInfo.GetTeamNum() == 255 )
	{
		// Spectator, so Diamond Sword (team 1) is "friendly")
		MyTeam = 1;
		return;
	}
    if (MyTeam != TrPC.PlayerReplicationInfo.GetTeamNum())
    {
        MyTeam = TrPC.PlayerReplicationInfo.GetTeamNum();
    }
}

function UpdateTeamScore(TrGameReplicationInfo GRI)
{
	local int FriendlyTeamNum, EnemyTeamNum, NewCoreHealth;
	local bool bUpdateFriendly, bUpdateEnemy, bNewGenOnline, bNewCapOnline;

	if( TrPC.GetTeamNum() == 0 )
	{
		FriendlyTeamNum = 0;
		EnemyTeamNum = 1;
	}
	else
	{
		// Spectator, Diamond Sword see friendly as team num 1.
		FriendlyTeamNum = 1;
		EnemyTeamNum = 0;
	}

	// See if core health changed.
	NewCoreHealth = GRI.r_DaDCore[FriendlyTeamNum].GetCeilPctScore();
	if( NewCoreHealth != FriendlyDaDScore.CoreHealthPct )
	{
		FriendlyDaDScore.CoreHealthPct = NewCoreHealth;
		bUpdateFriendly = true;
	}

	NewCoreHealth = GRI.r_DaDCore[EnemyTeamNum].GetCeilPctScore();
	if( NewCoreHealth != EnemyDaDScore.CoreHealthPct )
	{
		EnemyDaDScore.CoreHealthPct = NewCoreHealth;
		bUpdateEnemy = true;
	}

	// See if generator changed power status.
	bNewGenOnline = GRI.GeneratorPower[FriendlyTeamNum] == 1;
	if( bNewGenOnline != FriendlyDaDScore.bGeneratorOnline )
	{
		FriendlyDaDScore.bGeneratorOnline = bNewGenOnline;
		bUpdateFriendly = true;
	}
	
	bNewGenOnline = GRI.GeneratorPower[EnemyTeamNum] == 1;
	if( bNewGenOnline != EnemyDaDScore.bGeneratorOnline )
	{
		EnemyDaDScore.bGeneratorOnline = bNewGenOnline;
		bUpdateEnemy = true;
	}

	// Check the capacitors.
	bNewCapOnline = (GRI.r_DaDCapacitorBE[0].r_Health > 0);
	if( (FriendlyTeamNum == 0 ? FriendlyDaDScore.bCapacitorAOnline : EnemyDaDScore.bCapacitorAOnline) != bNewCapOnline )
	{
		(FriendlyTeamNum == 0 ? FriendlyDaDScore.bCapacitorAOnline : EnemyDaDScore.bCapacitorAOnline) = bNewCapOnline;
		if( FriendlyTeamNum == 0 )
		{
			bUpdateFriendly = true;
		}
		else
		{
			bUpdateEnemy = true;
		}
	}
	bNewCapOnline = (GRI.r_DaDCapacitorBE[1].r_Health > 0);
	if( (FriendlyTeamNum == 0 ? FriendlyDaDScore.bCapacitorBOnline : EnemyDaDScore.bCapacitorBOnline) != bNewCapOnline )
	{
		(FriendlyTeamNum == 0 ? FriendlyDaDScore.bCapacitorBOnline : EnemyDaDScore.bCapacitorBOnline) = bNewCapOnline;
		if( FriendlyTeamNum == 0 )
		{
			bUpdateFriendly = true;
		}
		else
		{
			bUpdateEnemy = true;
		}
	}
	bNewCapOnline = (GRI.r_DaDCapacitorBE[2].r_Health > 0);
	if( (FriendlyTeamNum == 0 ? FriendlyDaDScore.bCapacitorAOnline : EnemyDaDScore.bCapacitorCOnline) != bNewCapOnline )
	{
		(FriendlyTeamNum == 0 ? FriendlyDaDScore.bCapacitorAOnline : EnemyDaDScore.bCapacitorCOnline) = bNewCapOnline;
		if( FriendlyTeamNum == 0 )
		{
			bUpdateFriendly = true;
		}
		else
		{
			bUpdateEnemy = true;
		}
	}

	bNewCapOnline = (GRI.r_DaDCapacitorDS[0].r_Health > 0);
	if( (FriendlyTeamNum == 1 ? FriendlyDaDScore.bCapacitorAOnline : EnemyDaDScore.bCapacitorAOnline) != bNewCapOnline )
	{
		(FriendlyTeamNum == 1 ? FriendlyDaDScore.bCapacitorAOnline : EnemyDaDScore.bCapacitorAOnline) = bNewCapOnline;
		if( FriendlyTeamNum == 1 )
		{
			bUpdateFriendly = true;
		}
		else
		{
			bUpdateEnemy = true;
		}
	}
	bNewCapOnline = (GRI.r_DaDCapacitorDS[1].r_Health > 0);
	if( (FriendlyTeamNum == 1 ? FriendlyDaDScore.bCapacitorBOnline : EnemyDaDScore.bCapacitorBOnline) != bNewCapOnline )
	{
		(FriendlyTeamNum == 1 ? FriendlyDaDScore.bCapacitorBOnline : EnemyDaDScore.bCapacitorBOnline) = bNewCapOnline;
		if( FriendlyTeamNum == 1 )
		{
			bUpdateFriendly = true;
		}
		else
		{
			bUpdateEnemy = true;
		}
	}
	bNewCapOnline = (GRI.r_DaDCapacitorDS[2].r_Health > 0);
	if( (FriendlyTeamNum == 1 ? FriendlyDaDScore.bCapacitorCOnline : EnemyDaDScore.bCapacitorCOnline) != bNewCapOnline )
	{
		(FriendlyTeamNum == 1 ? FriendlyDaDScore.bCapacitorCOnline : EnemyDaDScore.bCapacitorCOnline) = bNewCapOnline;
		if( FriendlyTeamNum == 1 )
		{
			bUpdateFriendly = true;
		}
		else
		{
			bUpdateEnemy = true;
		}
	}

	if( bUpdateFriendly )
	{
		m_MoviePlayer.DaDUpdateFriendlyStats(int(FriendlyDaDScore.bGeneratorOnline),"0:00",int(FriendlyDaDScore.bCapacitorAOnline), int(FriendlyDaDScore.bCapacitorBOnline), int(FriendlyDaDScore.bCapacitorCOnline), FriendlyDaDScore.CoreHealthPct);
	}

	if( bUpdateEnemy )
	{
		m_MoviePlayer.DaDUpdateEnemyStats(int(EnemyDaDScore.bGeneratorOnline),"0:00",int(EnemyDaDScore.bCapacitorAOnline), int(EnemyDaDScore.bCapacitorBOnline), int(EnemyDaDScore.bCapacitorCOnline), EnemyDaDScore.CoreHealthPct);
	}
}

function UpdateTime(TrGameReplicationInfo GRI)
{
    if (GRI.RemainingTime != RemainingTime)
    {
        //m_MoviePlayer.ArenaStatsUpdateTime(FormatTime(GRI.TimeLimit != 0 ? GRI.RemainingTime : GRI.ElapsedTime));
        RemainingTime = GRI.RemainingTime;
    }
}

function string FormatTime(int Seconds)
{
	local int Hours, Mins;
	local string NewTimeString;

	Hours = Seconds / 3600;
	Seconds -= Hours * 3600;
	Mins = Seconds / 60;
	Seconds -= Mins * 60;
	if (Hours > 0)
		NewTimeString = ( Hours > 9 ? String(Hours) : "0"$String(Hours)) $ ":";
	NewTimeString = NewTimeString $ ( Mins > 9 ? String(Mins) : "0"$String(Mins)) $ ":";
	NewTimeString = NewTimeString $ ( Seconds > 9 ? String(Seconds) : "0"$String(Seconds));

	return NewTimeString;
}

function ForceUpdate()
{
    TeamScore[0] = -1;
    TeamScore[1] = -1;

    bForcingUpdate = true;

    Tick();
    
    bForcingUpdate = false;
}

defaultproperties
{
   RoundScore(0)=-500
   RoundScore(1)=-500
   Name="Default__TrDaDStats"
   ObjectArchetype=Object'Core.Default__Object'
}
