class GFxTrPage_NotificationSettings extends GFxTrPage;

var localized string ChatNotifySubtext;

function Initialize()
{
    super.Initialize();

    AddActionNumber(ESL_HUDFRIENDSNOTIFY);
    AddActionPage(Pages.WhisperSettingsPage);    
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex == -1)
    {
        SettingsManager.KeyBindings.FlushSettings();
    }

    return super.TakeAction(ActionIndex, DataList);
}

function FillData(GFxObject DataList)
{
    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    local int val;
    
    obj = super.FillOption(ActionIndex);
    
    if(PageActions[ActionIndex].ActionPage == Pages.WhisperSettingsPage)
    {
        obj.SetString("itemSubTitle",ChatNotifySubtext);
    }
    else if (PageActions[ActionIndex].ActionNumber > 0)
    {
        val = SettingsManager.ControlSettings.GetCurrentControlValue(ESettingsList(PageActions[ActionIndex].ActionNumber));
        if (val > 0)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 1);
            obj.SetString("itemRibbonLabel", Strings.Enabled);
            obj.SetString("itemSubTitle", "");
        }
        else
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemRibbonLabel", "");
            obj.SetString("itemSubTitle", Strings.Disabled);
        }
    }    
        

    return obj;
}


function SpecialAction(GFxTrAction Action)
{
    local int val;
    local int newVal;

    if (Action.ActionNumber > 0)
    {
        val = SettingsManager.ControlSettings.GetCurrentControlValue(ESettingsList(Action.ActionNumber));
        //case ESL_HUDFRIENDSNOTIFY
        newVal = val > 0 ? 0 : 1; //Friend Onoffline popups 
        SettingsManager.ControlSettings.SaveControlSetting(Action.ActionNumber,newVal);
    }

    super.SpecialAction(Action);

    RefreshButtons();
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    
    if (TrEPC != none) TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Settings);
}

defaultproperties
{
   ChatNotifySubtext="SELECT TO CHANGE CHAT NOTIFICATIONS"
   PageLabel="NOTIFICATION SETTINGS"
   OptionTitles(0)="FRIEND LOGIN/LOGOUT"
   OptionTitles(1)="PRIVATE CHAT"
   Name="Default__GFxTrPage_NotificationSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
