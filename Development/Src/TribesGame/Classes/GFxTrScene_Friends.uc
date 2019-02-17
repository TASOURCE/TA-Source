/**
 * GFxTrScene_Friends
 */

class GFxTrScene_Friends extends GFxTrScene;
    /*native;

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

var int       GFxCount;
var GFxObject GFxList;

var array<FriendStruct> m_FriendsList;
var array<FriendStruct> m_IgnoredList;

cpptext
{
    void PopulateFriendsList();
    void UpdateFriend(DWORD PlayerId, const FString& PlayerName, UBOOL bFriend, EOnlineState OnlineState);
    void UpdateFriendsList(DWORD dwPlayerId, INT MessageId, UBOOL bSuccess);
}

native function RequestFriendsList();
native function AddFriend(string PlayerName);
native function JoinFriend(string PlayerName);
native function IgnoreFriend(string PlayerName, bool bIgnore);
native function RemoveFriend(string PlayerName);

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();

    bSceneCreated = true;
}

event FriendsListUpdated()
{
    TrOuter.ASC_UpdateFriendsList();
}

function LoadFriendsList(GFxObject List)
{
    local int i;

    GFxList = List;
    GFxCount = 0;

    for (i = 0; i < m_FriendsList.Length; i++)
    {
        AddGFxFriend(m_FriendsList[i].PlayerName, m_FriendsList[i].OnlineState);
    }
}

function LoadIgnoredList(GFxObject List)
{
    local int i;

    GFxList = List;
    GFxCount = 0;

    for (i = 0; i < m_IgnoredList.Length; i++)
    {
        AddGFxFriend(m_IgnoredList[i].PlayerName, m_IgnoredList[i].OnlineState);
    }
}

function AddGFxFriend(string PlayerName, EOnlineState OnlineState)
{
    local GFxObject obj;

    obj = Outer.CreateObject("Object");
    obj.SetString("playerName", PlayerName);
    obj.SetFloat("bOnline", int(OnlineState));

    GFxList.SetElementObject(GFxCount++, obj);
}*/

defaultproperties
{
   Name="Default__GFxTrScene_Friends"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
