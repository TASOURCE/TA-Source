class TrHUDTeamCTFStats extends Object within TrHud;

var int MyTeam;
var int RemainingTime;
var bool bIsActive;

var int FlagReturnTime[2];
var int TeamScore[2];
var int GeneratorPower[2];
var int GeneratorDowntime[2];
var EFlagState FlagState[2];
var PlayerReplicationInfo FlagHolderPRI[2];
var byte bEmptyFlagStatus[2];

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
        m_MoviePlayer.TeamCTFStatsShow(true);
    }
}

function Hide()
{
    m_MoviePlayer.TeamCTFStatsShow(false);
}

function Tick()
{
	local TrGameReplicationInfo GRI;
	GRI = TrGameReplicationInfo(TrPC.WorldInfo.GRI);

	if ( GRI == None ) return;

    UpdateTeam();
    UpdateFlagStatus(GRI);
    UpdateGeneratorStatus(GRI);
    UpdateTeamScore(GRI);
    UpdateTime(GRI);
}

function UpdateTeam()
{
	if( TrPC.PlayerReplicationInfo == none || TrPC.PlayerReplicationInfo.GetTeamNum() == 255 )
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

// If we are diamond sword, swap the left and right sides on our HUD
function int GetTeamIndex(int i)
{
    if (MyTeam == 1)
    {
        if (i == 1)
            return 0;
        
        return 1;
    }

    return i;

}

function UpdateFlagStatus(TrGameReplicationInfo GRI)
{
    local int i;
    local int j;

    for (i = 0; i < 2; i++)
    {
        j = GetTeamIndex(i);

		if (GRI.m_Flags[i] != none && GRI.m_Flags[i].HolderPRI != none)
		{
			if (GRI.m_Flags[i].HolderPRI != FlagHolderPRI[j])
			{
				bEmptyFlagStatus[j] = 0;
				FlagHolderPRI[j] = GRI.m_Flags[i].HolderPRI;
				FlagReturnTime[j] = -1;
				m_MoviePlayer.TeamCTFStatsUpdateFlagReturnTime(j, GRI.m_Flags[i].HolderPRI.PlayerName);
			}
		}
		else if (GRI.FlagReturnTime[i] != 0)
		{
			if (GRI.FlagReturnTime[i] != FlagReturnTime[j])
			{
				bEmptyFlagStatus[j] = 0;
				FlagReturnTime[j] = GRI.FlagReturnTime[i];
				FlagHolderPRI[j] = none;
				m_MoviePlayer.TeamCTFStatsUpdateFlagReturnTime(j, FlagReturnTime[j] > 0 ? FormatTime(FlagReturnTime[j]) : "");
			}
		}
		else
		{
			if (bEmptyFlagStatus[j] != 1)
			{
				bEmptyFlagStatus[j] = 1;
				FlagHolderPRI[j] = none;
				FlagReturnTime[j] = -1;
				m_MoviePlayer.TeamCTFStatsUpdateFlagReturnTime(j, "");
			}
		}

	    if (GRI.FlagState[i] != FlagState[j])
	    {
            FlagState[j] = GRI.FlagState[i];
            m_MoviePlayer.TeamCTFStatsUpdateFlagStatus(j, FlagState[j] == FLAG_Home ? true : false);
	    }
    }
}

function UpdateGeneratorStatus(TrGameReplicationInfo GRI)
{
    local int i;
    local int j;

    for (i = 0; i < 2; i++)
    {
        j = GetTeamIndex(i);

	    if (GRI.GeneratorDowntime[i] != GeneratorDowntime[j])
	    {
            GeneratorDowntime[j] = GRI.GeneratorDowntime[i];
            m_MoviePlayer.TeamCTFStatsUpdateGeneratorTimer(j, GeneratorDowntime[j] > 0 ? FormatTime(GeneratorDowntime[j]) : "");
	    }
    }
    
    for (i = 0; i < 2; i++)
    {
        j = GetTeamIndex(i);

	    if (GRI.GeneratorPower[i] != GeneratorPower[j])
	    {
            GeneratorPower[j] = GRI.GeneratorPower[i];
            m_MoviePlayer.TeamCTFStatsUpdateGeneratorStatus(j, GeneratorPower[j] > 0 ? true : false);
	    }
    }
}

function UpdateTeamScore(TrGameReplicationInfo GRI)
{
    local int i;
    local int j;

    for (i = 0; i < 2; i++)
    {
        j = GetTeamIndex(i);

        if (GRI.Teams.Length > i && GRI.Teams[i] != none && TeamScore[j] != GRI.Teams[i].Score)
        {
            TeamScore[j] = GRI.Teams[i].Score;

            if (TrPlayerOwner.GetTeamNum() == 255 && !TrPlayerOwner.InRovingSpectate()) TeamScore[j] = -1;

            m_MoviePlayer.TeamCTFStatsUpdateTeamScore(j, TeamScore[j]);
        }

    }
}

function UpdateTime(TrGameReplicationInfo GRI)
{
    if (GRI.RemainingTime != RemainingTime)
    {
        m_MoviePlayer.TeamCTFStatsUpdateTime(FormatTime(GRI.TimeLimit != 0 ? GRI.RemainingTime : GRI.ElapsedTime));
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
    GeneratorPower[0] = -1;
    GeneratorPower[1] = -1;
    GeneratorDowntime[0] = -1;
    GeneratorDowntime[1] = -1;
    FlagState[0] = FLAG_Home;
    FlagState[1] = FLAG_Home;
	FlagReturnTime[0] = -1;
	FlagReturnTime[1] = -1;
	FlagHolderPRI[0] = none;
	FlagHolderPRI[1] = none;
	bEmptyFlagStatus[0] = 0;
	bEmptyFlagStatus[1] = 0;

    Tick();
}

defaultproperties
{
   FlagReturnTime(0)=-1
   FlagReturnTime(1)=-1
   GeneratorPower(0)=1
   GeneratorPower(1)=1
   Name="Default__TrHUDTeamCTFStats"
   ObjectArchetype=Object'Core.Default__Object'
}
