// 0. YouHaveTheFlag. 
// 1. TheEnemyHasTheFlag. 
// 2. YourTeamHasTheFlag. 
// 3. KillBonus 
// 4. DroppedTheFlag.
// 5. YourTeamHasXLivesLeft.
// 6. EnemyTeamHasXLivesLeft.

class TrTeamRabbitMessage extends UTLocalMessage;

var localized string YouHaveTheFlag;
var localized string TheEnemyHasTheFlag;
var localized string YourTeamHasTheFlag;
var localized string KillBonus;
var localized string DroppedTheFlag;
var localized string YourTeamHas;
var localized string EnemyTeamHas;
var localized string LivesLeft;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	switch( switch )
	{
		case 0: return default.YouHaveTheFlag;
		case 1: return default.TheEnemyHasTheFlag;
		case 2: return default.YourTeamHasTheFlag;
		case 3: return default.KillBonus$class'TrGame_TRTeamRabbit'.default.m_nBuffAmount;
		case 4: return default.DroppedTheFlag;
	}

	switch( switch >> class'TrGame_TRTeamRabbit'.const.MESSAGE_SCORE_SWITCH_TEAM )
	{
		case 1: return default.YourTeamHas@switch & class'TrGame_TRTeamRabbit'.const.MESSAGE_SCORE_SWITCH_LIMIT@default.LivesLeft;
		case 2: return default.EnemyTeamHas@switch & class'TrGame_TRTeamRabbit'.const.MESSAGE_SCORE_SWITCH_LIMIT@default.LivesLeft;
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
		case 0:
			TrPC.TrClientMusicEvent(18);
			break;
		case 1:
			TrPC.TrClientMusicEvent(19);
			break;
		case 2:
			TrPC.TrClientMusicEvent(18);
			break;
		case 3:
			P.PlaySound(SoundCue'Aud_menu.Rabbit_TDM.A_CUE_MENU_Rabbit_TDM_FlagBonus_Kill');
			break;
		default:
			TrPC.TrClientMusicEvent(1);
		}
	}

	switch( switch >> class'TrGame_TRTeamRabbit'.const.MESSAGE_SCORE_SWITCH_TEAM )
	{
		case 1:
			P.PlaySound(SoundCue'Aud_menu.Rabbit_TDM.A_CUE_MENU_Rabbit_TDM_TeamMessage_Negative');
			break;
		case 2: 
			P.PlaySound(SoundCue'Aud_menu.Rabbit_TDM.A_CUE_MENU_Rabbit_TDM_TeamMessage_Positive');
			break;
	}

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   YouHaveTheFlag="You have the flag"
   TheEnemyHasTheFlag="The enemy has the flag"
   YourTeamHasTheFlag="Your team has the flag"
   KillBonus="Kill bonus: x"
   DroppedTheFlag="The flag is dropped"
   YourTeamHas="Your team has"
   EnemyTeamHas="The enemy team has"
   LivesLeft="lives left"
   MessageArea=4
   Name="Default__TrTeamRabbitMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
