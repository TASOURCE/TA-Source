//	0 - Armor Class Restricted (can't get into vehicle, i.e. too fat)
//  1 - Vehicle Locked (can't get into vehicle, someone else's)
class TrVehicleMessage extends UTLocalMessage;

var localized string ArmorClassRestricted;
var localized string VehicleLocked;

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
		case 0: return Default.ArmorClassRestricted;
		case 1: return Default.VehicleLocked;
	}

	return "";
}

defaultproperties
{
   ArmorClassRestricted="Armor type cannot crew this vehicle"
   VehicleLocked="Vehicle locked"
   Name="Default__TrVehicleMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
