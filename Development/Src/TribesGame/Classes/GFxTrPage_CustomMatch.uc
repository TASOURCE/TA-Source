class GFxTrPage_CustomMatch extends GFxTrPage;

var int    RefreshNum;
var int    FilterRegionNum;
var int    FilterMapNameNum;
var int    FilterEmptyNum;
var int    FilterFullNum;
var int    FilterOwnerNum;
var int    FilterServerNameNum;

var string MapNameFilter;
var string ServerNameFilter;
var bool   bFilterFull;
var bool   bFilterEmpty;

var int    ServerIndex;
var int    PopupNumber;
var bool   bRefresh;
var bool   bFilterPopup;
var bool   bWaitingForJoinPopup;
var string QueueJoinName;

var int    SERVERS_PER_PAGE;

function Initialize()
{
    AddActionNumber(RefreshNum);
    AddActionPage(Pages.RegionSettingsPage);
    AddActionPage(Pages.GameTypeFilterPage);
    AddActionNumber(FilterMapNameNum);
    AddActionNumber(FilterServerNameNum);
    AddActionNumber(FilterOwnerNum);
    AddActionNumber(FilterEmptyNum);
    AddActionNumber(FilterFullNum);
    AddActionPage(Pages.ManageServersPage);
}

function FillData(GFxObject DataList)
{
    local GFxObject obj;
    
    ScrollIndex = 0;
    DataCount   = 0;

    if (QueueManager.RegionFilter.Length == 0)
    {
        QueueManager.RegionFilter.AddItem(SettingsManager.RegionSettings.GetPreferredSiteId());
    }
    
    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_SERVERBROWSER);
    obj.SetObject("data", FillServerBrowser());

    super.FillData(DataList);

    DataList.SetElementObject(DataCount++, obj);
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);

    if (DataList != none)
    {
        FillData(DataList);
    }

    return 0;
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    NewAction = 0;
    
    if (ActionIndex == GoBack || PageActions.Length == 0)
    {
        bRefresh = false;
        NewAction = -1;
        Pages.PopPage().FillData(DataList);
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.ManageServersPage || 
             PageActions[ActionIndex].ActionPage == Pages.GameTypeFilterPage)
    {
        NewAction = 1;
        PageActions[ActionIndex].ActionPage.FillData(DataList);
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.RegionSettingsPage)
    {
        NewAction = 1;
        Pages.RegionSettingsPage.bFilter = true;
        PageActions[ActionIndex].ActionPage.FillData(DataList);
    }
    else
    {
        switch (PageActions[ActionIndex].ActionNumber)
        {
        case RefreshNum:
            bRefresh = true;
            ServerIndex = 0;
            NewAction = -2;
            QueueManager.RequestCustomServers();
            break;
        case FilterOwnerNum:
            QueueManager.bFilterOwner = !QueueManager.bFilterOwner;
            bRefresh = true;
            ServerIndex = 0;
            NewAction = -2;
            QueueManager.RequestCustomServers();
            break;
        case FilterEmptyNum:
            ServerIndex = 0;
            bFilterEmpty = !bFilterEmpty;
            FillData(DataList);
            break;
        case FilterFullNum:
            ServerIndex = 0;
            bFilterFull = !bFilterFull;
            FillData(DataList);
            break;
        case FilterMapNameNum:
        case FilterServerNameNum:
            PopupNumber = PageActions[ActionIndex].ActionNumber;
            bFilterPopup = true;
            QueuePopup();
            break;
        default:
            break;
        }
    }

    return NewAction;
}

function PopupData(GFxObject Obj)
{
    if (Obj == none) return;
    
    if (bWaitingForJoinPopup)
    {
        Obj.SetString("popupTitle", Strings.JoiningServer);
        Obj.SetString("popupBody", Strings.AttemptingToJoin@"'"$QueueJoinName$"', "$Strings.PleaseWait$"...");
        Obj.SetString("buttonLabel2", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 0);
    }
    else if (bFilterPopup)
    {
        switch (PopupNumber)
        {
        case FilterMapNameNum:    Obj.SetString("popupTitle", Strings.SetmapName@Strings.Filter);    break;
        case FilterServerNameNum: Obj.SetString("popupTitle", Strings.Set@Strings.TrServer@Strings.TrName@Strings.Filter); break;
        default:
            break;
        }

        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 2);
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (bFilterPopup)
    {
        bFilterPopup = false;

        if (Action == 1)
        {
            switch (PopupNumber)
            {
            case FilterMapNameNum:
                MapNameFilter = TextInput;
                break;  
            case FilterServerNameNum:
                ServerNameFilter = TextInput;
                break;
            default:
                break;
            }

            ServerIndex = 0;
            bRefreshingMenu = true;
            NewAction = -2;
            StartMainMenu();
        }
    }
    else if (bWaitingForJoinPopup)
    {
        bWaitingForJoinPopup = false;

        if (Action > 0)
        {
            QueueManager.LeaveMatchmaking();
        }
    }
}

