class GFxTrPage_ServerActions extends GFxTrPage;

var int  EnableServerNum;
var int  DisableServerNum;
var int  KillServerNum;
var int  GotoMapServerNum;
var int  KickPlayerNum;
var int  BanPlayerNum;
var int  PopupNum;
var bool bPopup;

function Initialize()
{
    AddActionNumber(EnableServerNum);
    AddActionNumber(DisableServerNum);
    AddActionNumber(KillServerNum);
    AddActionNumber(GotoMapServerNum);
    AddActionNumber(KickPlayerNum);
    AddActionNumber(BanPlayerNum);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionNumber == EnableServerNum)
    {
        if (QueueManager.GetServerOnline(QueueManager.ServerIndex))
        {
            return;
        }
    }
    else if (!QueueManager.GetServerOnline(QueueManager.ServerIndex))
    {
        return;
    }

    bPopup = true;
    PopupNum = Action.ActionNumber;
    QueuePopup();
}

function FillData(GFxObject DataList)
{
    QueueManager.RefreshRentedServers();

    super.FillData(DataList);

    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionNumber == EnableServerNum)
    {
        if (QueueManager.GetServerOnline(QueueManager.ServerIndex))
        {
            obj.SetFloat("bLocked", 1);
        }
    }
    else if (!QueueManager.GetServerOnline(QueueManager.ServerIndex) || QueueManager.GetServerExpired())
    {
        obj.SetFloat("bLocked", 1);
    }

    return obj;
}

function PopupData(GFxObject Obj)
{
    Obj.SetString("buttonLabel2", Strings.OK);
    Obj.SetString("buttonLabel3", Strings.Cancel);
    Obj.SetFloat("enterKeyIndex", 1);
    Obj.SetFloat("type", 0);

    if (bPopup)
    {
        switch (PopupNum)
        {
        case EnableServerNum:
            if (QueueManager.GetServerTime() > 0)
            {
                Obj.SetString("popupTitle", Strings.Enable@Strings.TrServer);
                Obj.SetString("popupBody", Strings.EnableServerBody);
            }
            else
            {
                Obj.SetString("popupTitle", Strings.Enable@Strings.TrServer);
                Obj.SetString("popupBody", Strings.ServerExpiredBody);
                Obj.SetString("buttonLabel3", "");
            }
            break;
        case DisableServerNum:
            Obj.SetString("popupTitle", Strings.Disable@Strings.TrServer);
            Obj.SetString("popupBody", Strings.DisableServerBody);
            break;
        case KillServerNum:
            Obj.SetString("popupTitle", Strings.Kill@Strings.TrServer);
            Obj.SetString("popupBody", Strings.KillServerBody);
            break;
        case GotoMapServerNum:
            Obj.SetString("popupTitle", Strings.GoToNextMap);
            Obj.SetString("popupBody", Strings.GoToNextMapBody);
            break;
        case KickPlayerNum:
            Obj.SetString("popupTitle", Strings.Kick@Strings.Player);
            Obj.SetString("popupBody", Strings.KickPlayerBody);
            Obj.SetFloat("type", 2);
            break;
        case BanPlayerNum:
            Obj.SetString("popupTitle", Strings.Ban@Strings.Player);
            Obj.SetString("popupBody", Strings.BanPlayerBody);
            Obj.SetFloat("type", 2);
            break;
        default:
            break;
        }
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (bPopup)
    {
        bPopup = false;

        if (Action == 1)
        {
            switch (PopupNum)
            {
            case EnableServerNum:  QueueManager.CustomStart(); break;
            case DisableServerNum: QueueManager.CustomStop(); break;
            case KillServerNum:    QueueManager.CustomShutdown(); break;
            case GotoMapServerNum: QueueManager.CustomNextMap(0); break;
            case KickPlayerNum:    QueueManager.CustomKick(TextInput); break;
            case BanPlayerNum:     QueueManager.CustomBan(TextInput); break;
            default:
                break;
            }

            TrPlayerController(GetPC()).StartRefreshPageTimer();
        }
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
   EnableServerNum=1
   DisableServerNum=2
   KillServerNum=3
   GotoMapServerNum=4
   KickPlayerNum=5
   BanPlayerNum=6
   PageLabel="SERVER ACTIONS"
   OptionTitles(0)="ENABLE SERVER"
   OptionTitles(1)="DISABLE SERVER"
   OptionTitles(2)="KILL SERVER"
   OptionTitles(3)="GOTO NEXT MAP"
   OptionTitles(4)="KICK PLAYER"
   OptionTitles(5)="BAN PLAYER"
   OptionSubtext(0)="BRING SERVER UP FOR PLAY"
   OptionSubtext(1)="STOPS AFTER CURRENT MAP"
   OptionSubtext(2)="STOP SERVER IMMEDIATELY"
   OptionSubtext(3)="FORCE NEXT MAP"
   OptionSubtext(4)="KICK A PLAYER"
   OptionSubtext(5)="BAN A PLAYER"
   Name="Default__GFxTrPage_ServerActions"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
