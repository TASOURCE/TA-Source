class TrGame_TrCTFBlitz extends TrGame_TrCTF
    config(game);

/** CTF stands. */
var TrCTFBase_BloodEagle BloodEagleFlagStands[5];
var TrCTFBase_DiamondSword DiamondSwordFlagStands[5];

/** Rotate both team's flags on any capture? */
var bool m_bRotateBothFlagsOnCapture;

simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

    super.ApplyServerSettings();

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
        m_bRotateBothFlagsOnCapture = TrGRI.r_ServerConfig.bCTFBlitzAllFlagsMove;
	}
}

function RegisterFlagBase(TrCTFBase FlagBase)
{
	if( FlagBase.DefenderTeamIndex == 0 )
	{
		BloodEagleFlagStands[FlagBase.CTFBlitzIndex] = TrCTFBase_BloodEagle(FlagBase);
	}
	else
	{
		DiamondSwordFlagStands[FlagBase.CTFBlitzIndex] = TrCTFBase_DiamondSword(FlagBase);
	}
}

function ScoreFlag(Controller Scorer, TrFlagBase theFlag)
{
	Super.ScoreFlag(Scorer, theFlag);

	if( !bGameEnded )
	{
		if( Scorer.PlayerReplicationInfo.Team != theFlag.Team )
		{
			if( m_bRotateBothFlagsOnCapture )
			{
				RotateFlag(m_Flags[0]);
				RotateFlag(m_Flags[1]);
			}
			else
			{
				RotateFlag(theFlag);
			}
		}
	}
}

function RotateFlag(TrFlagBase theFlag)
{
	local TrCTFBase NextFlagStand;
	local int NextFlagStandIndex;

	// Find the next flag base.
	NextFlagStandIndex = TrCTFBase(theFlag.HomeBase).CTFBlitzIndex + 1;
	if( NextFlagStandIndex > 4 )
	{
		NextFlagStandIndex = 0;
	}
	if( theFlag.Team.TeamIndex == 0 )
	{
		NextFlagStand = BloodEagleFlagStands[NextFlagStandIndex];
	}
	else
	{
		NextFlagStand = DiamondSwordFlagStands[NextFlagStandIndex];
	}

	// Clear out the old stand.
	TrCTFBase(theFlag.HomeBase).SetBlitzStandActive(false);
	TrCTFBase(theFlag.HomeBase).myFlag = none;
	theFlag.HomeBase.bNetDirty = true;
	
	// Set up the new stand.
	NextFlagStand.SetBlitzStandActive(true);
	theFlag.HomeBase = NextFlagStand;
	NextFlagStand.myFlag = theFlag;
	NextFlagStand.bNetDirty = true;
}

defaultproperties
{
   Acronym="TrBlitz"
   MapPrefixes(0)="TrBlitz"
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrCTFBlitz'
   Name="Default__TrGame_TrCTFBlitz"
   ObjectArchetype=TrGame_TRCTF'TribesGame.Default__TrGame_TRCTF'
}
