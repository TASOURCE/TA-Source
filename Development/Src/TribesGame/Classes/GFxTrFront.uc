class GFxTrFront extends GFxMoviePlayer
    dependson(OnlineSubsystem)
    native;
/* DEPRECATED
`include(TrOnlineConstants.uci)

var bool                bInitialized;
var bool                bConsole;
var OnlineSubsystem     OnlineSub;          // Cached online subsystem variable.
var GFxTrFront_Party    PersonalParty;      // Party of friends, etc. that might join a large session party for a game.
var TrMakeQuickMatch    QuickMatch;

var GFxObject           RootMC;             // Reference to _root of the movie's (tr_manager.swf) stage.
var GFxObject           ManagerMC;          // Reference to the manager MovieClip (_root.manager) where views will be attached.
var GFxObject           _global;            // Reference to the global space.

var array<UTUIDataProvider_GameModeInfo>    GameModeList;
var array<TrUIDataProvider_MapInfo>         MapList;
var TrGameSearchCommon                      Searching;
var TrGameSettingsCommon                    GameSettings;

var TrKeyBindings        m_KeyBindings;
var TrVideoSettings      m_VideoSettings;
var TrControlSettings    m_ControlSettings;

var GFxTrScene_Login     m_LoginScene;
var GFxTrScene_Class     m_ClassScene;

delegate int    DelegateGetPlatform();
delegate string DelegateGetViewMode();
delegate bool   DelegateLogin(string userName, string password);
delegate        DelegateRefreshPlayers();
delegate        DelegateGetGameModes(GFxObject list);
delegate        DelegateGetGameMaps(GFxObject list);
delegate        DelegateGetGameSettings(GFxObject list);
delegate        DelegateMakeMatch(int nMode);
delegate        DelegateHostMatch(int nMode, int nMap);
delegate bool   DelegateJoinMatch(int nQueueId);
delegate        DelegateLeaveMatch(int nQueueId);
delegate        DelegateRequestGameSearch(GFxObject info);
delegate        DelegateGetServerList(GFxObject list);
delegate        DelegateGetSetupOptions(String Type, GFxObject list);
delegate        DelegateApplySetupOptions(String Type, GFxObject list);
delegate        DelegateLoadKeyBindings(GFxObject List);
delegate        DelegateSaveKeyBinding(int Index, String KeyName);
delegate        DelegateCaptureKeyPress();
delegate        DelegateResetDefaultKeyBindings();
delegate        DelegateLoadControlSettings(GFxObject List);
delegate        DelegateApplyControlSettings(GFxObject List);
delegate        DelegateLoadVideoSettings(GFxObject List);
delegate        DelegateApplyVideoSettings(GFxObject List);
delegate        DelegateLoadResolutions(GFxObject List);
delegate        DelegateExitGame();
delegate        EscapeDelegate();                           // A delegate for Escape/Back key press which will generally move the user backward through the menu or select "Cancel".
delegate bool   DelegateRequestClassSlot(int SlotId, int ClassId);
delegate bool   DelegateLoadClassData(GFxObject list);
delegate bool   DelegateLoadClassSlots();
delegate bool   DelegateLoadClassDevices(int ClassId, GFxObject list);

final function  SetGetPlatformDelegate(delegate<DelegateGetPlatform> InDelegate)            { ActionScriptSetFunction(_global, "TRFRONT_GetPlatform"); }
final function  SetGetViewModeDelegate(delegate<DelegateGetViewMode> InDelegate)            { ActionScriptSetFunction(_global, "TRFRONT_GetViewMode"); }
final function  SetLoginDelegate(delegate<DelegateLogin> InDelegate)                        { ActionScriptSetFunction(_global, "TRFRONT_Login"); }
final function  SetRefreshPlayersDelegate(delegate<DelegateRefreshPlayers> InDelegate)      { ActionScriptSetFunction(_global, "TRFRONT_RefreshPlayers"); }
final function  SetGetGameModesDelegate(delegate<DelegateGetGameModes> InDelegate)          { ActionScriptSetFunction(_global, "TRFRONT_GetGameModes"); }
final function  SetGetGameMapsDelegate(delegate<DelegateGetGameMaps> InDelegate)            { ActionScriptSetFunction(_global, "TRFRONT_GetGameMaps"); }
final function  SetGetGameSettingsDelegate(delegate<DelegateGetGameSettings> InDelegate)    { ActionScriptSetFunction(_global, "TRFRONT_GetGameSettings"); }
final function  SetMakeMatchDelegate(delegate<DelegateMakeMatch> InDelegate)                { ActionScriptSetFunction(_global, "TRFRONT_MakeMatch"); }
final function  SetHostMatchDelegate(delegate<DelegateHostMatch> InDelegate)                { ActionScriptSetFunction(_global, "TRFRONT_HostMatch"); }
final function  SetJoinMatchDelegate(delegate<DelegateJoinMatch> InDelegate)                { ActionScriptSetFunction(_global, "TRFRONT_JoinMatch"); }
final function  SetLeaveMatchDelegate(delegate<DelegateLeaveMatch> InDelegate)              { ActionScriptSetFunction(_global, "TRFRONT_LeaveMatch"); }
final function  SetRequestGameSearchDelegate(delegate<DelegateRequestGameSearch> InDelegate){ ActionScriptSetFunction(_global, "TRFRONT_RequestGameSearch"); }
final function  SetGetServerListDelegate(delegate<DelegateGetServerList> InDelegate)        { ActionScriptSetFunction(_global, "TRFRONT_GetServerList"); }
final function  SetGetSetupOptions(delegate<DelegateGetSetupOptions> InDelegate)            { ActionScriptSetFunction(_global, "TRFRONT_GetSetupOptions"); }
final function  SetApplySetupOptions(delegate<DelegateApplySetupOptions> InDelegate)        { ActionScriptSetFunction(_global, "TRFRONT_ApplySetupOptions"); }
final function  SetExitGameDelegate(delegate<DelegateExitGame> InDelegate)                  { ActionScriptSetFunction(_global, "TRFRONT_ExitGame"); }
final function  SetEscapeDelegate(delegate<EscapeDelegate> InDelegate)                      { ActionScriptSetFunction(_global, "OnEscapeKeyPress"); }
final function  SetLoadKeyBindingsDelegate(delegate<DelegateLoadKeyBindings> InDelegate)    { ActionScriptSetFunction(_global, "TRFRONT_LoadKeyBindings"); }
final function  SetSaveKeyBindingDelegate(delegate<DelegateSaveKeyBinding> InDelegate)      { ActionScriptSetFunction(_global, "TRFRONT_SaveKeyBinding"); }
final function  SetCaptureKeyPressDelegate(delegate<DelegateCaptureKeyPress> InDelegate)    { ActionScriptSetFunction(_global, "TRFRONT_CaptureKeyPress"); }
final function  SetResetDefaultKeyBindingsDelegate(delegate<DelegateResetDefaultKeyBindings> InDelegate) { ActionScriptSetFunction(_global, "TRFRONT_ResetDefaultKeyBindings"); }
final function  SetLoadControlSettingsDelegate(delegate<DelegateLoadControlSettings> InDelegate) { ActionScriptSetFunction(_global, "TRFRONT_LoadControlSettings"); }
final function  SetApplyControlSettingsDelegate(delegate<DelegateApplyControlSettings> InDelegate) { ActionScriptSetFunction(_global, "TRFRONT_ApplyControlSettings"); }
final function  SetLoadVideoSettingsDelegate(delegate<DelegateLoadVideoSettings> InDelegate) { ActionScriptSetFunction(_global, "TRFRONT_LoadVideoSettings"); }
final function  SetApplyVideoSettingsDelegate(delegate<DelegateApplyVideoSettings> InDelegate) { ActionScriptSetFunction(_global, "TRFRONT_ApplyVideoSettings"); }
final function  SetLoadResolutionsDelegate(delegate<DelegateLoadResolutions> InDelegate) { ActionScriptSetFunction(_global, "TRFRONT_LoadResolutions"); }
final function  SetRequestClassSlotDelegate(delegate<DelegateRequestClassSlot> InDelegate)    { ActionScriptSetFunction(_global, "USC_RequestClassSlot"); }
final function  SetLoadClassDataDelegate(delegate<DelegateLoadClassData> InDelegate)          { ActionScriptSetFunction(_global, "USC_LoadClassData"); }
final function  SetLoadClassSlotsDelegate(delegate<DelegateLoadClassSlots> InDelegate)        { ActionScriptSetFunction(_global, "USC_LoadClassSlots"); }
final function  SetLoadClassDevicesDelegate(delegate<DelegateLoadClassDevices> InDelegate)    { ActionScriptSetFunction(_global, "USC_LoadClassDevices"); }

///////////////////////////////////////////////////////////////////////////////
function bool Start(optional bool StartPaused = false)
{
	local int i;
	local array<UDKUIResourceDataProvider> ProviderList;

	super.Start(true);

   	if (!bInitialized)
	{
	    RootMC = GetVariableObject("_root");
    	ManagerMC = RootMC.GetObject("manager");
    	bInitialized = TRUE;
	}

    m_KeyBindings = new (self) class'TrKeyBindings';
    m_VideoSettings = new (self) class'TrVideoSettings';
    m_ControlSettings = new (self) class'TrControlSettings';

    if (m_KeyBindings != none) m_KeyBindings.SetGlobalPointer();

	// @todo sf: Stops the game running the background from ending. We should set the Kismet level up
	// properly rather than use pause instead.
	ConsoleCommand("pause");

	_global = GetVariableObject("_global");        
	SetGetPlatformDelegate(TRFRONT_GetPlatform);
	SetGetViewModeDelegate(TRFRONT_GetViewMode);
	SetLoginDelegate(TRFRONT_Login);
	SetRefreshPlayersDelegate(TRFRONT_RefreshPlayers);
    SetGetGameModesDelegate(TRFRONT_GetGameModes);
    SetGetGameMapsDelegate(TRFRONT_GetGameMaps);
    SetGetGameSettingsDelegate(TRFRONT_GetGameSettings);
	SetMakeMatchDelegate(TRFRONT_MakeMatch);
    SetHostMatchDelegate(TRFRONT_HostMatch);
    SetJoinMatchDelegate(TRFRONT_JoinMatch);
    SetLeaveMatchDelegate(TRFRONT_LeaveMatch);
    SetRequestGameSearchDelegate(TRFRONT_RequestGameSearch);
    SetGetServerListDelegate(TRFRONT_GetServerList);
    SetGetSetupOptions(TRFRONT_GetSetupOptions);
    SetApplySetupOptions(TRFRONT_ApplySetupOptions);
    SetLoadKeyBindingsDelegate(TRFRONT_LoadKeyBindings);
    SetSaveKeyBindingDelegate(TRFRONT_SaveKeyBinding);
    SetCaptureKeyPressDelegate(TRFRONT_CaptureKeyPress);
    SetResetDefaultKeyBindingsDelegate(TRFRONT_ResetDefaultKeyBindings);
    SetLoadControlSettingsDelegate(TRFRONT_LoadControlSettings);
    SetApplyControlSettingsDelegate(TRFRONT_ApplyControlSettings);
    SetLoadVideoSettingsDelegate(TRFRONT_LoadVideoSettings);
    SetApplyVideoSettingsDelegate(TRFRONT_ApplyVideoSettings);
    SetLoadResolutionsDelegate(TRFRONT_LoadResolutions);
	SetExitGameDelegate(TRFRONT_ExitGame);
    SetRequestClassSlotDelegate(USC_RequestClassSlot);
    SetLoadClassDataDelegate(USC_LoadClassData);
    SetLoadClassSlotsDelegate(USC_LoadClassSlots);
    SetLoadClassDevicesDelegate(USC_LoadClassDevices);

	// Fill the local game mode list
	class'UTUIDataStore_MenuItems'.static.GetAllResourceDataProviders(class'UTUIDataProvider_GameModeInfo', ProviderList);
	for (i = 0; i < ProviderList.Length; i++)
	{
	    GameModeList.InsertItem(0, UTUIDataProvider_GameModeInfo(ProviderList[i]));
	}

	// Load the map list.
    ProviderList.Length = 0;
	class'UTUIDataStore_MenuItems'.static.GetAllResourceDataProviders(class'TrUIDataProvider_MapInfo', ProviderList);

	for (i = 0; i < ProviderList.length; i++)
	{		
		MapList.AddItem(TrUIDataProvider_MapInfo(ProviderList[i]));
	}   

    Searching = new class'TrGameSearchTrCTF';
    GameSettings = new class'TrGameSettingsCommon';

    PersonalParty = new class'GFxTrFront_Party';

    ///////////////////////////////////
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
    
	if (OnlineSub.PlayerInterface != none)
	{
		OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnUserLoginChange);
		OnlineSub.PlayerInterface.AddLoginFailedDelegate(0,OnUserLoginFailed);
	}

    ///////////////////////////////////////////////////////////////////////////
    // Driving the UI by scenes now, load them
    ///////////////////////////////////////////////////////////////////////////

    m_ClassScene = new (self) class'GFxTrScene_Class';
    m_ClassScene.Initialize();
    
    ///////////////////////////////////////////////////////////////////////////

//    RegisterGamerParty();

	Advance(0);

	return TRUE;
}

///////////////////////////////////////////////////////////////////////////////
// Hooks from the front end to call into unreal.
function int TRFRONT_GetPlatform()
{
    local int platform;

	if (class'WorldInfo'.static.IsConsoleBuild(CONSOLE_XBox360))
	{
        platform = 1;
        bConsole = true;
    }
    else if (class'WorldInfo'.static.IsConsoleBuild(CONSOLE_PS3))
    {
        platform = 3;
        bConsole = true;
    }
    else
    {
        // PC interface.
        platform = 2;
    }

    return (platform);
}

function string TRFRONT_GetViewMode()
{
    local string mode;
    local OnlineGameSettings settings;

    settings = OnlineSub.GameInterface.GetGameSettings('MCTS');

    if (settings != none)
    {
        mode = settings.GetPropertyAsStringByName('ViewMode');
    }

	`log("MCTS ViewMode"@mode,,'DevGFxUI');

    return (mode);
}

function OnUserLoginChange(byte LocalUserNum)
{
    m_ClassScene.LoadClassSlots(); 
    ASC_PlayerLogin(OnlineSub.PlayerInterface.GetPlayerNickname(0), "Logged in", true);
}

function OnUserLoginFailed(byte LocalUserNum,EOnlineServerConnectionStatus ErrorCode)
{
    ASC_PlayerLogin("Unknown", string(ErrorCode), false);
}

function bool Login(string userName, string password)
{
	`log("------------------------login ("@userName@") ("@password@")");
    return (OnlineSub.PlayerInterface.Login(0, userName, password, false));
}

function bool TRFRONT_Login(string userName, string password) { return Login(userName, password); }

/**
 * Actionscript calls from UI scenes
 */
