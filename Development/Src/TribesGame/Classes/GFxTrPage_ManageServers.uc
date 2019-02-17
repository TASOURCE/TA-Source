class GFxTrPage_ManageServers extends GFxTrPage;

var int Offset;
var int AddServerNum;
var int PopupNum;

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionIndex > (Offset - 1))
    {
        QueueManager.SetActiveServer(Action.ActionIndex-Offset);
    }
    else if (Action.ActionNumber == AddServerNum)
    {
        PopupNum = AddServerNum;
        QueuePopup();
    }
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);

    if (DataList != none)
    {
        FillData(DataList);
    }

    if ((ActionIndex > (Offset - 1)) && (ActionIndex < QueueManager.RentedServers.Length))
    {
        QueueManager.ServerIndex = ActionIndex-Offset;
        CheckDescription(DataList);
    }

    return 0;
}

function FillData(GFxObject DataList)
{
    local int i;
    
    ClearActions();
    QueueManager.RefreshRentedServers();
    
    Offset = 0;

    if (QueueManager.RentedServers.Length < 8)
    {
        Offset = 1;
        AddActionNumber(AddServerNum);
    }

    for (i = 0; i < QueueManager.RentedServers.Length; i++)
    {
        AddActionSet(Pages.ManageServerPage, QueueManager.GetQueueCaseId());
    }

    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local bool bVal;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (Offset == 0 || ActionIndex > 0)
    {
        bVal = QueueManager.GetServerOnline(ActionIndex-Offset);

        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", bVal ? 2 : 1);
        obj.SetString("itemSubTitle", "");
        obj.SetString("itemRibbonLabel", bVal ? Strings.TrServer@Strings.Online : Strings.TrServer@Strings.Offline);
        obj.SetString("itemTitle", QueueManager.GetServerName(ActionIndex-Offset));
        obj.SetString("itemSubTitle", Strings.SelectToManage);
    }

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
    Obj.SetString("buttonLabel2", Strings.OK);
    Obj.SetString("buttonLabel3", Strings.Cancel);
    Obj.SetFloat("enterKeyIndex", 1);
    Obj.SetFloat("type", 0);

    if (PopupNum > 0)
    {
        switch (PopupNum)
        {
        case AddServerNum:
            Obj.SetString("popupTitle", Strings.CreateNewServer);
            Obj.SetString("popupBody", Strings.CreateNewServerBody);
            break;
        default:
            break;
        }
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (PopupNum > 0)
    {
        if (Action == 1)
        {
            switch (PopupNum)
            {
            case AddServerNum:
                QueueManager.AddCustomServer();
                QueueManager.RefreshRentedServers();
                RefreshButtons();
                break;
            default:
                break;
            }
        }
    }
    
    PopupNum = 0;
}

function CheckDescription(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject descObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_DESCRIPTION);

    if (Pages.FocusIndex > 0)
    {
        descObj = FillDescription(DataList);

        if (descObj != none)
        {
            obj.SetObject("data", descObj);

            if (DataList != none) DataList.SetElementObject(DataCount++, obj);
        }
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

defaultproperties
{
   AddServerNum=1
   PageLabel="MANAGE SERVERS"
   OptionTitles(0)="CREATE A SERVER"
   OptionSubtext(0)="SELECT TO ADD A NEW SERVER"
   Name="Default__GFxTrPage_ManageServers"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
