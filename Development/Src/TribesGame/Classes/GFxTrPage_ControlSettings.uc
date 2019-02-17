class GFxTrPage_ControlSettings extends GFxTrPage;

var int  popupIndex;
var bool bWaitingForFOV;
var bool bWaitingForSensitivity;
var bool bWaitingForVPSensitivity;
var bool bWaitingForVYSensitivity;

function Initialize()
{
    local int i;

    for (i = ESL_CONTROL_START+1; i <= ESL_SIMULATEDPROJECTILES; i++)  //sorry.  don't use ESL_CONTROL_END as we broke out some options in this set to another page.
    {
        AddActionNumber(i);
    }
}

function SpecialAction(GFxTrAction Action)
{
    local int val;
    local int newVal;

    val = SettingsManager.ControlSettings.GetCurrentControlValue(ESettingsList(Action.ActionNumber));

    popupIndex = Action.ActionNumber;

    switch (Action.ActionIndex)
    {
    case 0: bWaitingForSensitivity = true;   QueuePopup(); return; //MouseSensitivity
    case 1: bWaitingForVPSensitivity = true; QueuePopup(); return; //FlyingPitchSensitivity
    case 2: bWaitingForVYSensitivity = true; QueuePopup(); return; //FlyingYawSensitivity
    case 3: newVal = val > 0 ? 0 : 1; break; //MouseInvert
    case 4: newVal = val > 0 ? 0 : 1; break; //VehicleInvert
    case 5: newVal = val > 0 ? 0 : 1; break; //MouseSmoothing
    case 6: bWaitingForFOV = true; QueuePopup(); return; //FOV
    case 7: newVal = val > 0 ? 0 : 1; break; //ToggleZoom
    case 8: newVal = val > 0 ? 0 : 1; break; //DisableHelp
    case 9: newVal = val > 0 ? 0 : 1; break; //HUDObjectives
    case 10: newVal = val > 0 ? 0 : 1; break; //TinyWeapons
    case 11: newVal = val > 0 ? 0 : 1; break; //DamageCounter
    case 12: newVal = val > 0 ? 0 : 1; break;  //Alien FX
    case 13: newVal = val > 0 ? 0 : 1; break;  //Chat Profanity
	case 14: newVal = val > 0 ? 0 : 1; break;  //SimulatedProjectiles
    //case 13: newVal = val > 0 ? 0 : 1; break;  //Friend Onoffline popups
    default:
        return;
    }
    
    SettingsManager.ControlSettings.SaveControlSetting(Action.ActionNumber, newVal);
    
    //obj = CreateObject("Object");
    //FillData(obj);

    RefreshButtons();
}

function GFxObject FillOption(int ActionIndex)
{
    local float val;
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    val = SettingsManager.ControlSettings.GetCurrentControlValue(ESettingsList(PageActions[ActionIndex].ActionNumber));

    SetSubTitle(ActionIndex, val, obj);

    obj.SetString("itemTitle", OptionTitles[ActionIndex]);

    return obj;
}

