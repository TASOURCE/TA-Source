class GFxTrPage_ServerEditCallin extends GFxTrPage;

var int  MinBounds;
var int  MaxBounds;
var int  TACNumber;
var int  SUPNumber;
var int  ORBNumber;
var int  CallinType;
var int  EnabledIndex;
var int  PriceIndex;
var int  CooldownIndex;
var int  BuildupIndex;

var int  PopupIndex;
var bool bPopup;
var bool bBoundsPopup;

function SpecialAction(GFxTrAction Action)
{
    local int newVal;

    if (Action.ActionIndex == EnabledIndex)
    {
        newVal = QueueManager.GetPropNumber(GAME_CONFIG_CALLINSDENIED, SPT_GAME);

        if ((newVal & CallinType) == CallinType)
        {
            newVal -= CallinType;
        }
        else
        {
            newVal += CallinType;
        }
        
        QueueManager.SetPropNumber(GAME_CONFIG_CALLINSDENIED, newVal, SPT_GAME);

        RefreshButtons();
    }
    else if (Action.ActionNumber == GAME_CONFIG_SUPPLYDROPAMMOONLY)
    {
        newVal = QueueManager.GetPropNumber(Action.ActionNumber, SPT_GAME) > 0 ? 0 : 1;
        QueueManager.SetPropNumber(Action.ActionNumber, newVal, SPT_GAME);
        RefreshButtons();
    }
    else
    {
        PopupIndex = Action.ActionIndex;
        bPopup = true;
        QueuePopup();
    }
}

function FillData(GFxObject DataList)
{
    ClearActions();

    AddAction();

    switch (CallinType)
    {
    case TACNumber:
        AddActionNumber(GAME_CONFIG_CALLINPRICETAC);
        AddActionNumber(GAME_CONFIG_CALLINCLDWNTAC);
        AddActionNumber(GAME_CONFIG_CALLINBLDUPTAC);
        break;
    case SUPNumber:
        AddActionNumber(GAME_CONFIG_CALLINPRICESUP);
        AddActionNumber(GAME_CONFIG_CALLINCLDWNSUP);
        AddActionNumber(GAME_CONFIG_CALLINBLDUPSUP);
        AddActionNumber(GAME_CONFIG_SUPPLYDROPAMMOONLY);
        break;
    case ORBNumber:
        AddActionNumber(GAME_CONFIG_CALLINPRICEORB);
        AddActionNumber(GAME_CONFIG_CALLINCLDWNORB);
        AddActionNumber(GAME_CONFIG_CALLINBLDUPORB);
        break;
    default:
        break;
    }

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
    
    if (ActionIndex == EnabledIndex)
    {
        propVal = QueueManager.GetPropNumber(GAME_CONFIG_CALLINSDENIED, SPT_GAME);

        if ((propVal & CallinType) == CallinType)
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemRibbonLabel", "");
            obj.SetString("itemSubTitle", Strings.Disabled);
        }
        else
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", Strings.Enabled);
            obj.SetString("itemSubTitle", "");
        }
    }
    else if (PageActions[ActionIndex].ActionNumber == GAME_CONFIG_SUPPLYDROPAMMOONLY)
    {        
        propVal = QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_GAME);
        SetSubTitle(propVal, obj);
    }
    else
    {
        propVal = QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_GAME);

        switch (ActionIndex)
        {
        case PriceIndex:
            if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Free);
            else obj.SetString("itemRibbonLabel", propVal@Strings.Credits);
            break;
        case CooldownIndex:
        case BuildupIndex:
            if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Off);
            else obj.SetString("itemRibbonLabel", propVal@Strings.TrSecondsAbb);
            break;
        default:
            break;
        }
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

    switch (PopupIndex)
    {
    case PriceIndex:    Obj.SetString("popupTitle", Strings.Set@Strings.Price);                 break;
    case CooldownIndex: Obj.SetString("popupTitle", Strings.Set@Strings.Cooldown@Strings.Time); break;
    case BuildupIndex:  Obj.SetString("popupTitle", Strings.Set@Strings.Buildup@Strings.Time);  break;
    default:
        break;
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

    if (bPopup)
    {
        bPopup = false;

        if (Action == 1)
        {
            if (!QueueManager.SetPropNumber(PageActions[PopupIndex].ActionNumber, newVal, SPT_GAME))
            {
                ShowBoundsError(PageActions[PopupIndex].ActionNumber, SPT_GAME);
            }
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
   PriceIndex=1
   CooldownIndex=2
   BuildupIndex=3
   PageLabel="EDIT CALLIN"
   OptionTitles(0)="CALL-IN ACTIVE"
   OptionTitles(1)="PRICE"
   OptionTitles(2)="COOLDOWN TIME"
   OptionTitles(3)="BUILDUP TIME"
   OptionTitles(4)="AMMO ONLY"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerEditCallin"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
