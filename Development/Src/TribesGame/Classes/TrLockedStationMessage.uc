class TrLockedStationMessage extends UTLocalMessage;

var localized string StationLocked;
var localized string Seconds;
var localized string Second;

var SoundCue DeniedSound;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if( Switch > 1 )
	{
		return default.StationLocked@Switch@default.Seconds;
	}
	else
	{
		return default.StationLocked@Switch@default.Second;
	}
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	P.PlaySound(default.DeniedSound);

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   StationLocked="Locked from station for"
   Seconds="seconds"
   second="second"
   MessageArea=2
   Name="Default__TrLockedStationMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
