class TrPageManager extends Object within GFxTrMenuMoviePlayer;

var int NumDeal;
var int NumGold;
var int NumBundle;

var GFxTrPage_Main            MainPage;
var GFxTrPage_Game            GamePage;
var GFxTrPage_Login           LoginPage;
var GFxTrPage_Class           ClassPage;
var GFxTrPage_Equip           EquipPage;
var GFxTrPage_Store           StorePage;
var GFxTrPage_Queued          QueuedPage;
var GFxTrPage_RoamCTF         RoamCTFPage;
var GFxTrPage_RoamTDM         RoamTDMPage;
var GFxTrPage_Social          SocialPage;
var GFxTrPage_Friends         FriendsPage;
var GFxTrPage_Followers       FollowersPage;
var GFxTrPage_BlockedPlayers  BlockedPlayersPage;
var GFxTrPage_Classes         ClassesPage;
var GFxTrPage_PlayNow         PlayNowPage;
var GFxTrPage_WatchNow        WatchNowPage;
var GFxTrPage_Profile         ProfilePage;
var GFxTrPage_Badges          BadgesPage;
var GFxTrPage_Accolades       AccoladesPage;
var GFxTrPage_BuyGold         BuyGoldPage;
var GFxTrPage_BuyGoldSteam    BuyGoldSteamPage;
var GFxTrPage_BuyGoldPortal   BuyGoldPortalPage;
var GFxTrPage_Vehicle         VehiclePage;
var GFxTrPage_BuyBoost        BuyBoostPage;
var GFxTrPage_Bundles         BundlesPage;
var GFxTrPage_NameChange      NameChangePage;
var GFxTrPage_ClanTagChange   ClanTagChangePage;
var GFxTrPage_Settings        SettingsPage;
var GFxTrPage_Extras          ExtrasPage;
var GFxTrPage_Loadouts        LoadoutsPage;
var GFxTrPage_FriendActions   FriendActionsPage;
var GFxTrPage_FollowerActions FollowerActionsPage;
var GFxTrPage_JoinMatch       JoinMatchPage;
var GFxTrPage_RoamRabbit      RoamRabbitPage;
var GFxTrPage_RoamArena       RoamArenaPage;
var GFxTrPage_RoamCAH         RoamCAHPage;
var GFxTrPage_FriendJoin      FriendJoinPage;
var GFxTrPage_QuickMatch      QuickMatchPage;
var GFxTrPage_ClassSelect     ClassSelectPage;
var GFxTrPage_RankedMatch     RankedMatchPage;
var GFxTrPage_CustomMatch     CustomMatchPage;
var GFxTrPage_VideoWindow     VideoWindowPage;
var GFxTrPage_HUDSettings     HUDSettingsPage;
var GFxTrPage_RoamingMatch    RoamingMatchPage;
var GFxTrPage_VideoTexture    VideoTexturePage;
var GFxTrPage_VideoGraphics   VideoGraphicsPage;
var GFxTrPage_TrainingMatch   TrainingMatchPage;
var GFxTrPage_VideoSettings   VideoSettingsPage;
var GFxTrPage_AudioSettings   AudioSettingsPage;
var GFxTrPage_RegionSettings  RegionSettingsPage;
var GFxTrPage_ControlSettings ControlSettingsPage;
var GFxTrPage_VideoResolution VideoResolutionPage;
var GFxTrPage_VideoResolutionTypes VideoResolutionTypesPage;
var GFxTrPage_NotificationSettings NotificationSettingsPage;
var GFxTrPage_WhisperSettings WhisperSettingsPage;

var GFxTrPage_RentServer      RentServerPage;
var GFxTrPage_ManageServers   ManageServersPage;
var GFxTrPage_ManageServer    ManageServerPage;
var GFxTrPage_ManageProfiles  ManageProfilesPage;
var GFxTrPage_ManageProfile   ManageProfilePage;
var GFxTrPage_GameRules       GameRulesPage;
var GFxTrPage_MapRotation     MapRotationPage;
var GFxTrPage_GameMapSetup    GameMapSetupPage;
var GFxTrPage_GameType        GameTypePage;
var GFxTrPage_GameTypeFilter  GameTypeFilterPage;
var GFxTrPage_RotationType    RotationTypePage;
var GFxTrPage_ChangeMap       ChangeMapPage;