function bool  USC_LoadClassData(GFxObject list)                 { return m_ClassScene.LoadClassData(list); }
function bool  USC_LoadClassSlots()                              { return m_ClassScene.LoadClassSlots(); }
function bool  USC_LoadClassDevices(int ClassId, GFxObject list) { return m_ClassScene.LoadClassDevices(ClassId, list); }
function bool  USC_RequestClassSlot(int SlotId, int ClassId)     { return m_ClassScene.RequestClassSlot(SlotId, ClassId); }

/**
 * Actionscript calls to UI scenes
 */
final function ASC_UpdateClassSlot(int SlotId, int ClassId)                    { ActionScriptVoid("asc_UpdateClassSlot"); }
final function ASC_PlayerLogin(String PlayerName, String Reason, bool Success) { ActionScriptVoid("playerLogin"); }

function TRFRONT_RefreshPlayers()
{
	PersonalParty.UiUpdatePartyMembers();
}

function TRFRONT_GetGameModes(GFxObject list)
{
    local int i;
    local UTUIDataProvider_GameModeInfo mode;

    i = 0;
	ForEach GameModeList(mode)
	{	
        list.SetElementString(i++, GetFriendlyName(mode.FriendlyName));
    }
}

function TRFRONT_GetGameMaps(GFxObject list)
{
    local int i;
    local TrUIDataProvider_MapInfo map;

    i = 0;
	ForEach MapList(map)
	{	
        list.SetElementString(i++, GetFriendlyName(map.FriendlyName));
    }
}

