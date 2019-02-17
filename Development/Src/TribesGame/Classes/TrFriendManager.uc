class TrFriendManager extends TrObject within GFxTrMenuMoviePlayer
    native;

enum EOnlineState
{
    EOS_OFFLINE,
    EOS_ONLINE,
    EOS_INGAME
};

struct native FriendStruct
{
    var int          PlayerID;
    var init string  PlayerName;
    var EOnlineState OnlineState;
};

var int    PrevFriendCount;
var int    PrevFollowerCount;
var int    PrevBlockedCount;
var bool   AddFriendSuccess;
var string RecentlyAddedFriend;

var int       GFxCount;
var GFxObject GFxList;

var array<FriendStruct> FriendsList;
var array<FriendStruct> FollowersList;
var array<FriendStruct> IgnoredList;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function RequestFriendsList();
native function AddFriend(string PlayerName);
native function bool JoinFriend(string PlayerName, string Password);
native function IgnoreFriend(string PlayerName, bool bIgnore);
native function RemoveFriend(string PlayerName);

event Update()
{
    local GFxTrPage activePage;

    activePage = Pages.GetActivePage();

    if ((activePage == Pages.FriendsPage && PrevFriendCount != FriendsList.Length) 
      ||(activePage == Pages.FollowersPage && PrevFollowerCount != FollowersList.Length)
      ||(activePage == Pages.BlockedPlayersPage && PrevBlockedCount != IgnoredList.Length))
    {
         bOpeningMenu = true;
         StartMainMenu();     
    }
    else
    {
        activePage.RefreshButtons();
    }

    PrevFriendCount = FriendsList.Length;
    PrevFollowerCount = FollowersList.Length;
    PrevBlockedCount = IgnoredList.Length;
}

function RemoveFromList(string PlayerName)
{
    local int i;

    for (i = 0; i < FriendsList.Length; i++)
    {
        if (FriendsList[i].PlayerName == PlayerName)
        {
            FriendsList.Remove(i, 1);
        }
    }
}

function int GetOnlineFriendCount()
{
    local int i;
    local int count;

    for (i = 0; i < FriendsList.Length; i++)
    {
        if (FriendsList[i].OnlineState == EOS_ONLINE || FriendsList[i].OnlineState == EOS_INGAME)
        {
            count++;
        }
    }

    return count;
}

function int GetInGameFriendCount()
{
    local int i;
    local int count;

    for (i = 0; i < FriendsList.Length; i++)
    {
        if (FriendsList[i].OnlineState == EOS_INGAME)
        {
            count++;
        }
    }

    return count;
}


function int GetOnlineFollowerCount()
{
    local int i;
    local int count;

    for (i = 0; i < FollowersList.Length; i++)
    {
        if (FollowersList[i].OnlineState == EOS_ONLINE || FollowersList[i].OnlineState == EOS_INGAME)
        {
            count++;
        }
    }

    return count;
}


function bool IsFriend(string PlayerName)
{
    local int i;

    PlayerName = StripTag(PlayerName);

    for (i = 0; i < FriendsList.Length; i++)
    {
        if (FriendsList[i].PlayerName == PlayerName) return true;
    }

    return false;
}

function int GetFriendListIndex(string PlayerName)
{
    local int i;

    for (i = 0; i < FriendsList.Length; i++)
    {
        if (FriendsList[i].PlayerName == PlayerName) return i;
    }

    return -1;
}

function AddFriendScoreboard(string PlayerName)
{
    PlayerName = StripTag(PlayerName);

    RecentlyAddedFriend = PlayerName;

    if (!IsFriend(PlayerName))
    {
        AddFriend(PlayerName);
        AddFriendSuccess = true;
    }
    else
    {
        AddFriendSuccess = false;
    }

    bWaitingForAddFriendPopup = true;
    QueuePopup();
}

defaultproperties
{
   Name="Default__TrFriendManager"
   ObjectArchetype=TrObject'TribesGame.Default__TrObject'
}
