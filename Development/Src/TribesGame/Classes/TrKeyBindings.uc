class TrKeyBindings extends GFxObject
    native;

var bool        m_bGotInputKey;
var int         m_KeyBindingsCount;
var GFxObject   m_KeyBindingsList;
var PlayerInput m_EngineInput;

/** Rare cases where button open/closes a different movie player 
 *  and we need to intercept that key from Scaleform */
var string      m_EscapeKeybind;
var string      m_EnterKeybind;
var string      m_TeamSelectKeybind;
var string      m_ClassSelectKeybind;
var string      m_ScoreboardKeybind;
var string      m_TalkKeybind;
var string      m_TeamTalkKeybind;
var string      m_TalkReplyKeybind;
var string      m_FriendsHotkey;
var string      m_SettingsHotkey;
var string      m_MainMenuHotkey;
var string      m_ChatHotkey;

native function FlushSettings();
native function ClearSettingById(int SettingId);
native function ClearSettingByValue(string strValue);
native function StoreSetting(int SettingId, string Keybind);
native function string ReadSetting(int SettingId);

native function CaptureNextKey();
native function ResetDefaultKeyBindings(PlayerInput pInput);
native function ResetDefaultSpectatorBindings(TrPlayerInput_Spectator pInput);

function ReadBindings()
{
    local int i;
    local string keyName;

    for (i = ESL_KEYBIND_START+1; i < ESL_KEYBIND_END; i++)
    {
        keyName = ReadSetting(ESettingsList(i));

        if (keyName != "")
        {
            if (keyName != GetCurrentBind(ESettingsList(i)))
            {
                SaveKeyBind(i, keyName, false);
            }
        }
    }
}

function string GetCurrentBind(ESettingsList Key)
{
    local PlayerInput pInput;
    local TrPlayerInput_Spectator pSpecInput;

    if (Key < ESL_SPECTATE_MOVEUP)
    {
        pInput = GetPlayerInput();

        if (pInput != none)
        {
            return GetCurrentBinding(pInput, GetCommandName(Key));
        }
    }
    else
    {
        pSpecInput = GetSpectatorInput();

        if (pSpecInput != none)
        {
            return GetCurrentBinding(pSpecInput, GetCommandName(Key));
        }
    }

    return "ERROR";
}

function AddBinding(String Command, String KeyName)
{
    local GFxObject obj;

    obj = CreateObject("Object");           
    obj.SetString("label", Command);
    obj.SetString("value", KeyName);

    m_KeyBindingsList.SetElementObject(m_KeyBindingsCount++, obj);
}

function ApplyKeyBinding(int Index, string Val)
{
    SaveKeyBind(Index, Val);

    SaveInterceptKeys();
}

function String SaveKeyBind(int Index, string KeyName, optional bool bStore = true)
{
    local string retString;

    // Check if this is a player or spectator key
    if (ESettingsList(Index) < ESL_SPECTATE_MOVEUP)
    {
        retString = SavePlayerKeyBind(Index, KeyName, bStore);
    }
    else
    {
        retString = SaveSpectatorKeyBind(Index, KeyName, bStore);
    }

    if (bStore)
    {
        FlushSettings();
    }

    return retString;
}

function String SavePlayerKeyBind(int Index, string KeyName, bool bStore)
{
	local bool bFoundBind;
    local int i;
    local KeyBind newBind;
    local PlayerInput pInput;

    newBind.Command = GetCommandName(ESettingsList(Index));
    newBind.Name = Name(KeyName);
    
    pInput = GetPlayerInput();
    
    if (pInput == none) return "";

    UnbindPlayerCommand(pInput, newBind.Command);

    for(i = 0; i < pInput.Bindings.Length; i++)
	{
		if(pInput.Bindings[i].Name == newBind.Name)
		{
		    pInput.Bindings[i].Command = newBind.Command;

			bFoundBind = true;
		}
	}

    if (bStore)
    {
        ClearSettingByValue(KeyName);
        StoreSetting(Index, KeyName);
    }

	if (!bFoundBind)
	{
		pInput.Bindings[pInput.Bindings.Length] = newBind;
	}

	pInput.SaveConfig();
    UpdateRuntimePlayer(pInput);

    return "";
}