function TRFRONT_GetGameSettings(GFxObject list)
{
    local int i;

    i = 0;
    list.SetElementString(i++, "STANDARD");
	list.SetElementString(i++, "NO DEPLOYABLES");
	list.SetElementString(i++, "NO VEHICLES");
}

function TRFRONT_MakeMatch(int nMode)
{
	local string TravelURL;

	TravelURL = "open TrCTF-ArxNovena?Console=False?MaxPlayers=32?MinNetPlayers=0?NumPublicConnections=32?NumPrivateConnections=0?NumOpenPublicConnections=32?NumOpenPrivateConnections=0?bShouldAdvertise=True?bIsLanMatch=False?bUsesStats=True?bAllowJoinInProgress=True?bAllowInvites=True?bUsesPresence=True?bAllowJoinViaPresence=True?bAllowJoinViaPresenceFriendsOnly=False?bUsesArbitration=False?bAntiCheatProtected=False?bIsDedicated=False?PingInMs=0?MatchQuality=0.000000?GameState=OGS_NoSession?GameMode=0?LockedServer=0?TimeLimit=20?GoalScore=5?game=TribesGame.TrGame_TRCTF?name=Player?listen";
	ConsoleCommand(TravelURL);
}

function TRFRONT_HostMatch(int nMode, int nMap)
{
    local string mapName;
    local string gameClass;

    mapName = GameModeList[nMode].Prefixes;
    gameClass = mapName;
    mapName $= "-"$MapList[nMap];

/*
	local string TravelURL;
	TravelURL  = "open "$mapName;
	TravelURL $= "?Console=False?MaxPlayers=32?MinNetPlayers=0?NumPublicConnections=32?NumPrivateConnections=0?NumOpenPublicConnections=32?NumOpenPrivateConnections=0";
    TravelURL $= "?bShouldAdvertise=True?bIsLanMatch=False?bUsesStats=True?bAllowJoinInProgress=True?bAllowInvites=True?bUsesPresence=True?bAllowJoinViaPresence=True";
    TravelURL $= "?bAllowJoinViaPresenceFriendsOnly=False?bUsesArbitration=False?bAntiCheatProtected=False?bIsDedicated=False?PingInMs=0?MatchQuality=0.000000";
    TravelURL $= "?GameState=OGS_NoSession?GameMode=0?LockedServer=0?TimeLimit=20?GoalScore=5?name=Player?listen";
    TravelURL $= "?game=TribesGame.TrGame_"$gameClass;

    ConsoleCommand(TravelURL);
*/

    GameSettings.MapName              = mapName;
    GameSettings.GameMode             = "TribesGame.TrGame_"$gameClass;
    GameSettings.bIsLanMatch          = true;
    GameSettings.bUsesStats           = true;
    GameSettings.bAllowJoinInProgress = true;
    GameSettings.bAllowInvites        = true;

	// Create the online game
    OnlineSub.GameInterface.AddCreateOnlineGameCompleteDelegate(OnGameCreated);

    if (!OnlineSub.GameInterface.CreateOnlineGame(0, 'Game', GameSettings))
	{
        OnlineSub.GameInterface.ClearCreateOnlineGameCompleteDelegate(OnGameCreated);
	}
}

