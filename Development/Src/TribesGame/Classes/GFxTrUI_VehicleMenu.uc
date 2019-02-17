//
//
//
class GFxTrUI_VehicleMenu extends UTGFxTweenableMoviePlayer;

function bool Start(optional bool StartPaused = false)
{
    super.Start();
    Advance(0);

    return TRUE;
}

//
//	Send the active menu options to scaleform
//
function ConfigureOptions(class<TrFamilyInfo> FamilyInfo)
{
	local int CreditCost;
	local int j;
	local TrPlayerController TrPC;

	VehicleOptionsClear();

	TrPC = TrPlayerController(GetPC());

	for (j = 0; j < FamilyInfo.default.VehicleSelectionList.Length; j++)
	{
		// Determine the credit cost.
		CreditCost = (TrPC != none && TrPC.InTraining()) ? 0 : TrPC.GetVehicleCost(FamilyInfo.default.VehicleSelectionList[j]);

		SetVehicleOption(
				string(FamilyInfo.default.VehicleSelectionList[j]),
				FamilyInfo.default.VehicleSelectionList[j].default.m_sName,
				// Don't charge if roaming in a map.
				CreditCost,
				FamilyInfo.default.VehicleSelectionList[j].default.m_nIconIndex);
	}

	VehicleOptionsComplete(TrPlayerController(GetPC()).GetCurrentCredits());
}

function VehicleOptionsComplete(int credits)
{
	ActionScriptVoid("_root.VehicleOptionsComplete");
}
function VehicleOptionsClear()
{
	ActionScriptVoid("_root.VehicleOptionsClear");
}
function SetVehicleOption(string className, string displayName, int cost, int nIconIndex)
{
	ActionScriptVoid("_root.SetVehicleOption");
}

function string GetSelectedVehicle()
{
	return ActionScriptString("_root.GetVehicleSetting");
}

function OnVehicleScreenFinished()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(GetPC());

	// read the selected options from scaleform and make changes to the loadout
	TrPC.RequestBuyVehicle(GetSelectedVehicle());

    TrHUD(TrPC.myHUD).CompleteVehicleMenuClose();
}

defaultproperties
{
   bPauseGameWhileActive=True
   bCaptureInput=True
   Name="Default__GFxTrUI_VehicleMenu"
   ObjectArchetype=UTGFxTweenableMoviePlayer'UTGame.Default__UTGFxTweenableMoviePlayer'
}
