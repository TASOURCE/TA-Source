class GFxTrPage_ServerBase extends GFxTrPage;

function Initialize()
{
    AddActionNumber(GAME_CONFIG_BASEASSETS);
    AddActionNumber(GAME_CONFIG_UPGRADES);
    AddActionNumber(GAME_CONFIG_GENAUTOREGEN);
    AddActionNumber(GAME_CONFIG_GENDESTROYABLE);
    AddActionNumber(GAME_CONFIG_POWERDEPLOYS);
}

function SpecialAction(GFxTrAction Action)
{
    local int newVal;

    newVal = QueueManager.GetPropNumber(Action.ActionNumber, SPT_GAME) > 0 ? 0 : 1;
    QueueManager.SetPropNumber(Action.ActionNumber, newVal, SPT_GAME);

    RefreshButtons();
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

    obj.SetFloat("hasRibbon", 1);
    obj.SetFloat("ribbonType", 2);
    
    SetSubTitle(QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_GAME), obj);

    return obj;
}

function SetSubTitle(float Val, GFxObject Obj)
{
    local string subTitle;

    subTitle = val > 0 ? Strings.Enabled : Strings.Disabled;

    if (subTitle == Strings.Enabled)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
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
   PageLabel="BASE SETTINGS"
   OptionTitles(0)="BASE OBJECTIVES"
   OptionTitles(1)="BASE UPGRADES"
   OptionTitles(2)="GENERATOR REGEN"
   OptionTitles(3)="GENERATOR DESTROYABLE"
   OptionTitles(4)="POWERED DEPLOYABLES"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerBase"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
