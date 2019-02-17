/**
 * GFxTrScene_MatchSummary
 * 
 * This scene shows summaries of your last matches with player stats/accolades
 */

class GFxTrScene_MatchSummary extends GFxTrScene
    dependson(TrSummaryHelper)
    native;

struct native ScoreSlot
{
    var int Kills;
    var int Rank;
    var int Assists;
    var int Credits;
    var int PlayerId;
    var string PlayerName;
};

var int       SCOREBOARD_SIZE;

var int       MiscDataCount;
var int       AwardDataCount;
var int       AccoladeDataCount;
var int       ScoreboardDataCount;
var GFxObject MiscDataList;
var GFxObject AwardDataList;
var GFxObject AccoladeDataList;
var GFxObject ScoreboardDataList;

var int       WinningTeam;
var int       MatchId;
var int       MatchMapId;
var int       MatchGameType;
var int       MatchDuration;
var int       MatchDate;
var int       Team1Score;
var int       Team2Score;

var bool      bUseSNS;

var ScoreSlot Scoreboard[32];

var array<MVPAward> MVPAwards;
var array<MVPAward> MVPAccolades;

var TrSummaryHelper SummaryHelper;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();

    if (SummaryHelper == none) SummaryHelper = new class'TrSummaryHelper';

    bSceneCreated = true;
}

/** Clears out our existing summary page to load new values. */
event ClearSummary()
{
    local int i;

    WinningTeam = 0;
    MatchId = 0;
    MatchMapId = 0;
    MatchGameType = 0;
    MatchDuration = 0;
    MatchDate = 0;
    Team1Score = 0;
    Team2Score = 0;

    for (i = MVPAwards.Length; i > 0; i--)
    {
        MVPAwards.Remove(i-1, 1);
    }
    
    for (i = MVPAccolades.Length; i > 0; i--)
    {
        MVPAccolades.Remove(i-1, 1);
    }
}

/**
 * MatchSummaryReady - Called when the match ends and the data object has been loaded
 * Use this to spring the calls to load the scoreboard data and tell the UI we are
 * ready to rock.
 */
event SummaryReady()
{
    PopulateScoreboardDataFromGRI();

    TrOuter.ASC_LoadMatchSummary();
}

function LoadTeamStatsData(GFxObject List)
{
    local int i;
    local array<MVPAward> awardArray;

    AwardDataCount = 0;
    AwardDataList = List;

    awardArray = MVPAwards;
    SummaryHelper.SortMVPAwards(awardArray);
    
    for (i = awardArray.Length; i > 0; i--)
    {
        if (awardArray[i-1].AwardId <= 0) continue;

        AddAward(awardArray[i-1].PlayerId, awardArray[i-1].AwardId, awardArray[i-1].Value);
    }
}

function LoadTeamAccoladeData(GFxObject List)
{
    local int i;

    AccoladeDataCount = 0;
    AccoladeDataList = List;
    
    for (i = MVPAccolades.Length; i > 0; i--)
    {
        if (MVPAccolades[i-1].AwardId <= 0) continue;

        AddAccolade(MVPAccolades[i-1].PlayerId, MVPAccolades[i-1].AwardId, MVPAccolades[i-1].Value);
    }
}

function LoadTeamScoreboardData(GFxObject List)
{
    local int i;

    ScoreboardDataCount = 0;
    ScoreboardDataList = List;

    for (i = 0; i < SCOREBOARD_SIZE; i++)
    {
        AddScoreSlot(Scoreboard[i].PlayerName, Scoreboard[i].Kills, Scoreboard[i].Assists, Scoreboard[i].Credits, Scoreboard[i].Rank);
    }
}

function LoadTeamMiscData(GFxObject List)
{
    MiscDataCount = 0;
    MiscDataList = List;

    AddMiscData();
}

function AddAward(int PlayerId, int AwardId, int Val)
{
    local GFxObject obj;
    local string units;
    local class<TrAward> award;

    award = SummaryHelper.GetAwardFromId(AwardId);

    if (award == none) return;
    
    units = award.default.Units;

    if (bUseSNS)
    {
        if (AwardId == STAT_AWD_SPEED_SKIED) units = "SANICS";
        else if (AwardId == STAT_AWD_SPEED_FLAGGRAB) units = "SANIC GRAB";
    }

    obj = Outer.CreateObject("Object");
    obj.SetString("statLabel", SummaryHelper.GetTierTitle(Val, award));
    obj.SetString("playerName", FindPlayerName(PlayerId));
    obj.SetString("statNumber", Val@units);

    AwardDataList.SetElementObject(AwardDataCount++, obj);
}

function AddAccolade(int PlayerId, int AccoladeId, int Val)
{
    local GFxObject obj;
    local class<TrAccolade> accolade;

    accolade = SummaryHelper.GetAccoladeFromId(AccoladeId);

    if (accolade == none) return;

    obj = Outer.CreateObject("Object");
    obj.setFloat("frameNum", accolade.default.IconIndex);
    obj.SetString("playerName", FindPlayerName(PlayerId));
    obj.SetString("accoladeName", accolade.default.FriendlyName);
    obj.SetFloat("multiplier", Val);

    AccoladeDataList.SetElementObject(AccoladeDataCount++, obj);
}