var GFxTrPage_Party           PartyPage;
var GFxTrPage_PartyAction     PartyActionPage;
var GFxTrPage_PartyInvite     PartyInvitePage;
var GFxTrPage_PartyMember     PartyMemberPage;

var GFxTrPage_ServerTime       ServerTimePage;
var GFxTrPage_ServerScoring    ServerScoringPage;
var GFxTrPage_ServerPlayer     ServerPlayerPage;
var GFxTrPage_ServerTeam       ServerTeamPage;
var GFxTrPage_ServerBase       ServerBasePage;
var GFxTrPage_ServerVehicle    ServerVehiclePage;
var GFxTrPage_ServerCallin     ServerCallinPage;
var GFxTrPage_ServerEditCallin ServerEditCallinPage;
var GFxTrPage_ServerClasses    ServerClassesPage;
var GFxTrPage_ServerTeamJoin   ServerTeamJoinPage;
var GFxTrPage_ServerSettings   ServerSettingsPage;
var GFxTrPage_ServerActions    ServerActionsPage;
var GFxTrPage_ServerAddTime    ServerAddTimePage;
var GFxTrPage_ServerFF         ServerFFPage;
var GFxTrPage_ServerSpawn      ServerSpawnPage;

var GFxTrPage_KeybindSettings      KeybindSettingsPage;
var GFxTrPage_KeybindCommunication KeybindCommunicationPage;
var GFxTrPage_KeybindGameplay      KeybindGameplayPage;
var GFxTrPage_KeybindHotkeys       KeybindHotkeysPage;
var GFxTrPage_KeybindInterface     KeybindInterfacePage;
var GFxTrPage_KeybindMovement      KeybindMovementPage;
var GFxTrPage_KeybindVehicle       KeybindVehiclePage;
var GFxTrPage_KeybindWeapon        KeybindWeaponPage;
var GFxTrPage_KeybindSpecInterface KeybindSpecInterfacePage;
var GFxTrPage_KeybindSpecMovement  KeybindSpecMovementPage;
var GFxTrPage_KeybindSpecTargeting KeybindSpecTargetingPage;
var GFxTrPage_KeybindSpectator     KeybindSpectatorPage;

var GFxTrPage_LiveStream LiveStreamPage;
var GFxTrPage_HiRezVideo HiRezVideoPage;
var GFxTrPage_TrainVideo TrainVideoPage;
var GFxTrPage_CmntyVideo CmntyVideoPage;

var array<GFxTrPage>          PageStack;

var int FocusIndex;
var bool bPopBack;
var bool bSelectRequired;

