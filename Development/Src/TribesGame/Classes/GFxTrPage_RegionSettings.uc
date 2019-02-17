class GFxTrPage_RegionSettings extends GFxTrPage;

var int  CurrRegion;
var int  CurrFilterSite;
var int  CurrFilterIndex;
var bool bFilter;
var bool bServer;
var bool bForceChoose;

function Initialize()
{
    SettingsManager.RegionSettings.LoadRegions();
}

function FillData(GFxObject DataList)
{
    local int i;
    local string regionName;
    
    ClearActions();

    for (i = 0; i < SettingsManager.RegionSettings.AvailableRegions.Length; i++)
    {
        if (!(bFilter || bServer) && SettingsManager.RegionSettings.AvailableRegions[i].bModifyProperty)
        {
            continue;
        }

        regionName = string(SettingsManager.RegionSettings.AvailableRegions[i].PropertyName);

        OptionTitlesOverride.AddItem(regionName);
        AddActionString(regionName);
    }

    if (bFilter)
    {
        CurrRegion = SettingsManager.RegionSettings.GetRegionIdAtIndex(CurrFilterIndex);
    }
    else if (bServer)
    {
        CurrRegion = QueueManager.GetPropNumber(QUEUE_CONFIG_SITEID, SPT_QUEUE);
    }
    else
    {
        CurrRegion = SettingsManager.RegionSettings.GetPreferredSiteId();
    }

    super.FillData(DataList);
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    local int  i;
    local int  regionId;
    local int  regionIndex;
    local bool bFound;

    if (ActionIndex == GoBack)
    {
        if (bFilter)
        {
            QueueManager.RequestCustomServers();
            bFilter = false;
        }

        return super.TakeAction(ActionIndex, DataList);
    }

    regionIndex = SettingsManager.RegionSettings.GetRegionIndexByName(PageActions[ActionIndex].ActionString);

    if (regionIndex == INDEX_NONE)
    {
        return super.TakeAction(ActionIndex, DataList);
    }

    regionId = SettingsManager.RegionSettings.GetRegionIdAtIndex(regionIndex);

    if (bServer)
    {
        QueueManager.SetPropNumber(QUEUE_CONFIG_SITEID, regionId, SPT_QUEUE);
        Pages.PopPage().FillData(DataList);
        NewAction = -1;
        bServer = false;
    }
    else if (bFilter)
    {
        NewAction = 0;

        for (i = 0; i < QueueManager.RegionFilter.Length; i++)
        {
            if (QueueManager.RegionFilter[i] == regionId)
            {
                bFound = true;
                QueueManager.RegionFilter.Remove(i, 1);
                break;
            }
        }

        if (!bFound)
        {
            QueueManager.RegionFilter.AddItem(regionId);
        }

        RefreshButtons();
    }
    else
    {
        SettingsManager.RegionSettings.SetPreferredRegion(regionIndex);
        CurrRegion = regionId;
        SendProfileData();

        if (!User.m_ChoseRegion || !User.m_ChoseRegion2)
        {
            User.SaveChoseRegion();
        }

        if (bForceChoose)
        {
            NewAction = 1;
            Pages.PopPage();
            Pages.MainPage.PageActions[0].ActionPage = Pages.PlayNowPage;
            Pages.PlayNowPage.FillData(DataList);
        }
        else
        {
            NewAction = 0;
            RefreshButtons();
        }
    }

    return NewAction;
}

function GFxObject FillOption(int ActionIndex)
{
    local int i;
    local int regionId;
    local int regionIndex;
    local bool bActiveRegion;
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);

    regionIndex = SettingsManager.RegionSettings.GetRegionIndexByName(PageActions[ActionIndex].ActionString);
    regionId = SettingsManager.RegionSettings.GetRegionIdAtIndex(regionIndex);

    if (bFilter)
    {

        for (i = 0; i < QueueManager.RegionFilter.Length; i++)
        {
            if (QueueManager.RegionFilter[i] == regionId)
            {
                bActiveRegion = true;
                break;
            }
        }
    }
    else if (CurrRegion == regionId)
    {
        bActiveRegion = true;
    }

    if (bActiveRegion)
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
   PageLabel="CHOOSE REGION"
   Name="Default__GFxTrPage_RegionSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
