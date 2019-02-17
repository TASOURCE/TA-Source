class TrCaHStats extends Object within TrHud;

var int MyTeam;
var int RemainingTime;
var bool bIsActive;
var bool bForcingUpdate;

var int TeamScore[2];
var int RoundScore[2];
var int NumCapturePointsHeld[2];
var int RoundNum;
var bool bForceUpdateNextTick;

var GfxTrHud m_MoviePlayer;
var TrPlayerController TrPC;

struct CapturePointInfo
{
	var CaHCapturePointLabel PointLabel;
	var string LabelString;
	var int PointOwnershipType; // 0: Neutral, 1: Friendly, 2: Enemy
	var int PctHeld;
	var float RemainingHeldTime;
};
var array<CapturePointInfo> m_CapturePointData;
var array<TrCaHCapturePoint> m_CapturePoints;

/** Initialization for game-play related items. */
function ReadyToPlay()
{
	local TrCaHCapturePoint CapturePoint;
	local int AddedIndex;

	m_CapturePointData.Remove(0, m_CapturePointData.Length);
	m_CapturePoints.Remove(0, m_CapturePoints.Length);

	m_MoviePlayer.CaHControlPointAShow(false);
	m_MoviePlayer.CaHControlPointBShow(false);
	m_MoviePlayer.CaHControlPointCShow(false);
	m_MoviePlayer.CaHControlPointDShow(false);
	m_MoviePlayer.CaHControlPointEShow(false);

	ForEach DynamicActors(class'TrCaHCapturePoint', CapturePoint)
	{
		m_CapturePoints.AddItem(CapturePoint);
		AddedIndex = m_CapturePointData.Add(1);
		m_CapturePointData[AddedIndex].PointLabel = CapturePoint.m_CapturePointLabel;
		
		switch( CapturePoint.m_CapturePointLabel )
		{
		case CaHCapturePoint_A:
			m_CapturePointData[AddedIndex].LabelString = "A";
			m_MoviePlayer.CaHPointUpdate("A", 0, 0);
			m_MoviePlayer.CaHControlPointAShow(true);
			break;
		case CaHCapturePoint_B:
			m_CapturePointData[AddedIndex].LabelString = "B";
			m_MoviePlayer.CaHControlPointBShow(true);
			m_MoviePlayer.CaHPointUpdate("B", 0, 0);
			break;
		case CaHCapturePoint_C:
			m_CapturePointData[AddedIndex].LabelString = "C";
			m_MoviePlayer.CaHPointUpdate("C", 0, 0);
			m_MoviePlayer.CaHControlPointCShow(true);
			break;
		case CaHCapturePoint_D:
			m_CapturePointData[AddedIndex].LabelString = "D";
			m_MoviePlayer.CaHPointUpdate("D", 0, 0);
			m_MoviePlayer.CaHControlPointDShow(true);
			break;
		case CaHCapturePoint_E:
			m_CapturePointData[AddedIndex].LabelString = "E";
			m_MoviePlayer.CaHPointUpdate("E", 0, 0);
			m_MoviePlayer.CaHControlPointEShow(true);
			break;
		}
	}

	m_MoviePlayer.CaHUpdate(0,0,0,0,0,0,"0:00");
	
	bForceUpdateNextTick = true;
}

function Initialize(TrPlayerController PC, GfxTrHud MP)
{
    TrPC = PC;
    m_MoviePlayer = MP;
}

function Show()
{
    if (bIsActive)
    {
        m_MoviePlayer.CaHStatsShow(true);
		bForceUpdateNextTick = true;
    }
}

function Hide()
{
    m_MoviePlayer.CaHStatsShow(false);
}

