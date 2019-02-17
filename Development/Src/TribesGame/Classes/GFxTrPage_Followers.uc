class GFxTrPage_Followers extends GFxTrPage;

var int  Criteria;
var int  FocusedIndex;
var int  PrevPlayerId;
var int  RemovingIndex;
var localized string SelectPromptLabel;
var localized string MutalFriendLabel;

var array<FriendStruct> SortedFriends;

function Initialize()
{
    super.Initialize();
}

function FillData(GFxObject DataList)
{
    local int i;
    local int count;
    local int limitedCount;

    PrevPlayerId = 0;
    //bRemoveOption = false;
    Criteria = EOS_INGAME;

    count = Friends.FollowersList.Length;//GetOnlineFollowerCount();

    if(count > 1)
    {
        PageLabelOverride = count@PageLabel;
    }
    else if (count == 1)
    {
        PageLabelOverride = count@FollowerLabel;
    }
    else
    {
        PageLabelOverride = "";
    }
    
    ClearActions();
    
    for (i = SortedFriends.Length; i > 0; i--)
    {
        SortedFriends.Remove(i-1, 1);
    }

    if(count > MAX_FRIENDS_DISPLAYED)
    {
        limitedCount = MAX_FRIENDS_DISPLAYED;
    }
    else
    {
        limitedCount = count;
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

    adjustedIndex = Action.ActionIndex;        
    if (SortedFriends[adjustedIndex].OnlineState == EOS_INGAME)
    {
        QueueManager.JoinFriend(SortedFriends[adjustedIndex].PlayerName, "");
    }
}

function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;
   
    if(Friends.FollowersList.Length == 0)
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

    obj.SetString("actionLabel", Pages.FriendsPage.FlyoutTitle);
    obj.SetFloat("bUpgradeType", 3);

    return obj;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    Pages.FollowerActionsPage.TargetPlayer = SortedFriends[ActionIndex].PlayerName;
    Pages.FollowerActionsPage.FillData(DataList);    
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
       TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_JoinGame);               
    }
   
    FocusedIndex = ActionIndex;
    CheckPricing(DataList);

    return 0;
}

function GFxObject FillOption(int ActionIndex)
{
    local int index;
    local GFxObject obj;
    local string friendstr;
    local bool  isFriend;
    
    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    while (true)
    {
        index = FindNextFollower();

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

    SortedFriends.AddItem(Friends.FollowersList[index]);

    obj.SetString("itemTitle", Friends.FollowersList[index].PlayerName);

    isFriend = Friends.IsFriend(Friends.FollowersList[index].PlayerName);

    if(Criteria == EOS_INGAME)
    {
        friendstr = SelectPromptLabel;
        if(isFriend)
        {
            friendstr @= FriendLabel;
        }        
    }
    else
    {
        friendstr = isFriend ? MutalFriendLabel : FollowerLabel;
        if(Criteria == EOS_OFFLINE)
        {
            friendstr @= OfflineLabel;
        }
    }
    

    switch (Criteria)
    {
    case EOS_INGAME:  obj.SetString("itemSubTitle", friendstr); obj.SetString("itemRibbonLabel", InGameLabel); obj.SetFloat("ribbonType", 2); obj.SetFloat("hasRibbon", 1); break;
    case EOS_ONLINE:  obj.SetString("itemSubTitle", friendstr); obj.SetString("itemRibbonLabel", InLobbyLabel); obj.SetFloat("ribbonType", 1); obj.SetFloat("hasRibbon", 1); break;
    case EOS_OFFLINE:
    default:          obj.SetString("itemSubTitle", friendstr); obj.SetString("itemRibbonLabel", ""); obj.SetFloat("ribbonType", 0); obj.SetFloat("hasRibbon", 0); break;
    }
        
    return obj;
}

function int FindNextFollower()
{
    local int i;
    local bool bGetNextCriteria;
    
    ResetRunaway();

    if (PrevPlayerId == 0)
    {
        bGetNextCriteria = true;
    }
    
    for (i = 0; i < Friends.FollowersList.Length; i++)
    {
        ResetRunaway();
        if (bGetNextCriteria && Friends.FollowersList[i].OnlineState == Criteria)
        {
            PrevPlayerId = Friends.FollowersList[i].PlayerID;
            return i;
        }

        if (PrevPlayerId == Friends.FollowersList[i].PlayerID)
        {
            bGetNextCriteria = true;
            continue;
        }
    }

    return INDEX_NONE;
}

defaultproperties
{
   SelectPromptLabel="SELECT TO JOIN"
   MutalFriendLabel="MUTUAL FRIEND"
   PageLabel="FOLLOWERS"
   Name="Default__GFxTrPage_Followers"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
