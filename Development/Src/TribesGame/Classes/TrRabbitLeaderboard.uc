//
//
//
class TrRabbitLeaderboard extends Object within TrHud;

var int PrevSlots;
var int RemainingTime;
var bool bUpdated, bInitialized, bIsActive;

var GFxTrHUD m_MoviePlayer;
var TrPlayerController TrPC;

struct LeaderboardSlot
{
    var Name PRIName;
    var int Score;
};

var LeaderboardSlot LeaderboardSlots[3];

function Initialize(TrPlayerController PC, GfxTrHud MP)
{
    TrPC = PC;
    m_MoviePlayer = MP;
	bInitialized = true;
}

function Show()
{
    if (bIsActive)
    {
        m_MoviePlayer.RabbitLeaderboardShow(true);
    }
}

function Hide()
{
    m_MoviePlayer.RabbitLeaderboardShow(false);
}

function Tick()
{
	local TrGameReplicationInfo GRI;
	GRI = TrGameReplicationInfo(TrPC.WorldInfo.GRI);

	if ( GRI == None ) return;

    UpdatePlayers(GRI);
    UpdateTime(GRI);
}

function UpdatePlayers(TrGameReplicationInfo GRI)
{
	local int i;
    local bool bDisplayed;

    for (i = 0; i < 3; i++)
	{
        if (GRI.m_RabbitLeaderBoard[i] == none)
        {
            if (!bDisplayed)
            {
                UpdateLeaderboard(i, TRPC.PlayerReplicationInfo.Name, TRPC.PlayerReplicationInfo.PlayerName, TRPC.PlayerReplicationInfo.Score);
            }

            // Make sure the other slots are clear
            for (i++; i < 3; i++)
            {
                UpdateLeaderboard(i, Name(""), "", 0);
            }

            return;
        }

        if (i == 2 && !bDisplayed)
        {
            UpdateLeaderboard(i, TRPC.PlayerReplicationInfo.Name, TRPC.PlayerReplicationInfo.PlayerName, TRPC.PlayerReplicationInfo.Score);
            return;
        }

        if (UpdateLeaderboard(i, GRI.m_RabbitLeaderBoard[i].Name, GRI.m_RabbitLeaderBoard[i].PlayerName, GRI.m_RabbitLeaderBoard[i].Score))
        {
            bDisplayed = true;
        }
	}
}

function bool UpdateLeaderboard(int Index, Name PRIName, string PlayerName, int Score)
{
    local string scoreString;

    if (LeaderboardSlots[Index].PRIName == PRIName && LeaderboardSlots[Index].Score == Score)
    {
        if (PRIName == TrPC.PlayerReplicationInfo.Name) return true;
        else return false;
    }

    LeaderboardSlots[Index].PRIName = PRIName;
    LeaderboardSlots[Index].Score = Score;

    if (PlayerName == "") scoreString = "";
    else scoreString = string(Score);

    m_MoviePlayer.RabbitLeaderboardUpdateSlot(Index, PlayerName, scoreString);

    if (PRIName == TrPC.PlayerReplicationInfo.Name) return true;
    else return false;
}

function UpdateTime(TrGameReplicationInfo GRI)
{
    if (GRI.RemainingTime != RemainingTime)
    {
        m_MoviePlayer.RabbitLeaderboardUpdateTime(FormatTime(GRI.TimeLimit != 0 ? GRI.RemainingTime : GRI.ElapsedTime));
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
    LeaderboardSlots[0].PRIName = name("");
    LeaderboardSlots[0].Score = 0;
    LeaderboardSlots[1].PRIName = name("");
    LeaderboardSlots[1].Score = 0;
    LeaderboardSlots[2].PRIName = name("");
    LeaderboardSlots[2].Score = 0;

    Tick();
}

defaultproperties
{
   PrevSlots=3
   Name="Default__TrRabbitLeaderboard"
   ObjectArchetype=Object'Core.Default__Object'
}