function SetSubTitle(int Index, float Val, GFxObject Obj)
{
    local string subTitle;

    switch (Index)
    {
    case 0: subTitle = string(val);                                   break; //MouseSensitivity
    case 1: subTitle = string(val);                                   break; //FlyingPitchSensitivity
    case 2: subTitle = string(val);                                   break; //FlyingYawSensitivity
    case 3: subTitle = val > 0 ? Strings.Enabled : Strings.Disabled;  break; //MouseInvert
    case 4: subTitle = val > 0 ? Strings.Enabled : Strings.Disabled;  break; //VehicleInvert
    case 5: subTitle = val > 0 ? Strings.Enabled : Strings.Disabled;  break; //MouseSmoothing
    case 6: subTitle = string(int(val));                              break; //FOV
    case 7: subTitle = val > 0 ? Strings.Enabled : "DISABLED";        break; //ToggleZoom
    case 8: subTitle = val > 0 ? Strings.Disabled : Strings.Enabled;  break; //DisableHelp
    case 9: subTitle = val > 0 ? Strings.Enabled  : Strings.Disabled; break; //HUDObjectives
    case 10: subTitle = val > 0 ? Strings.Enabled : Strings.Disabled; break; //TinyWeapons
    case 11: subTitle = val > 0 ? Strings.Enabled : Strings.Disabled; break; //DamageCounter
    case 12: subTitle = val > 0 ? Strings.Enabled : Strings.Disabled; break; //AlienFX
    case 13: subTitle = val > 0 ? Strings.Enabled : Strings.Disabled; break; //ChatFilter
	case 14: subTitle = val > 0 ? Strings.Enabled : Strings.Disabled; break; //SimulatedProjectiles
    //case 13: subTitle = val > 0 ? "ENABLED" : "DISABLED"; break; //HUDPopup
    default:
        break;
    }

    if (subTitle == Strings.Enabled)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 1);
        obj.SetString("itemRibbonLabel", subTitle);
        obj.SetString("itemSubTitle", "");
    }
    else
    {
        obj.SetFloat("hasRibbon", 0);
        obj.SetString("itemRibbonLabel", "");
        obj.SetString("itemSubTitle", subTitle);
    }
}

function PopupData(GFxObject Obj)
{
    if (bWaitingForFOV)
    {
        Obj.SetString("popupTitle", Strings.Change@Strings.FOV@"(60-120)");
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 2);
    }
    else if (bWaitingForSensitivity || bWaitingForVPSensitivity || bWaitingForVYSensitivity)
    {
        Obj.SetString("popupTitle", Strings.Change@Strings.Sensitivity@"(1-100)");
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 2);
    }
}

function PopupComplete(int Action, string TextInput)
{
    local float newVal;

    newVal = float(TextInput);

    if (Action == 1)
    {
        if (bWaitingForFOV)
        {
            bWaitingForFOV = false;

            if (newVal < 60.0) newVal = 60.0;
            else if(newVal > 120.0) newVal = 120.0;
        }
        else if (bWaitingForSensitivity)
        {
            bWaitingForSensitivity = false;

            if (newVal <= 0.0) newVal = 1.0;
            else if (newVal > 100.0) newVal = 100.0;

            newVal *= 1000;
        }
        else if (bWaitingForVPSensitivity)
        {
            bWaitingForVPSensitivity = false;

            if (newVal <= 0.0) newVal = 1.0;
            else if (newVal > 100.0) newVal = 100.0;

            newVal *= 1000;
        }
        else if (bWaitingForVYSensitivity)
        {
            bWaitingForVYSensitivity = false;

            if (newVal <= 0.0) newVal = 1.0;
            else if (newVal > 100.0) newVal = 100.0;

            newVal *= 1000;
        }

        SettingsManager.ControlSettings.SaveControlSetting(popupIndex, newVal);
    
        RefreshButtons();
    }
}

defaultproperties
{
   PageLabel="GAMEPLAY SETTINGS"
   OptionTitles(0)="MOUSE SENSITIVITY"
   OptionTitles(1)="FLYING PITCH SENSITIVITY"
   OptionTitles(2)="FLYING YAW SENSITIVITY"
   OptionTitles(3)="MOUSE INVERT"
   OptionTitles(4)="VEHICLE INVERT"
   OptionTitles(5)="MOUSE SMOOTHING"
   OptionTitles(6)="FOV"
   OptionTitles(7)="TOGGLE ZOOM"
   OptionTitles(8)="SHOW HELP TEXT"
   OptionTitles(9)="DEFAULT OBJECTIVES ON"
   OptionTitles(10)="REDUCED WEAPON SIZE"
   OptionTitles(11)="DAMAGE NUMBERS"
   OptionTitles(12)="ALIENWARE FX"
   OptionTitles(13)="FILTER CHAT"
   OptionTitles(14)="SIMULATED PROJECTILES"
   Name="Default__GFxTrPage_ControlSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