function bool TRFRONT_JoinMatch(int nQueueId)
{
	local OnlineGameSearchResult GameToJoin;

    if (nQueueId < 1)
    {
        return (false);
    }

    nQueueId--;

    if (nQueueId >= Searching.Results.Length)
    {
        // Bit-O-Hack but we are in a out of sync state.
        SearchForServers(true);
        return (false);
    }

    OnlineSub.GameInterface.AddJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
    GameToJoin = Searching.Results[nQueueId];

    if (!OnlineSub.GameInterface.JoinOnlineGame(GetLP().ControllerId, 'Game', GameToJoin))//controllerid
    {
        return (false);
    }

    return (true);
}

function TRFRONT_LeaveMatch(int nQueueId)
{
	local OnlineGameSearchResult GameToJoin;
    OnlineSub.GameInterface.JoinOnlineGame(GetLP().ControllerId, 'Game', GameToJoin);
}

function OnJoinGameComplete(name SessionName,bool bSuccessful)
{
	local string URL;	

	`log("OnJoinGameComplete("@String(SessionName)@","@bSuccessful);
	
	// Figure out if we have an online subsystem registered
	if (bSuccessful)
	{
//		Cleanup();
		// Get the platform specific information
		if (OnlineSub.GameInterface.GetResolvedConnectString('Game',URL))
		{				
			// Call the game specific function to appending/changing the URL
			URL = "open " $ URL;

			`Log(`location @"- Join Game Successful, Traveling: "$URL$"",,'DevUI');                                
			
			// Get the resolved URL and build the part to start it
			ConsoleCommand(URL);                
		}
	}
	else
	{
		OnlineSub.GameInterface.DestroyOnlineGame('Game');
        /*
		if (MenuManager != none)
		{				
			DialogMC = GFxUDKFrontEnd_ErrorDialog(MenuManager.SpawnDialog('ErrorDialog'));
			DialogMC.SetTitle("<Strings:UTGameUI.Errors.ConnectionLost_Title>");
			DialogMC.SetInfo("<Strings:UTGameUI.Errors.ConnectionLost_Message>");		        
			DialogMC.SetButtonLabel("BACK");
			DialogMC.SetBackButton_OnPress(Select_Back);
		}            
*/
	}

	// Remove the delegate from the list
	OnlineSub.GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
}


function TRFRONT_RequestGameSearch(GFxObject info)
{
    SearchForServers();

    /*
    if (GameSearch == none)
    {
        GameSearch = new class'TrDataStore_OnlineGameSearch';
        GameSearch.Init();
    }

    GameSearch.SubmitGameSearch(class'UIInteraction'.static.GetPlayerControllerId(0), true);
*/
}

function TRFRONT_GetServerList(GFxObject list)
{
    local int i;
    local GFxObject item;
    local OnlineGameSettings settings;

    if (Searching.bIsSearchInProgress)
    {
	    `log("TRFRONT_GetServerList - Search still in progress");
        return;
    }

    for (i = 0; i < Searching.Results.Length; i++)
    {
        settings = Searching.Results[i].GameSettings;

        item = CreateObject("Object");
	    item.SetFloat("RefNum",      (i + 1));
	    item.SetString("Flags",      "");
	    item.SetString("ServerName", settings.OwningPlayerName);
	    item.SetString("Map",        settings.GetPropertyAsString(PROPERTY_CUSTOM_MAPNAME));
	    item.SetFloat("Players",     settings.NumPublicConnections);
	    item.SetFloat("GameCount",   settings.NumOpenPrivateConnections);
	    item.SetFloat("MaxPlayers",  settings.NumPublicConnections + settings.NumOpenPublicConnections);
	    item.SetString("Ping",       (settings.PingInMs < 0) ? ("-") : (String(settings.PingInMs)));
	    list.SetElementObject(i, item);
    }

    return;
}