function String SaveSpectatorKeyBind(int Index, string KeyName, bool bStore)
{
	local bool bFoundBind;
    local int i;
    local KeyBind newBind;
    local TrPlayerInput_Spectator pInput;

    newBind.Command = GetCommandName(ESettingsList(Index));
    newBind.Name = Name(KeyName);
    
    pInput = GetSpectatorInput();
    
    if (pInput == none) return "";

    UnbindSpectatorCommand(pInput, newBind.Command);

    for(i = 0; i < pInput.Bindings.Length; i++)
	{
		if(pInput.Bindings[i].Name == newBind.Name)
		{
		    pInput.Bindings[i].Command = newBind.Command;

			bFoundBind = true;
		}
	}

	if (!bFoundBind)
	{
		pInput.Bindings[pInput.Bindings.Length] = newBind;
	}

    if (bStore)
    {
        ClearSettingByValue(KeyName);
        StoreSetting(Index, KeyName);
    }

	pInput.SaveConfig();
    UpdateRuntimeSpectator(pInput);

    return "";
}

function UnbindPlayerCommand(PlayerInput pInput, String Command)
{
	local int i;
    local bool bRemoved;

    if (pInput == none) return;

    bRemoved = true;

    while (bRemoved)
    {
        bRemoved = false;

	    for (i = 0; i < pInput.Bindings.Length; i++)
	    {
		    if (pInput.Bindings[i].Command == Command && 
	            InStr(pInput.Bindings[i].Name,"Xbox") < 0 && 
	            InStr(pInput.Bindings[i].Name,"GBA_") < 0)
	        {
		        pInput.Bindings[i].Command = " ";
			    pInput.SaveConfig();
                bRemoved = true;
                break;
		    }
	    }
    }
}

function UnbindSpectatorCommand(TrPlayerInput_Spectator pInput, String Command)
{
	local int i;
    local bool bRemoved;

    if (pInput == none) return;

    bRemoved = true;

    while (bRemoved)
    {
        bRemoved = false;

	    for (i = 0; i < pInput.Bindings.Length; i++)
	    {
		    if (pInput.Bindings[i].Command == Command && 
	            InStr(pInput.Bindings[i].Name,"Xbox") < 0 && 
	            InStr(pInput.Bindings[i].Name,"GBA_") < 0)
	        {
		        pInput.Bindings[i].Command = " ";
			    pInput.SaveConfig();
                bRemoved = true;
                break;
		    }
	    }
    }
}

function String GetCurrentBinding(PlayerInput pInput, String Command)
{
    local int i;

    if (pInput == none) return "N/A";

    for (i = 0; i < pInput.Bindings.Length; i++)
    {
	    if (pInput.Bindings[i].Command == Command && 
	        InStr(pInput.Bindings[i].Name,"Xbox") < 0 && 
	        InStr(pInput.Bindings[i].Name,"GBA_") < 0)
	    {
            return String(pInput.Bindings[i].Name);
	    }
    }

    return "N/A";
}