function Tick()
{
	local TrGameReplicationInfo GRI;
	GRI = TrGameReplicationInfo(TrPC.WorldInfo.GRI);

	if ( GRI == None ) return;

    UpdateTeam();
    UpdateTeamScore(GRI);
	UpdateCapturePointData(GRI);
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

function UpdateCapturePointData(TrGameReplicationInfo GRI)
{
	local int i, FriendlyTeamNum, NewOwnershipType;
	local bool bUpdateHUDForPoint, bHeldTimeReset;

	if( MyTeam == 0 )
	{
		// Blood Eagle is friendly.
		FriendlyTeamNum = 0;
	}
	else
	{
		// Spectator and Diamond Sword see team 1 as friendly.
		FriendlyTeamNum = 1;
	}

	for( i = 0; i < m_CapturePointData.Length; i++ )
	{
		bUpdateHUDForPoint = false;
		switch( m_CapturePoints[i].DefenderTeamIndex )
		{
			case 0:
				if( 0 == FriendlyTeamNum )
				{
					NewOwnershipType = 1;
				}
				else
				{
					NewOwnershipType = 2;
				}
				break;
			case 1:
				if( 1 == FriendlyTeamNum )
				{
					NewOwnershipType = 1;
				}
				else
				{
					NewOwnershipType = 2;
				}
				break;
			default:
				NewOwnershipType = 0;
				break;
		}
		if( NewOwnershipType != m_CapturePointData[i].PointOwnershipType )
		{
			bUpdateHUDForPoint = true;
			m_CapturePointData[i].PointOwnershipType = NewOwnershipType;

			if( NewOwnershipType != 0 )
			{
				m_CapturePointData[i].RemainingHeldTime = class'TrGame_TrCaH'.default.m_nPostCapturePointTime;
				bHeldTimeReset = true;
			}
		}

		if( !bHeldTimeReset && m_CapturePointData[i].RemainingHeldTime > 0.0 )
		{
			bUpdateHUDForPoint = true;
			m_CapturePointData[i].RemainingHeldTime -= RenderDelta;
			m_CapturePointData[i].RemainingHeldTime = FMax(0.0, m_CapturePointData[i].RemainingHeldTime);
			m_CapturePointData[i].PctHeld = int(100 * (1.0 - (m_CapturePointData[i].RemainingHeldTime / class'TrGame_TrCaH'.default.m_nPostCapturePointTime)));
		}

		if( bUpdateHUDForPoint )
		{
			m_MoviePlayer.CaHPointUpdate(m_CapturePointData[i].LabelString, m_CapturePointData[i].PointOwnershipType, m_CapturePointData[i].PctHeld);
		}
	}
}

function UpdateTeamScore(TrGameReplicationInfo GRI)
{
    local int i, FriendlyTeamNum, EnemyTeamNum;
	local bool bUpdateHUD;

	if( MyTeam == 0 )
	{
		// Blood Eagle is friendly.
		FriendlyTeamNum = 0;
		EnemyTeamNum = 1;
	}
	else
	{
		// Spectator and Diamond Sword see team 1 as friendly.
		FriendlyTeamNum = 1;
		EnemyTeamNum = 0;
	}

	for (i = 0; i < 2; i++)
	{
		if( GRI.Teams.Length > i && GRI.Teams[i] != none && TeamScore[i] != GRI.Teams[i].Score )
		{
			// Animate the point break for the score difference.
			if( i == FriendlyTeamNum )
			{
				m_MoviePlayer.CaHFriendlyPointBreak("+"$string(int(GRI.Teams[i].Score - TeamScore[i])));
			}
			else
			{
				m_MoviePlayer.CaHEnemyPointBreak("+"$string(int(GRI.Teams[i].Score - TeamScore[i])));
			}
			bUpdateHUD = true;

			// Cache the new team score.
			TeamScore[i] = GRI.Teams[i].Score;
		}

		// Check to see if we need to update because the number of points held changed.
		if( NumCapturePointsHeld[i] != GRI.r_nNumCapturePointsHeld[i] )
		{
			bUpdateHUD = true;

			// Cache the number of points held.
			NumCapturePointsHeld[i] = GRI.r_nNumCapturePointsHeld[i];
		}
	}

    if (GRI.RemainingTime != RemainingTime)
    {
		// Update timer.
		bUpdateHUD = true;
        RemainingTime = GRI.RemainingTime;
    }

	if( (bForceUpdateNextTick || bUpdateHUD) && GRI.Teams[FriendlyTeamNum] != none && GRI.Teams[EnemyTeamNum] != none )
	{
		// The score or held points have changed, so update the HUD.
		m_MoviePlayer.CaHUpdate(    
						GRI.r_nNumCapturePointsHeld[FriendlyTeamNum],
						int(GRI.Teams[FriendlyTeamNum].Score),
						Clamp(FCeil(100.0 * (GRI.Teams[FriendlyTeamNum].Score / GRI.GoalScore)), 0, 100),
						GRI.r_nNumCapturePointsHeld[EnemyTeamNum],
						int(GRI.Teams[EnemyTeamNum].Score),
						Clamp(FCeil(100.0 * (GRI.Teams[EnemyTeamNum].Score / GRI.GoalScore)), 0, 100),
						FormatTime(GRI.TimeLimit != 0 ? GRI.RemainingTime : GRI.ElapsedTime));
		
		bForceUpdateNextTick = false;
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
   Name="Default__TrCaHStats"
   ObjectArchetype=Object'Core.Default__Object'
}
