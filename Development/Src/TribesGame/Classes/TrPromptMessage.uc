//	0 - Press 'G' to equip repair gun
//  1 - Press 'G' to upgrade
//  2 - Kick warning.
//  3 - Upgrade denied: not enough credits
//  4 - Upgrade denied: max level reached
//  5 - Press 'G' to enter vehicle
//  6 - Your Jackal grenades have been destroyed

class TrPromptMessage extends UTLocalMessage;

var SoundCue UpgradeDeniedSound;

var localized string EquipRepairGun;
var localized string UpgradeObjective;
var localized string KickWarning;
var localized string ObjectiveUpgradeDeniedNoCredits;
var localized string ObjectiveUpgradeDeniedMaxLevel;
var localized string EnterVehicle;
var localized string YourJackalGrenadesHaveBeenDestroyed;

/** 
 *  Takes a string and replaces any bindings with the user's preference.
 *  Keybinds should be commands wrapped in @s and a $ before the actual name.
 *  Ex: "Press and hold @$GBA_DoSki@ to ski" results in "Press and hold 'SpaceBar' to ski"
 */
static function string FormatText(string InString, TrPlayerController TrPC)
{
	local array<string> Pieces;
	local int i;
	local string BindName, CommandString, ReturnString;

	if (TrPC == none)
		return InString;

	ParseStringIntoArray(InString, Pieces, "@", true);

	for( i = 0; i < Pieces.Length; i++ )
	{
		if( Left(Pieces[i],1) == "$" )
		{
			// Replace word with actual keybind.
			CommandString = Right(Pieces[i],Len(Pieces[i]) - 1);
			BindName = TrPC.PlayerInput.GetBindNameFromCommandScript(CommandString);
			Pieces[i] = BindName;
		}
	}

	JoinArray(Pieces, ReturnString, "'");
	return ReturnString;
}

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local TrGameObjective TrGO;
	local string finalMessage;
	local TrPlayerController TrPC;

	TrGO = TrGameObjective(OptionalObject);
	if (TrGO != none)
	{
		TrPC = TrPlayerController(TrGO.GetALocalPlayerController());
	}
	else
	{
		TrPC = TrPlayerController(OptionalObject);
	}

	switch (Switch)
	{
		case 0: return FormatText(Default.EquipRepairGun, TrPC);
		case 1:
			finalMessage = default.UpgradeObjective;
			if (TrGO != none)
			{
				finalMessage = Repl(finalMessage, "[OBJNAME]", TrGO.m_sScreenName, true);
			}
			return FormatText(finalMessage, TrPC);
		case 2:
			return default.KickWarning;
		case 3:
			finalMessage = default.ObjectiveUpgradeDeniedNoCredits;
			if (TrGO != none)
			{
				finalMessage = Repl(finalMessage, "[OBJNAME]", TrGO.m_sScreenName, true);
				finalMessage = Repl(finalMessage, "[CREDITS]", TrGO.GetUpgradeCost(TrPC), true);
			}
			if (TrPC != none)
			{
				TrPC.PlaySound(default.UpgradeDeniedSound, true);
			}
			return FormatText(finalMessage, TrPC);
		case 4:			
			finalMessage = default.ObjectiveUpgradeDeniedMaxLevel;
			if (TrGO != none)
			{
				finalMessage = Repl(finalMessage, "[OBJNAME]", TrGO.m_sScreenName, true);
			}
			if (TrPC != none)
			{
				TrPC.PlaySound(default.UpgradeDeniedSound, true);
			}
			return FormatText(finalMessage, TrPC);
		case 5:
			return FormatText(default.EnterVehicle, TrPC);
		case 6:
			if (TrPC != none)
			{
				TrPC.PlaySound(default.UpgradeDeniedSound, true);
			}
			return default.YourJackalGrenadesHaveBeenDestroyed;
	}

	return "";
}

defaultproperties
{
   EquipRepairGun="Press @$GBA_Use@ to equip Repair Gun"
   UpgradeObjective="Press @$GBA_Use@ to upgrade [OBJNAME]"
   KickWarning="You are about to be kicked for idling"
   ObjectiveUpgradeDeniedNoCredits="[OBJNAME] upgrade denied - costs [CREDITS] credits"
   ObjectiveUpgradeDeniedMaxLevel="[OBJNAME] upgrade denied - max level reached"
   EnterVehicle="Press @$GBA_Use@ to exit or enter vehicle"
   YourJackalGrenadesHaveBeenDestroyed="Your Jackal grenades have been destroyed"
   MessageArea=2
   Name="Default__TrPromptMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
