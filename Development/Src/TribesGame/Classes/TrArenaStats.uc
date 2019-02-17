class TrArenaStats extends Object within TrHud;

var int MyTeam;
var int RemainingTime;
var bool bIsActive;
var bool bForcingUpdate;

var int TeamScore[2];
var int RoundScore[2];
var int RoundNum;

var GfxTrHud m_MoviePlayer;
var TrPlayerController TrPC;

enum ManGraphicState
{
	ManGraphic_Hidden,
	ManGraphic_HasSpawnsLeft,
	ManGraphic_OutOfSpawns,
	ManGraphic_CrossedOffList,
};

const MAX_NUM_ARENA_PLAYERS_PER_TEAM = 8;

var ManGraphicState FriendlyManGraphics[MAX_NUM_ARENA_PLAYERS_PER_TEAM];
var ManGraphicState EnemyManGraphics[MAX_NUM_ARENA_PLAYERS_PER_TEAM];

function Initialize(TrPlayerController PC, GfxTrHud MP)
{
    TrPC = PC;
    m_MoviePlayer = MP;
}

function Show()
{
    if (bIsActive)
    {
        m_MoviePlayer.ArenaStatsShow(true);
    }
}

function Hide()
{
    m_MoviePlayer.ArenaStatsShow(false);
}

function Tick()
{
	local TrGameReplicationInfo GRI;
	GRI = TrGameReplicationInfo(TrPC.WorldInfo.GRI);

	if ( GRI == None ) return;

    UpdateTeam();
    UpdateTeamScore(GRI);
    UpdateTime(GRI);
	UpdateRound(GRI);
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
    local int i;

    for (i = 0; i < 2; i++)
    {
        if (GRI.Teams.Length > i && GRI.Teams[i] != none && TeamScore[i] != GRI.Teams[i].Score)
        {
            if (MyTeam == i && !bForcingUpdate)
            {
                m_MoviePlayer.ArenaStatsPointBreak(0, "-"$string(int(TeamScore[i] - GRI.Teams[i].Score)));
            }
            else if (!bForcingUpdate)
            {
                m_MoviePlayer.ArenaStatsPointBreak(1, "-"$string(int(TeamScore[i] - GRI.Teams[i].Score)));
            }

            TeamScore[i] = GRI.Teams[i].Score;

            if (TrPlayerOwner.GetTeamNum() == 255 && !TrPlayerOwner.InRovingSpectate()) TeamScore[i] = 9999;

            if (MyTeam == i)
            {
                m_MoviePlayer.ArenaStatsUpdateTeamScore(0, TeamScore[i]);
            }
            else
            {
                m_MoviePlayer.ArenaStatsUpdateTeamScore(1, TeamScore[i]);
            }
        }
    }

	if( TeamScore[0] <= 0 || TeamScore[1] <= 0 )
	{
		for( i = 0; i < MAX_NUM_ARENA_PLAYERS_PER_TEAM; i++ )
		{
			if( TeamScore[0] <= 0 )
			{
				// Check each element to make sure it doesn't need an update.
				if( GRI.r_BEPlayerList[i] != none )
				{
					if( GRI.r_BEPlayerList[i].r_nArenaSpawnsLeft > 0 )
					{
						// Update to 'Has Spawns Left'.
						SetManGraphicState(0 == MyTeam, i, ManGraphic_HasSpawnsLeft);
					}
					else if( GRI.r_BEPlayerList[i].r_bIsCrossedOffArenaList )
					{
						// Update to 'Crossed Off List'.
						SetManGraphicState(0 == MyTeam, i, ManGraphic_CrossedOffList);
					}
					else
					{
						// Update to 'Out of Spawns'.
						SetManGraphicState(0 == MyTeam, i, ManGraphic_OutOfSpawns);
					}
				}
				else
				{
					// We don't have an PRI for this graphic, so make sure it is hidden.
					SetManGraphicState(0 == MyTeam, i, ManGraphic_Hidden);
				}
			}

			if( TeamScore[1] <= 0 )
			{
				// Check each element to make sure it doesn't need an update.
				if( GRI.r_DSPlayerList[i] != none )
				{
					if( GRI.r_DSPlayerList[i].r_nArenaSpawnsLeft > 0 )
					{
						// Update to 'Has Spawns Left'.
						SetManGraphicState(1 == MyTeam, i, ManGraphic_HasSpawnsLeft);
					}
					else if( GRI.r_DSPlayerList[i].r_bIsCrossedOffArenaList )
					{
						// Update to 'Crossed Off List'.
						SetManGraphicState(1 == MyTeam, i, ManGraphic_CrossedOffList);
					}
					else
					{
						// Update to 'Out of Spawns'.
						SetManGraphicState(1 == MyTeam, i, ManGraphic_OutOfSpawns);
					}
				}
				else
				{
					// We don't have an PRI for this graphic, so make sure it is hidden.
					SetManGraphicState(1 == MyTeam, i, ManGraphic_Hidden);
				}
			}
		}
	}
}

