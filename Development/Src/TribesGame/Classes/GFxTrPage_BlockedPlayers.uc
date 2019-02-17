class GFxTrPage_BlockedPlayers extends GFxTrPage;

var int  FocusedIndex;
var int  PrevPlayerId;
var int  RemovingIndex;
var bool bWaitingForFriendAddPopup;
var bool bWaitingForFriendRemovePopup;
var localized string BlockOption;
var localized string BlockSubtext;
var localized string BlockedStatus;
var localized string UnblockOption;
var localized string FlyoutTitle;

var array<FriendStruct> SortedFriends;

function Initialize()
{
    super.Initialize();
}

function FillData(GFxObject DataList)
{
    local int i;
    local int limitedCount;

    PrevPlayerId = 0;
    
    ClearActions();

    for (i = SortedFriends.Length; i > 0; i--)
    {
        SortedFriends.Remove(i-1, 1);
    }
    
    AddAction();

    if(Friends.IgnoredList.Length > MAX_FRIENDS_DISPLAYED)
    {
        limitedCount = MAX_FRIENDS_DISPLAYED;
    }
    else
    {
        limitedCount = Friends.IgnoredList.Length;
    }


    for (i = 0; (i < limitedCount); i++)
    {
        AddAction();
        ResetRunaway();
    }

    if (DataList != none)
    {
        super.FillData(DataList);
    }
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionIndex == ScrollIndex)
    {
        bWaitingForFriendAddPopup = true;
        QueuePopup();
    }    
}

function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;

    if (FocusedIndex == ScrollIndex)
    {
        return false;
    }

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_PRICE);

    priceObj = FillPricing(DataList);

    if (priceObj != none)
    {
        obj.SetObject("data", priceObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }

    return true;
}

function GFxObject FillPricing(GFxObject DataList)
{
    local GFxObject obj;

    obj = CreateObject("Object");

    obj.SetString("actionLabel", FlyoutTitle);
    obj.SetFloat("bUpgradeType", 3);

    return obj;
}

function ModifyFocus(int ActionIndex)
{
    local TrEntryPlayerController TrEPC;
    
    TrEPC = TrEntryPlayerController(GetPC());
    
    if (TrEPC != none)
    {
        TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_AddFriend);
    }
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    RemovingIndex = ActionIndex - 1;
    bWaitingForFriendRemovePopup = true;
    QueuePopup();

    return 0;
}

function RefreshButtons()
{
    FillData(none);

    super.RefreshButtons();
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    local TrEntryPlayerController TrEPC;

    super.TakeFocus(ActionIndex, DataList);
    
    TrEPC = TrEntryPlayerController(GetPC());
    
    if (TrEPC != none)
    {
        TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_RemoveFriend);

        /*case 1: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_AddFriend); break;
        case 2: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_RemoveFriend); break;
        //case 3: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_RemoveFriend); break;
        default: break;
        }*/
    }
   
    FocusedIndex = ActionIndex;
    CheckPricing(DataList);

    return 0;
}

function GFxObject FillOption(int ActionIndex)
{
    local int index;
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    if (ActionIndex == ScrollIndex)
    {
        obj.SetString("itemTitle", BlockOption);
        obj.SetString("itemSubTitle", BlockSubtext);

        return obj;
    }
    
    while (true)
    {
        index = FindNextBlocked();

        if (index != INDEX_NONE)
        {
            break;
        }    
    }

    SortedFriends.AddItem(Friends.IgnoredList[index]);

    obj.SetFloat("bLocked", 1);
    obj.SetString("itemTitle", Friends.IgnoredList[index].PlayerName);
    obj.SetString("itemSubTitle", BlockedStatus);  obj.SetString("itemRibbonLabel", ""); obj.SetFloat("ribbonType", 0); obj.SetFloat("hasRibbon", 0);
            
    return obj;
}

function int FindNextBlocked()
{
    local int i;
    local bool bGetNextCriteria;

    ResetRunaway();

    if (PrevPlayerId == 0)
    {
        bGetNextCriteria = true;
    }
    
    for (i = 0; i < Friends.IgnoredList.Length; i++)
    {
        if (bGetNextCriteria)// && Friends.IgnoredList[i].OnlineState == Criteria)
        {
            PrevPlayerId = Friends.IgnoredList[i].PlayerID;
            return i;
        }

        if (PrevPlayerId == Friends.IgnoredList[i].PlayerID)
        {
            bGetNextCriteria = true;
            continue;
        }
    }

    return INDEX_NONE;
}

function PopupData(GFxObject Obj)
{
    if (bWaitingForFriendAddPopup)
    {
        Obj.SetString("popupTitle", BlockOption);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);
    }
    else if (bWaitingForFriendRemovePopup)
    {
        Obj.SetString("popupTitle", UnblockOption);
        Obj.SetString("popupBody", UnblockOption@"'"$SortedFriends[RemovingIndex].PlayerName$"'?");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 0);
        Obj.SetFloat("enterKeyIndex", 1);
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (bWaitingForFriendAddPopup)
    {
        bWaitingForFriendAddPopup = false;

        if (Action == 1) Friends.IgnoreFriend(TextInput,true);

        RefreshButtons();
    }
    else if (bWaitingForFriendRemovePopup)
    {
        bWaitingForFriendRemovePopup = false;

        if (Action == 1)
        {
            Friends.IgnoreFriend(SortedFriends[RemovingIndex].PlayerName,false);
        }
    }
}

defaultproperties
{
   BlockOption="BLOCK PLAYER"
   BlockSubtext="SELECT TO BLOCK A PLAYER"
   BlockedStatus="BLOCKED"
   UnblockOption="UNBLOCK PLAYER"
   FlyoutTitle="UNBLOCK"
   PageLabel="BLOCKED PLAYERS"
   Name="Default__GFxTrPage_BlockedPlayers"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