function Initialize()
{
    MainPage = new (Outer) class'GFxTrPage_Main';
    GamePage = new (Outer) class'GFxTrPage_Game';
    LoginPage = new (Outer) class'GFxTrPage_Login';
    ClassPage = new (Outer) class'GFxTrPage_Class';
    EquipPage = new (Outer) class'GFxTrPage_Equip';
    StorePage = new (Outer) class'GFxTrPage_Store';
    QueuedPage = new (Outer) class'GFxTrPage_Queued';
    RoamCTFPage = new (Outer) class'GFxTrPage_RoamCTF';
    RoamTDMPage = new (Outer) class'GFxTrPage_RoamTDM';
    SocialPage = new (Outer) class'GFxTrPage_Social';
    FriendsPage = new (Outer) class'GFxTrPage_Friends';
    FollowersPage = new (Outer) class'GFxTrPage_Followers';
    BlockedPlayersPage = new (Outer) class'GFxTrPage_BlockedPlayers';
    ClassesPage = new (Outer) class'GFxTrPage_Classes';
    PlayNowPage = new (Outer) class'GFxTrPage_PlayNow';
    WatchNowPage = new (Outer) class'GFxTrPage_WatchNow';
    ProfilePage = new (Outer) class'GFxTrPage_Profile';
    VehiclePage = new (Outer) class'GFxTrPage_Vehicle';
    BadgesPage = new (Outer) class'GFxTrPage_Badges';
    AccoladesPage = new (Outer) class'GFxTrPage_Accolades';
    BuyGoldPage = new (Outer) class'GFxTrPage_BuyGold';
    BuyGoldSteamPage = new (Outer) class'GFxTrPage_BuyGoldSteam';
    BuyGoldPortalPage = new (Outer) class'GFxTrPage_BuyGoldPortal';
    BuyBoostPage = new (Outer) class'GFxTrPage_BuyBoost';
    BundlesPage = new (Outer) class'GFxTrPage_Bundles';
    NameChangePage = new (Outer) class'GFxTrPage_NameChange';
    ClanTagChangePage = new (Outer) class'GFxTrPage_ClanTagChange';
    SettingsPage = new (Outer) class'GFxTrPage_Settings';
    ExtrasPage = new (Outer) class'GFxTrPage_Extras';
    LoadoutsPage = new (Outer) class'GFxTrPage_Loadouts';
    JoinMatchPage = new (Outer) class'GFxTrPage_JoinMatch';
    FriendActionsPage = new (Outer) class'GFxTrPage_FriendActions';
    FollowerActionsPage = new (Outer) class'GFxTrPage_FollowerActions';
    RoamRabbitPage = new (Outer) class'GFxTrPage_RoamRabbit';
    RoamArenaPage = new (Outer) class'GFxTrPage_RoamArena';
    RoamCAHPage = new (Outer) class'GFxTrPage_RoamCAH';
    FriendJoinPage = new (Outer) class'GFxTrPage_FriendJoin';
    QuickMatchPage = new (Outer) class'GFxTrPage_QuickMatch';
    ClassSelectPage = new (Outer) class'GFxTrPage_ClassSelect';
    VideoWindowPage = new (Outer) class'GFxTrPage_VideoWindow';
    RankedMatchPage = new (Outer) class'GFxTrPage_RankedMatch';
    CustomMatchPage = new (Outer) class'GFxTrPage_CustomMatch';
    HUDSettingsPage = new (Outer) class'GFxTrPage_HUDSettings';
    RoamingMatchPage = new (Outer) class'GFxTrPage_RoamingMatch';
    VideoTexturePage =  new (Outer) class'GFxTrPage_VideoTexture';
    VideoGraphicsPage = new (Outer) class'GFxTrPage_VideoGraphics';
    TrainingMatchPage = new (Outer) class'GFxTrPage_TrainingMatch';
    VideoSettingsPage = new (Outer) class'GFxTrPage_VideoSettings';
    AudioSettingsPage = new (Outer) class'GFxTrPage_AudioSettings';
    RegionSettingsPage = new (Outer) class'GFxTrPage_RegionSettings';
    ControlSettingsPage = new (Outer) class'GFxTrPage_ControlSettings';
    VideoResolutionPage = new (Outer) class'GFxTrPage_VideoResolution';
    VideoResolutionTypesPage = new (Outer) class'GFxTrPage_VideoResolutionTypes';
    NotificationSettingsPage = new (Outer) class'GFxTrPage_NotificationSettings';
    WhisperSettingsPage = new (Outer) class'GFxTrPage_WhisperSettings';

    RentServerPage = new (Outer) class'GFxTrPage_RentServer';
    ManageServersPage = new (Outer) class'GFxTrPage_ManageServers';
    ManageServerPage = new (Outer) class'GFxTrPage_ManageServer';
    ManageProfilesPage = new (Outer) class'GFxTrPage_ManageProfiles';
    ManageProfilePage = new (Outer) class'GFxTrPage_ManageProfile';
    GameRulesPage = new (Outer) class'GFxTrPage_GameRules';
    MapRotationPage = new (Outer) class'GFxTrPage_MapRotation';
    GameMapSetupPage = new (Outer) class'GFxTrPage_GameMapSetup';
    GameTypePage = new (Outer) class'GFxTrPage_GameType';
    GameTypeFilterPage = new (Outer) class'GFxTrPage_GameTypeFilter';
    RotationTypePage = new (Outer) class'GFxTrPage_RotationType';
    ChangeMapPage = new (Outer) class'GFxTrPage_ChangeMap';
    
    PartyPage       = new (Outer) class'GFxTrPage_Party';
    PartyActionPage = new (Outer) class'GFxTrPage_PartyAction';
    PartyInvitePage = new (Outer) class'GFxTrPage_PartyInvite';
    PartyMemberPage = new (Outer) class'GFxTrPage_PartyMember';

    ServerTimePage = new (Outer) class'GFxTrPage_ServerTime';
    ServerScoringPage = new (Outer) class'GFxTrPage_ServerScoring';
    ServerPlayerPage = new (Outer) class'GFxTrPage_ServerPlayer';
    ServerTeamPage = new (Outer) class'GFxTrPage_ServerTeam';
    ServerBasePage = new (Outer) class'GFxTrPage_ServerBase';
    ServerVehiclePage = new (Outer) class'GFxTrPage_ServerVehicle';
    ServerCallinPage = new (Outer) class'GFxTrPage_ServerCallin';
    ServerEditCallinPage = new (Outer) class'GFxTrPage_ServerEditCallin';
    ServerClassesPage = new (Outer) class'GFxTrPage_ServerClasses';
    ServerSettingsPage = new (Outer) class'GFxTrPage_ServerSettings';
    ServerTeamJoinPage = new (Outer) class'GFxTrPage_ServerTeamJoin';
    ServerActionsPage = new (Outer) class'GFxTrPage_ServerActions';
    ServerAddTimePage = new (Outer) class'GFxTrPage_ServerAddTime';
    ServerFFPage = new (Outer) class'GFxTrPage_ServerFF';
    ServerSpawnPage = new (Outer) class'GFxTrPage_ServerSpawn';

    KeybindSettingsPage = new (Outer) class'GFxTrPage_KeybindSettings';
    KeybindCommunicationPage = new (Outer) class'GFxTrPage_KeybindCommunication';
    KeybindGameplayPage = new (Outer) class'GFxTrPage_KeybindGameplay';
    KeybindHotkeysPage = new (Outer) class'GFxTrPage_KeybindHotkeys';
    KeybindInterfacePage = new (Outer) class'GFxTrPage_KeybindInterface';
    KeybindMovementPage = new (Outer) class'GFxTrPage_KeybindMovement';
    KeybindVehiclePage = new (Outer) class'GFxTrPage_KeybindVehicle';
    KeybindWeaponPage = new (Outer) class'GFxTrPage_KeybindWeapon';
    KeybindSpecInterfacePage = new (Outer) class'GFxTrPage_KeybindSpecInterface';
    KeybindSpecMovementPage = new (Outer) class'GFxTrPage_KeybindSpecMovement';
    KeybindSpecTargetingPage = new (Outer) class'GFxTrPage_KeybindSpecTargeting';
    KeybindSpectatorPage = new (Outer) class'GFxTrPage_KeybindSpectator';

    LiveStreamPage = new (Outer) class'GFxTrPage_LiveStream';
    HiRezVideoPage = new (Outer) class'GFxTrPage_HiRezVideo';
    TrainVideoPage = new (Outer) class'GFxTrPage_TrainVideo';
    CmntyVideoPage = new (Outer) class'GFxTrPage_CmntyVideo';

    MainPage.Initialize();
    GamePage.Initialize();
    LoginPage.Initialize();
    ClassPage.Initialize();
    EquipPage.Initialize();
    StorePage.Initialize();
    QueuedPage.Initialize();
    SocialPage.Initialize();
    FriendsPage.Initialize();
    FollowersPage.Initialize();
    BlockedPlayersPage.Initialize();
    ClassesPage.Initialize();
    PlayNowPage.Initialize();
    WatchNowPage.Initialize();
    ProfilePage.Initialize();
    BadgesPage.Initialize();
    AccoladesPage.Initialize();
    BuyGoldPage.Initialize();
    BuyGoldSteamPage.Initialize();
    BuyGoldPortalPage.Initialize();
    RoamCTFPage.Initialize();
    RoamTDMPage.Initialize();
    BuyBoostPage.Initialize();
    BundlesPage.Initialize();
    SettingsPage.Initialize();
    ExtrasPage.Initialize();
    LoadoutsPage.Initialize();
    JoinMatchPage.Initialize();
    FriendActionsPage.Initialize();
    FollowerActionsPage.Initialize();
    FriendJoinPage.Initialize();
    QuickMatchPage.Initialize();
    RoamRabbitPage.Initialize();
    RoamArenaPage.Initialize();
    RoamCAHPage.Initialize();
    ClassSelectPage.Initialize();
    VideoWindowPage.Initialize();
    RankedMatchPage.Initialize();
    CustomMatchPage.Initialize();
    HUDSettingsPage.Initialize();
    RoamingMatchPage.Initialize();
    VideoTexturePage.Initialize();
    VideoGraphicsPage.Initialize();
    TrainingMatchPage.Initialize();
    VideoSettingsPage.Initialize();
    AudioSettingsPage.Initialize();
    ControlSettingsPage.Initialize();
    VideoResolutionPage.Initialize();
    VideoResolutionTypesPage.Initialize();
    NotificationSettingsPage.Initialize();
    WhisperSettingsPage.Initialize();

    RentServerPage.Initialize();
    ManageServersPage.Initialize();
    ManageServerPage.Initialize();
    ManageProfilesPage.Initialize();
    ManageProfilePage.Initialize();
    GameRulesPage.Initialize();
    MapRotationPage.Initialize();
    GameMapSetupPage.Initialize();
    GameTypePage.Initialize();
    GameTypeFilterPage.Initialize();
    RotationTypePage.Initialize();
    ChangeMapPage.Initialize();

    PartyPage.Initialize();
    PartyInvitePage.Initialize();
    PartyMemberPage.Initialize();

    ServerTimePage.Initialize();
    ServerScoringPage.Initialize();
    ServerPlayerPage.Initialize();
    ServerTeamPage.Initialize();
    ServerBasePage.Initialize();
    ServerVehiclePage.Initialize();
    ServerCallinPage.Initialize();
    ServerEditCallinPage.Initialize();
    ServerClassesPage.Initialize();
    ServerSettingsPage.Initialize();
    ServerTeamJoinPage.Initialize();
    ServerActionsPage.Initialize();
    ServerAddTimePage.Initialize();
    ServerFFPage.Initialize();
    ServerSpawnPage.Initialize();

    KeybindSettingsPage.Initialize();
    KeybindCommunicationPage.Initialize();
    KeybindGameplayPage.Initialize();
    KeybindHotkeysPage.Initialize();
    KeybindInterfacePage.Initialize();
    KeybindMovementPage.Initialize();
    KeybindVehiclePage.Initialize();
    KeybindWeaponPage.Initialize();
    KeybindSpecInterfacePage.Initialize();
    KeybindSpecMovementPage.Initialize();
    KeybindSpecTargetingPage.Initialize();
    KeybindSpectatorPage.Initialize();
}

