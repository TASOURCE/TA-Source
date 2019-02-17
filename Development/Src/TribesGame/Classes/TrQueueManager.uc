class TrQueueManager extends Object within GFxTrMenuMoviePlayer
    native;

var int    QueueId;
var int    MapSlots[8];
var int    GameTypeId;
var int    ProfileIndex;
var int    ServerIndex;
var int    PasswordIndex;
var int    PasswordQueue;
var array<int> RegionFilter;
var bool   bQueued;
var bool   bNeedPassword;
var bool   bJoiningCustom;
var bool   bFilterOwner;
var string QueueFriend;
var OnlineGameInterfaceMcts OnlineGameMcts;
var GFxTrMenuMoviePlayer TrOuter;

var bool bMapSort;
var bool bNameSort;
var bool bPingSort;
var bool bTypeSort;
var bool bRulesSort;
var bool bRangeSort;
var bool bSlotsSort;
var bool bPasswordSort;
var bool bFavoriteSort;

struct native ServerInfo
{
    var int         Ping;
    var int         QueueId;
    var int         MinLevel;
    var int         MaxLevel;
    var int         PlayerMax;
    var int         PlayerCount;
    var bool        bPrivate;
    var bool        bFavorite;
    var int         GameType;
    var init string ServerName;
    var init string ServerDesc;
    var init string MapName;
    var init string Ruleset;
};

var array<ServerInfo> ServerInfoList;

struct native ProfileConfig
{
    var int         Slots;
    var int         GameCaseId;
    var int         QueueCaseId;
    var init string ProfileName;
    var init string ProfileDesc;
    var init string PasswordAdmin;
    var init string PasswordPublic;
};

struct native ServerConfig
{
    var int    ActiveConfig;
    var int    MatchQueueId;
    var int    MinutesRented;
    var bool   bOpen;
    var bool   bOwner;
    var bool   bActive;
    var bool   bCanExpire;
    var string ServerName;
    var array<ProfileConfig> Profiles;
};

var array<ServerConfig> RentedServers;

struct native RentalItem
{
    var int         Price;
    var int         LootId;
    var int         SortOrder;
    var init string RentalName;
};

var array<RentalItem> RentalItems;
var array<PropertyPair> FilteredGameTypes;

native function ForceGoHome();
native function OpenLocal(string URL);
native function GetCustomServers();
native function RequestCustomServers();
native function RefreshRentedServers();

native function string GetMapName(int MapId);
native function bool   GetNextMapId(bool bStart, out int MapId);
native function int    GetPropNumber(int PropId, int PropType);
native function string GetPropString(int PropId, int PropType);
native function bool   SetPropNumber(int PropId, int Val, int PropType);
native function bool   SetPropString(int PropId, string Val, int PropType);
native function bool   SetLocalName(string Val);
native function bool   AddCustomServer();
native function bool   AddCustomServerTime(int LootId);

native function bool   GetPropMin(int PropId, int PropType, out int Val);
native function bool   GetPropMax(int PropId, int PropType, out int Val);

native function bool   CustomLogin(string Password);
native function bool   CustomStart();
native function bool   CustomStop();
native function bool   CustomShutdown();
native function bool   CustomNextMap(int MapId);
native function bool   CustomKick(string PlayerName);
native function bool   CustomBan(string PlayerName);
native function bool   CustomSetName(string QueueName);

native function bool   MatchQueueJoin(int Queue, string Password);

function Initialize()
{
    local PropertyPair pair;

    OnlineGameMcts = OnlineGameInterfaceMcts(Outer.OnlineSub.GameInterface);
    TrOuter = Outer;
    
    if (FilteredGameTypes.Length == 0)
    {
        pair.Value = 0;
        pair.PropertyId = SERVER_GAMECLASSID_CTF;
        FilteredGameTypes.AddItem(pair);
        pair.PropertyId = SERVER_GAMECLASSID_BTZ;
        FilteredGameTypes.AddItem(pair);
        pair.PropertyId = SERVER_GAMECLASSID_RAB;
        FilteredGameTypes.AddItem(pair);
        pair.PropertyId = SERVER_GAMECLASSID_TDM;
        FilteredGameTypes.AddItem(pair);
        pair.PropertyId = SERVER_GAMECLASSID_ARN;
        FilteredGameTypes.AddItem(pair);
        pair.PropertyId = SERVER_GAMECLASSID_CAH;
        FilteredGameTypes.AddItem(pair);
    }
}

