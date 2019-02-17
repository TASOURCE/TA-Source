class GFxTrPage_ServerClasses extends GFxTrPage;

var int  MinBounds;
var int  MaxBOunds;
var int  PopupNum;
var bool bBoundsPopup;

function Initialize()
{
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_PTH);
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_SEN);
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_INF);
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_SLD);
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_TCN);
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_RDR);
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_JUG);
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_DMB);
    AddActionNumber(GAME_CONFIG_CLASSCOUNT_BRT);
}

function SpecialAction(GFxTrAction Action)
{
    PopupNum = Action.ActionNumber;
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

    if (propVal == 0)
    {
        obj.SetFloat("hasRibbon", 0);
        obj.SetString("itemRibbonLabel", "");
        obj.SetString("itemSubTitle", Strings.Banned);
    }
    else
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemSubTitle", "");

        if (propVal > 15) obj.SetString("itemRibbonLabel", Strings.All);
        else obj.SetString("itemRibbonLabel", propVal@Strings.Only);
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

    Obj.SetString("popupTitle", Strings.Set@Strings.Total@Strings.Allowed);
    Obj.SetString("buttonLabel2", Strings.Accept);
    Obj.SetString("buttonLabel3", Strings.Cancel);
    Obj.SetFloat("enterKeyIndex", 1);
    Obj.SetFloat("type", 2);
}

function PopupComplete(int Action, string TextInput)
{
    local int newVal;

    newVal = int(TextInput);

    if (bBoundsPopup)
    {
        bBoundsPopup = false;
    }
    else if (PopupNum != INDEX_NONE)
    {
        if (Action == 1)
        {
            if (newVal > 16) newVal = 16;

            if (!QueueManager.SetPropNumber(PopupNum, newVal, SPT_GAME))
            {
                ShowBoundsError(PopupNum, SPT_GAME);
            }
        }

        PopupNum = INDEX_NONE;
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

defaultproperties
{
   PopupNum=-1
   PageLabel="ALLOWED CLASSES"
   OptionTitles(0)="PATHFINDER"
   OptionTitles(1)="SENTINEL"
   OptionTitles(2)="INFILTRATOR"
   OptionTitles(3)="SOLDIER"
   OptionTitles(4)="TECHNICIAN"
   OptionTitles(5)="RAIDER"
   OptionTitles(6)="JUGGERNAUT"
   OptionTitles(7)="DOOMBRINGER"
   OptionTitles(8)="BRUTE"
   Name="Default__GFxTrPage_ServerClasses"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
