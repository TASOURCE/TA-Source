// 0. Capture and Hold the Control Points.
// 1. Control point captured.
// 2. The enemy needs X more points to win.
// 3. We need X more points to win.
// 4. The enemy has a score of X points.
// 5. We have a score of X points.

class TrCaHMessage extends UTLocalMessage;

var localized string CaptureAndHoldTheControlPoints;
var localized string ControlPointCaptured;
var localized string TheEnemyNeeds;
var localized string WeNeed;
var localized string MorePointsToWin;
var localized string TheEnemyHas;
var localized string WeHave;
var localized string Points;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local UTTeamInfo T;

	T = UTTeamInfo(OptionalObject);
	switch( switch )
	{
		case 0: return default.CaptureAndHoldTheControlPoints;
		case 1: return default.ControlPointCaptured;
		case 2: return default.TheEnemyNeeds$T.WorldInfo.GRI.GoalScore - int(T.Score)$default.MorePointsToWin;
		case 3: return default.WeNeed$T.WorldInfo.GRI.GoalScore - int(T.Score)$default.MorePointsToWin;
		case 4: return default.TheEnemyHas$int(T.Score)$default.Points;
		case 5: return default.WeHave$int(T.Score)$default.Points;
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
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(P);

	if( TrPC != none )
	{
		switch( switch )
		{
		case 1:
			P.PlaySound(SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagPickedUp');
			break;
		case 2:
			P.PlaySound(SoundCue'Aud_menu.Rabbit_TDM.A_CUE_MENU_Rabbit_TDM_TeamMessage_Negative');
			break;
		case 3:
			P.PlaySound(SoundCue'Aud_menu.Rabbit_TDM.A_CUE_MENU_Rabbit_TDM_TeamMessage_Positive');
			break;
		case 4:
			P.PlaySound(SoundCue'Aud_menu.Rabbit_TDM.A_CUE_MENU_Rabbit_TDM_TeamMessage_Negative');
			break;
		case 5:
			P.PlaySound(SoundCue'Aud_menu.Rabbit_TDM.A_CUE_MENU_Rabbit_TDM_TeamMessage_Positive');
			break;
		}
		TrPC.TrClientMusicEvent(1);
	}
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   CaptureAndHoldTheControlPoints="Capture and hold the Control Points"
   ControlPointCaptured="Control point captured"
   TheEnemyNeeds="The enemy team needs "
   WeNeed="Your team needs "
   MorePointsToWin=" more points to win"
   TheEnemyHas="The enemy team has "
   WeHave="Your team has "
   Points=" points"
   MessageArea=4
   Name="Default__TrCaHMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