function LeaveMatchmaking(optional bool bForced = false)
{
    TrPlayerController(GetPC()).QueueTimer(false);

    if (bInGame)
    {
        bQueued = false;
        ExitGameInProgress();
        return;
    }

    MenuSounds.LeaveQueue();

    if (bQueued && !bJoiningCustom)
    {
        UpdateStatus("EXITED QUEUE");
    }

    if (!bForced && PartyManager.InParty() && !PartyManager.AmLeader())
    {
        PartyManager.LeaveParty();

        if (Pages.GetActivePage() == Pages.PartyPage ||
            Pages.GetActivePage() == Pages.PartyInvitePage ||
            Pages.GetActivePage() == Pages.PartyMemberPage)
        {
            Pages.TravelToMain();
        }
    }

    QueueId = 0;
    QueueFriend = "";
    bEndOfMatch=false;
    bQueued = false;
    SendProfileData();

    OnlineGameMcts.MatchQueueLeave();

    if (!bJoiningCustom) ForceGoHome();
}

function JoinQueue(int nQueueId)
{
    Outer.MenuSounds.SoundSelectedQueue();

    if (bQueued && QueueId == nQueueId)
    {
        return;
    }
    else if (!MatchQueueJoin(nQueueId, ""))
    {
        ;
        OnlineGameMcts.MatchQueueLeave();
    }
    else
    {
        QueueId = nQueueId;
        // Wait for mcts callback
    }
}

event SetPlayerQueued()
{
    if (bQueued) return;

    if (!bJoiningCustom)
    {
        bQueued = true;
        Pages.CustomMatchPage.bWaitingForJoinPopup = false;
        ClosePopup();
        UpdateStatus("QUEUE JOINED");
        SendProfileData();

        TrPlayerController(GetPC()).QueueTimer(true);
        TrPlayerController(GetPC()).StartSendMenuBackTimer();
    }
}

function string GetStatus()
{
    if (bEndOfMatch)
    {
        if (EndOfMatchTimer > 0)
        {
            return "NEXT MATCH IN"@EndOfMatchTimer;
        }
        
        return "WAITING FOR NEXT MATCH";
    }
    else if (bInGame)
    {
        return "IN GAME";
    }

    switch (QueueId)
    {
    case 426:  return "QUEUED FOR CAPTURE THE FLAG";
    case 425:  return "QUEUED FOR TEAM DEATHMATCH";
    case 427:  return "QUEUED FOR CAPTURE AND HOLD";
    case 428:  return "QUEUED FOR RABBIT";
    case 444:  return "QUEUED FOR ARENA";
    case 1000: return "QUEUED WITH '"$QueueFriend$"'";
    case 0:  if (PartyManager.InParty()) { return "QUEUED WITH PARTY"; }
        break;
    default: return "IN QUEUE";
    }

    return "IN LOBBY";
}

function JoinFriend(string PlayerName, optional string Password = "")
{
    if (bInGame)
    {
        UpdateStatus("MUST LEAVE CURRENT MATCH FIRST");
        return;
    }
    
    if (bQueued)
    {
        UpdateStatus("MUST LEAVE CURRENT QUEUE FIRST");
        return;
    }

    if (Friends.JoinFriend(PlayerName, Password))
    {
        QueueId = 1000;
        QueueFriend = PlayerName;

        // Wait for callback
    }
    else
    {
        bQueued = false;
        QueueId = 0;
        QueueFriend = "";
        UpdateStatus("COULD NOT JOIN PLAYER");
    }
}

event ExitGameInProgress(optional bool bForceDrop = false, optional bool bKicked = false)
{
    local UTPlayerController PC;

    if (bForceDrop || bInGame)
    {
        PC = UTPlayerController(GetPC());

        if (PC != none)
        {
            PC.ClientSetHUD(none);
            PC.QuitToMainMenu();
        }
        
        PartyManager.LeaveParty();
        
        ShowMovie();        
        bWaitingForEntry = true;
        
        if (bKicked)
        {
            SetPlayerInLogin(true);
            ForceGoHome();
            bWaitingForAFKKickPopup = true;
            QueuePopup();
        }
        else if (bForceDrop)
        {
            SetPlayerInLogin(true);
        }
        
        bInGame = false;
        LeaveMatchmaking();
    }
}

