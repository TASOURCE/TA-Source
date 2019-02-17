class GFxTrPage_ServerScoring extends GFxTrPage;

var int  GameType;
var int  MinBounds;
var int  MaxBounds;
var int  ScoreNumber;
var bool bScorePopup;
var bool bRoundsPopup;
var bool bLivesPopup;
var bool bBoundsPopup;

function Initialize()
{
    AddActionNumber(ScoreNumber);
    AddActionNumber(GAME_CONFIG_ARENAROUNDS);
}

function SpecialAction(GFxTrAction Action)
{
    switch (Action.ActionNumber)
    {
    case ScoreNumber:
        bScorePopup = true;
        QueuePopup();
        break;
    case GAME_CONFIG_ARENAROUNDS:
        bRoundsPopup = true;
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

    if (bScorePopup)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Score@Strings.ToWin);
    }
    else if (bRoundsPopup)
    {
        Obj.SetString("popupTitle", Strings.Set@Strings.Round@Strings.ToWin@"("@Strings.Arena@")");
    }

    Obj.SetString("buttonLabel2", Strings.Accept);
    Obj.SetString("buttonLabel3", Strings.Cancel);
    Obj.SetFloat("enterKeyIndex", 1);
    Obj.SetFloat("type", 2);
}

function PopupComplete(int Action, string TextInput)
{
    local int newVal;
    local int propId;

    newVal = int(TextInput);

    if (bScorePopup)
    {
        bScorePopup = false;

        if (Action == 1)
        {
            switch (GameType)
            {
            case SERVER_GAMECLASSID_CTF:
            case SERVER_GAMECLASSID_BTZ: propId = GAME_CONFIG_SCORELIMIT_CTF; break;
            case SERVER_GAMECLASSID_RAB: propId = GAME_CONFIG_SCORELIMIT_RAB; break;
            case SERVER_GAMECLASSID_TDM: propId = GAME_CONFIG_SCORELIMIT_TDM; break;
            case SERVER_GAMECLASSID_ARN: propId = GAME_CONFIG_SCORELIMIT_ARN; break;
            case SERVER_GAMECLASSID_CAH: propId = GAME_CONFIG_SCORELIMIT_CAH; break;
            }
            
            if (!QueueManager.SetPropNumber(propId, newVal, SPT_GAME))
            {
                ShowBoundsError(propId, SPT_GAME);
            }
        }
    }
    else if (bRoundsPopup)
    {
        bRoundsPopup = false;

        if (Action == 1 && !QueueManager.SetPropNumber(GAME_CONFIG_ARENAROUNDS, newVal, SPT_GAME))
        {
            ShowBoundsError(GAME_CONFIG_ARENAROUNDS, SPT_GAME);
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
    GameType = QueueManager.GetPropNumber(GAME_CONFIG_GAMETYPE, SPT_QUEUE);

    super.FillData(DataList);

    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local int propId;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    obj.SetFloat("hasRibbon", 1);
    obj.SetFloat("ribbonType", 2);
    
    if (PageActions[ActionIndex].ActionNumber == GAME_CONFIG_ARENAROUNDS)
    {
        propId = GAME_CONFIG_ARENAROUNDS;
    }
    else
    {
        switch (GameType)
        {
        case SERVER_GAMECLASSID_CTF:
        case SERVER_GAMECLASSID_BTZ: propId = GAME_CONFIG_SCORELIMIT_CTF; break;
        case SERVER_GAMECLASSID_RAB: propId = GAME_CONFIG_SCORELIMIT_RAB; break;
        case SERVER_GAMECLASSID_TDM: propId = GAME_CONFIG_SCORELIMIT_TDM; break;
        case SERVER_GAMECLASSID_ARN: propId = GAME_CONFIG_SCORELIMIT_ARN; break;
        case SERVER_GAMECLASSID_CAH: propId = GAME_CONFIG_SCORELIMIT_CAH; break;
        }
    }

    obj.SetString("itemRibbonLabel", string(QueueManager.GetPropNumber(propId, SPT_GAME)));

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
   ScoreNumber=1
   PageLabel="SCORE SETTINGS"
   OptionTitles(0)="SCORE TO WIN"
   OptionTitles(1)="ROUNDS TO WIN (ARENA)"
   OptionTitles(2)="TEAM LIVES (ARENA)"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerScoring"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
