/**
 * 
 */
class TrControlSettings extends GFxObject
    native;

var int       m_ControlSettingsCount;
var GFxObject m_ControlSettingsList;

native function FlushSettings();
native function StoreSetting(int SettingId, int Val);
native function int ReadSetting(int SettingId);

function ReadSettings()
{
    local int i;
    local float val;

    for (i = ESL_CONTROL_START+1; i < ESL_CONTROL_END; i++)
    {
        val = float(ReadSetting(ESettingsList(i)));

        if (val >= 0)
        {
            if (val != GetCurrentControlValue(ESettingsList(i)))
            {
                SaveControlSetting(i, val, false);
            }
        }
    }
}

function LoadControlSettings(GFxObject List)
{
    local int i;
    local float val;
    local string controlName;

    m_ControlSettingsCount = 0;
    m_ControlSettingsList = List;
    
    for (i = ESL_CONTROL_START+1; i < ESL_CONTROL_END; i++)
    {
        controlName = GetControlNameFromType(ESettingsList(i));
        val = GetCurrentControlValue(ESettingsList(i));

        AddControlSetting(controlName, val);
    }
}

function AddControlSetting(string ControlName, float Val)
{
    local GFxObject obj;

    obj = CreateObject("Object");           
    obj.SetString("label", ControlName);
    obj.SetFloat("value", Val);

    m_ControlSettingsList.SetElementObject(m_ControlSettingsCount++, obj);
}

function SaveControlSetting(int Index, float Val, optional bool bStore = true)
{
	local int IntVal;
    local PlayerInput pInput;

    pInput = GetPlayerInput();

    if (pInput == none)
    {
        return;
    }
    
	IntVal = int(Val);

    if (bStore)
    {
        StoreSetting(ESettingsList(Index), IntVal);
    }
    
    switch (ESettingsList(Index))
    {
    case ESL_MOUSESENSITIVITY:
    case ESL_FLYINGPITCHSENSITIVITY:
    case ESL_FLYINGYAWSENSITIVITY:
        Val /= 1000;
        break;
    }

    switch (ESettingsList(Index))
    {
    case ESL_MOUSESENSITIVITY:
        if (Val > 0) pInput.MouseSensitivity = Val;
        break;
    case ESL_FLYINGPITCHSENSITIVITY:
        if (Val > 0) pInput.FlyingPitchSensitivity = Val;
        break;
    case ESL_FLYINGYAWSENSITIVITY:
        if (Val > 0) pInput.FlyingYawSensitivity = Val;
        break;
    case ESL_MOUSEINVERT:
        pInput.bInvertMouse = (IntVal > 0) ? true : false;
        break;
    case ESL_VEHICLEINVERT:
        pInput.bInvertAirVehicles = (IntVal > 0) ? true : false;
        break;
    case ESL_MOUSESMOOTHING:
        pInput.bEnableMouseSmoothing = (IntVal > 0) ? true : false;
        break;
    case ESL_FOV:
        pInput.FOVSetting = IntVal;
        break;
    case ESL_TOGGLEZOOM:
        pInput.bUseToggleZoom = (IntVal > 0) ? true : false;
        break;
    case ESL_TINYWEAPONS:
        SaveTinyWeaponValue(IntVal);
        break;
    case ESL_DISABLEHELP:
        SaveHelpTextValue(IntVal);
        break;
    case ESL_HUDOBJECTIVES:
        SaveHUDObjectivesValue(IntVal);
        break;
    case ESL_DAMAGECOUNTER:
        SaveDamageCounterValue(IntVal);
        break;
    case ESL_ALIENFX:
        SaveAlienFXValue(IntVal);
        break;
    case ESL_CHATFILTER:
        SaveChatFilterValue(IntVal);
        break;
    case ESL_HUDFRIENDSNOTIFY:
        SaveHUDFriendStateNotificationsValue(IntVal);
        break;
    case ESL_WHISPERNOTIFY:
        SaveWhisperNotificationsValue(IntVal);
        break;
    case ESL_SIMULATEDPROJECTILES:
		SaveSimulatedProjectilesValue(IntVal);
		break;
    default:
        break;
    }

	pInput.SaveConfig();
    UpdateRuntimePlayer(pInput);
}

