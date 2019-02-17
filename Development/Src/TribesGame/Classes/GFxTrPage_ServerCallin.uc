class GFxTrPage_ServerCallin extends GFxTrPage;

var int TACNumber;
var int SUPNumber;
var int ORBNumber;

function Initialize()
{
    AddActionNumber(GAME_CONFIG_POWEREDCALLINS);
    AddActionSet(Pages.ServerEditCallinPage, TACNumber);
    AddActionSet(Pages.ServerEditCallinPage, SUPNumber);
    AddActionSet(Pages.ServerEditCallinPage, ORBNumber);
}

function SpecialAction(GFxTrAction Action)
{
    local int newVal;

    if (Action.ActionNumber == GAME_CONFIG_POWEREDCALLINS)
    {
        newVal = QueueManager.GetPropNumber(Action.ActionNumber, SPT_GAME) > 0 ? 0 : 1;
        QueueManager.SetPropNumber(Action.ActionNumber, newVal, SPT_GAME);
        RefreshButtons();
    }
    else
    {
        Pages.ServerEditCallinPage.CallinType = Action.ActionNumber;
        Pages.ServerEditCallinPage.PageLabelOverride = Strings.Edit@OptionTitles[Action.ActionIndex];
    }
}

function FillData(GFxObject DataList)
{
    super.FillData(DataList);

    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local float propVal;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionNumber == GAME_CONFIG_POWEREDCALLINS)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        
        propVal = QueueManager.GetPropNumber(GAME_CONFIG_POWEREDCALLINS, SPT_GAME);
        SetSubTitle(propVal, obj);
    }

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
   TACNumber=1
   SUPNumber=2
   ORBNumber=4
   PageLabel="CALL-IN SETTINGS"
   OptionTitles(0)="POWERED CALLINS"
   OptionTitles(1)="TACTICAL STRIKE"
   OptionTitles(2)="SUPPLY DROP"
   OptionTitles(3)="ORBITAL STRIKE"
   OptionSubtext(0)="SELECT TO EDIT"
   OptionSubtext(1)="SELECT TO EDIT"
   OptionSubtext(2)="SELECT TO EDIT"
   OptionSubtext(3)="SELECT TO EDIT"
   Name="Default__GFxTrPage_ServerCallin"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
