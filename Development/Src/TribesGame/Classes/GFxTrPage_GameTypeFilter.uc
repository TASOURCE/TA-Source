class GFxTrPage_GameTypeFilter extends GFxTrPage;

function Initialize()
{
    AddActionNumber(SERVER_GAMECLASSID_CTF);
    AddActionNumber(SERVER_GAMECLASSID_BTZ);
    AddActionNumber(SERVER_GAMECLASSID_RAB);
    AddActionNumber(SERVER_GAMECLASSID_TDM);
    AddActionNumber(SERVER_GAMECLASSID_ARN);
    AddActionNumber(SERVER_GAMECLASSID_CAH);
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    local int  gameTypeId;
    local bool bFilter;

    if (ActionIndex == GoBack)
    {
        QueueManager.RequestCustomServers();
        Pages.PopPage().FillData(DataList);
        return -1;
    }

    gameTypeId = PageActions[ActionIndex].ActionNumber;
    bFilter = !QueueManager.IsGameTypeFiltered(gameTypeId);

    QueueManager.FilterGameType(gameTypeId, bFilter);

    RefreshButtons();

    return 0;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);

    if (DataList != none)
    {
        FillData(DataList);
    }

    return 0;
}

function FillData(GFxObject DataList)
{
    super.FillData(DataList);
    
    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (!QueueManager.IsGameTypeFiltered(PageActions[ActionIndex].ActionNumber))
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemSubTitle", "");
        obj.SetString("itemRibbonLabel", Strings.Shown);
    }
    else
    {
        obj.SetFloat("hasRibbon", 0);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemSubTitle", Strings.Hidden);
        obj.SetString("itemRibbonLabel", "");
    }

    return obj;
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
   PageLabel="FILTER BY GAMETYPE"
   OptionTitles(0)="CAPTURE THE FLAG"
   OptionTitles(1)="CTF BLITZ"
   OptionTitles(2)="RABBIT"
   OptionTitles(3)="TEAM DEATHMATCH"
   OptionTitles(4)="ARENA"
   OptionTitles(5)="CAPTURE AND HOLD"
   OptionSubtext(0)="SELECT TO APPLY"
   OptionSubtext(1)="SELECT TO APPLY"
   OptionSubtext(2)="SELECT TO APPLY"
   OptionSubtext(3)="SELECT TO APPLY"
   OptionSubtext(4)="SELECT TO APPLY"
   OptionSubtext(5)="SELECT TO APPLY"
   Name="Default__GFxTrPage_GameTypeFilter"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