function String GetCommandName(ESettingsList Index)
{
    switch (Index)
    {
        case ESL_MOVE_FORWARD :
            return "GBA_MoveForward";
        case ESL_MOVE_BACKWARD :
            return "GBA_Backward";
        case ESL_STRAFE_LEFT :
            return "GBA_StrafeLeft";
        case ESL_STRAFE_RIGHT :
            return "GBA_StrafeRight";
        case ESL_DO_SKI :
            return "GBA_DoSki";
        case ESL_DO_JUMP:
            return "GBA_DoJump";
        case ESL_DO_JETPACK :
            return "GBA_ToggleJetpack";
        case ESL_DO_JUMPJETPACK:
            return "GBA_ToggleJumpJetpack";
        case ESL_DO_JUMPSKI:
            return "GBA_DoSkiJump";
        case ESL_TOGGLE_SKI:
            return "ToggleSki";
        case ESL_DO_ZOOM :
            return "DoZoom";
        case ESL_DO_JETPACK :
            return "GBA_ToggleJetpack";
        case ESL_FIRE_WEAPON :
            return "GBA_Fire";
        case ESL_RELOAD :
            return "GBA_Reload";
        case ESL_NEXT_WEAPON :
            return "GBA_NextWeapon";
        case ESL_WEAPON_SWITCH_FILTER :
            return "GBA_WeaponSwitchWithFilter";
        case ESL_WEAPON_SWITCH_FILTER2 :
            return "GBA_WeaponSwitchWithFilter";
        case ESL_USE :
            return "GBA_Use";
        case ESL_ACTIVATE_MELEE :
            return "GBA_ActivateMelee";
        case ESL_ACTIVATE_PACK :
            return "GBA_ActivatePack";
        case ESL_ACTIVATE_BELT :
            return "GBA_ActivateBelt";
        case ESL_TOGGLE_MENU_CLASS :
            return "GBA_OpenClasses";
        case ESL_SHOW_SCORES :
            return "GBA_ShowScores";
        case ESL_SHOW_OBJECTIVES :
            return "GBA_ShowObjectMarkers";
        case ESL_DROP_FLAG :
            return "GBA_DropFlag";
        case ESL_TALK :
            return "GBA_Talk";
        case ESL_TALK_TEAM :
            return "GBA_TeamTalk";
        case ESL_HORN :
            return "GBA_Horn";
        case ESL_BEGIN_VGS:
            return "BeginVGS";
        case ESL_CALLIN_ONE :
            return "GBA_CallIn1"; 
        case ESL_CALLIN_TWO :
            return "GBA_CallIn2";
        case ESL_CALLIN_THREE :
            return "GBA_CallIn3";
        case ESL_TYPE_KEY :
            return "TypeKeyPressed";
        case ESL_WEAPON_PRIMARY:
            return "GBA_SwitchWeapon1";
        case ESL_WEAPON_SECONDARY:
            return "GBA_SwitchWeapon2";
        case ESL_SWITCH_SEAT_ONE :
            return "GBA_SwitchToSeat1";
        case ESL_SWITCH_SEAT_TWO :
            return "GBA_SwitchToSeat2";
        case ESL_SWITCH_SEAT_THREE :
            return "GBA_SwitchToSeat3";
        case ESL_SWITCH_SEAT_FOUR :
            return "GBA_SwitchToSeat4";
        case ESL_SWITCH_SEAT_FIVE :
            return "GBA_SwitchToSeat5";
        case ESL_SWITCH_SEAT_SIX :
            return "GBA_SwitchToSeat6";
        case ESL_SUICIDE:
            return "Suicide";
        case ESL_SPOT_TARGET:
            return "GBA_SpotTarget";
        case ESL_THIRD_PERSON:
            return "BehindView";
        case ESL_FREE_LOOK:
            return "ActivateFreeCam | OnRelease DeactivateFreeCam";
        case ESL_TEAM_SELECT:
            return "| onrelease ToggleTeamSelectionMenu";
        case ESL_SUPPRESS_HELP:
            return "SuppressHelpText";
        case ESL_QUICKCLASSES:
            return "QuickClasses";
        case ESL_TALK_REPLY:
            return "GBA_ReplyTalk";

        // Hotkeys

        case ESL_FRIENDS:
            return "GBA_Friends";
        case ESL_SETTINGS:
            return "GBA_Settings";
        case ESL_MAINMENU:
            return "GBA_MainMenu";
        case ESL_HOTKEY1:
            return "GBA_ClassSelectPTH";
        case ESL_HOTKEY2:
            return "GBA_ClassSelectSEN";
        case ESL_HOTKEY3:
            return "GBA_ClassSelectINF";
        case ESL_HOTKEY4:
            return "GBA_ClassSelectSLD";
        case ESL_HOTKEY5:
            return "GBA_ClassSelectRDR";
        case ESL_HOTKEY6:
            return "GBA_ClassSelectTCN";
        case ESL_HOTKEY7:
            return "GBA_ClassSelectJUG";
        case ESL_HOTKEY8:
            return "GBA_ClassSelectDMB";
        case ESL_HOTKEY9:
            return "GBA_ClassSelectBRT";
        case ESL_CHAT:
            return "GBA_ToggleChat";

        // Specatator
            
        case ESL_SPECTATE_MOVEUP:
            return "MoveUp";
        case ESL_SPECTATE_MOVEDOWN:
            return "MoveDown";
        case ESL_SPECTATE_MOVEFORWARD:
            return "MoveForward";
        case ESL_SPECTATE_MOVEBACKWARD:
            return "MoveBackward";
        case ESL_SPECTATE_TURNLEFT:
            return "TurnLeft";
        case ESL_SPECTATE_TURNRIGHT:
            return "TurnRIght";
        case ESL_SPECTATE_STRAFELEFT:
            return "StrafeLeft";
        case ESL_SPECTATE_STRAFERIGHT:
            return "StrafeRight";
        case ESL_SPECTATE_CAMERAX:
            return "Count bXAxis | Axis aMouseX";
        case ESL_SPECTATE_CAMERAY:
            return "Count bYAxis | Axis aMouseY";
        case ESL_SPECTATE_SPEEDINCREASE:
            return "IncreaseSpeed 1 |  DecreaseCamDistance 100";
        case ESL_SPECTATE_SPEEDDECREASE:
            return "DecreaseSpeed 1 | IncreaseCamDistance 100";
        case ESL_SPECTATE_VIEWNEXTPLAYER:
            return "ViewNextPlayer";
        case ESL_SPECTATE_VIEWPREVPLAYER:
            return "ViewPreviousPlayer";
        case ESL_SPECTATE_VIEWSELF:
            return "ViewSelf";
        case ESL_SPECTATE_VIEWBOOKMARKS:
            return "ViewBookmarks true | OnRelease ViewBookmarks false";
        case ESL_SPECTATE_VIEWGENERATORS:
            return "ViewGenerators true | OnRelease ViewGenerators false";
        case ESL_SPECTATE_VIEWSTANDS:
            return "ViewFlagStands true | OnRelease ViewFlagStands false";
        case ESL_SPECTATE_VIEWFLAGS:
            return "ViewFlags true | OnRelease ViewFlags false";
        case ESL_SPECTATE_SHOWCONTROLS:
            return "ShowSpectatorControls";
        case ESL_SPECTATE_SHOWHUD:
            return "ShowSpectatorHUD";
        case ESL_SPECTATE_SHOWSCORES:
            return "SetShowScores true | Onrelease SetShowScores false";
        case ESL_SPECTATE_TYPE_KEY :
            return "TypeKeyPressed";
        case ESL_SPECTATE_CHANGETEAM:
            return "| onrelease ToggleTeamSelectionMenu";
        case ESL_SPECTATE_VEHICLES:
            return "ViewVehicles true | OnRelease ViewVehicles false";
        case ESL_SPECTATE_FASTESTPLAYER:
            return "ViewFastestPlayer true | OnRelease ViewFastestPlayer false";
        case ESL_SPECTATE_OBJECTIVES:
            return "ToggleShowObjectMarkers";
        case ESL_SPECTATE_LOCKVIEW:
            return "ToggleLockViewToPlayer";
        default:
            break;
    }

    return "";
}

