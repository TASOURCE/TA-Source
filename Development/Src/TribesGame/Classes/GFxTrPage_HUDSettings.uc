class GFxTrPage_HUDSettings extends GFxTrPage;

function Initialize()
{
    local int i;

    for (i = 0; i < EHST_MAX; i++)
    {
        AddAction();
    }
}

function SpecialAction(GFxTrAction Action)
{
    local int val;

    val = SettingsManager.HUDSettings.GetCurrentValue(EHUDSettingType(Action.ActionIndex));
    
    SettingsManager.HUDSettings.SaveSetting(Action.ActionIndex, val > 0 ? 0 : 1);

    RefreshButtons();
}

function GFxObject FillOption(int ActionIndex)
{
    local float val;
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    val = SettingsManager.HUDSettings.GetCurrentValue(EHUDSettingType(ActionIndex));

    SetSubTitle(ActionIndex, val, obj);

    obj.SetString("itemTitle", OptionTitles[ActionIndex]);

    return obj;
}

function SetSubTitle(int Index, float Val, GFxObject Obj)
{
    local string subTitle;

    subTitle = val > 0 ? Strings.Visible : Strings.Hidden;

    if (subTitle == "VISIBLE")
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

defaultproperties
{
   PageLabel="HUD SETTINGS"
   OptionTitles(0)="GAME MESSAGES"
   OptionTitles(1)="COMBAT LOG"
   OptionTitles(2)="CREDITS/CALLINS"
   OptionTitles(3)="CHAT"
   OptionTitles(4)="TEAM SCORES"
   OptionTitles(5)="ACCOLADES"
   OptionTitles(6)="BADGES"
   OptionTitles(7)="VISOR BARS"
   OptionTitles(8)="KILL INFO"
   OptionTitles(9)="DEATH INFO"
   OptionTitles(10)="PROMPT INFO"
   OptionTitles(11)="RESPAWN TIMER"
   OptionTitles(12)="HEALTH/ENERGY"
   OptionTitles(13)="RETICULE"
   OptionTitles(14)="SKI BARS"
   OptionTitles(15)="FRIEND NAME COLORING"
   OptionTitles(16)="VISOR DAMAGE"
   Name="Default__GFxTrPage_HUDSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
