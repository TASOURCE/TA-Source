// 0. Ten team respawns remain.
// 1. Five team respawns remain.
// 2. Team respawns depleted.
// 3. Last man standing
// 4. Fight!
// 5. No respawns remain
// 6. Cannot switch teams while round is in progress.
// 7. Enemy has one man left.
// 8. Enemy is out of respawns.
// 9. Match warmup.
// 10. We won the round
// 11. We lost the round

class TrArenaMessage extends UTLocalMessage;

var localized string TenTeamRespawnsRemain;
var localized string FiveTeamRespawnsRemain;
var localized string TeamRespawnsDepleted;
var localized string YouAreLastManStanding;
var localized string Fight;
var localized string NoRespawnsRemain;
var localized string CannotSwitchTeam;
var localized string WeWonTheRound;
var localized string WeLostTheRound;

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
		case 0: return default.TenTeamRespawnsRemain;
		case 1: return default.FiveTeamRespawnsRemain;
		case 2: return default.TeamRespawnsDepleted;
		case 3: return default.YouAreLastManStanding;
		case 4: return default.Fight;
		case 5: return default.NoRespawnsRemain;
		case 6: return default.CannotSwitchTeam;
		case 10: return default.WeWonTheRound;
		case 11: return default.WeLostTheRound;
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
			P.PlaySound(SoundCue'Aud_menu.Arena.A_CUE_UI_Arena_Message_Negative');
			break;
		case 1:
			P.PlaySound(SoundCue'Aud_menu.Arena.A_CUE_UI_Arena_Message_Negative');
			break;
		case 2:
			P.PlaySound(SoundCue'Aud_menu.Arena.A_CUE_UI_Arena_Message_RespawnDepleted');
			TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Neg_NoRespawn' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Neg_NoRespawn', false);
			break;
		case 3:
			P.PlaySound(SoundCue'Aud_menu.Arena.A_CUE_UI_Arena_Message_LastManStanding');
			TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Neg_LastMan' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Neg_LastMan', true);
			break;
		case 4: 
			TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Pos_MatchStart' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Pos_MatchStart', false);
			break;
		case 5:
			P.PlaySound(SoundCue'Aud_menu.Arena.A_CUE_UI_Arena_Message_DeathToll');
			break;
		case 7:
			TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Pos_EnemyLastMan' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Pos_EnemyLastMan', false);
			break;
		case 8:
			TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Pos_EnemyNoRespawn' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Pos_EnemyNoRespawn', false);
			break;
		case 9:
			TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Pos_MatchWarmup' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Pos_MatchWarmup', false);
			break;
		case 10:
			TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Pos_RoundWin' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Pos_RoundWin', false);
			break;
		case 11:
			TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Neg_RoundLoss' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Neg_RoundLoss', false);
			break;
		}
		TrPC.TrClientMusicEvent(1);
	}
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   TenTeamRespawnsRemain="10 team respawns remain"
   FiveTeamRespawnsRemain="5 team respawns remain"
   TeamRespawnsDepleted="Team respawns depleted"
   YouAreLastManStanding="You are the last man standing"
   Fight="Fight!"
   NoRespawnsRemain="No respawns remain"
   CannotSwitchTeam="Cannot switch teams while round is in progress"
   WeWonTheRound="We won the round"
   WeLostTheRound="We lost the round"
   MessageArea=4
   Name="Default__TrArenaMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