function AddScoreSlot(string PlayerName, int Kills, int Assists, int Credits, int Rank)
{
    local GFxObject obj;

    obj = Outer.CreateObject("Object");

    if (PlayerName == "")
    {
        obj.SetString("playerName", "");
        obj.SetString("score", "");
        obj.SetString("assist", "");
        obj.SetString("kills", "");
        obj.setFloat("frameNum", -1);
        obj.setFloat("isMuted", -1);
        obj.setFloat("isFriend", 1);
    }
    else
    {
        obj.SetString("playerName", PlayerName);
        obj.SetString("score", string(Credits));
        obj.SetString("assist", string(Assists));
        obj.SetString("kills", string(Kills));
        obj.setFloat("frameNum", Rank);

        if (PlayerName == GetPC().PlayerReplicationInfo.PlayerName)
        {
            obj.setFloat("isMuted", -1);
            obj.setFloat("isFriend", 1);
        }
        else
        {
            obj.setFloat("isMuted", TrPlayerController(GetPC()).IsTrPlayerMuted(PlayerName) ? 1 : 0);
            obj.setFloat("isFriend", TrOuter.Friends.IsFriend(PlayerName) ? 1 : 0);
        }
    }

    ScoreboardDataList.SetElementObject(ScoreboardDataCount++, obj);
}

function AddMiscData()
{
    local GFxObject obj;

    obj = Outer.CreateObject("Object");

	obj.SetFloat("mapNumber", MatchMapId);
    obj.SetString("scoreboardLabel", "SCOREBOARD");
    obj.SetString("accoladesLabel", "TOP ACCOLADES");
    obj.SetString("statsLabel", "MVP STATISTICS");
    obj.SetString("resultTF", FormatResult(WinningTeam));
    obj.SetString("matchTimeTF", FormatTime(MatchDuration));
    obj.SetString("redTeamScore", string(Team1Score));
    obj.SetString("redTeamLabel", "BLOOD EAGLE");
    obj.SetString("blueTeamScore", string(Team2Score));
    obj.SetString("blueTeamLabel", "DIAMOND SWORD");

    switch (MatchGameType)
    {
    case 1:  obj.SetString("gametypeTF", "CAPTURE THE FLAG"); break;
    case 2:  obj.SetString("gametypeTF", "TEAM DEATHMATCH");  break;
    case 3:  obj.SetString("gametypeTF", "RABBIT");           break;
    case 4:  obj.SetString("gametypeTF", "ARENA");            break;
    case 5:  obj.SetString("gametypeTF", "CAPTURE AND HOLD"); break;
    default: obj.SetString("gametypeTF", "TRIBES");           break;
    }

    MiscDataList.SetElementObject(MiscDataCount++, obj);
}

function string FormatResult(int aWinningTeam)
{
    local int teamNum;
    local PlayerController PC;

    PC = GetPC();

    if (PC == none) return "";
    
    teamNum = PC.PlayerReplicationInfo.GetTeamNum();

    if (teamNum == aWinningTeam) return "VICTORY";
    else return "DEFEAT";
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

function string FindPlayerName(int PlayerId)
{
    local int i;

	for (i = 0; i < SCOREBOARD_SIZE; i++ )
	{
        if (Scoreboard[i].PlayerId == PlayerId) return Scoreboard[i].PlayerName;
	}

    return "Player";
}

function PopulateScoreboardDataFromGRI()
{
    local int i;
    local int slotIndex;
    local int BESlot;
    local int DSSlot;
	local TrPlayerController TrPC;
	local TrGameReplicationInfo TrGRI;
	local TrPlayerReplicationInfo TrPRI;
    local array<PlayerReplicationInfo> PRIArray;

    // Clear out any existing data and intialize
	for (i = 0; i < SCOREBOARD_SIZE; i++ )
	{
        Scoreboard[i].Assists = 0;
        Scoreboard[i].Credits = 0;
        Scoreboard[i].Kills = 0;
        Scoreboard[i].PlayerId = 0;
        Scoreboard[i].PlayerName = "";
        Scoreboard[i].Rank = -1;
	}

    TrPC = TrPlayerController(GetPC());

    if (TrPC == none) return;
    
	TrGRI = TrGameReplicationInfo(TrPC.WorldInfo.GRI);

    if (TrGRI == none) return;

    PRIArray = TrGRI.PRIArray;

    // Sort by player credits, assume CTF for now
    PRIArray.Sort(CreditsSort);

    BESlot = 0;
    DSSlot = 16;
    
	for (i = 0; i < PRIArray.Length; i++ )
	{
		TrPRI = TrPlayerReplicationInfo(PRIArray[i]);

        if (TrPRI.GetTeamNum() == 0)
        {
            slotIndex = BEslot;

            if (slotIndex > 15) continue;
        }
        else if (TrPRI.GetTeamNum() == 1)
        {
            slotIndex = DSSlot;

            if (slotIndex > 31) continue;
        }
        else
        {
            continue;
        }
        
        // Optimization - Save off playerId for lookups on awards/accolades later
        Scoreboard[slotIndex].PlayerId = TrPRI.UniqueId.Uid.A;
        Scoreboard[slotIndex].PlayerName = TrPRI.PlayerName;
        Scoreboard[slotIndex].Credits = TrPRI.m_nCreditsEarned;
        Scoreboard[slotIndex].Kills = TrPRI.m_nKills;
        Scoreboard[slotIndex].Assists = TrPRI.m_nAssists;
        Scoreboard[slotIndex].Rank = TrPRI.GetRankIcon();
        
        if (TrPRI.GetTeamNum() == 0) BESlot++;
        else DSSlot++;
	}
}

delegate int CreditsSort(TrPlayerReplicationInfo A, TrPlayerReplicationInfo B) { return A.m_nCreditsEarned < B.m_nCreditsEarned ? -1 : 0; }

defaultproperties
{
   SCOREBOARD_SIZE=32
   Name="Default__GFxTrScene_MatchSummary"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
