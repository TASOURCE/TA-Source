class TrGameNextRoundMessage extends UTLocalMessage;

var localized string Round;
var localized string BeginsIn;

//
// Messages common to GameInfo derivatives.
//
static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(OptionalObject);
    return Default.Round@TrGRI.r_nCurrentRound + 1@default.BeginsIn@Switch;
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

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	if( TrPC != none )
	{
		switch( Switch )
	{
		case 1: TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Count_1Sec' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Count_1Sec', true);
			break;
		case 2: TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Count_2Sec' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Count_2Sec', true);
			break;
		case 3: TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Count_3Sec' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Count_3Sec', true);
			break;
		case 4: TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Count_4Sec' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Count_4Sec', true);
			break;
		case 5: TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Count_5Sec' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Count_5Sec', true);
			break;
		case 10: TrPC.PlayAnnouncerSound((TrPC.GetTeamNum() == 0) ? SoundCue'AUD_VOX_BE_Leader.A_CUE_Arena_Count_10Sec' : SoundCue'AUD_VOX_DS_Leader.A_CUE_Arena_Count_10Sec', true);
			break;
		}
	}
}

defaultproperties
{
   Round="Round"
   BeginsIn="begins in:"
   MessageArea=4
   Lifetime=4.000000
   Name="Default__TrGameNextRoundMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
