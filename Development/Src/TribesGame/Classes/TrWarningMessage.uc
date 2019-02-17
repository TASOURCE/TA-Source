//	0 - FumbledFlag
//  1 - Saber Launcher needs a target in order to fire.
//  2 - Missile locked on to you.
//  3 - Missile is targeting you.
//  4 - Missile intercepted.
//  5 - Suicide penalty.
//  6 - Requires X credits to fire
class TrWarningMessage extends UTLocalMessage;

var localized string FumbledFlag;
var localized string SaberLauncherNeedsTargetToFire;
var localized string MissileLockedOnToYou;
var localized string MissileTargetingYou;
var localized string MissileIntercepted;
var localized string SuicidePenalty;
var localized string RequiresCreditsToFire;
var localized string RequiresPowerToFire;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local TrCallIn CallIn;
	local string finalMessage;

	switch (Switch)
	{
		case 0: return Default.FumbledFlag;
		case 1: return Default.SaberLauncherNeedsTargetToFire;
		case 2: return Default.MissileLockedOnToYou;
		case 3: return Default.MissileTargetingYou;
		case 4: return Default.MissileIntercepted;
		case 5: return Default.SuicidePenalty;
		case 6:
			finalMessage = default.RequiresCreditsToFire;
			CallIn = TrCallIn(OptionalObject);
			if( CallIn != none )
			{
				finalMessage = Repl(finalMessage, "[CREDITS]", CallIn.CreditCost, true);
			}
			return finalMessage;
        case 7: return Default.RequiresPowerToFire;
	}

	return "";
}

defaultproperties
{
   FumbledFlag="Fumbled flag from concussion blast"
   SaberLauncherNeedsTargetToFire="Requires in air locked-on target to fire"
   MissileLockedOnToYou="Incoming missile. Shoot it down!"
   MissileTargetingYou="Missile attempting to target you"
   MissileIntercepted="Missile intercepted"
   SuicidePenalty="Suicide penalty: +5 seconds"
   RequiresCreditsToFire="Requires [CREDITS] credits to fire"
   RequiresPowerToFire="Requires generator power to fire"
   MessageArea=2
   AnnouncementPriority=1
   Name="Default__TrWarningMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
