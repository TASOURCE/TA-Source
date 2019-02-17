//
//
//
class TrScoreboard extends Object within TrHud;

var int MAX_PLAYER_INDEX;
var int BESlots, DSSlots, PrevBESlots, PrevDSSLots, PrevActiveSlot, DSOffset, BEIndex, DSIndex;
var bool bTeamGame, bUpdated, bInitialized, bIsActive, bCheckPing;

struct TrScoreSlot
{
	var string PlayerName;
    var string ClassAbb;
    var int Kills;
	var int Assists;
	var int Score;
	var int Ping;
	var int Rank;
	var int RankIcon;
};

struct TrScoreboardState
{
    var int RemainingTime;
    var int BloodEagleScore;
    var int DiamondSwordScore;
};

var GfxTrHud m_MoviePlayer;
var TrScoreSlot ScoreboardSlots[32];
var TrScoreboardState PreviousState;
var TrPlayerController TrPC;

function Initialize(TrPlayerController PC, GFxTrHud MP)
{
    TrPC = PC;
    m_MoviePlayer = MP;

	ConfigScoreboard();
}

function Show(bool bIsTeamGame)
{
    bIsActive = true;
    bCheckPing = true;

    PrevActiveSlot = -1;

	if (bTeamGame != bIsTeamGame)
	{
        bTeamGame = bIsTeamGame;
		ConfigScoreboard();		
	}

    if (bTeamGame)
    {
        m_MoviePlayer.TeamScoreboardShow(true);
    }
    else
    {
        m_MoviePlayer.RabbitScoreboardShow(true);
    }
}

function Hide()
{
    if (bTeamGame)
    {
        m_MoviePlayer.TeamScoreboardShow(false);
    }
    else
    {
        m_MoviePlayer.RabbitScoreboardShow(false);
    }

    bIsActive = false;
}

function ConfigScoreboard()
{
    local int i;

    if (bTeamGame)
    {
        PrevBESLots = 16;
        PrevDSSLots = 16;

        m_MoviePlayer.TeamScoreboardActivePlayer(-1);

        for (i = 0; i < 32; i++)
        {
            m_MoviePlayer.TeamScoreboardUpdateSlot(i, "", "", "", "", "", "", -1, -1);
        }
    }
    else
    {
        PrevBESLots = 8;
        PrevDSSLots = 0;

        for (i = 0; i < 8; i++)
        {
            m_MoviePlayer.RabbitScoreboardActivePlayer(i, false);
            m_MoviePlayer.RabbitScoreboardUpdateSlot(i, "", "", "", "", "", "", -1, -1);
        }
    }

    for (i = 0; i < 32; i++)
    {
        ScoreboardSlots[i].PlayerName = "";
        ScoreboardSlots[i].Assists = -1;
        ScoreboardSlots[i].Kills = -1;
        ScoreboardSlots[i].Score = -1;
        ScoreboardSlots[i].Ping = -1;
        ScoreboardSlots[i].Rank = -1;
    }
    

    PreviousState.RemainingTime = -2;
    PreviousState.BloodEagleScore = -2;
    PreviousState.DiamondSwordScore = -2;

	bInitialized = true;
}

function Tick(Float DeltaTime)
{
	local TrGameReplicationInfo GRI;
    
	GRI = TrGameReplicationInfo(TrPC.WorldInfo.GRI);

	if ( GRI != None )
	{
		UpdateHeaders(GRI);
		UpdatePRILists(GRI);
	}
}

/** 
  *  Make sure the PRI lists reflect current player state
  */
