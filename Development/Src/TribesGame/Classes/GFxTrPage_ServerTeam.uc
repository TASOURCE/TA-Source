class GFxTrPage_ServerTeam extends GFxTrPage;

var int  MinBounds;
var int  MaxBounds;
var bool bMaxPlayerPopup;
var bool bDisparityPopup;
var bool bPopupBaseDestPopup;
var bool bBoundsPopup;

function Initialize()
{
    AddActionNumber(GAME_CONFIG_MAXPLAYERS);
    AddActionSet(Pages.ServerTeamJoinPage,  GAME_CONFIG_TEAMJOINTYPE);
    AddActionNumber(GAME_CONFIG_AUTOBALANCE);
    AddActionNumber(GAME_CONFIG_BASEDESTLIMIT);
    AddActionNumber(GAME_CONFIG_TEAMCREDITS);
}

function SpecialAction(GFxTrAction Action)
{
    local int newVal;

    newVal = QueueManager.GetPropNumber(Action.ActionNumber, SPT_GAME) > 0 ? 0 : 1;

    switch (Action.ActionNumber)
    {
    case GAME_CONFIG_MAXPLAYERS:
        bMaxPlayerPopup = true;
        QueuePopup();
        break;
    case GAME_CONFIG_AUTOBALANCE:
    case GAME_CONFIG_TEAMCREDITS:
        QueueManager.SetPropNumber(Action.ActionNumber, newVal, SPT_GAME);
        RefreshButtons();
        break;
    case GAME_CONFIG_BASEDESTLIMIT:
        bPopupBaseDestPopup = true;
        QueuePopup();
        break;
    default:
        break;
    }
}

function PopupData(GFxObject Obj)
{
    if (bBoundsPopup)
    {
        Obj.SetString("popupTitle", Strings.OutOfBounds);
        Obj.SetString("popupBody", Strings.ValueMustBeWithin@MinBounds@Strings.And@MaxBounds);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 0);
        return;
    }

    if (bMaxPlayerPopup)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Max@Strings.Players);
    }
    else if (bPopupBaseDestPopup)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.BaseDestReq);
    }

    Obj.SetString("buttonLabel2", Strings.Accept);
    Obj.SetString("buttonLabel3", Strings.Cancel);
    Obj.SetFloat("enterKeyIndex", 1);
    Obj.SetFloat("type", 2);
}

function PopupComplete(int Action, string TextInput)
{
    local int newVal;

    newVal = int(TextInput);

    if (bMaxPlayerPopup)
    {
        bMaxPlayerPopup = false;

        if (Action == 1 && !QueueManager.SetPropNumber(GAME_CONFIG_MAXPLAYERS, newVal, SPT_GAME))
        {
            ShowBoundsError(GAME_CONFIG_MAXPLAYERS, SPT_GAME);
        }
    }
    else if (bPopupBaseDestPopup)
    {
        bPopupBaseDestPopup = false;

        if (Action == 1 && !QueueManager.SetPropNumber(GAME_CONFIG_BASEDESTLIMIT, newVal, SPT_GAME))
        {
            ShowBoundsError(GAME_CONFIG_BASEDESTLIMIT, SPT_GAME);
        }
    }
    else if (bBoundsPopup)
    {
        bBoundsPopup = false;
    }

    RefreshButtons();
}

function ShowBoundsError(int PropId, int PropType)
{
    QueueManager.GetPropMin(PropId, PropType, MinBounds);
    QueueManager.GetPropMax(PropId, PropType, MaxBounds);
    bBoundsPopup = true;
    QueuePopup();
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

    obj.SetFloat("hasRibbon", 1);
    obj.SetFloat("ribbonType", 2);
    
    propVal = QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_GAME);

    switch (PageActions[ActionIndex].ActionNumber)
    {
    case GAME_CONFIG_AUTOBALANCE:
    case GAME_CONFIG_TEAMCREDITS:
        SetSubTitle(propVal, obj);
        break;
    case GAME_CONFIG_MAXPLAYERS:
    case GAME_CONFIG_BASEDESTLIMIT:
        if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Off);
        else if (propVal == 1) obj.SetString("itemRibbonLabel", propVal@Strings.Player);
        else obj.SetString("itemRibbonLabel", propVal@Strings.Players);
        break;
    case GAME_CONFIG_TEAMJOINTYPE:
        switch (propVal)
        {
        case TAT_BALANCED:   obj.SetString("itemRibbonLabel", Strings.Balanced);    break;
        case TAT_UNBALANCED: obj.SetString("itemRibbonLabel", Strings.Unbalanced);  break;
        case TAT_AUTOASSIGN: obj.SetString("itemRibbonLabel", Strings.AutoAssign); break;
        }
    default: break;
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
   PageLabel="TEAM SETTINGS"
   OptionTitles(0)="MAX PLAYERS"
   OptionTitles(1)="TEAM JOIN TYPE"
   OptionTitles(2)="AUTOBALANCE IN GAME"
   OptionTitles(3)="BASE DESTRUCTION REQ."
   OptionTitles(4)="POOL TEAM CREDITS"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerTeam"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
