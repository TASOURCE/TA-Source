class GFxTrPage_VideoSettings extends GFxTrPage;

var int VSyncNumber;
var int FrameSmoothNumber;
var int MotionBlurNumber;

function Initialize()
{
    AddActionPage(Pages.VideoGraphicsPage);
    AddActionPage(Pages.VideoTexturePage);
    AddActionSet(Pages.VideoWindowPage);
    AddActionSet(Pages.VideoResolutionTypesPage);
    AddActionNumber(VSyncNumber);
    AddActionNumber(FrameSmoothNumber);
    AddActionNumber(MotionBlurNumber);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionNumber == VSyncNumber)
    {
        if (SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_VerticalSync) > 0)
        {
            SettingsManager.VideoSettings.SetVSync(false);
        }
        else
        {
            SettingsManager.VideoSettings.SetVSync(true);
        }
    }
    else if (Action.ActionNumber == FrameSmoothNumber)
    {
        if (SettingsManager.VideoSettings.GetSmoothFramerateValue() > 0)
        {
            SettingsManager.VideoSettings.SetSmoothFramerateValue(0);
        }
        else
        {
            SettingsManager.VideoSettings.SetSmoothFramerateValue(1);
        }
    }
    else if (Action.ActionNumber == MotionBlurNumber)
    {
        if (SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_MotionBlur) > 0)
        {
            SettingsManager.VideoSettings.SetMotionBlur(false);
        }
        else
        {
            SettingsManager.VideoSettings.SetMotionBlur(true);
        }
    }
    else
    {
        return;
    }

    RefreshButtons();
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);
    
    if (PageActions[ActionIndex].ActionNumber == VSyncNumber)
    {
        if (SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_VerticalSync) > 0)
        {
            obj.SetString("itemRibbonLabel", Strings.Enabled);
            obj.SetString("itemSubTitle", "");
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 1);
        }
        else
        {
            obj.SetString("itemRibbonLabel", "");
            obj.SetString("itemSubTitle", Strings.Disabled);
            obj.SetFloat("hasRibbon", 0);
        }
    }
    else if (PageActions[ActionIndex].ActionNumber == FrameSmoothNumber)
    {
        if (SettingsManager.VideoSettings.GetSmoothFramerateValue() > 0)
        {
            obj.SetString("itemRibbonLabel", Strings.Enabled);
            obj.SetString("itemSubTitle", "");
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 1);
        }
        else
        {
            obj.SetString("itemRibbonLabel", "");
            obj.SetString("itemSubTitle", Strings.Disabled);
            obj.SetFloat("hasRibbon", 0);
        }
    }
    else if (PageActions[ActionIndex].ActionNumber == MotionBlurNumber)
    {
        if (SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_MotionBlur) > 0)
        {
            obj.SetString("itemRibbonLabel", Strings.Enabled);
            obj.SetString("itemSubTitle", "");
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 1);
        }
        else
        {
            obj.SetString("itemRibbonLabel", "");
            obj.SetString("itemSubTitle", Strings.Disabled);
            obj.SetFloat("hasRibbon", 0);
        }
    }

    return obj;
}

defaultproperties
{
   VSyncNumber=1
   FrameSmoothNumber=2
   MotionBlurNumber=3
   PageLabel="VIDEO SETTINGS"
   OptionTitles(0)="GRAPHICS DETAIL"
   OptionTitles(1)="TEXTURE DETAIL"
   OptionTitles(2)="SCREEN TYPE"
   OptionTitles(3)="RESOLUTION"
   OptionTitles(4)="VSYNC"
   OptionTitles(5)="FRAMERATE SMOOTHING"
   OptionTitles(6)="MOTION BLUR"
   OptionSubtext(0)="LIGHTING, DRAW DISTANCE, ETC."
   OptionSubtext(1)="TEXTURE QUALITY"
   OptionSubtext(2)="FULLSCREEN, WINDOWED, BORDERLESS"
   OptionSubtext(3)="CHANGE RESOLUTION"
   Name="Default__GFxTrPage_VideoSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