function float GetCurrentControlValue(ESettingsList Index)
{
    local PlayerInput pInput;

    pInput = GetPlayerInput();

    if (pInput == none) return -1;

    switch (Index)
    {
    case ESL_MOUSESENSITIVITY:
        return pInput.MouseSensitivity;
    case ESL_FLYINGPITCHSENSITIVITY:
        return pInput.FlyingPitchSensitivity;
    case ESL_FLYINGYAWSENSITIVITY:
        return pInput.FlyingYawSensitivity;
    case ESL_MOUSEINVERT:
        return int(pInput.bInvertMouse);
    case ESL_VEHICLEINVERT:
        return int(pInput.bInvertAirVehicles);
    case ESL_MOUSESMOOTHING:
        return int(pInput.bEnableMouseSmoothing);
    case ESL_FOV:
        return pInput.FOVSetting;
    case ESL_TOGGLEZOOM:
        return int(pInput.bUseToggleZoom);
    case ESL_TINYWEAPONS:
        return int(GetTinyWeaponValue());
    case ESL_HUDOBJECTIVES:
        return int(GetHUDObjectivesValue());
    case ESL_DISABLEHELP:
        return int(GetHelpTextValue());
    case ESL_DAMAGECOUNTER:
        return int(GetDamageCounterValue());
    case ESL_ALIENFX:
        return int(GetAlienFXValue());
    case ESL_CHATFILTER:
        return int(GetChatFilterValue());
    case ESL_HUDFRIENDSNOTIFY:
        return int(GetHUDFriendStateNotifications());
    case ESL_WHISPERNOTIFY:
        return GetWhisperNotificationsValue();
    case ESL_SIMULATEDPROJECTILES:
		return int(GetSimulatedProjectilesValue());
    default:
        break;
    }

    return -1;
}

function ESettingsList GetControlTypeFromName(string ControlName)
{
    switch (ControlName)
    {
    case "MouseSensitivity":
        return ESL_MOUSESENSITIVITY;
    case "FlyingPitchSensitivity":
        return ESL_FLYINGPITCHSENSITIVITY;
    case "FlyingYawSensitivity":
        return ESL_FLYINGYAWSENSITIVITY;
    case "MouseInvert":
        return ESL_MOUSEINVERT;
    case "VehicleInvert":
        return ESL_VEHICLEINVERT;
    case "MouseSmoothing":
        return ESL_MOUSESMOOTHING;
    case "FOV":
        return ESL_FOV;
    case "ToggleZoom":
        return ESL_TOGGLEZOOM;
    case "TinyWeapons":
        return ESL_TINYWEAPONS;
    case "DisableHelp":
        return ESL_DISABLEHELP;
    case "DamageCounter":
        return ESL_DAMAGECOUNTER;
    case "AlienFX":
        return ESL_ALIENFX;
    case "ChatFilter":
        return ESL_CHATFILTER;
    case "HudFriendsNotify":
        return ESL_HUDFRIENDSNOTIFY;
    case "WhisperNotify":
        return ESL_WHISPERNOTIFY;
    case "SimulatedProjectiles":
		return ESL_SIMULATEDPROJECTILES;
    default:
        break;
    }

    return -1;
}

function String GetControlNameFromType(ESettingsList Index)
{
    switch (Index)
    {
    case ESL_MOUSESENSITIVITY:
        return "MouseSensitivity";
    case ESL_FLYINGPITCHSENSITIVITY:
        return "FlyingPitchSensitivity";
    case ESL_FLYINGYAWSENSITIVITY:
        return "FlyingYawSensitivity";
    case ESL_MOUSEINVERT:
        return "MouseInvert";
    case ESL_VEHICLEINVERT:
        return "VehicleInvert";
    case ESL_MOUSESMOOTHING:
        return "MouseSmoothing";
    case ESL_FOV:
        return "FOV";
    case ESL_TOGGLEZOOM:
        return "ToggleZoom";
    case ESL_TINYWEAPONS:
        return "TinyWeapons";
    case ESL_DISABLEHELP:
        return "DisableHelp";
    case ESL_DAMAGECOUNTER:
        return "DamageCounter";
    case ESL_ALIENFX:
        return "AlienFX";
    case ESL_CHATFILTER:
        return "ChatFilter";
    case ESL_HUDFRIENDSNOTIFY:
        return "HudFriendsNotify";
    case ESL_WHISPERNOTIFY:
        return "WhisperNotify";
	case ESL_SIMULATEDPROJECTILES:
		return "SimulatedProjectiles";
    default:
        break;
    }

    return "N/A";
}