event ServerInfoLoaded()
{
    if (Pages.GetActivePage() == Pages.CustomMatchPage && 
        Pages.CustomMatchPage.bRefresh)
    {
        bRefreshingMenu = true;
        StartMainMenu();
    }
}

function JoinCustomServer(int Index)
{
    if (Index < ServerInfoList.Length)
    {
        if (ServerInfoList[Index].bPrivate)
        {
            PasswordIndex = Index;
            bNeedPassword = true;
            PasswordServer(Index);
        }
        else 
        {
            PasswordIndex = 0;
            bNeedPassword = false;
            bJoiningCustom = true;
            Pages.CustomMatchPage.WaitPopup(ServerInfoList[Index].ServerName);
            JoinQueue(ServerInfoList[Index].QueueId);
        }
    }
}

function JoinProtectedServer(string Password)
{
    if (PasswordIndex < ServerInfoList.Length)
    {
        bNeedPassword = false;
        bJoiningCustom = true;
        Pages.CustomMatchPage.WaitPopup(ServerInfoList[PasswordIndex].ServerName);
        MatchQueueJoin(ServerInfoList[PasswordIndex].QueueId, Password);
    }
}

function FavoriteServer(int Index)
{
    if (Index < ServerInfoList.Length)
    {
        User.SetFavoriteServer(ServerInfoList[Index].QueueId);
    }
}

function PasswordServer(int Index)
{
    if (Index < ServerInfoList.Length)
    {
        bPasswordPopup = true;
        PasswordQueue = ServerInfoList[Index].QueueId;
        QueuePopup();
    }
}

function SetActiveServer(int Index)
{
    ServerIndex = Index;
    PasswordQueue = RentedServers[Index].MatchQueueId;
    CustomLogin("admin");
}

function ServerPage(int Index)
{
    if (Index == 0)
    {
        Pages.ActionUp();
    }
    else
    {
        Pages.ActionDown();
    }
}

function ServerSort(string SortName)
{
    if (Pages.GetActivePage() == Pages.CustomMatchPage)
    {
        SortOn(SortName);
        bRefreshingMenu = true;
        Pages.CustomMatchPage.ServerIndex = 0;
        StartMainMenu();
    }
}

function SortOn(string SortName)
{
    switch (SortName)
    {
    case "map":        if (bMapSort)      ServerInfoList.Sort(MapSortA);      else ServerInfoList.Sort(MapSortB);      bMapSort = !bMapSort;           break;
    case "servername": if (bNameSort)     ServerInfoList.Sort(NameSortA);     else ServerInfoList.Sort(NameSortB);     bNameSort = !bNameSort;         break;
    case "ping":       if (bPingSort)     ServerInfoList.Sort(PingSortA);     else ServerInfoList.Sort(PingSortB);     bPingSort = !bPingSort;         break;
    case "type":       if (bTypeSort)     ServerInfoList.Sort(TypeSortB);     else ServerInfoList.Sort(TypeSortA);     bTypeSort = !bTypeSort;         break;
    case "rules":      if (bRulesSort)    ServerInfoList.Sort(RulesSortA);    else ServerInfoList.Sort(RulesSortB);    bRulesSort = !bRulesSort;       break;
    case "range":      if (bRangeSort)    ServerInfoList.Sort(RangeSortA);    else ServerInfoList.Sort(RangeSortB);    bRangeSort = !bRangeSort;       break;
    case "slots":      if (bSlotsSort)    ServerInfoList.Sort(SlotsSortA);    else ServerInfoList.Sort(SlotsSortB);    bSlotsSort = !bSlotsSort;       break;
    case "password":   if (bPasswordSort) ServerInfoList.Sort(PasswordSortB); else ServerInfoList.Sort(PasswordSortA); bPasswordSort = !bPasswordSort; break;
    case "favorites":  if (bFavoriteSort) ServerInfoList.Sort(FavoriteSortB); else ServerInfoList.Sort(FavoriteSortA); bFavoriteSort = !bFavoriteSort; break;
    default:
        break;
    }
}