function GFxObject FillServerBrowser()
{
    local int i;
    local int count;
    local int currPage;
    local int pageCount;
    local int index;
    local string pingString;
    local GFxObject obj;
    
    obj = CreateObject("Object");

    currPage = (ServerIndex/SERVERS_PER_PAGE) + 1;
    pageCount = (QueueManager.ServerInfoList.Length/SERVERS_PER_PAGE) + 1;
    
    obj.SetString("browserTitle", Strings.CustomServerBrowser);
    obj.SetString("pageCount", Strings.Page@currpage$"/"$pageCount);

    if (ServerIndex > 0) obj.SetFloat("bPageUp", 1);
    else obj.SetFloat("bPageUp", 0);

    if ((QueueManager.ServerInfoList.Length - ServerIndex) > SERVERS_PER_PAGE) obj.SetFloat("bPageDown", 1);
    else obj.SetFloat("bPageDown", 0);

    obj.SetFloat("pageUpActionID", 0);
    obj.SetFloat("pageDownActionID", 1);

    // HEADER TITLES
    obj.SetString("titleFavorites", Strings.FavoriteInitial);
    obj.SetString("titlePassword", Strings.PasswordInitial);
    obj.SetString("titleName", Strings.TrName);
    obj.SetString("titleSlots", Strings.Slots);
    obj.SetString("titlePing", Strings.Ping);
    obj.SetString("titleType", Strings.Type);
    obj.SetString("titleMap", Strings.Map);
    obj.SetString("titleRules", Strings.Rules);
    obj.SetString("titleRange", Strings.Lvl);

    count = 0;

    // SERVER LIST
    for (i = 0; i < QueueManager.ServerInfoList.Length; i++)
    {
        index = ServerIndex + i;
        
        if (count < 20 && index < QueueManager.ServerInfoList.Length)
        {
            if (bFilterEmpty && QueueManager.ServerInfoList[index].PlayerCount == 0)
            {
                continue;
            }

            if (bFilterFull && QueueManager.ServerInfoList[index].PlayerCount == QueueManager.ServerInfoList[index].PlayerMax)
            {
                continue;
            }

            if (MapNameFilter != "" && (InStr(Caps(QueueManager.ServerInfoList[index].MapName), Caps(MapNameFilter)) == -1))
            {
                continue;
            }

            if (ServerNameFilter != "" && (InStr(Caps(QueueManager.ServerInfoList[index].ServerName), Caps(ServerNameFilter)) == -1))
            {
                continue;
            }

            QueueManager.ServerInfoList[index].bFavorite = User.IsFavoriteServer(QueueManager.ServerInfoList[index].QueueId); 

            pingString = string(QueueManager.ServerInfoList[index].Ping);

            if (pingString == "0") pingString = "";

            obj.SetFloat("bFavorited"$count+1,  int(QueueManager.ServerInfoList[index].bFavorite));
            obj.SetFloat("bPassworded"$count+1, int(QueueManager.ServerInfoList[index].bPrivate));
            obj.SetString("pServerName"$count+1, QueueManager.ServerInfoList[index].ServerName);
            obj.SetString("pSlots"$count+1, QueueManager.ServerInfoList[index].PlayerCount$"/"$QueueManager.ServerInfoList[index].PlayerMax);
            obj.SetString("pPing"$count+1, pingString);
            obj.SetString("pType"$count+1, QueueManager.GetServerGameTypeName(index));
            obj.SetString("pMap"$count+1, QueueManager.ServerInfoList[index].MapName);
            obj.SetString("pRules"$count+1, QueueManager.ServerInfoList[index].Ruleset);
            obj.SetString("pRange"$count+1, GetLevelReq(QueueManager.ServerInfoList[index].MinLevel, QueueManager.ServerInfoList[index].MaxLevel));
            obj.SetString("pServerLongTitle"$count+1, QueueManager.ServerInfoList[index].ServerName);
            obj.SetString("pSeverLongDesc"$count+1, QueueManager.ServerInfoList[index].ServerDesc); 
            obj.SetFloat("pActionIDJoin"$count+1, index);
            obj.SetFloat("pActionIDFavorite"$count+1, index);
            obj.SetFloat("pActionIDPassword"$count+1, index);

            count++;
        }
    }

    return obj;
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionPage == Pages.RegionSettingsPage)
    {
        if (QueueManager.RegionFilter.Length > 1)
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemRibbonLabel", "");
        }
        else
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", SettingsManager.RegionSettings.GetRegionName(QueueManager.RegionFilter[0]));
        }

        return obj;
    }

    switch (PageActions[ActionIndex].ActionNumber)
    {
    case FilterMapNameNum:
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);

        if (MapNameFilter == "") obj.SetString("itemRibbonLabel", Strings.All);
        else obj.SetString("itemRibbonLabel", "'"$MapNameFilter$"'");
        break;
    case FilterServerNameNum:
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);

        if (ServerNameFilter == "") obj.SetString("itemRibbonLabel", Strings.All);
        else obj.SetString("itemRibbonLabel", "'"$ServerNameFilter$"'");
        break;
    case FilterOwnerNum:
        if (!QueueManager.bFilterOwner)
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemSubTitle", Strings.All);
            obj.SetString("itemRibbonLabel", "");
        }
        else
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemSubTitle", "");
            obj.SetString("itemRibbonLabel", Strings.MeAndFriends);
        }
        break;
    case FilterEmptyNum:
        if (!bFilterEmpty)
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemSubTitle", Strings.Disabled);
            obj.SetString("itemRibbonLabel", "");
        }
        else
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemSubTitle", "");
            obj.SetString("itemRibbonLabel", Strings.Enabled);
        }
        break;
    case FilterFullNum:       
        if (!bFilterFull)
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemSubTitle", Strings.Disabled);
            obj.SetString("itemRibbonLabel", "");
        }
        else
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemSubTitle", "");
            obj.SetString("itemRibbonLabel", Strings.Enabled);
        }
        break;
    default:
        break;
    }

    return obj;
}