function PlayerInput GetPlayerInput()
{
    local PlayerController pc;

    pc = GetPC();

    if (pc == none) return none;

    if (TrPlayerController(pc) != none) return TrPlayerController(pc).GetEngineSettings();
    else return pc.PlayerInput;
}

function UpdateRuntimePlayer(PlayerInput EngineInput)
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC == none) return;
    
    TrPC.PlayerInput.MouseSensitivity = EngineInput.MouseSensitivity;
    TrPC.PlayerInput.bInvertMouse = EngineInput.bInvertMouse;
    TrPC.PlayerInput.bInvertAirVehicles = EngineInput.bInvertAirVehicles;
	TrPC.PlayerInput.FlyingPitchSensitivity = EngineInput.FlyingPitchSensitivity;
	TrPC.PlayerInput.FlyingYawSensitivity = EngineInput.FlyingYawSensitivity;
	TrPC.SetAirVehicleControls(TrPC.PlayerInput.bInvertAirVehicles);
	TrPC.PlayerInput.bEnableMouseSmoothing = EngineInput.bEnableMouseSmoothing;
    TrPC.PlayerInput.FOVSetting = EngineInput.FOVSetting;
    TrPC.PlayerInput.bUseToggleZoom = EngineInput.bUseToggleZoom;
    
    TrPC.SetFOV(EngineInput.FOVSetting);
}

function SaveTinyWeaponValue(int Val)
{
    TrPlayerController(GetPC()).EnableTinyWeapons(Val > 0 ? true : false);
}

function bool GetTinyWeaponValue()
{
    return TrPlayerController(GetPC()).GetTinyWeaponValue();
}

function bool GetAlienFXValue()
{
    return TrPlayerController(GetPC()).EnableAlienFX;
}

function SaveAlienFXValue(int Val)
{
    TrPlayerController(GetPC()).ShowAlienFX(Val > 0 ? true : false);
}

function SaveChatFilterValue(int Val)
{
    TrPlayerController(GetPC()).EnableChatFilter(Val > 0 ? true : false);
}

function bool GetChatFilterValue()
{
    return TrPlayerController(GetPC()).GetChatFilterValue();
}

function SaveHUDFriendStateNotificationsValue(int Val)
{
    TrPlayerController(GetPC()).EnableHUDFriendStateNotifications(Val > 0 ? true : false);
}

function bool GetHUDFriendStateNotifications()
{
    return TrPlayerController(GetPC()).GetHUDFriendStateNotifications();
}

function SaveWhisperNotificationsValue(int Val)
{
    TrPlayerController(GetPC()).SetWhisperFilter(Val);
}

function int GetWhisperNotificationsValue()
{
    return TrPlayerController(GetPC()).GetWhisperFilterValue();
}

function SaveHelpTextValue(int Val)
{
    local int i;
    local TrHelpTextManager helpText;
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        helpText = TrPC.m_HelpTextManager;

        if (helpText != none)
        {
            helpText.m_bShowHelpTexts = (Val > 0 ? false : true);
            helpText.SaveConfig();

            if (!helpText.m_bShowHelpTexts)
            {
                for (i = 0; i < helpText.m_HelpTextQueue.Length; i++)
                {
                    TrPC.SuppressHelpText();
                }
            }
        }
    }
}

function bool GetHelpTextValue()
{
    return !TrPlayerController(GetPC()).m_HelpTextManager.m_bShowHelpTexts;
}

function SaveSimulatedProjectilesValue(int Val)
{
	TrPlayerController(GetPC()).SetAllowSimProjectiles(Val > 0 ? true : false);
}

function bool GetSimulatedProjectilesValue()
{
	return TrPlayerController(GetPC()).m_bAllowSimulatedProjectiles;
}

function SaveDamageCounterValue(int Val)
{
    TrPlayerController(GetPC()).EnableDamageCounter(Val > 0 ? true : false);
}

function bool GetDamageCounterValue()
{
    return TrPlayerController(GetPC()).GetDamageCounterValue();
}

function SaveHUDObjectivesValue(int Val)
{
    TrPlayerController(GetPC()).EnableHUDObjectives(Val > 0 ? true : false);
}

function bool GetHUDObjectivesValue()
{
    return TrPlayerController(GetPC()).GetHUDObjectivesValue();
}

defaultproperties
{
   Name="Default__TrControlSettings"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
