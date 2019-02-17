class GFxTrPage_VideoTexture extends GFxTrPage;

var int SettingIndex;
var int CurrGraphics;

enum MENU_ACTION_VIDEOTEXTURE
{
    MAVT_MINIMAL,
    MAVT_LOW,
    MAVT_MEDIUM,
    MAVT_HIGH,
    MAVT_VERYHIGH,
    MAVT_MAX
};

function Initialize()
{
    local int i;

    for (i = 0; i < MAVT_MAX; i++)
    {
        AddAction();
    }
}

function FillData(GFxObject DataList)
{
    CurrGraphics = SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_TextureDetail);

    super.FillData(DataList);
}

function SpecialAction(GFxTrAction Action)
{
    SettingIndex = Action.ActionIndex;

    if (Action.ActionIndex > MAVT_MEDIUM)
    {    
        m_PopupType = PUT_VIDEO_WARNING;
        QueuePopup();
    }
    else
    {
        PerformChange();
    }
}

function PerformChange()
{
    SettingsManager.VideoSettings.ChangeTextureDetail(SettingIndex);
    CurrGraphics = SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_TextureDetail);

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
   PageLabel="TEXTURE DETAIL"
   OptionTitles(0)="MINIMAL"
   OptionTitles(1)="LOW"
   OptionTitles(2)="MEDIUM"
   OptionTitles(3)="HIGH"
   OptionTitles(4)="VERY HIGH"
   Name="Default__GFxTrPage_VideoTexture"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