function PopupData(GFxObject Obj)
{
    if (HandlePopup(Obj))
    {
        return;
    }

    if (bInvitationPopup)
    {
        PartyManager.InvitationPopup(Obj);
    }
    else if (bShowPurchaseFailed)
    {
        PurchaseFailedPopup(Obj);
    }
    else if (bWaitingForPlayerNamePopup)
    {
        bWaitingForPlayerNamePopup = false;
        NewPlayerNamePopup(Obj);
    }
    else if (bShowPromoCodeFailed)
    {
        bShowPromoCodeFailed = false;
        PromoCodeFailedPopup(Obj);
    }
    else if (bShowGenericFailure)
    {
        bShowGenericFailure = false;
        GenericFailurePopup(Obj);
    }
    else if (bWaitingForQuitGameConfirm)
    {
        QuitGamePopup(Obj);
    }
    else if (bWaitingForLeaveMatchConfirm)
    {
        LeaveMatchPopup(Obj);
    }
    else if (LoginManager.bWaitingForLoginWaitPopup)
    {
        LoginManager.PopupData(Obj);
    }
    else if (bWaitingForLoginQueuePopup)
    {
        LoginQueuePopupData(Obj);
    }
    else if (bWaitingForServerDropPopup)
    {
        ServerDropPopupData(Obj);
    }
    else if (bWaitingForAFKKickPopup)
    {
        AFKKickPopupData(Obj);
    }
    else if (bWaitingForAddFriendPopup)
    {
        AddFriendScoreboardPopup(Obj);
    }
    else if (bWaitingForLoginFailedPopup)
    {
        LoginFailedPopup(Obj);
    }
    else if (bWaitingForPurchaseReturn)
    {
        WaitingForPurchaseReturn(Obj);
    }
    else if (bPasswordPopup)
    {
        PasswordPopup(Obj);
    }
    else if (bWaitingForJoinFailed)
    {
        DisplayJoinFailed(Obj);
    }
    else if (bWaitingForJoinRequiresPassword)
    {
        PasswordPopup(Obj);
    }
    else
    {
        GetActivePage().PopupData(Obj);
    }
}

