// 0 - Station Not Powered
// 1 - Enemy Station
// 2 - Neutral Station denied
// 3 - Non-held station denied

class TrStationMessage extends UTLocalMessage;

var localized string StationNotPowered;
var localized string EnemyStation;
var localized string NeutralStation;
var localized string ControlPoint;
var localized string MustBeHeld;

var SoundCue StationNotPoweredSound;
var SoundCue EnemyStationSound;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local TrCaHCapturePoint CP;

	switch (Switch)
	{
		case 0:
			return Default.StationNotPowered;
			break;
		case 1:
			return Default.EnemyStation;
			break;
		case 2:
			return Default.NeutralStation;
			break;
		case 3:
			CP = TrCaHCapturePoint(OptionalObject);
			if( CP != none )
			{
				return Default.ControlPoint@CP.GetScreenName(none)@default.MustBeHeld;
			}
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

	switch (Switch)
	{
		case 0: sound = Default.StationNotPoweredSound;
			break;
		case 1: sound = Default.EnemyStationSound;
			break;
		case 2: sound = Default.EnemyStationSound;
			break;
		case 3: sound = Default.EnemyStationSound;
			break;
	}

	if (sound!=None)
		P.PlaySound(sound, true);

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   StationNotPowered="Denied: Repair the generator to restore power to station"
   EnemyStation="Denied: You cannot use an enemy station"
   NeutralStation="Denied: You cannot use a neutral station"
   ControlPoint="Denied: Control point"
   MustBeHeld="must be held"
   MessageArea=2
   Name="Default__TrStationMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
