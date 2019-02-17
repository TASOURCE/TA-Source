class GFxTrPage_ServerSpawn extends GFxTrPage;

function Initialize()
{
    local int i;

    for (i = 0; i < EST_MAX; i++)
    {
        AddActionNumber(i);
    }
}

function SpecialAction(GFxTrAction Action)
{
    QueueManager.SetPropNumber(GAME_CONFIG_SPAWNNAKED, Action.ActionNumber, SPT_GAME);
    RefreshButtons();
}

function FillData(GFxObject DataList)
{
    super.FillData(DataList);

    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local int propVal;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    propVal = QueueManager.GetPropNumber(GAME_CONFIG_SPAWNNAKED, SPT_GAME);

    if (propVal == PageActions[ActionIndex].ActionNumber)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemRibbonLabel", Strings.Active);
    }
    else
    {
        obj.SetFloat("hasRibbon", 0);
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

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_PrivateServer);
}

defaultproperties
{
   PageLabel="SPAWN TYPES"
   OptionTitles(0)="NORMAL"
   OptionTitles(1)="PTH/SLD/JUG ONLY"
   OptionTitles(2)="NAKED PATHFINDER"
   OptionSubtext(0)="SELECT TO ACTIVATE"
   OptionSubtext(1)="SELECT TO ACTIVATE"
   OptionSubtext(2)="SELECT TO ACTIVATE"
   Name="Default__GFxTrPage_ServerSpawn"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