function UpdatePRILists(TrGameReplicationInfo TrGRI)
{
	local int i;
    local int slot;
    local int activeSlot;
    local array<PlayerReplicationInfo> PRIArray;
	local TrPlayerReplicationInfo TrPRI;

    BESlots = 0;
    DSSlots = 0;
    bUpdated = false;
    activeSlot = PrevActiveSlot;

    PRIArray = TrGRI.PRIArray;

    // Sort by player credits
    if (bTeamGame)
    {
        //PRIArray = GetBestSortArray(PRIArray);
        PRIArray.Sort(CreditsSort);
    }
    
    // Set up lists of Red/Blue players - each list only has 16 slots.
	for (i = 0; i < PRIArray.Length; i++ )
	{
		TrPRI = TrPlayerReplicationInfo(PRIArray[i]);
		
		if ( TrPRI == none || !IsValidScoreboardPlayer(TrPRI) || TrPRI.bOnlySpectator)
		{
            continue;
		}
        
        if (TrPRI.GetTeamNum() == BEIndex || !bTeamGame)
        {
            if (BESlots > MAX_PLAYER_INDEX)
            {
                if (PRIArray[i] != TrPC.PlayerReplicationInfo)
                {
                    continue;
                }

                slot = MAX_PLAYER_INDEX;
            }
            else
            {
                slot = BESlots;
                BESlots++;
            }
        }
        else
        {
            if (DSSlots > MAX_PLAYER_INDEX)
            {
                if (PRIArray[i] != TrPC.PlayerReplicationInfo)
                {
                    continue;
                }

                slot = MAX_PLAYER_INDEX + DSOffset;
            }
            else
            {
                slot = DSSlots + DSOffset;
                DSSlots++;
            }
        }

        if (UpdateSlot(slot, TrPRI))
        {
            if (bTeamGame)
            {
                m_MoviePlayer.TeamScoreboardUpdateSlot(slot, ScoreboardSlots[slot].PlayerName, string(ScoreboardSlots[slot].Score), string(ScoreboardSlots[slot].Kills), string(ScoreboardSlots[slot].Assists), string(ScoreboardSlots[slot].Ping), ScoreboardSlots[slot].ClassAbb, ScoreboardSlots[slot].Rank, ScoreboardSlots[slot].RankIcon);
            }
            else
            {
                m_MoviePlayer.RabbitScoreboardUpdateSlot(slot, ScoreboardSlots[slot].PlayerName, string(ScoreboardSlots[slot].Score), string(ScoreboardSlots[slot].Kills), string(ScoreboardSlots[slot].Assists), string(ScoreboardSlots[slot].Ping), ScoreboardSlots[slot].ClassAbb, ScoreboardSlots[slot].Rank, ScoreboardSlots[slot].RankIcon);
            }
        }
        
        // Set the active player to me so we can highlight on the board
        if (TrPRI.PlayerName == TrPC.PlayerReplicationInfo.PlayerName)
        {
            activeSlot = slot;
        }
	}

	// Clear extraneous Blood Eagle slots
	for (i = BESlots; i < PrevBESlots; i++)
	{
        if (ClearSlot(i))
        {
            if (bTeamGame)
            {
                m_MoviePlayer.TeamScoreboardUpdateSlot(i, "", "", "", "", "", "", -1, -1);
            }
            else
            {
                m_MoviePlayer.RabbitScoreboardUpdateSlot(i, "", "", "", "", "", "", -1, -1);
            }
        }
	}
    
	// Clear extraneous Diamond Sword slots
    for (i = DSSlots + DSOffset; i < (PrevDSSLots + DSOffset); i++)
    {
        if (ClearSlot(i))
        {
            if (bTeamGame)
            {
                m_MoviePlayer.TeamScoreboardUpdateSlot(i, "", "", "", "", "", "", -1, -1);
            }
            else
            {
                m_MoviePlayer.RabbitScoreboardUpdateSlot(i, "", "", "", "", "", "", -1, -1);
            }
        }
    }

    if (bUpdated)
    {
        if (activeSlot != PrevActiveSlot)
        {
            if (bTeamGame)
            {
                m_MoviePlayer.TeamScoreboardActivePlayer(activeSlot);
                m_MoviePlayer.TeamScoreboardUpdateSlot(activeSlot, ScoreboardSlots[activeSlot].PlayerName, string(ScoreboardSlots[activeSlot].Score), string(ScoreboardSlots[activeSlot].Kills), string(ScoreboardSlots[activeSlot].Assists), string(ScoreboardSlots[activeSlot].Ping), ScoreboardSlots[activeSlot].ClassAbb, ScoreboardSlots[activeSlot].Rank, ScoreboardSlots[activeSlot].RankIcon);
            }
            else
            {
                m_MoviePlayer.RabbitScoreboardActivePlayer(PrevActiveSlot, false);
                m_MoviePlayer.RabbitScoreboardActivePlayer(activeSlot, true);
                m_MoviePlayer.RabbitScoreboardUpdateSlot(activeSlot, ScoreboardSlots[activeSlot].PlayerName, string(ScoreboardSlots[activeSlot].Score), string(ScoreboardSlots[activeSlot].Kills), string(ScoreboardSlots[activeSlot].Assists), string(ScoreboardSlots[activeSlot].Ping), ScoreboardSlots[activeSlot].ClassAbb, ScoreboardSlots[activeSlot].Rank, ScoreboardSlots[activeSlot].RankIcon);
            }

            PrevActiveSlot = activeSlot;
        }

        PrevBESlots = BESlots;
        PrevDSSlots = DSSlots;
    }
    
    bCheckPing = false;
}

function array<PlayerReplicationInfo> GetBestSortArray(array<PlayerReplicationInfo> PRIArray)
{
    local int rank;
    local int nextRank;
    local array<PlayerReplicationInfo> rankArray;
    local array<PlayerReplicationInfo> nextArray;

    rankArray = PRIArray;
    nextArray = PRIArray;

    // Check credits earned rank
    rankArray.Sort(CreditsSort);
    rank = GetRank(rankArray);

    if (rank == 1) return rankArray;

    // Check kills rank
    nextArray.Sort(KillsSort);
    rank = GetRank(nextArray);

    if (nextRank == 1) return nextArray;
    if (nextRank < rank)
    {
        rankArray = nextArray;
        nextRank = rank;
    }
    
    nextArray.Sort(AssistsSort);
    nextRank = GetRank(nextArray);

    if (nextRank < rank )
    {
        return nextArray;
    }

    return rankArray;
}

