//
//      Announce winner and loser
//
//0 dominating victory
//1 dominantly defeated
//2 victory
//3 defeat
//4 team zero won
//5 team one won
//6 Rabbit win
//7 Draw
//8 Training complete
class TrVictoryMessage extends UTLocalMessage;

var SoundCue DiamondSwordSounds[4];
var SoundCue BloodEagleSounds[4];

var localized string DominantVictory;
var localized string DominantDefeat;
var localized string NormalVictory;
var localized string NormalDefeat;
var localized string BloodEagleVictory;
var localized string DiamondSwordVictory;
var localized string PlayerWonRound;
var localized string DrawGame;
var localized string TrainingComplete;

static function string GetString( optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1,
					optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	local string playerName;

	if (RelatedPRI_1!=None)
	{
		playerName = RelatedPRI_1.PlayerName;
	}

	switch (switch)
	{
	case 0: return default.BloodEagleVictory;
	case 1: return default.DiamondSwordVictory;
	case 6: return playerName$default.PlayerWonRound;
	case 7: return default.DrawGame;
	case 8: return default.TrainingComplete;
	}

	return "";
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local TrHUD HUD;
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(P);

	// Don't play team-centric announcements if spectating.
	if( P.GetTeamNum() == 255 )
	{
		return;
	}

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	
	HUD = TrHUD(P.myHUD);
	if ( (HUD != None) && HUD.bIsSplitScreen )
	{
		return;
	}

	if (Switch < 4)
	{
		if (P.GetTeamNum() == 0)
		{
			TrPC.PlayAnnouncerSound(default.BloodEagleSounds[Switch], true);
		}
		else
		{
			TrPC.PlayAnnouncerSound(default.DiamondSwordSounds[Switch], true);
		}
	}
	else if( Switch == 7 )
	{
		if (P.GetTeamNum() == 0)
		{
			TrPC.PlayAnnouncerSound(default.BloodEagleSounds[3], true);
		}
		else
		{
			TrPC.PlayAnnouncerSound(default.DiamondSwordSounds[3], true);
		}
	}
}

defaultproperties
{
   TrainingComplete="Training complete"
   MessageArea=4
   AnnouncementPriority=1
   Lifetime=10.000000
   Name="Default__TrVictoryMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
