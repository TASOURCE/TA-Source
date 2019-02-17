// 0. Ten team respawns remain.
// 1. Five team respawns remain.
// 2. Team respawns depleted.
// 3. Last man standing
// 4. Fight!
// 5. No respawns remain
// 6. Cannot switch teams while round is in progress.

class TrDaDMessage extends UTLocalMessage;

var localized string TenTeamRespawnsRemain;
var localized string FiveTeamRespawnsRemain;
var localized string TeamRespawnsDepleted;
var localized string YouAreLastManStanding;
var localized string Fight;
var localized string NoRespawnsRemain;
var localized string CannotSwitchTeam;

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
			break;
		case 3:
			P.PlaySound(SoundCue'Aud_menu.Arena.A_CUE_UI_Arena_Message_LastManStanding');
			break;
		case 5:
			P.PlaySound(SoundCue'Aud_menu.Arena.A_CUE_UI_Arena_Message_DeathToll');
			break;
		}
		TrPC.TrClientMusicEvent(1);
	}
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   MessageArea=4
   Name="Default__TrDaDMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