function PopupComplete(int Action, string TextInput)
{
    bWaitingForPopup = false;

    HidePopup();
    
    if (HandlePopupComplete(Action, TextInput))
    {
        return;
    }

    if (bInvitationPopup)
    {
        bInvitationPopup = false;
        PartyManager.InvitationComplete(Action);
    }
    else if (bShowPurchaseFailed)
    {
        bShowPurchaseFailed = false;

        if (Action == 1)
        {
            Pages.PushPage(Pages.StorePage);
            bOpeningMenu = true;
            StartMainMenu();
        }
    }
    else if (bWaitingForPlayerNameInput)
    {
        bWaitingForPlayerNameInput = false;

        if (Action == 1)
        {
            if (TextInput == "")
            {
                PlayerNameNotAllowed(false);
            }
            else
            {
                LoginManager.SubmitPlayerName(TextInput);
            }
        }
        else
        {
            QuitGame();
        }
    }
    else if (bWaitingForQuitGameConfirm)
    {
        bWaitingForQuitGameConfirm = false;
        QuitGamePopupComplete(Action);
    }
    else if (bWaitingForLeaveMatchConfirm)
    {
        bWaitingForLeaveMatchConfirm = false;
        LeaveMatchPopupComplete(Action);
    }
    else if (bWaitingForLoginQueuePopup)
    {
        bWaitingForLoginQueuePopup = false;
        LoginQueuePopupComplete(Action);
    }
    else if (bWaitingForJoinRequiresPassword)
    {
        bWaitingForJoinRequiresPassword = false;
        JoinRequiresPasswordComplete(Action, TextInput);
    }
    else if (bPasswordPopup)
    {
        bPasswordPopup = false;

        if (Action == 1)
        {
            if (QueueManager.bNeedPassword)
            {
                QueueManager.JoinProtectedServer(TextInput);
            }
            else
            {
                QueueManager.CustomLogin(TextInput);
                QueueManager.RefreshRentedServers();
            }
        }
    }
    else
    {
        GetActivePage().PopupComplete(Action, TextInput);
    }
}