function TRFRONT_CaptureKeyPress()
{
    if (m_KeyBindings != none)
    {
        m_KeyBindings.CaptureModeOn();
    }
}

function TRFRONT_LoadKeyBindings(GFxObject List)
{
    if (m_KeyBindings != none)
    {
        m_KeyBindings.LoadBindings(List);
    }
}

function TRFRONT_SaveKeyBinding(int Index, string keyName)
{
    if (m_KeyBindings != none)
    {
        m_KeyBindings.SaveKeyBind(Index, keyName);
    }
}

function TRFRONT_ResetDefaultKeyBindings()
{
    local PlayerController pc;

    pc = GetPC();

    if (pc != none && m_KeyBindings != none)
    {
        m_KeyBindings.ResetDefaultKeyBindings(pc.PlayerInput);
    }
}

function TRFRONT_GetSetupOptions(String Type, GFxObject list)
{
    local PlayerController pc;
    local GFxTrFront_Setup opts;

    pc = GetPC();

    if (pc != none)
    {
        opts = new(self) class'GFxTrFront_Setup';
        opts.LoadBindings(list, pc.PlayerInput.Bindings);
    }
}

function TRFRONT_LoadControlSettings(GFxObject list)
{
    if (m_ControlSettings != none)
    {
        m_ControlSettings.LoadControlSettings(list);
    }
}

