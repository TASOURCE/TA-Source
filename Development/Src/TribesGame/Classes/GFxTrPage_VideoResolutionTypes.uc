class GFxTrPage_VideoResolutionTypes extends GFxTrPage;

var int FourByThree;
var int SixteenByNine;
var int SixteenbyTen;

var bool bShowingFourByThree;
var bool bShowingSixteenByNine;
var bool bShowingSixteenbyTen;

var array<PropertyPair> AllResolutions;
var array<ResolutionSet> FourByThreeGroup;
var array<ResolutionSet> SixteenByNineGroup;
var array<ResolutionSet> SixteenbyTenGroup;
var array<ResolutionSet> OtherGroup;

function Initialize()
{
    local int i;
    local int ratio;
    local ResolutionSet resSet;

    SettingsManager.VideoSettings.GetResolutions(AllResolutions);

    SettingsManager.VideoSettings.m_Cached_Resolution = SettingsManager.VideoSettings.GetCurrentSettingValue(EVST_Resolution);

    for (i = AllResolutions.Length; i > 0; i--)
    {
        ratio = 100 * (float(AllResolutions[i-1].PropertyId) / float(AllResolutions[i-1].Value));

        resSet.Index = i-1;
        resSet.Res = AllResolutions[i-1];

        switch (ratio)
        {
        case FourByThree:   FourByThreeGroup.AddItem(resSet); break;
        case SixteenByNine: SixteenByNineGroup.AddItem(resSet); break;
        case SixteenbyTen:  SixteenbyTenGroup.AddItem(resSet); break;
        default:            OtherGroup.AddItem(resSet); break;
        }        
    }

    if (FourByThreeGroup.Length > 0) AddActionSet(Pages.VideoResolutionPage, FourByThree);
    if (SixteenByNineGroup.Length > 0) AddActionSet(Pages.VideoResolutionPage, SixteenByNine);
    if (SixteenbyTenGroup.Length > 0) AddActionSet(Pages.VideoResolutionPage, SixteenbyTen);
    if (OtherGroup.Length > 0) AddActionSet(Pages.VideoResolutionPage, 0);
}

function SpecialAction(GFxTrAction Action)
{
    local int i;

    Pages.VideoResolutionPage.ClearActions();

    switch (Action.ActionNumber)
    {
    case FourByThree:
        Pages.VideoResolutionPage.PageLabelOverride = "4:3"@Strings.Resolutions;

        for (i = 0; i < FourByThreeGroup.Length; i++)
        {
            Pages.VideoResolutionPage.OptionTitlesOverride[i] = FourByThreeGroup[i].Res.PropertyId@"X"@FourByThreeGroup[i].Res.Value;

            Pages.VideoResolutionPage.AddActionNumber(FourByThreeGroup[i].Index);
        }
        break;
    case SixteenByNine:
        Pages.VideoResolutionPage.PageLabelOverride = "16:9"@Strings.Resolutions;

        for (i = 0; i < SixteenbyNineGroup.Length; i++)
        {
            Pages.VideoResolutionPage.OptionTitlesOverride[i] = SixteenbyNineGroup[i].Res.PropertyId@"X"@SixteenbyNineGroup[i].Res.Value;

            Pages.VideoResolutionPage.AddActionNumber(SixteenbyNineGroup[i].Index);
        }
        break;
    case SixteenbyTen:
        Pages.VideoResolutionPage.PageLabelOverride = "16:10"@Strings.Resolutions;

        for (i = 0; i < SixteenbyTenGroup.Length; i++)
        {
            Pages.VideoResolutionPage.OptionTitlesOverride[i] = SixteenbyTenGroup[i].Res.PropertyId@"X"@SixteenbyTenGroup[i].Res.Value;

            Pages.VideoResolutionPage.AddActionNumber(SixteenbyTenGroup[i].Index);
        }
        break;
    default:
        Pages.VideoResolutionPage.PageLabelOverride = Strings.Other@Strings.Resolutions;

        for (i = 0; i < OtherGroup.Length; i++)
        {
            Pages.VideoResolutionPage.OptionTitlesOverride[i] = OtherGroup[i].Res.PropertyId@"X"@OtherGroup[i].Res.Value;

            Pages.VideoResolutionPage.AddActionNumber(OtherGroup[i].Index);
        }
        break;
    }
}

function FillData(GFxObject DataList)
{
    bShowingFourByThree   = false;
    bShowingSixteenByNine = false;
    bShowingSixteenbyTen  = false;

    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local int i;
    local int currIndex;
    local GFxObject obj;
    
    currIndex = SettingsManager.VideoSettings.m_Cached_Resolution;
    
    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    if (!bShowingFourByThree && FourByThreeGroup.Length > 0)
    {
        bShowingFourByThree = true;
        obj.SetString("itemTitle", "4:3"@Strings.Resolutions);
        
        for (i = 0; i < FourByThreeGroup.Length; i++)
        {
            if (FourByThreeGroup[i].Index == currIndex)
            {
                obj.SetString("itemRibbonLabel", Strings.Active);
                obj.SetFloat("hasRibbon", 1);
                obj.SetFloat("ribbonType", 1);
            }
        }
    }
    else if (!bShowingSixteenByNine && SixteenByNineGroup.Length > 0)
    {
        bShowingSixteenByNine = true;
        obj.SetString("itemTitle", "16:9"@Strings.Resolutions);
        
        for (i = 0; i < SixteenByNineGroup.Length; i++)
        {
            if (SixteenByNineGroup[i].Index == currIndex)
            {
                obj.SetString("itemRibbonLabel", Strings.Active);
                obj.SetFloat("hasRibbon", 1);
                obj.SetFloat("ribbonType", 1);
            }
        }
    }
    else if (!bShowingSixteenbyTen && SixteenbyTenGroup.Length > 0)
    {
        bShowingSixteenbyTen = true;
        obj.SetString("itemTitle", "16:10"@Strings.Resolutions);
        
        for (i = 0; i < SixteenbyTenGroup.Length; i++)
        {
            if (SixteenbyTenGroup[i].Index == currIndex)
            {
                obj.SetString("itemRibbonLabel", Strings.Active);
                obj.SetFloat("hasRibbon", 1);
                obj.SetFloat("ribbonType", 1);
            }
        }
    }
    else
    {
        obj.SetString("itemTitle", Strings.Other@Strings.Resolutions);
        
        for (i = 0; i < OtherGroup.Length; i++)
        {
            if (OtherGroup[i].Index == currIndex)
            {
                obj.SetString("itemRibbonLabel", Strings.Active);
                obj.SetFloat("hasRibbon", 1);
                obj.SetFloat("ribbonType", 1);
            }
        }
    }
    
    obj.SetString("itemSubTitle", "");

    return obj;
}

defaultproperties
{
   FourByThree=133
   SixteenByNine=177
   SixteenbyTen=160
   Name="Default__GFxTrPage_VideoResolutionTypes"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
