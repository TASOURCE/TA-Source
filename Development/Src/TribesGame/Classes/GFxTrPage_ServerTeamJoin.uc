class GFxTrPage_ServerTeamJoin extends GFxTrPage;

function Initialize()
{
    AddActionNumber(TAT_BALANCED);
    AddActionNumber(TAT_UNBALANCED);
    AddActionNumber(TAT_AUTOASSIGN);
}

function SpecialAction(GFxTrAction Action)
{
    QueueManager.SetPropNumber(GAME_CONFIG_TEAMJOINTYPE, Action.ActionNumber, SPT_GAME);
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

    propVal = QueueManager.GetPropNumber(GAME_CONFIG_TEAMJOINTYPE, SPT_GAME);

    if (propVal == PageActions[ActionIndex].ActionNumber)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemRibbonLabel", Strings.Active);
        obj.SetString("itemSubTitle", "");
    }
    else
    {
        obj.SetFloat("hasRibbon", 0);
        obj.SetString("itemRibbonLabel", "");
        obj.SetString("itemSubTitle", "");
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
   PageLabel="TEAM JOIN TYPE"
   OptionTitles(0)="BALANCED"
   OptionTitles(1)="UNBALANCED"
   OptionTitles(2)="AUTO-ASSIGN"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerTeamJoin"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