function int GetRank(array<PlayerReplicationInfo> PRIArray)
{
    local int i;

    for (i = 0; i < PRIArray.Length; i++)
    {
        if (PRIArray[i].Name == TrPC.PlayerReplicationInfo.Name)
        {
            return i+1;
        }
    }

    return -1;
}

delegate int KillsSort(TrPlayerReplicationInfo A, TrPlayerReplicationInfo B) { return A.m_nKills < B.m_nKills ? -1 : 0; }
delegate int AssistsSort(TrPlayerReplicationInfo A, TrPlayerReplicationInfo B) { return A.m_nAssists < B.m_nAssists ? -1 : 0; }
delegate int CreditsSort(TrPlayerReplicationInfo A, TrPlayerReplicationInfo B) { return A.m_nCreditsEarned < B.m_nCreditsEarned ? -1 : 0; }

function bool ClearSlot(int Index)
{
    if (ScoreboardSlots[Index].PlayerName != "")
    {
        ScoreboardSlots[Index].PlayerName = "";
        bUpdated = true;
        return true;
    }

    return false;
}

function bool UpdateSlot(int Index, TrPlayerReplicationInfo PRI)
{
    if (ScoreboardSlots[Index].PlayerName != PRI.PlayerName ||
        ScoreboardSlots[Index].Score != PRI.m_nCreditsEarned ||
        ScoreboardSlots[Index].Kills != PRI.m_nKills ||
        ScoreboardSlots[Index].Assists != PRI.m_nAssists ||
        (bCheckPing && (ScoreboardSlots[Index].Ping != PRI.Ping*4)) ||
        ScoreboardSlots[Index].RankIcon != PRI.GetRankIcon() ||
        ScoreboardSlots[Index].Rank != PRI.GetPlayerRankNum() ||
        ScoreboardSlots[Index].ClassAbb != PRI.GetCurrentClassAbb())
    {
        ScoreboardSlots[Index].PlayerName = PRI.PlayerName;
        ScoreboardSlots[Index].Score = PRI.m_nCreditsEarned;
        ScoreboardSlots[Index].Kills = PRI.m_nKills;
        ScoreboardSlots[Index].Assists = PRI.m_nAssists;
        ScoreboardSlots[Index].Rank = PRI.GetPlayerRankNum();
        ScoreboardSlots[Index].RankIcon = PRI.GetRankIcon();
        ScoreboardSlots[Index].ClassAbb = PRI.GetCurrentClassAbb();

        // Use exact ping if us, normal ping otherwise (local is more accurate and non-replicated)
        if (PRI == TrPC.PlayerReplicationInfo)
        {
            ScoreboardSlots[Index].Ping = int(PRI.ExactPing*1000.0);
        }
        else
        {
            ScoreboardSlots[Index].Ping = PRI.Ping*4;
        }

        bUpdated = true;
        return true;
    }

    return false;
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

function UpdateHeaders(TrGameReplicationInfo GRI)
{
    local int beScore;
    local int dsScore;

    if (TrPlayerOwner.GetTeamNum() == 255 && !TrPlayerOwner.InRovingSpectate()) beScore = -1;
    else beScore = GRI.Teams[BEIndex].Score;
    
    if (TrPlayerOwner.GetTeamNum() == 255 && !TrPlayerOwner.InRovingSpectate()) dsScore = -1;
    else dsScore = GRI.Teams[DSIndex].Score;

    if (bTeamGame)
    {
		if (PreviousState.BloodEagleScore != beScore)
		{
		    m_MoviePlayer.TeamScoreboardUpdateTeamScore(BEIndex, beScore);    
            PreviousState.BloodEagleScore = beScore;
		}

        if (PreviousState.DiamondSwordScore != dsScore)
		{
		    m_MoviePlayer.TeamScoreboardUpdateTeamScore(DSIndex, dsScore);
            PreviousState.DiamondSwordScore = dsScore;
		}
    }

    if (GRI.RemainingTime != PreviousState.RemainingTime)
    {
        if (bTeamGame)
        {
            m_MoviePlayer.TeamScoreboardUpdateTime(FormatTime(GRI.TimeLimit != 0 ? GRI.RemainingTime : GRI.ElapsedTime));
        }

        PreviousState.RemainingTime = GRI.RemainingTime;

        // Check Ping once a second so we don't update like crazy on the scoreboard
        bCheckPing = true;
    }
}

function bool IsValidScoreboardPlayer( TrPlayerReplicationInfo PRI)
{
	if (!PRI.bIsInactive && PRI.WorldInfo.NetMode != NM_Client && 
		(PRI.Owner == None || (TrPlayerController(PRI.Owner) != None && TrPlayerController(PRI.Owner).Player == None) || UTBot(PRI.Owner) != none))
	{
		return false;
	}

    if (PRI.GetTeamNum() == 255)
    {
        return false;
    }

	return true;
}

defaultproperties
{
   MAX_PLAYER_INDEX=15
   DSOffset=16
   DSIndex=1
   Name="Default__TrScoreboard"
   ObjectArchetype=Object'Core.Default__Object'
}
