class GFxTrPage_KeybindAction extends GFxTrPage;

var int  SelectedIndex;
var int  SelectedCommand;
var bool bWaitingForKeybind;

function GFxObject FillOption(int ActionIndex)
{
    local string bindName;
    local GFxObject obj;

    bindName = SettingsManager.KeyBindings.GetCurrentBind(ESettingsList(PageActions[ActionIndex].ActionNumber));

    obj = super.FillOption(ActionIndex);
    
    if (bindName == "N/A")
    {
        obj.SetFloat("hasRibbon", 0);
        obj.SetString("itemSubTitle", bindName);
        obj.SetString("itemRibbonLabel", "");
    }
    else
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 1);
        obj.SetString("itemSubTitle", "");
        obj.SetString("itemRibbonLabel", bindName);
    }

    return obj;
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex != GoBack)
    {
        SelectedIndex = ActionIndex;
        SelectedCommand = PageActions[ActionIndex].ActionNumber;
        bWaitingForKeybind = true;
        QueuePopup();

        NewAction = 0;
    }
    else
    {
        super.TakeAction(ActionIndex, DataList);
    }

    return NewAction;
}

function PopupData(GFxObject Obj)
{
    if (bWaitingForKeybind)
    {
        Obj.SetString("popupTitle", Strings.Set@"'"$OptionTitles[SelectedIndex]$"'");
        Obj.SetString("popupBody", Strings.ChangeBindingBody);
        Obj.SetFloat("type", 0);
        Obj.SetFloat("enterKeyIndex", -1);

        SettingsManager.KeyBindings.CaptureNextKey();
    }
}

function PopupComplete(int Action, string TextInput)
{
    bWaitingForKeybind = false;
}

function KeyEvent()
{
    bWaitingForKeybind = false;

    ClosePopup();

    if (CapturedKey != "" && CapturedKey != "Escape")
    {
        SettingsManager.KeyBindings.SaveKeyBind(SelectedCommand, CapturedKey);

        RefreshButtons();
        
        SettingsManager.KeyBindings.SaveInterceptKeys();
    }

    CapturedKey = "";
}

defaultproperties
{
   Name="Default__GFxTrPage_KeybindAction"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
