class TrTeamRabbitStats extends Object within TrHud;

var int MyTeam;
var int RemainingTime;
var bool bIsActive;
var bool bForcingUpdate;

var int TeamScore[2];
var int TeamHoldingFlag;

var GfxTrHud m_MoviePlayer;
var TrPlayerController TrPC;

function Initialize(TrPlayerController PC, GfxTrHud MP)
{
    TrPC = PC;
    m_MoviePlayer = MP;
}

function Show()
{
    if (bIsActive)
    {
        m_MoviePlayer.TeamRabbitStatsShow(true);
    }
}

function Hide()
{
    m_MoviePlayer.TeamRabbitStatsShow(false);
}

function Tick()
{
	local TrGameReplicationInfo GRI;
	GRI = TrGameReplicationInfo(TrPC.WorldInfo.GRI);

	if ( GRI == None ) return;

    UpdateTeam();
    UpdateFlagStatus(GRI);
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

function UpdateFlagStatus(TrGameReplicationInfo GRI)
{
    if (GRI.m_Flags[0] != none)
    {
        if (GRI.m_Flags[0].HolderPRI != none)
        {
            if (TeamHoldingFlag != GRI.m_Flags[0].HolderPRI.GetTeamNum())
            {
                TeamHoldingFlag = GRI.m_Flags[0].HolderPRI.GetTeamNum();

                if (TeamHoldingFlag == MyTeam)
                {
                    m_MoviePlayer.TeamRabbitStatsUpdateFlagStatus(0);
                }
                else
                {
                    m_MoviePlayer.TeamRabbitStatsUpdateFlagStatus(1);
                }
            }

            return;
        }
    }
    
    if (TeamHoldingFlag != -1)
    {
        TeamHoldingFlag = -1;
        m_MoviePlayer.TeamRabbitStatsUpdateFlagStatus(TeamHoldingFlag);
    }
}

function UpdateTeamScore(TrGameReplicationInfo GRI)
{
    local int i;

    for (i = 0; i < 2; i++)
    {
        if (GRI.Teams.Length > i && GRI.Teams[i] != none && TeamScore[i] != GRI.Teams[i].Score)
        {
            if (MyTeam == i && !bForcingUpdate)
            {
                m_MoviePlayer.TeamRabbitStatsPointBreak(0, "-"$string(int(TeamScore[i] - GRI.Teams[i].Score)));
            }
            else if (!bForcingUpdate)
            {
                m_MoviePlayer.TeamRabbitStatsPointBreak(1, "-"$string(int(TeamScore[i] - GRI.Teams[i].Score)));
            }

            TeamScore[i] = GRI.Teams[i].Score;

            if (TrPlayerOwner.GetTeamNum() == 255 && !TrPlayerOwner.InRovingSpectate()) TeamScore[i] = -1;

            if (MyTeam == i)
            {
                m_MoviePlayer.TeamRabbitStatsUpdateTeamScore(0, TeamScore[i]);
            }
            else
            {
                m_MoviePlayer.TeamRabbitStatsUpdateTeamScore(1, TeamScore[i]);
            }
        }

    }
}

function UpdateTime(TrGameReplicationInfo GRI)
{
    if (GRI.RemainingTime != RemainingTime)
    {
        m_MoviePlayer.TeamRabbitStatsUpdateTime(FormatTime(GRI.TimeLimit != 0 ? GRI.RemainingTime : GRI.ElapsedTime));
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
    TeamHoldingFlag = -1;

    bForcingUpdate = true;

    Tick();
    
    bForcingUpdate = false;
}

defaultproperties
{
   TeamHoldingFlag=-1
   Name="Default__TrTeamRabbitStats"
   ObjectArchetype=Object'Core.Default__Object'
}
