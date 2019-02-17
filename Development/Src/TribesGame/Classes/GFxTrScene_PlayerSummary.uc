/**
 * GFxTrScene_PlayerSummary
 * 
 * This scene shows summaries of your last matches with player stats/accolades
 */

class GFxTrScene_PlayerSummary extends GFxTrScene
    native;

var int       AWARD_TIER_SIZE;

var int       SkillClassId;
var int       MiscDataCount;
var int       AwardDataCount;
var int       AccoladeDataCount;
var GFxObject MiscDataList;
var GFxObject AwardDataList;
var GFxObject AccoladeDataList;

var int       PlayerId;
var int       Kills;
var int       Deaths;
var int       Assists;
var int       Credits;
var int       TopPlayedClass;
var int       RankBase;
var int       RankGained;
var string    PlayerName;

var int       XPBase;
var int       XPPerf;
var int       XPVIP;
var int       XPBoost;

var int       EarnedBadgeValue;

var bool      bUseSNS;
var bool      bFirstWin;
var bool      bSummaryReady;
var bool      bSummaryTweened;
var bool      bSummaryXPTweened;

var array<PropertyPair> AwardData;
var array<PropertyPair> AccoladeData;

var array<BadgeStruct>  EarnedBadges;

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

    PlayerId = 0;
    Kills = 0;
    Deaths = 0;
    Assists = 0;
    Credits = 0;
    TopPlayedClass = 0;
    RankBase = 0;
    RankGained = 0;
    PlayerName = "";

    for (i = AwardData.Length; i > 0; i--)
    {
        AwardData.Remove(i-1, 1);
    }
    
    for (i = AccoladeData.Length; i > 0; i--)
    {
        AccoladeData.Remove(i-1, 1);
    }
}

function ClearEarnedBadgeValue()
{
    local int i;

    EarnedBadgeValue = 0;

    for (i = EarnedBadges.Length; i > 0; i--)
    {
        EarnedBadges.Remove(i-1, 1);
    }
}

/**
 * SummaryReady - Called when the match ends and the data object has been loadde
 * Use this to tell the UI we are ready to rock.
 */
event SummaryReady()
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    bFirstWin = false;
    bSummaryReady = true;
    bSummaryTweened = false;
    bSummaryXPTweened = false;

    if (TrPC != none)
    {
        PlayerName = TrPC.PlayerReplicationInfo.PlayerName;
        TrPC.StartUILoadSummaryTimer();
    }
    else
    {
        bFirstWin = TrPC.r_bDailyCompleted;
        TrOuter.ASC_LoadPlayerSummary();
    }
}

function LoadXPData(GFxObject List)
{
    List.SetFloat("base", XPBase);
    List.SetFloat("vip", XPVIP);
    List.SetFloat("boost", XPBoost);
    List.SetFloat("bVIP", int(TrOuter.PlayerProfile.bVIP));
    List.SetFloat("bBoost", int(TrOuter.PlayerProfile.bBoost));
}

function LoadPlayerStatsData(GFxObject List)
{
    local int i;
    local array<PropertyPair> awardArray;

    AwardDataCount = 0;
    AwardDataList = List;

    awardArray = AwardData;
    SummaryHelper.SortPlayerAwards(awardArray);
    
    for (i = awardArray.Length; i > 0; i--)
    {
        if (awardArray[i-1].PropertyId <= 0) continue;

        AddAward(awardArray[i-1].PropertyId, awardArray[i-1].Value);
    }
}

function LoadPlayerAccoladeData(GFxObject List)
{
    local int i;

    AccoladeDataCount = 0;
    AccoladeDataList = List;

    //Badges first
    for (i = EarnedBadges.Length; i > 0; i--)
    { 
        AddBadge(EarnedBadges[i-1]);
    }

    for (i = AccoladeData.Length; i > 0; i--)
    {
        if (AccoladeData[i-1].PropertyId <= 0) continue;

        AddAccolade(AccoladeData[i-1].PropertyId, AccoladeData[i-1].Value);
    }
}

function LoadPlayerMiscData(GFxObject List)
{
    MiscDataCount = 0;
    MiscDataList = List;

    AddMiscData();
}

function AddAward(int AwardId, int Val)
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
    obj.SetString("playerName", "");
    obj.SetString("statNumber", Val@units);

    AwardDataList.SetElementObject(AwardDataCount++, obj);
}