function TRFRONT_ApplyControlSettings(GFxObject list)
{
    if (m_ControlSettings != none)
    {
        m_ControlSettings.SaveControlSettings(list);
    }
}

function TRFRONT_LoadVideoSettings(GFxObject list)
{
    if (m_VideoSettings != none)
    {
        m_VideoSettings.LoadVideoSettings(list);
    }
}

function TRFRONT_ApplyVideoSettings(GFxObject list)
{
    if (m_VideoSettings != none)
    {
        m_VideoSettings.ApplyVideoSettings(list);
    }
}

function TRFRONT_LoadResolutions(GFxObject list)
{
    if (m_VideoSettings != none)
    {
        m_VideoSettings.LoadResolutions(list);
    }
}

function TRFRONT_ApplySetupOptions(String Type, GFxObject list)
{
    local PlayerController pc;
    local GFxTrFront_Setup opts;

    pc = GetPC();

    if (pc != none)
    {
        opts = new(self) class'GFxTrFront_Setup';
        opts.SaveBindings(list, pc.PlayerInput);
    }
}

function TRFRONT_GetCustomGameOptions(String Type, GFxObject list)
{
    local PlayerController pc;
    local GFxTrFront_CustomGameSetup opts;

    pc = GetPC();

    if (pc != none)
    {
        opts = new(self) class'GFxTrFront_CustomGameSetup';
        opts.LoadCustomParameters(list, pc.PlayerInput.Bindings);
    }
}

