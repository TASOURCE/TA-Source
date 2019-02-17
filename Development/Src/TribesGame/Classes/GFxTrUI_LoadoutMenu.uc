//
//
//
class GFxTrUI_LoadoutMenu extends UTGFxTweenableMoviePlayer;
/* DEPRECATED
// Localized strings to use as button labels
var localized string ResumeString, ExitString;

var bool	m_bUIOptionsInitialized;

var	array<SoundCue> m_HUDSoundCues;							// DO NOT REMOVE unless Actionscript is making its own sounds

function bool Start(optional bool StartPaused = false)
{
    //`log("Starting loadout menu");

    super(UTGFxTweenableMoviePlayer).Start();
    Advance(0);

    return TRUE;
}

function string GetSlotNameFromEquipPoint(int eqp)
{
	switch (eqp)
	{
	case EQP_Primary:	return "Primary";
	case EQP_Secondary:	return "Secondary";
	case EQP_Pack:		return "Pack";
	case EQP_Belt:		return "Belt";
	case EQP_Deployable:return "Deployable";
	}

	return "";
}

//
//	Send the confguration of menu options to scaleform
//
function ConfigureOptions(bool bisSpawning)
{
	local int i,j;
	local string message;
    local class<TrFamilyInfo> FamilyInfo;
    local class<TrDevice> DeviceClass;
	local string eqpPoint;
	local array<string> famList;

	// $$LOCALIZE
	message = bisSpawning ? "Ready to Respawn" : "Close";

	if (!m_bUIOptionsInitialized)
	{
		famList[0]="Light";
		famList[1]="Medium";
		famList[2]="Heavy";

		//
		//	send the various weapon options through to the UI for the user to choose
		//
		for (i=0; i<famList.Length; i++)
		{
			FamilyInfo = class<TrFamilyInfo>(DynamicLoadObject("TribesGame.TrFamilyInfo_"$famList[i], class'Class'));

			for (j = 0; j < FamilyInfo.default.DevSelectionList.Length; j++)
			{
				eqpPoint = GetSlotNameFromEquipPoint(FamilyInfo.default.DevSelectionList[j].EquipPoint);

				if (eqpPoint!="")
				{
					DeviceClass = FamilyInfo.default.DevSelectionList[j].DeviceClass;

					SetLoadoutOption(famList[i],eqpPoint,
						string(DeviceClass),
						DeviceClass.default.ItemName,
						DeviceClass.default.m_nCreditCost,
						DeviceClass.default.m_nIconIndex);
				}
			}
		}
		LoadoutOptionsComplete();
	}

	SetLoadoutExitOptions(message,10,
		TrPlayerController(GetPC()).GetCurrentCredits(),
		TrPlayerController(GetPC()).GetTotalInventoryCreditValue());

	m_bUIOptionsInitialized=true;
}

function LoadoutOptionsComplete()
{
	ActionScriptVoid("_root.LoadoutOptionsComplete");
}

function SetLoadoutExitOptions(string displayMessage, int respawnSeconds, int currentCredits, int currentLoadoutValue)
{
	ActionScriptVoid("_root.SetLoadoutExitOptions");
}

function GamepadAnalogStickInput(float leftAngle, float rightAngle)
{
	ActionScriptVoid("_root.GamepadAnalogStickInput");
}

function SetLoadoutOption(string Armor, string slot, string className, string displayName, int cost, int iconIndex)
{
	ActionScriptVoid("_root.SetLoadoutOption");
}

function string GetSelectedArmorLevel()
{
	return ActionScriptString("_root.GetLoadoutArmorSetting");
}

function string GetSelectedPrimaryWeapon()
{
	return ActionScriptString("_root.GetLoadoutPrimarySetting");
}

function string GetSelectedSecondaryWeapon()
{
	return ActionScriptString("_root.GetLoadoutSecondarySetting");
}

function string GetSelectedPack()
{
	return ActionScriptString("_root.GetLoadoutPackSetting");
}

function string GetSelectedBelt()
{
	return ActionScriptString("_root.GetLoadoutBeltSetting");
}

function PlaySoundCueForHud(string SoundCueName)
{
	local SoundCue cue;

	foreach m_HUDSoundCues(cue)
	{
		if (InStr(SoundCueName,String(cue.Name))!=-1)
		{
			GetPC().PlaySound(cue,true);
			break;
		}
	}

	//any cues created THIS way will not play on consoles unless the cue is referenced in default properties.
	//cue = SoundCue(DynamicLoadObject(SoundCueName, class'SoundCue')); 
}

function OnLoadoutScreenFinished()
{
	/*local TrPlayerController TrPC;
	local TrPlayerReplicationInfo repInfo;

	TrPC = TrPlayerController(GetPC());

	if (TrPC == none)
		return;

	// read the selected options from scaleform and make changes to the loadout
	TrPC.RequestLoadoutChange(GetSelectedArmorLevel(),
						  	  GetSelectedPrimaryWeapon(),
							  GetSelectedSecondaryWeapon(),
							  GetSelectedPack(),
							  GetSelectedBelt());

    TrHUD(TrPC.MyHUD).CompleteLoadoutMenuClose();
	repInfo = TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo);

	// Only give our station message if we have an actual change
	if (!TrPC.IsDead() && repInfo.ShouldVisitStation() && !TrPC.m_bLoadoutChangeAlerted)
	{
		// $$LOCALIZE
		TrHUD(TrPC.MyHUD).AddToPromptPanelTime("Visit Inventory Stations to Get New Gear!",-1,APT_Minimal);
		TrPC.m_bLoadoutChangeAlerted = true;
	}*/
}

defaultproperties
{
    bEnableGammaCorrection=FALSE
	m_bUIOptionsInitialized=false
	bCaptureInput=true

	// Add all sound cues that the ActionScript HUD is going to request
	// EXAMPLE:  m_HUDSoundCues.Add(SoundCue'ButtonClickSound')
	// adding in cues used by loadout_radial menu
	m_HUDSoundCues.Add(SoundCue'AUD_MENU.Loadout_Menu.A_CUE_MENU_Loadout_Button_Back_1');
	m_HUDSoundCues.Add(SoundCue'AUD_MENU.Loadout_Menu.A_CUE_MENU_Loadout_Button_Press_1');
	m_HUDSoundCues.Add(SoundCue'AUD_MENU.Loadout_Menu.A_CUE_MENU_Loadout_Button_Press_2');
	m_HUDSoundCues.Add(SoundCue'AUD_MENU.Loadout_Menu.A_CUE_MENU_Loadout_Button_Rollover_1');
	m_HUDSoundCues.Add(SoundCue'AUD_MENU.Loadout_Menu.A_CUE_MENU_Loadout_Button_Rollover_2');
}*/

defaultproperties
{
   Name="Default__GFxTrUI_LoadoutMenu"
   ObjectArchetype=UTGFxTweenableMoviePlayer'UTGame.Default__UTGFxTweenableMoviePlayer'
}
