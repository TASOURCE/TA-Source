class TrCallInMessage extends UTLocalMessage;

var localized string PlayerCalledInSupportInventory;
var localized string PlayerCalledInOrbitalStrike;
var localized string PlayerCalledInTacticalStrike;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local string Suffix;

	switch( switch )
	{
		case TRCALLIN_SupportInventory: Suffix = default.PlayerCalledInSupportInventory; break;
		case TRCALLIN_OrbitalStrike: Suffix = default.PlayerCalledInOrbitalStrike; break;
		case TRCALLIN_TacticalStrike: Suffix = default.PlayerCalledInTacticalStrike; break;
	}

	return RelatedPRI_1.PlayerName$Suffix;
}

defaultproperties
{
   PlayerCalledInSupportInventory=" called in an Inventory Station"
   PlayerCalledInOrbitalStrike=" called in an Orbital Strike"
   PlayerCalledInTacticalStrike=" called in a Tactical Strike"
   MessageArea=4
   Lifetime=4.000000
   Name="Default__TrCallInMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
