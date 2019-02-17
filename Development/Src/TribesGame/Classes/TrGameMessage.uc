//0 - TeamSwap
//1 - You are on Blood Eagle
//2 - You are on Diamond Sword
//3 - Overtime
//4 - Match about to start
//5 - Waiting for players
class TrGameMessage extends UTLocalMessage;

var localized string YouAreOnBloodEagleMessage;
var localized string YouAreOnDiamondSwordMessage;
var localized string OvertimeNotification;
var localized string WaitingForPlayers;

var SoundCue m_sMatchStartBloodEagle;
var SoundCue m_sMatchStartDiamondSword;

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
	switch (Switch)
	{
		//case 0:
		//	return Default.RequestTeamSwapPrefix@RelatedPRI_1.PlayerName@Default.RequestTeamSwapPostfix;
		case 1:
			return Default.YouAreOnBloodEagleMessage;
		case 2:
			return Default.YouAreOnDiamondSwordMessage;
		case 3:
			return Default.OvertimeNotification;
		case 5:
			return Default.WaitingForPlayers;
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
	local SoundCue sound;
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(P);

	switch (Switch)
	{
	case 2: sound = Default.m_sMatchStartDiamondSword;
		break;
	case 1: sound = Default.m_sMatchStartBloodEagle;
		break;
	}

	// Don't play team-centric announcements if spectating.
	if( P.GetTeamNum() != 255 )
	{
		if (sound!=None)
			TrPC.PlayAnnouncerSound(sound, false);
	}

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   YouAreOnBloodEagleMessage="You are on Blood Eagle"
   YouAreOnDiamondSwordMessage="You are on Diamond Sword"
   OvertimeNotification="Overtime"
   WaitingForPlayers="Waiting for players"
   MessageArea=4
   Lifetime=4.000000
   Name="Default__TrGameMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