function int TakeFocus(int Index, GFxObject DataList)
{
    if (PageStack.Length == 0)
    {
        PushPage(LoginPage);
    }

    return GetActivePage().TakeFocus(Index, DataList);
}

function int TakeAction(int Index, GFxObject DataList)
{
    local int action;

    if (RibbonManager.bDirty)
    {
        RibbonManager.bDirty = false;
        CheckRibbons();
    }

    if (PageStack.Length == 0)
    {
        PushPage(LoginPage);
    }
    
    if (bOpeningMenu)
    {
        if (GetActivePage() == GamePage) GamePage.PushModel();

        GetActivePage().FillData(DataList);
        bOpeningMenu = false;

        if (bPopBack) action = -1;
        else action = 1;

        bPopBack = false;
    }
    else if (bRefreshingMenu)
    {
        GetActivePage().FillData(DataList);
        GetActivePage().RefreshButtons();
        bRefreshingMenu = false;
        action = 0;
    }
    else
    {
        action = GetActivePage().TakeAction(Index, DataList);
    }

    if (action == -1 && !GetActivePage().bEndOfLine)
    {
        MenuSounds.PageBack();
    }
    else if (action == 1)
    {
        MenuSounds.PageForward();
    }

    return action;
}

function ActionUp()
{
    GetActivePage().ActionUp();
}

