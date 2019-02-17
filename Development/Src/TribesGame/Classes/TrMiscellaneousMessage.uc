//
//  0 - Blood eagle bought a HERC
//  1 - Diamond sword bought a HERC
//

class TrMiscellaneousMessage extends UTLocalMessage
	abstract;

var SoundCue EnemyBloodEagleBoughtHerc;
var SoundCue EnemyDiamondSwordBoughtHerc;
var SoundCue FriendBloodEagleBoughtHerc;
var SoundCue FriendDiamondSwordBoughtHerc;

var SoundCue BloodEagleCloseToWin;
var SoundCue BloodEagleCloseToLoss;
var SoundCue DiamondSwordCloseToWin;
var SoundCue DiamondSwordCloseToLoss;

var	localized string OurTeamBoughtHerc;
var localized string EnemyTeamBoughtHerc;

//
//  switch is "localized" for this player... 
//      0 - our team bought herc
//      1 - enemy team bought herc
//
static function string GetString( optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1,
					optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	switch (Switch)
	{
	case 0: return default.OurTeamBoughtHerc;
	case 1: return default.EnemyTeamBoughtHerc;
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
	local int textIndex;
	local SoundCue sound;
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(P);

	textIndex=-1;

	switch(Switch)
	{
	case TrMISC_BloodEagleBoughtHerc: // blood eagle bought herc
		if (P.GetTeamNum()==0)
		{
			sound = default.FriendBloodEagleBoughtHerc;
			textIndex = 0;
		}
		else
		{
			sound = default.EnemyDiamondSwordBoughtHerc;
			textIndex = 1;
		}
		break;

	case TrMISC_DiamondSwordBoughtHerc: // diamond sword generator down
		if (P.GetTeamNum()==1)
		{
			sound = default.FriendDiamondSwordBoughtHerc;
			textIndex = 0;
		}
		else
		{
			sound = default.EnemyBloodEagleBoughtHerc;
			textIndex = 1;
		}
		break;

	case TrMISC_BloodEagleCloseToWin:
		if (P.GetTeamNum()==0)
		{
			sound = default.BloodEagleCloseToWin;
		}
		else
		{
			sound = default.DiamondSwordCloseToLoss;
		}
		break;

	case TrMISC_DiamondSwordCloseToWin:
		if (P.GetTeamNum()==0)
		{
			sound = default.BloodEagleCloseToLoss;
		}
		else
		{
			sound=default.DiamondSwordCloseToWin;
		}
		break;
	}

		// Don't play team-centric announcements if spectating.
	if( P.GetTeamNum() != 255 )
	{
		if (sound!=none)
		{
			TrPC.PlayAnnouncerSound(sound, false);
		}
	}

	if (textIndex!=-1)
	{
		Super.ClientReceive(P, textIndex, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	}
}

defaultproperties
{
   OurTeamBoughtHerc="We have a HERC"
   EnemyTeamBoughtHerc="The Enemy has a HERC"
   bIsUnique=True
   bIsConsoleMessage=False
   FontSize=1
   Name="Default__TrMiscellaneousMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