function AddBadge(BadgeStruct Badge)
{
    local GFxObject obj;
    
    obj = Outer.CreateObject("Object");
    obj.setFloat("frameNum", Badge.Icon);
    obj.SetString("playerName", "");
    obj.SetString("accoladeName", Badge.Title);
    obj.SetString("multiplier", "");

    AccoladeDataList.SetElementObject(AccoladeDataCount++, obj);
}

function AddAccolade(int AccoladeId, int Val)
{
    local GFxObject obj;
    local class<TrAccolade> accolade;

    accolade = SummaryHelper.GetAccoladeFromId(AccoladeId);

    if (accolade == none) return;
    
    obj = Outer.CreateObject("Object");
    obj.setFloat("frameNum", accolade.default.IconIndex);
    obj.SetString("playerName", "");
    obj.SetString("accoladeName", accolade.default.FriendlyName);
    obj.SetString("multiplier", string(Val));

    AccoladeDataList.SetElementObject(AccoladeDataCount++, obj);
}

function AddMiscData()
{
    local int  xpPercent;
    local bool bVip;
    local bool bBoost;
    local float xpTotal;
    local float xpBasePercent;
    local float xpGainedPercent;
    local GFxObject obj;
    local class<TrRank> currRank;
    local class<TrRank> nextRank;

    currRank = SummaryHelper.GetRankFromXP(RankBase + RankGained);

    // Max rank, set everything to max
    if (currRank.default.Rank >= 50)
    {
        currRank = class<TrRank>(DynamicLoadObject("TribesGame.TrRank_50", class'Class'));
        nextRank = class<TrRank>(DynamicLoadObject("TribesGame.TrRank_50", class'Class'));

        xpBasePercent = 100;
        xpGainedPercent = 100;
    }
    else
    {
        xpBasePercent = RankBase - currRank.default.RequiredXP;
        xpGainedPercent = RankBase + RankGained - currRank.default.RequiredXP;

        nextRank = SummaryHelper.GetNextRank(currRank);

        xpBasePercent /= float(nextRank.default.RequiredXP - currRank.default.RequiredXP);
        xpGainedPercent /= float(nextRank.default.RequiredXP - currRank.default.RequiredXP);
    }

    XPPerf += EarnedBadgeValue;

    bVip = TrOuter.PlayerProfile.bVIP;
    bBoost = TrOuter.PlayerProfile.bBoost;

    obj = Outer.CreateObject("Object");

    xpTotal = XPBase + XPPerf;
    
    XPVIP += EarnedBadgeValue * 0.5f;

    if (bVip) xpTotal += XPVIP;
    
    XPBoost += EarnedBadgeValue * 1.5f;
    
    if (bBoost) xpTotal += XPBoost;

    if (bFirstWin) xpTotal += 1200;

    obj.SetString("playerSumLabel", "PLAYER SUMMARY");
    obj.SetString("accoladesLabel", "BADGES AND ACCOLADES");
    obj.SetString("xpLabel", "EXPERIENCE GAINED");
    obj.SetString("resultsLabel", "MATCH RESULTS");
    obj.SetString("rankLabel", "RANK PROGRESSION");
    obj.SetString("statsLabel", "PERSONAL STATISTICS");
    
    obj.SetString("baseMatchLabel", "BASE XP");

    // Get Base XP Values

    xpPercent = (float(XPBase)/float(XPBoost))*100;

    if (xpPercent == 0 && XPBase > 0) xpPercent = 1;
    if (xpPercent > 100) xpPercent = 100;

    if (XPBase > 0) obj.SetFloat("baseMatchPercentage", xpPercent);
    else obj.SetFloat("baseMatchPercentage", 0.1f);

    obj.SetString("baseMatchValue", string(XPBase));

    // Get Bonus XP Values

    obj.SetString("perfMatchLabel", "BONUS XP");
    
    if (bFirstWin) XPPerf += 1200;

    xpPercent = (float(XPPerf)/float(XPBoost))*100;
    
    if (xpPercent == 0 && XPPerf > 0) xpPercent = 1;
    if (xpPercent > 100) xpPercent = 100;    

    if (XPPerf > 0) obj.SetFloat("perfMatchPercentage", xpPercent);
    else obj.SetFloat("perfMatchPercentage", 0.1f);

    obj.SetString("perfMatchValue", string(XPPerf));

    // Get VIP XP Values

    obj.SetFloat("bIsVIP", bVIP ? 1 : 0);
    obj.SetString("vipMatchLabel", "VIP");

    if (XPBase > 0) obj.SetFloat("vipMatchPercentage", 33);
    else obj.SetFloat("vipMatchPercentage", 0.1f);

    if (bVip) obj.SetString("vipMatchValue", string(XPVIP));
    else obj.SetString("vipMatchValue", "NOT EARNED");

    // Get Boost XP Values

    obj.SetFloat("bIsBoosted", bBoost ? 1 : 0);
    obj.SetString("boostMatchLabel", "BOOST");

    if (XPBase > 0) obj.SetFloat("boostMatchPercentage", 100);
    else obj.SetFloat("boostMatchPercentage", 0.1f);
    
    if (bBoost) obj.SetString("boostMatchValue", string(XPBoost));
    else obj.SetString("boostMatchValue", "NOT EARNED");

    obj.SetString("matchTotalLabel", "TOTAL");
    obj.SetFloat("matchTotalValue", xpTotal);

    TrOuter.CheckRibbons();

    if (true)//TrOuter.RibbonManager.bHaveUnlocks)
    {
        obj.SetFloat("bIsAvailableBtn", 1);
        obj.SetString("availBtnLabel", "UNLOCKS AVAILABLE");
        obj.SetFloat("availBtnActionID", 1);
    }
    else if (TrOuter.RibbonManager.bHaveUnlocks)
    {
        obj.SetFloat("bIsAvailableBtn", 1);
        obj.SetString("availBtnLabel", "UPGRADES AVAILABLE");
        obj.SetFloat("availBtnActionID", 1);
    }
    else
    {
        obj.SetFloat("bIsAvailableBtn", 0);
        obj.SetString("availBtnLabel", "");
    }

    if (bBoost)
    {
        obj.SetFloat("bBuyBoostBtn", 0);
        obj.SetString("boostBtnLabel", "");
    }
    else
    {
        obj.SetFloat("bBuyBoostBtn", 1);
        obj.SetString("boostBtnLabel", "BUY BOOST");
        obj.SetFloat("boostBtnActionID", 2);
    }

	obj.SetString("oldRankLabel", currRank.default.FriendlyName);
	obj.SetString("oldRankNumber", string(currRank.default.Rank));
	obj.SetFloat("oldRankIconFrame", currRank.default.IconIndex);
	obj.SetString("newRankLabel", nextRank.default.FriendlyName);
	obj.SetString("newRankNumber", string(nextRank.default.Rank));
	obj.SetFloat("newRankIconFrame", nextRank.default.IconIndex);

    obj.SetFloat("rankPercentStart", xpBasePercent);
    obj.SetFloat("rankPercentEnd", xpGainedPercent);

    obj.SetString("killLabel", "KILLS");
    obj.SetString("killValue", string(Kills));
    obj.SetString("assistLabel", "ASSISTS");
    obj.SetString("assistValue", string(Assists));
    obj.SetString("deathLabel", "DEATHS");
    obj.SetString("deathValue", string(Deaths));
    obj.SetString("scoreLabel", "SCORE");
    obj.SetString("scoreValue", string(Credits));

    obj.SetString("flagGrabLabel", "FLAG GRABS");
    obj.SetString("flagGrabValue", string(GetFlagGrabCount()));
    obj.SetString("flagReturnLabel", "FLAG RETURNS");
    obj.SetString("flagReturnValue", string(GetFlagReturnCount()));

    obj.SetString("matchIdLabel", "MATCH ID# 0");
    obj.SetString("matchDataLabel", "MATCH TIME: 2/12/12");

    MiscDataList.SetElementObject(MiscDataCount++, obj);

    ClearEarnedBadgeValue();
}

function int GetFlagGrabCount()
{
    local int i;
    local int count;

    for (i = 0; i < AccoladeData.Length; i++)
    {
        switch (AccoladeData[i].PropertyId)
        {
        case STAT_ACO_FLAG_GRAB:
        case STAT_ACO_FLAG_GRABDM:
        case STAT_ACO_FLAG_GRABFAST:
        case STAT_ACO_FLAG_GRABE:
        case STAT_ACO_FLAG_GRABLLAMA:
        case STAT_ACO_FLAG_GRABULTRA:
            count += AccoladeData[i].Value;
        default:
            break;
        }
    }

    return count;
}

function int GetFlagReturnCount()
{
    local int i;
    local int count;

    for (i = 0; i < AccoladeData.Length; i++)
    {
        switch (AccoladeData[i].PropertyId)
        {
        case STAT_ACOW_FLAG_RETURN:
            count += AccoladeData[i].Value;
        default:
            break;
        }
    }

    return count;
}

defaultproperties
{
   AWARD_TIER_SIZE=3
   Name="Default__GFxTrScene_PlayerSummary"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