delegate int MapSortA(ServerInfo A, ServerInfo B)      { return A.MapName < B.MapName ? -1 : 0; }
delegate int NameSortA(ServerInfo A, ServerInfo B)     { return A.ServerName < B.ServerName ? -1 : 0; }
delegate int PingSortA(ServerInfo A, ServerInfo B)     { return A.Ping < B.Ping ? -1 : 0; }
delegate int TypeSortA(ServerInfo A, ServerInfo B)     { return A.GameType < B.GameType ? -1 : 0; }
delegate int RulesSortA(ServerInfo A, ServerInfo B)    { return A.Ruleset < B.Ruleset ? -1 : 0; }
delegate int RangeSortA(ServerInfo A, ServerInfo B)    { return A.MinLevel < B.MinLevel ? -1 : 0; }
delegate int SlotsSortA(ServerInfo A, ServerInfo B)    { return (A.PlayerCount) < (B.PlayerCount) ? -1 : 0; }
delegate int PasswordSortA(ServerInfo A, ServerInfo B) { return int(A.bPrivate) < int(B.bPrivate) ? -1 : 0; }
delegate int FavoriteSortA(ServerInfo A, ServerInfo B) { return int(A.bFavorite) < int(B.bFavorite) ? -1 : 0; }
delegate int MapSortB(ServerInfo A, ServerInfo B)      { return B.MapName < A.MapName ? -1 : 0; }
delegate int NameSortB(ServerInfo A, ServerInfo B)     { return B.ServerName < A.ServerName ? -1 : 0; }
delegate int PingSortB(ServerInfo A, ServerInfo B)     { return B.Ping < A.Ping ? -1 : 0; }
delegate int TypeSortB(ServerInfo A, ServerInfo B)     { return B.GameType < A.GameType ? -1 : 0; }
delegate int RulesSortB(ServerInfo A, ServerInfo B)    { return B.Ruleset < A.Ruleset ? -1 : 0; }
delegate int RangeSortB(ServerInfo A, ServerInfo B)    { return B.MinLevel < A.MinLevel ? -1 : 0; }
delegate int SlotsSortB(ServerInfo A, ServerInfo B)    { return (B.PlayerCount) < (A.PlayerCount) ? -1 : 0; }
delegate int PasswordSortB(ServerInfo A, ServerInfo B) { return int(B.bPrivate) < int(A.bPrivate) ? -1 : 0; }
delegate int FavoriteSortB(ServerInfo A, ServerInfo B) { return int(B.bFavorite) < int(A.bFavorite) ? -1 : 0; }

function int    GetSlots()           { return RentedServers[ServerIndex].Profiles[ProfileIndex].Slots; }
function int    GetGameCaseId()      { return RentedServers[ServerIndex].Profiles[ProfileIndex].GameCaseId; }
function int    GetQueueCaseId()     { return RentedServers[ServerIndex].Profiles[ProfileIndex].QueueCaseId; }
function string GetProfileName()     { return RentedServers[ServerIndex].Profiles[ProfileIndex].ProfileName; }
function string GetProfileDesc()     { return RentedServers[ServerIndex].Profiles[ProfileIndex].ProfileDesc; }
function string GetAdminPassword()   { return RentedServers[ServerIndex].Profiles[ProfileIndex].PasswordAdmin; }
function string GetPublicPassword()  { return RentedServers[ServerIndex].Profiles[ProfileIndex].PasswordPublic; }
function int    GetProfileGameType() { return GetPropNumber(GAME_CONFIG_GAMETYPE, SPT_QUEUE); }
function int    GetProfileRotation() { return GetPropNumber(QUEUE_CONFIG_MAPROTATIONTYPE, SPT_QUEUE); }
function int    GetProfileRegion()   { return GetPropNumber(QUEUE_CONFIG_SITEID, SPT_QUEUE); }

function string GetServerName(int Index)   { return RentedServers[Index].ServerName; }
function bool   GetServerOnline(int Index) { return RentedServers[Index].bOpen; }
function bool   GetServerExpired()         { return (RentedServers[ServerIndex].MinutesRented == 0 && RentedServers[ServerIndex].bCanExpire); }
function bool   AmServerOwner()            { return RentedServers[ServerIndex].bOwner; }
function int    GetServerTime()            { return RentedServers[ServerIndex].MinutesRented; }

