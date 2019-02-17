class GfxTrHudTeam extends GfxTrHud;

var GFxObject   ScoreBarMC[2];
var GFxObject   ScoreTF[2];
var GFxObject   FlagCarrierTF[2];

function Init(optional LocalPlayer player)
{
    Super.Init(player);

	ScoreBarMC[0] = GetVariableObject("_root.teamStats.teamRed");
	ScoreBarMC[1] = GetVariableObject("_root.teamStats.teamBlue");
	ScoreTF[0]    = GetVariableObject("_root.teamStats.scoreRed");
	ScoreTF[1]    = GetVariableObject("_root.teamStats.scoreBlue");

	if( FlagCarrierTF[0] != none )
	{
		FlagCarrierTF[0].SetText("");
	}

	if( FlagCarrierTF[1] != none )
	{
		FlagCarrierTF[1].SetText("");
	}

    ClearStats(true);
}

/*
 * override so we don't create UT's Hud text lines
 */
function GFxObject InitMessageRow()
{
	return None;
}

function ClearStats(optional bool clearScores)
{
	local GFxObject.ASDisplayInfo DI;
	DI.hasXScale = true;
	DI.XScale = 0;

    Super.ClearStats(clearScores);

    if (ScoreTF[0] != None)
    {
        if (clearScores && LastScore[0] != -100000)
	    {
		    LastScore[0] = -100000;
		    LastScore[1] = -100000;
			
			if( ScoreTF[0] != none )
			{
				ScoreTF[0].SetString("text", "");
			}

			if( ScoreTF[1] != none )
			{
				ScoreTF[1].SetString("text", "");
			}

			if( ScoreBarMC[0] != none )
			{
				ScoreBarMC[0].SetDisplayInfo(DI);
			}
			
			if( ScoreBarMC[1] != none )
			{
				ScoreBarMC[1].SetDisplayInfo(DI);
			}

			if( FlagCarrierTF[0] != none )
			{
				FlagCarrierTF[0].SetText("");
			}

			if( FlagCarrierTF[1] != none )
			{
				FlagCarrierTF[1].SetText("");
			}
	    }
    }
}


function UpdateGameHUD(UTPlayerReplicationInfo PRI)
{
	local UTPlayerReplicationInfo MaxPRI;
	local int j, CurScores[2];
	local GFxObject.ASDisplayInfo DI;
	local UTTeamInfo Team;

	CurScores[0] = GRI.Teams[0].Score;
	CurScores[1] = GRI.Teams[1].Score;

	for (j = 0; j < 2; j++)
	{
		if (LastScore[j] != CurScores[j])
		{
			LastScore[j] = CurScores[j];

			if (CurScores[j] > -100000)
				ScoreTF[j].SetText(CurScores[j]);
			else
				ScoreTF[j].SetText("");

			DI.hasXScale = true;
			DI.XScale = FMax(0.0, (100.0 * float(LastScore[j])) / float(GRI.GoalScore));
			if( ScoreBarMC[j] != none )
			{
				ScoreBarMC[j].SetDisplayInfo(DI);
			}

            // A score has occured, let the music manager know. We do this here rather
            // than in a Message because the client is guaranteed to have an updated score
            // whereas a Message could be received before the score is replicated.
            TrPlayerController(GetPC()).TrClientMusicEvent(3);
		}

		Team = UTTeamInfo(GRI.Teams[j]);

		if (Team.TeamFlag != none)
		{
			MaxPRI = Team.TeamFlag.HolderPRI;

			if (LastFlagCarrier[j] != MaxPRI)
			{
				LastFlagCarrier[j] = MaxPRI;
				if( FlagCarrierTF[j] != none )
				{
					FlagCarrierTF[j].SetText(MaxPRI != none ? MaxPRI.PlayerName : "");
				}
			}
			if (LastFlagHome[j] != byte(Team.TeamFlag.bHome))
			{
				LastFlagHome[j] = byte(Team.TeamFlag.bHome);
				//~~FlagCarrierMC[j].SetVisible(LastFlagHome[j] == 0);
			}
		}
		else
		{
			//~~FlagCarrierMC[j].SetVisible(false);
		}
	}
}

function string GetRank(PlayerReplicationInfo PRI)
{
	return "";
}

defaultproperties
{
   bIsTeamHUD=True
   Name="Default__GfxTrHudTeam"
   ObjectArchetype=GfxTrHud'TribesGame.Default__GfxTrHud'
}
