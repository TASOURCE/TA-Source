class GFxTrPage_Friends extends GFxTrPage;

var int  Criteria;
var int  FocusedIndex;
var int  PrevPlayerId;
var int  RemovingIndex;
var bool bWaitingForFriendAddPopup;
var bool bWaitingForFriendRemovePopup;
var localized string  SelectPromptLabel;
var localized string  AddFriendTitle;
var localized string  AddFriendSubtext;
var localized string  RemoveFriendTitle;
var localized string  FlyoutTitle;

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
    //bRemoveOption = false;
    Criteria = EOS_INGAME;

    PageLabelOverride = PageLabel@"("$SettingsManager.KeyBindings.m_FriendsHotkey$")";
    
    ClearActions();
    
    for (i = SortedFriends.Length; i > 0; i--)
    {
        SortedFriends.Remove(i-1, 1);
    }

    AddAction();

    if(Friends.FriendsList.Length > MAX_FRIENDS_DISPLAYED)
    {
        limitedCount = MAX_FRIENDS_DISPLAYED;
    }
    else
    {
        limitedCount = Friends.FriendsList.Length;
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
    local int adjustedIndex;

    adjustedIndex = Action.ActionIndex - 1;

    if (Action.ActionIndex == ScrollIndex)
    {
        bWaitingForFriendAddPopup = true;
        QueuePopup();
    }
    else if (SortedFriends[adjustedIndex].OnlineState == EOS_INGAME)
    {
        QueueManager.JoinFriend(SortedFriends[adjustedIndex].PlayerName, "");
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

    obj.SetString("actionLabel", FlyoutTitle); //Pick something for "other actions"
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
    Pages.FriendActionsPage.TargetPlayer = SortedFriends[ActionIndex - 1].PlayerName;
    Pages.FriendActionsPage.FillData(DataList);    
    return 1;
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
        if (ActionIndex == ScrollIndex)
        {
            TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_AddFriend);
        }
        else
        {
            TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_JoinGame);
        }
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
        obj.SetString("itemTitle", AddFriendTitle);
        obj.SetString("itemSubTitle", AddFriendSubtext);

        return obj;
    }
    
    //bRemoveOption = true;
    
    while (true)
    {
        index = FindNextFriend();

        if (index != INDEX_NONE)
        {
            break;
        }

        if (Criteria == EOS_INGAME)
        {
            PrevPlayerId = 0;
            Criteria = EOS_ONLINE;
        }
        else if (Criteria == EOS_ONLINE)
        {
            PrevPlayerId = 0;
            Criteria = EOS_OFFLINE;
        }
        else
        {
            obj.SetString("itemTitle", Strings.Error);
            obj.SetString("itemSubTitle", Strings.NoInfoFound);  break;
            return obj;
        }
    }

    SortedFriends.AddItem(Friends.FriendsList[index]);

    obj.SetString("itemTitle", Friends.FriendsList[index].PlayerName);

    switch (Criteria)
    {
    case EOS_INGAME:  obj.SetString("itemSubTitle", SelectPromptLabel); obj.SetString("itemRibbonLabel", InGameLabel); obj.SetFloat("ribbonType", 2); obj.SetFloat("hasRibbon", 1); break;
    case EOS_ONLINE:  obj.SetString("itemSubTitle", ""); obj.SetString("itemRibbonLabel", InLobbyLabel); obj.SetFloat("ribbonType", 1); obj.SetFloat("hasRibbon", 1); break;
    case EOS_OFFLINE:
    default:          obj.SetString("itemSubTitle", Strings.Offline);  obj.SetString("itemRibbonLabel", ""); obj.SetFloat("ribbonType", 0); obj.SetFloat("hasRibbon", 0); break;
    }
        
    return obj;
}

function int FindNextFriend()
{
    local int i;
    local bool bGetNextCriteria;

    ResetRunaway();

    if (PrevPlayerId == 0)
    {
        bGetNextCriteria = true;
    }
    
    for (i = 0; i < Friends.FriendsList.Length; i++)
    {
        if (bGetNextCriteria && Friends.FriendsList[i].OnlineState == Criteria)
        {
            PrevPlayerId = Friends.FriendsList[i].PlayerID;
            return i;
        }

        if (PrevPlayerId == Friends.FriendsList[i].PlayerID)
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
        Obj.SetString("popupTitle", AddFriendTitle);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);
    }
    else if (bWaitingForFriendRemovePopup)
    {
        Obj.SetString("popupTitle", RemoveFriendTitle);
        Obj.SetString("popupBody", RemoveFriendTitle@SortedFriends[RemovingIndex].PlayerName$"?");
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

        if (Action == 1) Friends.AddFriend(TextInput);

        RefreshButtons();
    }
    else if (bWaitingForFriendRemovePopup)
    {
        bWaitingForFriendRemovePopup = false;

        if (Action == 1)
        {
            Friends.RemoveFriend(SortedFriends[RemovingIndex].PlayerName);
        }
    }    
}

defaultproperties
{
   SelectPromptLabel="SELECT TO JOIN"
   AddFriendTitle="ADD FRIEND"
   AddFriendSubtext="SELECT TO ADD A FRIEND"
   RemoveFriendTitle="REMOVE FRIEND"
   FlyoutTitle="ACTIONS"
   PageLabel="FRIENDS"
   Name="Default__GFxTrPage_Friends"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
