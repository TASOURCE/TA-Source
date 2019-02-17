class GFxTrPage_ServerPlayer extends GFxTrPage;

var int  PopupNum;
var int  MinBounds;
var int  MaxBounds;
var bool bBoundsPopup;

function Initialize()
{
    AddActionSet(Pages.ServerClassesPage);
    AddActionPage(Pages.ServerSpawnPage);
    AddActionNumber(QUEUE_CONFIG_MINLEVEL);
    AddActionNumber(QUEUE_CONFIG_MAXLEVEL);
    AddActionNumber(GAME_CONFIG_MAXSPEEDWITHFLAGLIGHT);
	AddActionNumber(GAME_CONFIG_MAXSPEEDWITHFLAGMEDIUM);
	AddActionNumber(GAME_CONFIG_MAXSPEEDWITHFLAGHEAVY);
    AddActionNumber(GAME_CONFIG_DECELERATIONRATEWITHFLAG);
}

function SpecialAction(GFxTrAction Action)
{
    switch (Action.ActionNumber)
    {
    case QUEUE_CONFIG_MINLEVEL:
    case QUEUE_CONFIG_MAXLEVEL:
    case GAME_CONFIG_MAXSPEEDWITHFLAGLIGHT:
	case GAME_CONFIG_MAXSPEEDWITHFLAGMEDIUM:
	case GAME_CONFIG_MAXSPEEDWITHFLAGHEAVY:
    case GAME_CONFIG_DECELERATIONRATEWITHFLAG:
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
        Obj.SetString("popupBody", Strings.ValueMustBeWithin@MinBounds@Strings.And@MaxBounds);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 0);
        return;
    }

    if (PopupNum == QUEUE_CONFIG_MINLEVEL || PopupNum == QUEUE_CONFIG_MAXLEVEL)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Level);
    }
    else if (  (PopupNum == GAME_CONFIG_MAXSPEEDWITHFLAGLIGHT || PopupNum == GAME_CONFIG_DECELERATIONRATEWITHFLAG)
    		 ||(PopupNum == GAME_CONFIG_MAXSPEEDWITHFLAGMEDIUM)
    		 ||(PopupNum == GAME_CONFIG_MAXSPEEDWITHFLAGHEAVY) )
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
    local int   propType;
    local float propVal;

    propVal = float(TextInput);

    if (PopupNum > 0)
    {
        if (Action == 1)
        {
            if (PopupNum == QUEUE_CONFIG_MINLEVEL || PopupNum == QUEUE_CONFIG_MAXLEVEL)
            {
                propType = SPT_QUEUE;
            }
            else if ( (PopupNum == GAME_CONFIG_MAXSPEEDWITHFLAGLIGHT || PopupNum == GAME_CONFIG_DECELERATIONRATEWITHFLAG)
					||(PopupNum == GAME_CONFIG_MAXSPEEDWITHFLAGMEDIUM)
					||(PopupNum == GAME_CONFIG_MAXSPEEDWITHFLAGHEAVY) )
            {
                propType = SPT_GAME;
            }

            if (!QueueManager.SetPropNumber(PopupNum, propVal, propType))
            {
                ShowBoundsError(PopupNum, propType);
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

    if (PageActions[ActionIndex].ActionNumber > 0)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
    }

    switch (PageActions[ActionIndex].ActionNumber)
    {
    case QUEUE_CONFIG_MINLEVEL:
    case QUEUE_CONFIG_MAXLEVEL:
        propVal = QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_QUEUE);
        if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.TrNone);
        else obj.SetString("itemRibbonLabel", Strings.Level@propVal);
        break;
    case GAME_CONFIG_MAXSPEEDWITHFLAGLIGHT:
	case GAME_CONFIG_MAXSPEEDWITHFLAGMEDIUM:
	case GAME_CONFIG_MAXSPEEDWITHFLAGHEAVY:
    case GAME_CONFIG_DECELERATIONRATEWITHFLAG:
        propVal = QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_GAME);
        if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Off);
        else obj.SetString("itemRibbonLabel", propVal@Strings.KPH);
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
   PageLabel="PLAYER SETTINGS"
   OptionTitles(0)="CLASSES ALLOWED"
   OptionTitles(1)="SPAWN TYPES"
   OptionTitles(2)="MINIMUM LEVEL"
   OptionTitles(3)="MAXIMUM LEVEL"
   OptionTitles(4)="MAX SPEED W/ FLAG(LIGHT)"
   OptionTitles(5)="MAX SPEED W/ FLAG(MED)"
   OptionTitles(6)="MAX SPEED W/ FLAG(HEAVY)"
   OptionTitles(7)="FLAG DECELERATION RATE"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   OptionSubtext(5)="SELECT TO CHANGE"
   OptionSubtext(6)="SELECT TO CHANGE"
   OptionSubtext(7)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerPlayer"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
