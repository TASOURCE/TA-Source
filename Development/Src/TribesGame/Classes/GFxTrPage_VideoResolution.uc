class GFxTrPage_VideoResolution extends GFxTrPage;

var int CurrResolution;

function SpecialAction(GFxTrAction Action)
{
    local TrPlayerController TrPC;

    if (Action.ActionNumber != SettingsManager.VideoSettings.m_Cached_Resolution)
    {
        TrPC = TrPlayerController(GetPC());

        if (TrPC != none)
        {
            TrPC.StartSettingBlock();
            QueuePopup();
        }

        SettingsManager.VideoSettings.ChangeResolution(Action.ActionNumber);
        CurrResolution = Action.ActionNumber;
     
        RefreshButtons();
        RequestNews();
    }
}

function FillData(GFxObject DataList)
{
    CurrResolution = SettingsManager.VideoSettings.m_Cached_Resolution;

    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);
    
    if (PageActions[ActionIndex].ActionNumber == CurrResolution)
    {
        obj.SetString("itemRibbonLabel", Strings.Active);
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 1);
    }
    else
    {
        obj.SetString("itemRibbonLabel", "");
        obj.SetFloat("hasRibbon", 0);
    }

    return obj;
}

function PopupData(GFxObject Obj)
{
    Obj.SetString("popupTitle", Strings.Confirm@Strings.Resolution@Strings.Change);
    Obj.SetString("popupBody", Strings.ResolutionChangeBody);
    Obj.SetString("buttonLabel2", Strings.Accept);
    Obj.SetString("buttonLabel3", Strings.Revert);
    Obj.SetFloat("type", 0);
    Obj.SetFloat("enterKeyIndex", 1);
}

function PopupComplete(int Action, string TextInput)
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    TrPC.bAutoRevertSetting = false;

    if (Action == 1)
    {
        SettingsManager.VideoSettings.m_Cached_Resolution = CurrResolution;
    }
    else if (Action == 2)
    {
        RevertSetting();
    }
}

function RevertSetting()
{
    SettingsManager.VideoSettings.ChangeResolution(SettingsManager.VideoSettings.m_Cached_Resolution);
    CurrResolution = SettingsManager.VideoSettings.m_Cached_Resolution;
    
    RefreshButtons();
    RequestNews();
}

defaultproperties
{
   PageLabel="RESOLUTION"
   Name="Default__GFxTrPage_VideoResolution"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