function ActionDown()
{
    GetActivePage().ActionDown();
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    return GetActivePage().ModifyAction(ActionIndex, DataList);
}

function ModifyFocus(int ActionIndex)
{
    GetActivePage().ModifyFocus(ActionIndex);
}

function HelpButton(int ActionIndex)
{
    GetActivePage().HelpButton(ActionIndex);
}

function ProfileUp(int ActionIndex)
{
    GetActivePage().ProfileUp(ActionIndex);
}

function ProfileDown(int ActionIndex)
{
    GetActivePage().ProfileDown(ActionIndex);
}

function PushPage(GFxTrPage Page)
{
    if (PageStack.Length == 0 || PageStack[PageStack.Length-1] != Page)
    {
        PageStack.AddItem(Page);
    }
}

function PushOpen(GFxTrPage Page)
{
    if (!bLoggedIn) Page = LoginPage;

    bOpeningMenu = true;
    Page.bEndOfLine = true;

    ClearStack();
    PushPage(Page);
    
    if (bLoggedIn) StartMainMenu();
    else StartLogin();
}

function PopBack()
{
    bOpeningMenu = true;

    PopPage();
    StartMainMenu();
}

function GFxTrPage PopPage()
{
    if (PageStack.Length > 0)
    {
        PageStack.Remove(PageStack.Length-1, 1);
    }

    return GetActivePage();
}

function ClearStack()
{
    local int i;

    for (i = PageStack.Length; i > 0; i--)
    {
        PageStack.Remove(i-1, 1);
    }
}

function GFxTrPage GetActivePage()
{
    if (PageStack.Length > 0)
    {
        return PageStack[PageStack.Length-1];
    }
    
    if (bInGame)
    {
        PushPage(GamePage);

        return GamePage;
    }

    PushPage(LoginPage);

    return LoginPage;
}

function PushOpenMain()
{
    if (bInGame)
    {
        PushOpen(GamePage);
    }
    else
    {
        PushOpen(MainPage);
    }
}

function PushOpenParty()
{
    bOpeningMenu = true;

    ClearStack();
    PushPage(MainPage);
    PushPage(PartyPage);
    StartMainMenu();
}

function PushOpenClassSelect() { PushOpen(ClassSelectPage); }

function PushOpenLogin()
{    
    bOpeningMenu = true;
    LoginPage.bEndOfLine = true;

    ClearStack();
    PushPage(LoginPage);

    StartLogin();
}

function TravelToMain()
{
    if (!bLoggedIn) return;

    if (bInGame)
    {
        if (bMovieIsOpen)
        {
            if (GetActivePage() == GamePage)
            {
                HideMovie();
            }
            else if (!bBlockHotkey)
            {
                Pages.bPopBack = true;
                bOpeningMenu = true;
                StartHotKeyBlock();

                ClearStack();
                PushPage(GamePage);
                StartMainMenu();
            }
        }
        else
        {
            StartHotKeyBlock();
            bOpeningMenu = true;
            PushOpenMain();
        }
    }
    else
    {
        if (!bBlockHotkey && GetActivePage() != MainPage)
        {
            StartHotKeyBlock();
            PushOpenMain();
        }
    }
}

