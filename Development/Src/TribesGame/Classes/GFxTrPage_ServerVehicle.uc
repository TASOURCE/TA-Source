class GFxTrPage_ServerVehicle extends GFxTrPage;

var int   PopupNumber;
var bool  bBoundsPopup;
var float MinBounds;
var float MaxBounds;

function Initialize()
{
    AddActionNumber(GAME_CONFIG_VEHICLEHEALTHMULT);
    AddActionNumber(GAME_CONFIG_VGRAVCYCLELIMIT);
    AddActionNumber(GAME_CONFIG_VGRAVPRICE);
    AddActionNumber(GAME_CONFIG_VBEOWULFLIMIT);
    AddActionNumber(GAME_CONFIG_VBEOWULFPRICE);
    AddActionNumber(GAME_CONFIG_VSHRIKELIMIT);
    AddActionNumber(GAME_CONFIG_VSHRIKEPRICE);
}

function SpecialAction(GFxTrAction Action)
{
    PopupNumber = Action.ActionNumber;
    QueuePopup();
}

function PopupData(GFxObject Obj)
{
    if (bBoundsPopup)
    {
        Obj.SetString("popupTitle", Strings.OutOfBounds);
        Obj.SetString("popupBody", Strings.ValueMustBeWithin@MinBounds@Strings.And@MaxBounds);
        Obj.SetString("buttonLabel2", "OK");
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 0);
        return;
    }

    if (PopupNumber > 0)
    {
        switch (PopupNumber)
        {
        case GAME_CONFIG_VEHICLEHEALTHMULT: Obj.SetString("popupTitle", Strings.Set@Strings.Health@Strings.Multiplier); break;
        case GAME_CONFIG_VGRAVCYCLELIMIT:   Obj.SetString("popupTitle", Strings.Set@"GRAVCYCLES"@Strings.PerTeam); break;
        case GAME_CONFIG_VBEOWULFLIMIT:     Obj.SetString("popupTitle", Strings.Set@"BEOWULFS"@Strings.PerTeam); break;
        case GAME_CONFIG_VSHRIKELIMIT:      Obj.SetString("popupTitle", Strings.Set@"SHRIKES"@Strings.PerTeam); break;
        case GAME_CONFIG_VGRAVPRICE:        Obj.SetString("popupTitle", Strings.Set@"GRAVCYCLE"@Strings.Price); break;
        case GAME_CONFIG_VBEOWULFPRICE:     Obj.SetString("popupTitle", Strings.Set@"BEOWULF"@Strings.Price); break;
        case GAME_CONFIG_VSHRIKEPRICE:      Obj.SetString("popupTitle", Strings.Set@"SHRIKE"@Strings.Price); break;
        default:
            break;
        }
    }

    Obj.SetString("buttonLabel2", Strings.Accept);
    Obj.SetString("buttonLabel3", Strings.Cancel);
    Obj.SetFloat("enterKeyIndex", 1);
    Obj.SetFloat("type", 2);
}

function PopupComplete(int Action, string TextInput)
{
    local float newVal;

    newVal = float(TextInput);

    if (PopupNumber > 0)
    {
        if (Action == 1)
        {
            switch (PopupNumber)
            {
            case GAME_CONFIG_VEHICLEHEALTHMULT:
                if (!QueueManager.SetPropNumber(PopupNumber, newVal*1000, SPT_GAME))
                {
                    ShowBoundsError(PopupNumber, SPT_GAME);
                }
                break;
            case GAME_CONFIG_VGRAVCYCLELIMIT:
            case GAME_CONFIG_VBEOWULFLIMIT:
            case GAME_CONFIG_VSHRIKELIMIT:
            case GAME_CONFIG_VGRAVPRICE:
            case GAME_CONFIG_VBEOWULFPRICE:
            case GAME_CONFIG_VSHRIKEPRICE:
                if (!QueueManager.SetPropNumber(PopupNumber, newVal, SPT_GAME))
                {
                    ShowBoundsError(PopupNumber, SPT_GAME);
                }
                break;
            default:
                break;
            }

        }

        PopupNumber = -1;
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
    
    if (PropId == GAME_CONFIG_VEHICLEHEALTHMULT)
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

    obj.SetFloat("hasRibbon", 1);
    obj.SetFloat("ribbonType", 2);
    
    propVal = QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_GAME);

    switch (PageActions[ActionIndex].ActionNumber)
    {
    case GAME_CONFIG_VEHICLEHEALTHMULT:
        propVal /= 1000;
        if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Off);
        else obj.SetString("itemRibbonLabel", "x"@propVal);
        break;
    case GAME_CONFIG_VGRAVCYCLELIMIT:
    case GAME_CONFIG_VBEOWULFLIMIT:
    case GAME_CONFIG_VSHRIKELIMIT:
        if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Disabled);
        else obj.SetString("itemRibbonLabel", int(propVal)@Strings.PerTeam);
        break;
    case GAME_CONFIG_VGRAVPRICE:
    case GAME_CONFIG_VBEOWULFPRICE:
    case GAME_CONFIG_VSHRIKEPRICE:
        if (propVal == 0) obj.SetString("itemRibbonLabel", Strings.Free);
        else obj.SetString("itemRibbonLabel", int(propVal)@Strings.Credits);
        break;
    default: break;
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
   PageLabel="VEHICLE SETTINGS"
   OptionTitles(0)="HEALTH MULTIPLIER"
   OptionTitles(1)="GRAVCYCLE LIMIT"
   OptionTitles(2)="GRACYCLE PRICE"
   OptionTitles(3)="BEOWULF LIMIT"
   OptionTitles(4)="BEOWULF PRICE"
   OptionTitles(5)="SHRIKE LIMIT"
   OptionTitles(6)="SHRIKE PRICE"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   OptionSubtext(5)="SELECT TO CHANGE"
   OptionSubtext(6)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerVehicle"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
