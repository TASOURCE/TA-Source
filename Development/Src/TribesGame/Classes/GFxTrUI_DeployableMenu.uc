//
//
//
class GFxTrUI_DeployableMenu extends UTGFxTweenableMoviePlayer;
/* DEPRECATED
function bool Start(optional bool StartPaused = false)
{
    //`log("Starting deployable menu");

    super.Start();
    Advance(0);

    return TRUE;
}

//
//	Send the active menu options to scaleform
//
function ConfigureOptions(TrPawn TrP)
{
	local class<TrFamilyInfo> FamilyInfo;
    local class<TrDevice> DeviceClass;
	local int j;

	FamilyInfo = TrP.GetCurrCharClassInfo();

	DeployableOptionsClear();

	for (j = 0; j < FamilyInfo.default.DevSelectionList.Length; j++)
	{
		if (FamilyInfo.default.DevSelectionList[j].EquipPoint==EQP_Deployable)
		{
			DeviceClass = FamilyInfo.default.DevSelectionList[j].DeviceClass;

			SetDeployableOption(string(DeviceClass),
						DeviceClass.default.ItemName,
						DeviceClass.default.m_nCreditCost,
						(class<TrDevice_Deployable>(DeviceClass)).default.m_nPerPlayerMaxDeployed,
						TrP.CurrentDeployedCount(DeviceClass),
						DeviceClass.default.m_nIconIndex);
		}
	}

	DeployableOptionsComplete(TrPlayerController(GetPC()).GetCurrentCredits());
}

function DeployableOptionsComplete(int credits)
{
	ActionScriptVoid("_root.DeployableOptionsComplete");
}

function DeployableOptionsClear()
{
	ActionScriptVoid("_root.DeployableOptionsClear");
}

function SetDeployableOption(string className, string displayName, int cost, int maxCount, int currentCount, int icon)
{
	ActionScriptVoid("_root.SetDeployableOption");
}

function string GetSelectedDeployable()
{
	local string s;
	s=ActionScriptString("_root.GetDeploySetting");
	//`log("player selected"@s);
	return s;
}

function OnDeployableScreenFinished()
{
	// read the selected options from scaleform and make changes to the loadout
	// TrPlayerController(GetPC()).RequestDeployableChange(GetSelectedDeployable());

    TrHUD(GetPC().MyHUD).CompleteDeployableMenuClose();
}

defaultproperties
{
    bEnableGammaCorrection=FALSE
	bPauseGameWhileActive=TRUE
	bCaptureInput=true
}
*/

defaultproperties
{
   Name="Default__GFxTrUI_DeployableMenu"
   ObjectArchetype=UTGFxTweenableMoviePlayer'UTGame.Default__UTGFxTweenableMoviePlayer'
}