function TravelToClasses()
{
    if (!bLoggedIn) return;

    if (bInGame)
    {
        if (bMovieIsOpen && GetActivePage() == ClassSelectPage)
        {
            if (!PlayerNeedsClass())
            {
                HideMovie();
            }
        }
        else if (!bBlockHotkey)
        {
            bOpeningMenu = true;
            StartHotKeyBlock();

            ClearStack();
            PushPage(GamePage);
            PushPage(ClassSelectPage);
            StartMainMenu();
        }
    }
    else
    {
        if (!bBlockHotkey)
        {
            bOpeningMenu = true;
            StartHotKeyBlock();

            ClearStack();
            PushPage(MainPage);
            PushPage(ClassesPage);
            StartMainMenu();
        }
    }
}

function TravelToFriends()
{
    if (!bLoggedIn) return;

    if (bMovieIsOpen && GetActivePage() == FriendsPage)
    {
        HideMovie();
    }
    else if (!bBlockHotkey)
    {
        bOpeningMenu = true;
        StartHotKeyBlock();

        ClearStack();

        if (bInGame) PushPage(GamePage);
        else PushPage(MainPage);
        
        PushPage(FriendsPage);
        StartMainMenu();
    }
}

function TravelToSettings()
{
    if (!bLoggedIn) return;

    if (bMovieIsOpen && GetActivePage() == SettingsPage)
    {
        HideMovie();
    }
    else if (!bBlockHotkey)
    {
        bOpeningMenu = true;
        StartHotKeyBlock();

        ClearStack();

        if (bInGame) PushPage(GamePage);
        else PushPage(MainPage);

        PushPage(SettingsPage);
        StartMainMenu();
    }
}

function TravelToBundles()
{
    if (!bLoggedIn) return;

    if (bMovieIsOpen && GetActivePage() != BundlesPage)
    {
        bOpeningMenu = true;

        ClearStack();

        if (bInGame) PushPage(GamePage);
        else PushPage(MainPage);

        PushPage(StorePage);
        PushPage(BundlesPage);
        StartMainMenu();
    }
}

function TravelToStore()
{
    if (!bLoggedIn) return;

    if (bMovieIsOpen && GetActivePage() != StorePage)
    {
        bOpeningMenu = true;

        ClearStack();

        if (bInGame) PushPage(GamePage);
        else PushPage(MainPage);

        PushPage(StorePage);
        StartMainMenu();
    }
}

function bool NavigateGold(optional bool bViaStore = false)
{
    if (UseSteam())
    {
        RequestSteamUserData();
    }
    else if (UsePortal())
    {
        if (bViaStore)
        {
            return false;
        }

        bOpeningMenu = true;
        PushPage(BuyGoldPage);
        StartMainMenu();
    }
    else
    {
        Browser.Gold();
    }

    return true;
}

function ShowInGameModel()
{
    GamePage.PushModel();
}

function PromoAction(int ActionIndex)
{
    //Hardcode for now
    NavigateGold();
}

function SelectedFeature(int ActionIndex)
{
    if (ActionIndex == NumBundle)
    {
        TravelToBundles();
    }
    else if (ActionIndex == NumGold)
    {
        NavigateGold();
    }
    else
    {
        TravelToStore();
    }
}

function ShowReticule(int Index)
{
    GetActivePage().ShowReticule(Index);
}

function SaveReticule(GFxObject Data)
{
    GetActivePage().SaveReticule(Data);
}

defaultproperties
{
   NumDeal=2000
   NumGold=2001
   NumBundle=2002
   Name="Default__TrPageManager"
   ObjectArchetype=Object'Core.Default__Object'
}
