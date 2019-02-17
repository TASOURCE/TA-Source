class TrDeployableMessage extends UTLocalMessage;

var localized string DeployableHologramTooCloseToEnemyBase;
var localized string DeployableHologramTooCloseToAnotherDeployable;
var localized string DeployableHologramOnlyOutside;
var localized string DeployableHologramInvalidDeploySpot;
var localized string DeployableAmmoRemaining;
var localized string DeployableAmmoDepleted;

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
		case 0:
			return Default.DeployableHologramTooCloseToEnemyBase;
			break;
		case 1:
			return Default.DeployableHologramTooCloseToAnotherDeployable;
			break;
		case 2:
			return Default.DeployableHologramOnlyOutside;
			break;
		case 3:
			return Default.DeployableHologramInvalidDeploySpot;
			break;
		case 4:
			return default.DeployableAmmoRemaining@TrDevice_Deployable(OptionalObject).GetAmmoCount();
		case 5:
			return default.DeployableAmmoDepleted;
	}
	return "";
}

defaultproperties
{
   DeployableHologramTooCloseToEnemyBase="Invalid deploy location"
   DeployableHologramTooCloseToAnotherDeployable="Too close to another deployable of the same type"
   DeployableHologramOnlyOutside="Can only be deployed outside"
   DeployableHologramInvalidDeploySpot="Invalid deploy location"
   DeployableAmmoRemaining="Deployable ammo remaining:"
   DeployableAmmoDepleted="Deployable ammo depleted"
   Name="Default__TrDeployableMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
