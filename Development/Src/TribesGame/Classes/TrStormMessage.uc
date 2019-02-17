// 0. ControlPointWon 
// 1. ControlPointLost 
// 2. ControlPointTransitioning 
// 3. FriendlyCarrierShields50Percent 
// 4. EnemyCarrierShields50Percent 
// 5. FriendlyCarrierShieldsDown 
// 6. EnemyCarrierShieldsDown 
// 7. EnemyCore75Percent 
// 8. EnemyCore50Percent 
// 9. EnemyCore25Percent 
// 10. EnemyCoreDestroyed 
// 11. FriendlyCore75Percent 
// 12. FriendlyCore50Percent 
// 13. FriendlyCore25Percent 
// 14. FriendlyCoreDestroyed 

class TrStormMessage extends UTLocalMessage;

var localized string ControlPointWon;
var localized string ControlPointLost;
var localized string ControlPointTransitioning;
var localized string FriendlyCarrierShields50Percent;
var localized string EnemyCarrierShields50Percent;
var localized string FriendlyCarrierShieldsDown;
var localized string EnemyCarrierShieldsDown;
var localized string EnemyCore75Percent;
var localized string EnemyCore50Percent;
var localized string EnemyCore25Percent;
var localized string EnemyCoreDestroyed;
var localized string FriendlyCore75Percent;
var localized string FriendlyCore50Percent;
var localized string FriendlyCore25Percent;
var localized string FriendlyCoreDestroyed;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local TrStormControlPoint ControlPoint;

	ControlPoint = TrStormControlPoint(OptionalObject);
	switch( switch )
	{
		case 0: return (ControlPoint.GetScreenName(none)@default.ControlPointWon);
		case 1: return (ControlPoint.GetScreenName(none)@default.ControlPointLost);
		case 2: return (ControlPoint.GetScreenName(none)@default.ControlPointTransitioning);
		case 3: return default.FriendlyCarrierShields50Percent;
		case 4: return default.EnemyCarrierShields50Percent;
		case 5: return default.FriendlyCarrierShieldsDown;
		case 6: return default.EnemyCarrierShieldsDown;
		case 7: return default.EnemyCore75Percent;
		case 8: return default.EnemyCore50Percent;
		case 9: return default.EnemyCore25Percent;
		case 10: return default.EnemyCoreDestroyed;
		case 11: return default.FriendlyCore75Percent;
		case 12: return default.FriendlyCore50Percent;
		case 13: return default.FriendlyCore25Percent;
		case 14: return default.FriendlyCoreDestroyed;
	}
	return "";
}

defaultproperties
{
   ControlPointWon="taken"
   ControlPointLost="lost"
   ControlPointTransitioning="transitioning"
   FriendlyCarrierShields50Percent="Our Carrier shields are at 50%"
   EnemyCarrierShields50Percent="Enemy Carrier shields are at 50%"
   FriendlyCarrierShieldsDown="Our Carrier shields are down"
   EnemyCarrierShieldsDown="Enemy Carrier shields are down"
   EnemyCore75Percent="Enemy Carrier core health at 75%"
   EnemyCore50Percent="Enemy Carrier core health at 50%"
   EnemyCore25Percent="Enemy Carrier core health at 25%"
   EnemyCoreDestroyed="Enemy Carrier core destroyed"
   FriendlyCore75Percent="Our Carrier core health at 75%"
   FriendlyCore50Percent="Our Carrier core health at 50%"
   FriendlyCore25Percent="Our Carrier core health at 25%"
   FriendlyCoreDestroyed="Our Carrier core is destroyed"
   MessageArea=4
   Lifetime=4.000000
   Name="Default__TrStormMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
