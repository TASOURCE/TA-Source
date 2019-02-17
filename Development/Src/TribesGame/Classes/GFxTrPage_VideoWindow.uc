class GFxTrPage_VideoWindow extends GFxTrPage;

var int CurrWindow;

enum MENU_ACTION_VIDEOWINDOW
{
    MAVW_FULLSCREEN,
    MAVW_WINDOWED,
    MAVW_BORDERLESS,
    MAVW_MAX
};

function Initialize()
{
    local int i;

    for (i = 0; i < MAVW_MAX; i++)
    {
        AddAction();
    }
}

function FillData(GFxObject DataList)
{
    CurrWindow = SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_ScreenType);

    super.FillData(DataList);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionIndex != GoBack)
    {
        SettingsManager.VideoSettings.ChangeScreenType(Action.ActionIndex);
        SettingsManager.VideoSettings.ApplyVideoSettings();
        CurrWindow = SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_ScreenType);

        RefreshButtons();
    }
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);
    
    if (ActionIndex == CurrWindow)
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

defaultproperties
{
   PageLabel="WINDOW TYPE"
   OptionTitles(0)="FULLSCREEN"
   OptionTitles(1)="WINDOWED"
   OptionTitles(2)="BORDERLESS"
   Name="Default__GFxTrPage_VideoWindow"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