function SetManGraphicState(bool bFriendly, int Index, ManGraphicState NewState)
{
	local GFxObject Obj;
	local string Path;

	// Update the cache.
	if( bFriendly )
	{
		if( FriendlyManGraphics[Index] == NewState )
		{
			// No need for an update.
			return;
		}
		FriendlyManGraphics[Index] = NewState;
	}
	else
	{
		if( EnemyManGraphics[Index] == NewState )
		{
			// No need for an update.
			return;
		}
		EnemyManGraphics[Index] = NewState;
	}

	/*
	switch( Index )
	{
		case 0:
			if( bFriendly )
			{
				m_MoviePlayer.ArenaUpdateManGraphicFriendly01(Index);
			}
			else
			{
			}
			break;
	}*/

	// Update actionscript.
	switch( Index )
	{
		case 0:
			Obj = bFriendly ? m_MoviePlayer.ArenaStats_FriendlyManGraphic01 : m_MoviePlayer.ArenaStats_EnemyManGraphic01;
			Path = bFriendly ? "arenaStats.blueArenaPlayer1" : "arenaStats.redArenaPlayer1";
			break;
		case 1:
			Obj = bFriendly ? m_MoviePlayer.ArenaStats_FriendlyManGraphic02 : m_MoviePlayer.ArenaStats_EnemyManGraphic02;
			Path = bFriendly ? "arenaStats.blueArenaPlayer2" : "arenaStats.redArenaPlayer2";
			break;
		case 2:
			Obj = bFriendly ? m_MoviePlayer.ArenaStats_FriendlyManGraphic03 : m_MoviePlayer.ArenaStats_EnemyManGraphic03;
			Path = bFriendly ? "arenaStats.blueArenaPlayer3" : "arenaStats.redArenaPlayer3";
			break;
		case 3:
			Obj = bFriendly ? m_MoviePlayer.ArenaStats_FriendlyManGraphic04 : m_MoviePlayer.ArenaStats_EnemyManGraphic04;
			Path = bFriendly ? "arenaStats.blueArenaPlayer4" : "arenaStats.redArenaPlayer4";
			break;
		case 4:
			Obj = bFriendly ? m_MoviePlayer.ArenaStats_FriendlyManGraphic05 : m_MoviePlayer.ArenaStats_EnemyManGraphic05;
			Path = bFriendly ? "arenaStats.blueArenaPlayer5" : "arenaStats.redArenaPlayer5";
			break;
		case 5:
			Obj = bFriendly ? m_MoviePlayer.ArenaStats_FriendlyManGraphic06 : m_MoviePlayer.ArenaStats_EnemyManGraphic06;
			Path = bFriendly ? "arenaStats.blueArenaPlayer6" : "arenaStats.redArenaPlayer6";
			break;
		case 6:
			Obj = bFriendly ? m_MoviePlayer.ArenaStats_FriendlyManGraphic07 : m_MoviePlayer.ArenaStats_EnemyManGraphic07;
			Path = bFriendly ? "arenaStats.blueArenaPlayer7" : "arenaStats.redArenaPlayer7";
			break;
		case 7:
			Obj = bFriendly ? m_MoviePlayer.ArenaStats_FriendlyManGraphic08 : m_MoviePlayer.ArenaStats_EnemyManGraphic08;
			Path = bFriendly ? "arenaStats.blueArenaPlayer8" : "arenaStats.redArenaPlayer8";
			break;
	}

	m_MoviePlayer.ArenaUpdateManGraphic(Obj, Path, NewState);
}

function UpdateRound(TrGameReplicationInfo GRI)
{
    local int i;

    for (i = 0; i < 2; i++)
    {
		if( RoundScore[i] != GRI.r_nRoundScore[i] )
		{
			// Update the cached round score.
			RoundScore[i] = GRI.r_nRoundScore[i];

			// Update the HUD.
			if( MyTeam == i )
			{
				m_MoviePlayer.ArenaStatsUpdateFriendlyRoundScore(RoundScore[i]);
			}
			else
			{
				m_MoviePlayer.ArenaStatsUpdateEnemyRoundScore(RoundScore[i]);
			}
		}
    }

	if( RoundNum != GRI.r_nCurrentRound )
	{
		// Update the cached round number.
		RoundNum = GRI.r_nCurrentRound;

		// Update the HUD.
		m_MoviePlayer.ArenaStatsUpdateRoundCount(RoundNum);
	}
}

function UpdateTime(TrGameReplicationInfo GRI)
{
    if (GRI.RemainingTime != RemainingTime)
    {
        m_MoviePlayer.ArenaStatsUpdateTime(FormatTime(GRI.TimeLimit != 0 ? GRI.RemainingTime : GRI.ElapsedTime));
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
   Name="Default__TrArenaStats"
   ObjectArchetype=Object'Core.Default__Object'
}
