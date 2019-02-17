class GFxTrPage_ServerFF extends GFxTrPage;

var int   PopupNum;
var bool  bBoundsPopup;
var float MinBounds;
var float MaxBounds;

function Initialize()
{
    AddActionNumber(GAME_CONFIG_FRIENDLYFIRE);
    AddActionNumber(GAME_CONFIG_FFMULTIPLIER);
    AddActionNumber(GAME_CONFIG_FFDEPLOYABLES);
    AddActionNumber(GAME_CONFIG_FFBASEASSETS);
    AddActionNumber(GAME_CONFIG_FFKILLLIMIT);
    AddActionNumber(GAME_CONFIG_FFDMGLIMIT);
}

function SpecialAction(GFxTrAction Action)
{
    local int newVal;

    newVal = QueueManager.GetPropNumber(Action.ActionNumber, SPT_GAME) > 0 ? 0 : 1;

    switch (Action.ActionNumber)
    {
    case GAME_CONFIG_FRIENDLYFIRE:
    case GAME_CONFIG_FFBASEASSETS:
    case GAME_CONFIG_FFDEPLOYABLES:
        QueueManager.SetPropNumber(Action.ActionNumber, newVal, SPT_GAME);
        RefreshButtons();
        break;
    case GAME_CONFIG_FFDMGLIMIT:
    case GAME_CONFIG_FFKILLLIMIT:
    case GAME_CONFIG_FFMULTIPLIER:
        PopupNum = Action.ActionNumber;
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
        Obj.SetString("popupBody", Strings.ValueMustBeWithin@int(MinBounds)@Strings.And@int(MaxBounds));
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 0);
        return;
    }

    if (PopupNum > 0)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Value);
    }

    Obj.SetString("buttonLabel2", Strings.Accept);
    Obj.SetString("buttonLabel3", Strings.Cancel);
    Obj.SetFloat("enterKeyIndex", 1);
    Obj.SetFloat("type", 2);
}

function PopupComplete(int Action, string TextInput)
{
    local bool bInBounds;
    local float newVal;

    newVal = float(TextInput);

    if (PopupNum > 0)
    {
        if (Action == 1)
        {
            if (PopupNum == GAME_CONFIG_FFMULTIPLIER)
            {
                bInBounds = QueueManager.SetPropNumber(PopupNum, newVal*1000, SPT_GAME);
            }
            else
            {
                bInBounds = QueueManager.SetPropNumber(PopupNum, newVal, SPT_GAME);
            }

            if (!bInBounds)
            {
                ShowBoundsError(PopupNum, SPT_GAME);
            }
        }

        PopupNum = -1;
    }
    else if (bBoundsPopup)
    {
        bBoundsPopup = false;
    }

    RefreshButtons();
}

function ShowBoundsError(int PropId, int PropType)
{
    local int tempVal;

    QueueManager.GetPropMin(PropId, PropType, tempVal);
    MinBounds = tempVal;
    QueueManager.GetPropMax(PropId, PropType, tempVal);
    MaxBounds = tempVal;

    if (PropId == GAME_CONFIG_FFMULTIPLIER)
    {
        MinBounds /= 1000;
        MaxBounds /= 1000;
    }

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
    local float propVal;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionNumber > 0)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        
        propVal = QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_GAME);
    }

    switch (PageActions[ActionIndex].ActionNumber)
    {
    case GAME_CONFIG_FRIENDLYFIRE:
    case GAME_CONFIG_FFBASEASSETS:
    case GAME_CONFIG_FFDEPLOYABLES:
        SetSubTitle(propVal, obj);
        break;
    case GAME_CONFIG_FFDMGLIMIT:
    case GAME_CONFIG_FFKILLLIMIT:
        if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Off);
        else obj.SetString("itemRibbonLabel", string(int(propVal)));
        break;
    case GAME_CONFIG_FFMULTIPLIER:
        propVal /= 1000;
        if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Off);
        else obj.SetString("itemRibbonLabel", "x"@propVal);
        break;
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
   PopupNum=-1
   PageLabel="FRIENDLY FIRE"
   OptionTitles(0)="FRIENDLY FIRE (FF)"
   OptionTitles(1)="FF DAMAGE MULTIPLIER"
   OptionTitles(2)="FF ON DEPLOYABLES"
   OptionTitles(3)="FF ON BASE ASSETS"
   OptionTitles(4)="KILL LIMIT (AUTOKICK)"
   OptionTitles(5)="DAMAGE LIMIT (AUTOKICK)"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   OptionSubtext(5)="SELECT TO CHANGE"
   OptionSubtext(6)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerFF"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
