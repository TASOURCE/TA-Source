class GFxTrPage_ManageServer extends GFxTrPage;

function Initialize()
{
}

function FillData(GFxObject DataList)
{
    local int siteId;

    SetOverrides();

    ClearActions();
    
    if (QueueManager.AmServerOwner())
    {
        AddActionPage(Pages.ServerSettingsPage);
        AddActionPage(Pages.ServerActionsPage);
        AddActionPage(Pages.GameMapSetupPage);
        AddActionPage(Pages.GameRulesPage);
        AddActionPage(Pages.ServerAddTimePage);
        
        siteId = QueueManager.GetPropNumber(QUEUE_CONFIG_SITEID, SPT_QUEUE);

        if (siteId == 0)
        {
            QueueManager.SetPropNumber(QUEUE_CONFIG_SITEID, SettingsManager.RegionSettings.GetPreferredSiteId(), SPT_QUEUE);
        }

        EquipInterface.SaveProfile();
    }
    else
    {
        AddActionPage(Pages.ServerActionsPage);
    }

    super.FillData(DataList);
    
    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionPage == Pages.ServerAddTimePage)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemRibbonLabel", QueueManager.GetServerTimeFormat());
    }

    return obj;
}

function RefreshButtons()
{
    SetOverrides();

    super.RefreshButtons();
}

function SetOverrides()
{
    PageLabelOverride = QueueManager.GetProfileName();
}

function CheckDescription(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject descObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_DESCRIPTION);

    descObj = FillDescription(DataList);

    if (descObj != none)
    {
        obj.SetObject("data", descObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }
}

function GFxObject FillDescription(GFxObject DataList)
{
    local GFxObject obj;

    obj = CreateObject("Object");
    obj.SetString("descTitle", QueueManager.GetProfileName());
    obj.SetString("description", QueueManager.GetProfileDesc());

    return obj;
}

defaultproperties
{
   PageLabel="MANAGE SERVER"
   OptionTitles(0)="SERVER SETTINGS"
   OptionTitles(1)="SERVER ACTIONS"
   OptionTitles(2)="GAMETYPE AND MAPS"
   OptionTitles(3)="GAMEPLAY SETTINGS"
   OptionTitles(4)="ADD RENTAL TIME"
   OptionSubtext(0)="SELECT TO EDIT"
   OptionSubtext(1)="SELECT FOR OPTIONS"
   OptionSubtext(2)="SELECT TO EDIT"
   OptionSubtext(3)="SELECT TO EDIT"
   OptionSubtext(4)="SELECT FOR OPTIONS"
   Name="Default__GFxTrPage_ManageServer"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
