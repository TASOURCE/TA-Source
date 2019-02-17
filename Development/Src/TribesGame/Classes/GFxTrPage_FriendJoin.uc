class GFxTrPage_FriendJoin extends GFxTrPage;

var int  Criteria;
var int  FocusedIndex;
var int  PrevPlayerId;
var int  SpecActionIndex;
var bool bWaitingForFriendAddPopup;
var bool bWaitingForMessagePopup;
var localized string  SelectPromptSubtext;
var localized string  SocialTitle;
var localized string  SocialSubtext;
var localized string  NotInAGameSubtext;

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

    ClearActions();
    
    for (i = SortedFriends.Length; i > 0; i--)
    {
        SortedFriends.Remove(i-1, 1);
    }

    AddActionPage(Pages.SocialPage);

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

    if (Action.ActionPage == Pages.SocialPage)
    {
        return;
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

    if (FocusedIndex == ScrollIndex || SortedFriends[FocusedIndex-1].OnlineState == EOS_OFFLINE)
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

    obj.SetString("actionLabel", Strings.Message);
    obj.SetFloat("bUpgradeType", 3);

    return obj;
}

function ModifyFocus(int ActionIndex)
{
    local TrEntryPlayerController TrEPC;
    
    TrEPC = TrEntryPlayerController(GetPC());
    
    if (TrEPC != none)
    {
        TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_RemoveFriend);
    }
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    SpecActionIndex = ActionIndex - 1;
    bWaitingForMessagePopup = true;
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
        obj.SetString("itemTitle", SocialTitle);
        obj.SetString("itemSubTitle", SocialSubtext);

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
    case EOS_INGAME:  obj.SetString("itemSubTitle", SelectPromptSubtext); obj.SetString("itemRibbonLabel", InGameLabel); obj.SetFloat("ribbonType", 2); obj.SetFloat("hasRibbon", 1); obj.SetFloat("bLocked",0); break;
    case EOS_ONLINE:  obj.SetString("itemSubTitle", NotInAGameSubtext); obj.SetString("itemRibbonLabel", InLobbyLabel); obj.SetFloat("ribbonType", 1); obj.SetFloat("hasRibbon", 1); obj.SetFloat("bLocked",1); break;
    case EOS_OFFLINE:
    default:          obj.SetString("itemSubTitle", Strings.Offline);  obj.SetString("itemRibbonLabel", ""); obj.SetFloat("ribbonType", 0); obj.SetFloat("hasRibbon", 0); obj.SetFloat("bLocked",1); break;
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
    if (bWaitingForMessagePopup)
    {
        Obj.SetString("popupTitle", "@"$SortedFriends[SpecActionIndex].PlayerName);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);
    }
}

function PopupComplete(int Action, string TextInput)
{
    local TrPlayerController TrPC;
    
    if (bWaitingForMessagePopup)
    {
        bWaitingForMessagePopup = false;

        if (Action == 1)
        {
            TrPC = TrPlayerController(GetPC());
            TrPC.SendPrivateChatMessage(SortedFriends[SpecActionIndex].PlayerName, TextInput);            
        }
    }    
}

defaultproperties
{
   SelectPromptSubtext="SELECT TO JOIN"
   SocialTitle="SOCIAL"
   SocialSubtext="ADD OTHER FRIENDS"
   NotInAGameSubtext="NOT IN A GAME"
   PageLabel="JOIN FRIEND'S GAME"
   Name="Default__GFxTrPage_FriendJoin"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
