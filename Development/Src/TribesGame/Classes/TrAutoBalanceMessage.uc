//
//  0 - Twenty seconds until auto-balance
//  1 - Five seconds until auto-balance
//  2 - Auto-balance happened

class TrAutoBalanceMessage extends UTLocalMessage
	abstract;

var	localized string AutoBalanceInTwenty;
var localized string AutoBalanceInFive;
var localized string TeamsAutoBalanced;

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
	case 0: return default.AutoBalanceInTwenty;
	case 1: return default.AutoBalanceInFive;
	case 2: return default.TeamsAutoBalanced;
	}

	return "";
}

defaultproperties
{
   AutoBalanceInTwenty="Auto balance in 20 seconds"
   AutoBalanceInFive="Auto balance in 5 seconds"
   TeamsAutoBalanced="Teams auto balanced"
   MessageArea=4
   AnnouncementPriority=11
   FontSize=2
   Name="Default__TrAutoBalanceMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
