/**
 * Team Death Match.
 */
class TrGame_TRTDM extends TrGame
    config(game);

function ScoreKill(Controller Killer, Controller Other )
{
    local TrPlayerReplicationInfo ScorerPRI;

    ScorerPRI = TrPlayerReplicationInfo(Killer.PlayerReplicationInfo);

    Super.ScoreKill(Killer, Other);

    // Apply the team score
	ScorerPRI.Team.Score += 1.0;
	ScorerPRI.Team.bForceNetUpdate = TRUE;

	if (CheckScore(ScorerPRI))
	{
		// $$LOCALIZE
		TrPlayerController(Killer).ProcessCreditEvent(FinalBlowEvent,false);
	}
}

// override so we can insert special messages
function bool CheckScore(PlayerReplicationInfo Scorer)
{
	if (super.CheckScore(Scorer))
		return true;

	if (bPlayTeamAudio)
	{
		if (!bPlayedBEWinning && Teams[0].Score == FFloor(GoalScore * 0.75))
		{
			bPlayedBEWinning=true;
			BroadcastLocalizedMessage(class'TrMiscellaneousMessage', TrMISC_BloodEagleCloseToWin);
		}
		else if (!bPlayedDSWinning && Teams[1].Score == FFloor(GoalScore * 0.75))
		{
			bPlayedDSWinning=true;
			BroadcastLocalizedMessage(class'TrMiscellaneousMessage', TrMISC_DiamondSwordCloseToWin);
		}
	}

	return false;
}

defaultproperties
{
   bPlayTeamAudio=True
   bSpawnInTeamArea=True
   Acronym="TrTDM"
   MapPrefixes(0)="TrTDM"
   bTeamGame=True
   HUDType=Class'TribesGame.TrHUDTeam'
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrTDM'
   Name="Default__TrGame_TRTDM"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