function TRFRONT_ApplyCustomGameOptions(String Type, GFxObject list)
{
    local PlayerController pc;
    local GFxTrFront_CustomGameSetup opts;

    pc = GetPC();

    if (pc != none)
    {
        opts = new(self) class'GFxTrFront_CustomGameSetup';
        opts.SaveCustomParameters(list, pc.PlayerInput);
    }
}


function TRFRONT_ExitGame()
{
    `log("UI request to close game");
	ConsoleCommand("quit");
}

function bool SearchForServers(optional bool bOverride = false)
{
    local bool bResult;

    if (!bOverride && Searching.bIsSearchInProgress)
    {
        `log("Game server searching already in progress",,'DevOnline');
        return (false);
    }

    Searching = new class'TrGameSearchTrCTF';
    Searching.MaxSearchResults = 20;
    Searching.bIsLanQuery      = FALSE;
    Searching.bUsesArbitration = TRUE;

	// Set the function to call when the search is done
	OnlineSub.GameInterface.AddFindOnlineGamesCompleteDelegate(OnSearchComplete);

	bResult = OnlineSub.GameInterface.FindOnlineGames(0, Searching);

	if (!bResult)
	{
		// should never return false, but just to be safe
		OnlineSub.GameInterface.ClearFindOnlineGamesCompleteDelegate(OnSearchComplete);
	}

	return bResult;
}

function OnSearchComplete(bool bWasSuccessful)
{
	OnlineSub.GameInterface.ClearFindOnlineGamesCompleteDelegate(OnSearchComplete);

    AsUpdateServers();
}



