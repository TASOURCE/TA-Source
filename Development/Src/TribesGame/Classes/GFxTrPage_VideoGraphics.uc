class GFxTrPage_VideoGraphics extends GFxTrPage;

var int CurrGraphics;

enum MENU_ACTION_VIDEOGRAPHICS
{
    MAVG_MINIMAL,
    MAVG_LOW,
    MAVG_MEDIUM,
    MAVG_HIGH,
    MAVG_VERYHIGH,
    MAVG_MAX
};

function Initialize()
{
    local int i;

    for (i = 0; i < MAVG_MAX; i++)
    {
        AddAction();
    }
}

function FillData(GFxObject DataList)
{
    CurrGraphics = SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_ShadowDetail);

    super.FillData(DataList);
}

function SpecialAction(GFxTrAction Action)
{
    SettingsManager.VideoSettings.ChangeShadowDetail(Action.ActionIndex);
    CurrGraphics = SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_ShadowDetail);

    RefreshButtons();
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);
    
    if (ActionIndex == CurrGraphics)
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
   PageLabel="GRAPHICS DETAIL"
   OptionTitles(0)="MINIMAL"
   OptionTitles(1)="LOW"
   OptionTitles(2)="MEDIUM"
   OptionTitles(3)="HIGH"
   OptionTitles(4)="VERY HIGH"
   Name="Default__GFxTrPage_VideoGraphics"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
