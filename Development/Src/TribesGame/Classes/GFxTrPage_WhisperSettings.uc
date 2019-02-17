class GFxTrPage_WhisperSettings extends GFxTrPage;

var int CurrSetting;

enum MENU_ACTION_WHISPER_NOTIFY_TYPE
{
    MAWNT_SHOWALL,
    MAWNT_ONLYFRIENDS,
    MAWNT_NOBODY,    
    MAVNT_MAX
};

function Initialize()
{
    local int i;

    for (i = 0; i < MAVNT_MAX; i++)
    {
        AddAction();
    }
}

function FillData(GFxObject DataList)
{
    CurrSetting = SettingsManager.ControlSettings.GetCurrentControlValue(ESL_WHISPERNOTIFY);

    super.FillData(DataList);
}


function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);
    
    if (ActionIndex == CurrSetting)
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


function SpecialAction(GFxTrAction Action)
{
    CurrSetting = Action.ActionIndex;
    SettingsManager.ControlSettings.SaveControlSetting(ESL_WHISPERNOTIFY, CurrSetting);
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
   PageLabel="PRIVATE CHAT NOTIFICATIONS:"
   OptionTitles(0)="ALWAYS"
   OptionTitles(1)="ONLY FROM FRIENDS"
   OptionTitles(2)="NEVER"
   Name="Default__GFxTrPage_WhisperSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
