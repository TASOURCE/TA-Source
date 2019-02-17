class GFxTrPage_ServerTime extends GFxTrPage;

var int  MinBounds;
var int  MaxBounds;
var bool bWarmupTimePopup;
var bool bTimeLimitPopup;
var bool bOverTimeLimitPopup;
var bool bRespawnTimePopup;
var bool bBoundsPopup;

function Initialize()
{
    AddActionNumber(GAME_CONFIG_WARMUPTIME);
    AddActionNumber(GAME_CONFIG_TIMELIMIT);
    AddActionNumber(GAME_CONFIG_OVERTIMELIMIT);
    AddActionNumber(GAME_CONFIG_RESPAWNTIME);
}

function SpecialAction(GFxTrAction Action)
{
    switch (Action.ActionNumber)
    {
    case GAME_CONFIG_WARMUPTIME:
        bWarmupTimePopup = true;
        QueuePopup();
        break;
    case GAME_CONFIG_TIMELIMIT:
        bTimeLimitPopup = true;
        QueuePopup();
        break;
    case GAME_CONFIG_OVERTIMELIMIT:
        bOverTimeLimitPopup = true;
        QueuePopup();
        break;
    case GAME_CONFIG_RESPAWNTIME:
        bRespawnTimePopup = true;
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

    if (bWarmupTimePopup)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Warmup@Strings.Time);
    }
    else if (bTimeLimitPopup)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Gametime@Strings.Limit);
    }
    else if (bOverTimeLimitPopup)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Overtime@Strings.Limit);
    }
    else if (bRespawnTimePopup)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Respawn@Strings.Time);
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

    if (bWarmupTimePopup)
    {
        bWarmupTimePopup = false;

        if (Action == 1)
        {
            if (!QueueManager.SetPropNumber(GAME_CONFIG_WARMUPTIME, newVal, SPT_GAME))
            {
                ShowBoundsError(GAME_CONFIG_WARMUPTIME, SPT_GAME);
            }
        }
    }
    else if (bTimeLimitPopup)
    {
        bTimeLimitPopup = false;

        if (Action == 1)
        {
            if (!QueueManager.SetPropNumber(GAME_CONFIG_TIMELIMIT, newVal, SPT_GAME))
            {
                ShowBoundsError(GAME_CONFIG_TIMELIMIT, SPT_GAME);
            }
        }
    }
    else if (bOverTimeLimitPopup)
    {
        bOverTimeLimitPopup = false;

        if (Action == 1)
        {
            if (!QueueManager.SetPropNumber(GAME_CONFIG_OVERTIMELIMIT, newVal, SPT_GAME))
            {
                ShowBoundsError(GAME_CONFIG_OVERTIMELIMIT, SPT_GAME);
            }
        }
    }
    else if (bRespawnTimePopup)
    {
        bRespawnTimePopup = false;

        if (Action == 1)
        {
            if (!QueueManager.SetPropNumber(GAME_CONFIG_RESPAWNTIME, newVal, SPT_GAME))
            {
                ShowBoundsError(GAME_CONFIG_RESPAWNTIME, SPT_GAME);
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

function FillData(GFxObject DataList)
{
    super.FillData(DataList);

    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local int time;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    obj.SetFloat("hasRibbon", 1);
    obj.SetFloat("ribbonType", 2);
    
    time = QueueManager.GetPropNumber(PageActions[ActionIndex].ActionNumber, SPT_GAME);

    if (time == 0)
    {
        obj.SetString("itemRibbonLabel", Strings.Off);
    }
    else
    {    
        switch (PageActions[ActionIndex].ActionNumber)
        {
        case GAME_CONFIG_WARMUPTIME:    obj.SetString("itemRibbonLabel", time@Strings.TrSecondsAbb); break;
        case GAME_CONFIG_TIMELIMIT:     obj.SetString("itemRibbonLabel", time@Strings.TrMinutesAbb); break;
        case GAME_CONFIG_OVERTIMELIMIT: obj.SetString("itemRibbonLabel", time@Strings.TrMinutesAbb); break;
        case GAME_CONFIG_RESPAWNTIME:   obj.SetString("itemRibbonLabel", time@Strings.TrSecondsAbb); break;
        default: break;
        }
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
   PageLabel="TIME SETTINGS"
   OptionTitles(0)="WARMUP TIME"
   OptionTitles(1)="GAMETIME LIMIT"
   OptionTitles(2)="OVERTIME LIMIT"
   OptionTitles(3)="RESPAWN TIME"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerTime"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