function OnGameCreated(name SessionName,bool bWasSuccessful)
{
	local string TravelURL;
	local string Mutators;
//	local int    OutValue;
	local OnlineGameInterface GameInterface;

	if (!bWasSuccessful)
	{
		`Log("UTUIFrontEnd_HostGame::OnGameCreated - Game Creation Failed.");
        return;
	}

	// Grab the game interface to verify the subsystem supports it
	GameInterface = OnlineSub.GameInterface;

	if (GameInterface == None)
	{
		`Log("GfxTrFront::OnGameCreated - No GameInterface found.");
	}

	// Clear the delegate we set.
	GameInterface.ClearCreateOnlineGameCompleteDelegate(OnGameCreated);

	// append options from the OnlineGameSettings class
	GameSettings.BuildURL(TravelURL);
//    GameSettings.SetStringSettingValue(CONTEXT_LOCKEDSERVER, CONTEXT_LOCKEDSERVER_NO, false);

	// Num play needs to be the number of bots + 1 (the player).
//	if (GameSettings.GetIntProperty(PROPERTY_NUMBOTS, OutValue))
//	{
//		TravelURL $= "?NumPlay=" $ (OutValue+1);
//	}

	// append the game mode
	TravelURL $= "?game=" $ GameSettings.GameMode;

	// Append any mutators
	Mutators = class'GFxUDKFrontEnd_Mutators'.static.GetEnabledMutators();

	if(Len(Mutators) > 0)
	{
		TravelURL $= "?mutator=" $ Mutators;
	}

	// Append Extra Common Options
	TravelURL $= GetCommonOptionsURL();
	TravelURL = "open " $ GameSettings.MapName $ TravelURL $ "?listen";

	`Log("UTUIFrontEnd_HostGame::OnGameCreated - Game Created, Traveling: " $ TravelURL);

	// Do the server travel.
	ConsoleCommand(TravelURL);
}


/** @return Generates a set of URL options common to both instant action and host game. */
function String GetCommonOptionsURL()
{
	local string URL;
//	local string OutStringValue;

	// Set player name using the OnlinePlayerData	    
	URL $= "?name=" $ "Player"; // GetPlayerName();
/*
	// Set player alias
	if(class'UIRoot'.static.GetDataStoreStringValue("<OnlinePlayerData:ProfileData.Alias>", OutStringValue, GetPlayerOwner()) && Len(OutStringValue)>0)
	{
		OutStringValue = Repl(OutStringValue," ","_");
		OutStringValue = Repl(OutStringValue,"?","_");
		OutStringValue = Repl(OutStringValue,"=","_");

		URL $= "?alias="$OutStringValue;
	}
*/
	return URL;
}

function LaunchQuickMatch()
{
    if (QuickMatch != None)
    {
        return;
    }

    QuickMatch = new class'TrMakeQuickMatch';
    QuickMatch.Init(GetLP().ControllerId, CONTEXT_GAME_MODE_TRCTF);
    QuickMatch.Launch();

    return;
}


///////////////////////////////////////////////////////////////////////////////
// Action script interface function wrappers

final function AsUpdatePlayer(int nId, String TagName, String Rank, int nScore, bool bServer, bool bLeader, int nController)
{
    ActionScriptVoid("updatePlayer");
}

final function AsUpdateServers()
{
    ActionScriptVoid("updateServers");
}

final function AsKeyPressCaptured(string KeyName)
{
    ActionScriptVoid("KeyPressCaptured");
}

///////////////////////////////////////////////////////////////////////////////
// Action script callback functions
function noticeViewReady(String viewName)
{
}

function noticeViewClosed(String viewName)
{
}

/** @return Checks to see if the platform is currently connected to a network. */
function bool CheckLinkConnectionAndError(optional string AlternateTitle, optional string AlternateMessage)
{
//    local GFxTrDialog_Error Dialog;
    local bool bResult;

	if(class'GFxUIView'.static.HasLinkConnection())
	{
		bResult = true;
	}
	else
	{
		if (AlternateTitle == "")
		{
			AlternateTitle = "<Strings:UTGameUI.Errors.Error_Title>";
		}
		if (AlternateMessage == "")
		{
			AlternateMessage = "<Strings:UTGameUI.Errors.LinkDisconnected_Message>";
		}

//        Dialog = GFxTrDialog_Error(ConfigureTargetDialog('ErrorDialog'));
//        Dialog.SetTitle(AlternateTitle);
//        Dialog.SetInfo(AlternateMessage);
		bResult = false;
	}

    return bResult;
}

function String GetFriendlyName(String szName)
{
    local String retName;
	local int startIndex, endIndex;
	local array<string> LocPieces;

	// try to resolve the UI string binding into a readable name
	startIndex = InStr(Caps(szName), "<STRINGS:");

	if (startIndex == INDEX_NONE)
	{
		return (szName);
	}

	retName = Right(szName, Len(szName) - startIndex - 9); // 9 = Len("<STRINGS:")
	endIndex = InStr(retName, ">");

	if (endIndex != INDEX_NONE)
	{
		retName = Left(retName, endIndex);
		ParseStringIntoArray(retName, LocPieces, ".", true);

		if (LocPieces.length >= 3)
		{
			retName = Localize(LocPieces[1], LocPieces[2], LocPieces[0]);
		}
	}

    return (retName);
}


/** 
 *  Callback when a CLIK widget with enableInitCallback set to TRUE is initialized.  
 *  Returns TRUE if the widget was handled, FALSE if not. 
 */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    return (true);
}

///////////////////////////////////////////////////////////////////////////////
defaultproperties
{
    bDisplayWithHudOff=TRUE    
    TimingMode=TM_Real
    bInitialized=FALSE
	MovieInfo=SwfMovie'TribesFrontEnd.tr_manager'
	bPauseGameWhileActive=TRUE
	bCaptureInput=true

    SoundThemes(0)=(ThemeName=default,Theme=UISoundTheme'Aud_menu.TrFrontEndTheme')
}*/

defaultproperties
{
   Name="Default__GFxTrFront"
   ObjectArchetype=GFxMoviePlayer'GFxUI.Default__GFxMoviePlayer'
}