function string GetServerTimeFormat()
{
    local int days;
    local int mins;
    local int hours;
    local string dayStr;
    local string minStr;
    local string hourStr;

    mins = RentedServers[ServerIndex].MinutesRented;
    
    days = mins / 1440;
    mins -= 1440 * days;
    hours = mins / 60;
    mins -= 60 * hours;

    if (mins == 0)
    {
        if (GetServerExpired())
        {
            return "EXPIRED";
        }

        return "ACTIVE";
    }
    
    if (days == 1)
    {
        dayStr = days@"DAY";
    }
    else if (days > 0)
    {
        dayStr = days@"DAYS";
    }
    
    if (hours == 1)
    {
        hourStr = hours@"HOUR";
    }
    else if (hours > 0)
    {
        hourStr = hours@"HOURS";
    }
    
    if (mins == 1)
    {
        minStr = mins@"MIN";
    }
    else if (mins > 0)
    {
        minStr = mins@"MINS";
    }

    if (dayStr != "")
    {
        return dayStr$","@hourStr;
    }
    
    return hourStr$","@minStr;
}


function string GetServerGameTypeName(optional int Index = -1)
{
    local int gameClassId;

    if (Index < 0)
    {
        gameClassId = GetProfileGameType();
    }
    else
    {
        gameClassId = ServerInfoList[Index].GameType;
    }

    switch (gameClassId)
    {
    case SERVER_GAMECLASSID_CTF: return "CTF";
    case SERVER_GAMECLASSID_BTZ: return "BLITZ";
    case SERVER_GAMECLASSID_RAB: return "RABBIT";
    case SERVER_GAMECLASSID_TDM: return "TDM";
    case SERVER_GAMECLASSID_ARN: return "ARENA";
    case SERVER_GAMECLASSID_CAH: return "C AND H";
    }

    return "";
}

function string GetServerRotationName()
{
    switch (GetPropNumber(QUEUE_CONFIG_MAPROTATIONTYPE, SPT_QUEUE))
    {
    case SERVER_RT_METHOD_RANDOM:  return "RANDOM";
    case SERVER_RT_METHOD_LINEAR:  return "SINGLE";
    case SERVER_RT_METHOD_LINEAR2: return "DOUBLE";
    case SERVER_RT_METHOD_LINEAR4: return "QUAD";
    }

    return "UNKNOWN";
}

event AddServerConfig(int MatchQueueId)
{
    local ServerConfig data;

    data.MatchQueueId = MatchQueueId;
    RentedServers.AddItem(data);
}

event AddProfileConfig(int Index, ProfileConfig Data)
{
    RentedServers[Index].Profiles.AddItem(Data);
}

function ResetRotation()
{
    local int i;

    for (i = 0; i < 8; i++)
    {
        SetPropNumber(MapSlots[i], 0, SPT_QUEUE);
    }

    SetPropNumber(QUEUE_CONFIG_MAPSLOT1, GetDefaultMapId(), SPT_QUEUE);
}

function int GetDefaultMapId()
{
    switch (GetProfileGameType())
    {
    case SERVER_GAMECLASSID_CTF: return SERVER_DEFAULT_MAP_CTF;
    case SERVER_GAMECLASSID_BTZ: return SERVER_DEFAULT_MAP_BTZ;
    case SERVER_GAMECLASSID_RAB: return SERVER_DEFAULT_MAP_RAB;
    case SERVER_GAMECLASSID_TDM: return SERVER_DEFAULT_MAP_TDM;
    case SERVER_GAMECLASSID_ARN: return SERVER_DEFAULT_MAP_ARN;
    case SERVER_GAMECLASSID_CAH: return SERVER_DEFAULT_MAP_CAH;
    }

    return 0;
}

event MarkFavorite(int Index)
{
     ServerInfoList[Index].bFavorite = User.IsFavoriteServer(QueueManager.ServerInfoList[Index].QueueId);
}

function FilterGameType(int Id, bool bFilter)
{
    local int i;

    for (i = 0; i < FilteredGameTypes.Length; i++)
    {
        if (FilteredGameTypes[i].PropertyId == Id)
        {
            FilteredGameTypes[i].Value = bFilter ? 1 : 0;
            break;
        }
    }
}

function bool IsGameTypeFiltered(int Id)
{
    local int i;

    for (i = 0; i < FilteredGameTypes.Length; i++)
    {
        if (FilteredGameTypes[i].PropertyId == Id)
        {
            return FilteredGameTypes[i].Value == 1 ? true : false;
        }
    }

    return false;
}

defaultproperties
{
   MapSlots(0)=1257
   MapSlots(1)=1258
   MapSlots(2)=1259
   MapSlots(3)=1260
   MapSlots(4)=1261
   MapSlots(5)=1262
   MapSlots(6)=1263
   MapSlots(7)=1264
   Name="Default__TrQueueManager"
   ObjectArchetype=Object'Core.Default__Object'
}