function ActionUp()
{
    ServerIndex -= SERVERS_PER_PAGE;

    if (ServerIndex < 0)
    {
        ServerIndex = 0;
    }

    bRefreshingMenu = true;
    StartMainMenu();
}

function ActionDown()
{
    ServerIndex += SERVERS_PER_PAGE;

    if (ServerIndex > (QueueManager.ServerInfoList.Length - SERVERS_PER_PAGE))
    {
        ScrollIndex = QueueManager.ServerInfoList.Length - SERVERS_PER_PAGE;
    }

    if (ServerIndex < 0)
    {
        ServerIndex = 0;
    }

    bRefreshingMenu = true;
    StartMainMenu();
}

function string GetLevelReq(int Min, int Max)
{
    if (Min == Max)
    {
        if (Min == 0) return Strings.All;
        else return string(Min);
    }

    if (Min == 0) return "<"$Max+1;
    else if (Max == 0) return ">"$Min-1;
    
    return Min$'-'$Max;
}

function WaitPopup(string ServerName)
{
    QueueJoinName = ServerName;
    bWaitingForJoinPopup = true;
    QueuePopup();
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_None);
}

defaultproperties
{
   RefreshNum=1
   FilterRegionNum=2
   FilterMapNameNum=4
   FilterEmptyNum=6
   FilterFullNum=7
   FilterOwnerNum=5
   FilterServerNameNum=8
   SERVERS_PER_PAGE=20
   PageLabel="CUSTOM SERVERS"
   OptionTitles(0)="REFRESH SERVERS"
   OptionTitles(1)="FILTER REGION"
   OptionTitles(2)="FILTER GAMETYPE"
   OptionTitles(3)="FILTER MAP"
   OptionTitles(4)="FILTER SERVER NAME"
   OptionTitles(5)="FILTER BY OWNER"
   OptionTitles(6)="FILTER EMPTY SERVERS"
   OptionTitles(7)="FILTER FULL SERVERS"
   OptionTitles(8)="MANAGE SERVERS"
   OptionSubtext(0)="FIND SERVERS BASED ON YOUR FILTERS"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   OptionSubtext(5)="SELECT TO CHANGE"
   OptionSubtext(6)="SELECT TO CHANGE"
   OptionSubtext(7)="SELECT TO CHANGE"
   OptionSubtext(8)="RENT AND MANAGE SERVERS"
   Name="Default__GFxTrPage_CustomMatch"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