function ApplyDefaultSettings()
{
    local int i;
    local PlayerInput pInput;
    local TrPlayerInput_Spectator pSpecInput;

    pInput = TrPlayerController(GetPC()).GetEngineSettings();
    pSpecInput = TrPlayerController(GetPC()).GetSpectatorSettings();

    if (pInput == none) return;

    ResetDefaultKeyBindings(pInput);
    ResetDefaultSpectatorBindings(pSpecInput);

    for (i = ESL_KEYBIND_START+1; i < ESL_KEYBIND_END; i++)
	{
        ClearSettingById(ESettingsList(i));
	}

    FlushSettings();

    UpdateRuntimePlayer(pInput);
    UpdateRuntimeSpectator(pSpecInput);
}

function PlayerInput GetPlayerInput()
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        return TrPC.GetEngineSettings();
    }

    return none;
}

function TrPlayerInput_Spectator GetSpectatorInput()
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        return TrPC.GetSpectatorSettings();
    }

    return none;
}

function UpdateRuntimePlayer(PlayerInput EngineInput)
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        TrPC.PlayerInput.Bindings = EngineInput.Bindings;
    }
}

function UpdateRuntimeSpectator(TrPlayerInput_Spectator SpecInput)
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC != none && TrPC.InRovingSpectate())
    {
        TrPC.PlayerInput.Bindings = SpecInput.Bindings;
    }
}

function SaveInterceptKeys()
{
    local PlayerInput pInput;

    pInput = GetPlayerInput();

    if (pInput != none)
    {
        m_TeamSelectKeybind = GetCurrentBinding(pInput, GetCommandName(ESL_TEAM_SELECT));
        m_ClassSelectKeybind = GetCurrentBinding(pInput, GetCommandName(ESL_TOGGLE_MENU_CLASS));
        m_ScoreboardKeybind = GetCurrentBinding(pInput, GetCommandName(ESL_SHOW_SCORES));
        m_TalkKeybind = GetCurrentBinding(pInput, GetCommandName(ESL_TALK));
        m_TeamTalkKeybind = GetCurrentBinding(pInput, GetCommandName(ESL_TALK_TEAM));
        m_TalkReplyKeybind = GetCurrentBinding(pInput, GetCommandName(ESL_TALK_REPLY));
        m_FriendsHotkey = GetCurrentBinding(pInput, GetCommandName(ESL_FRIENDS));
        m_SettingsHotkey = GetCurrentBinding(pInput, GetCommandName(ESL_SETTINGS));
        m_MainMenuHotkey = GetCurrentBinding(pInput, GetCommandName(ESL_MAINMENU));
        m_ChatHotkey = GetCurrentBinding(pInput, GetCommandName(ESL_CHAT));
    }
}

defaultproperties
{
   m_EscapeKeybind="Escape"
   m_EnterKeybind="Enter"
   Name="Default__TrKeyBindings"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
