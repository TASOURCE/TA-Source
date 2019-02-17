/**
 * GFxTrScene_Game
 */

class GFxTrScene_PlayNow extends GFxTrScene;
/*    native;

var string LastGameTypeRequest;

var TrGameSearchCommon   Searching;
var TrGameSettingsCommon GameSettings;

struct native MatchData
{
    var int SiteId;
    var int QueueId;
    var int ActiveMatches;
    var int PlayersQueued;
    var int PlayersInGame;
};

var native array<MatchData> MatchDataList;

native function     ForceGoHome();
native function     StoreMatchData();
native function     RequestMatchData();
native function     OpenLocal(string URL);
native function int RetrieveMatchDataIndex(int QueueId);

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();
    
    Searching     = new class'TrGameSearchTrCTF';
    GameSettings  = new class'TrGameSettingsCommon';

    LastGameTypeRequest = "CTF";

    RequestMatchData();

    bSceneCreated = true;
}

function JoinMatch(string GameType, int MapId)
{
    switch (GameType)
    {
    case "CTF":
        JoinQueue(426);
        break;
    case "Rabbit":
        JoinQueue(428);
        break;
    case "TDM":
        JoinQueue(425);
        break;
    case "Skiing Tutorial":
        JoinLocalGame("TrTraining-SkiTutorial.fmap?m_bRoamingMap=true");
        break;
    case "Target Practice":
        JoinLocalGame("TrTraining-Crossfire.fmap?m_bRoamingMap=true");
        break;
    case "Practice":
        switch (MapId)
        {
        case 0: // Bella Omega
            JoinLocalGame("TrCTF-BellaOmega.fmap?m_bRoamingMap=true");
            break;
        case 1: // Crossfire
            JoinLocalGame("TrCTF-Crossfire.fmap?m_bRoamingMap=true");
            break;
        case 2: // Drydock
            JoinLocalGame("TrCTF-Drydock.fmap?m_bRoamingMap=true");
            break;
        case 3: // Katabatic
            JoinLocalGame("TrCTF-Katabatic.fmap?m_bRoamingMap=true");
            break;
		case 3: // Crossfire rabbit
            JoinLocalGame("TrRabbit-Crossfire.fmap?m_bRoamingMap=true");
            break;
        default:
            break;
        }
        break;
    default:
        break;
    }
}

function JoinCTF()
{
    TrOuter.m_User.SaveGameType("CAPTURE THE FLAG");

    JoinQueue(426);
}

function JoinVIPCTF()
{
    if (TrOuter.m_PlayerProfile.bVIP)
    {
        JoinQueue(430);
    }
}

function JoinRabbit()
{
    TrOuter.m_User.SaveGameType("RABBIT");

    JoinQueue(428);
}

function JoinTDM()
{
    TrOuter.m_User.SaveGameType("TEAM DEATHMATCH");

    JoinQueue(425);
}

function JoinVIPRabbit()
{
    if (TrOuter.m_PlayerProfile.bVIP)
    {
        JoinQueue(431);
    }
}

function bool JoinQueue(int nQueueId)
{
    TrOuter.MenuSounds.SoundSelectedQueue();

    if (!OnlineGameInterfaceMcts(OnlineSub.GameInterface).MatchQueueJoin(nQueueId))
    {
        TrOuter.ASC_PopupError("Unable to join matchmaking. Please try again.");

        // Trying to lock down all rogue states
        LeaveMatchmaking();
        return false;
    }
    
    return true;
}

function LeaveMatch()
{
    TrOuter.MenuSounds.SoundSelectedExit();

    if (TrOuter.m_bInGame)
    {
        TrOuter.ExitGameInProgress();
    }
    else
    {
        LeaveMatchmaking();
    }
}

function LeaveMatchmaking()
{
    OnlineGameInterfaceMcts(OnlineSub.GameInterface).MatchQueueLeave();
    ForceGoHome();
}

function RefreshMatchData()
{
    RequestMatchData();
}

function UpdateMatchData(string GameType)
{
    local int index;
    local int queueId;

    if (!TrOuter.m_bProfileLoaded) return;

    if (GameType == "") GameType = LastGameTypeRequest;

    switch (GameType)
    {
    case "CTF":
        queueId = 426;
        break;
    case "Rabbit":
        queueId = 428;
        break;
    case "Tutorial":
    case "Practice":
    default:
        queueId = 0;
        break;
    }

    index = RetrieveMatchDataIndex(queueId);

    if (index >= 0 && index < MatchDataList.Length)
    {
        TrOuter.ASC_UpdateMatchData(GameType, MatchDataList[index].ActiveMatches, MatchDataList[index].PlayersQueued, MatchDataList[index].PlayersInGame);
    }
    else
    {
        TrOuter.ASC_UpdateMatchData(GameType, 0, 0, 0);
    }

    LastGameTypeRequest = GameType;
}

function JoinLocalGame(string SessionName)
{
	//local string URL;

    TrOuter.MenuSounds.SoundSelectedQueue();

    // Show the loading screen while we are taken into the match
    //TrOuter.SetMenuState(EMS_LOADING);

	// Call the game specific function to appending/changing the URL
	//URL = "open " $ SessionName;

	`Log(`location @"- Join Local Game , Traveling: "$SessionName$"",,'DevUI');                                
	
	// Get the resolved URL and build the part to start it
	OpenLocal(SessionName);
}

function OnJoinGameComplete(name SessionName,bool bSuccessful)
{
	local string URL;	

	`log("OnJoinGameComplete("@String(SessionName)@","@bSuccessful);
	
	// Figure out if we have an online subsystem registered
	if (bSuccessful)
	{
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
	}

	// Remove the delegate from the list
	OnlineSub.GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
}

function RequestGameSearch(GFxObject info)
{
    SearchForServers();
}

function GetServerList(GFxObject list)
{
    local int i;
    local GFxObject item;
    local OnlineGameSettings settings;

    if (Searching.bIsSearchInProgress)
    {
	    `log("GetServerList - Search still in progress");
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

function OnGameCreated(name SessionName,bool bWasSuccessful)
{
	local string TravelURL;
	local string Mutators;
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
		`Log("GfxTrScene_Game::OnGameCreated - No GameInterface found.");
	}

	// Clear the delegate we set.
	GameInterface.ClearCreateOnlineGameCompleteDelegate(OnGameCreated);

	// append options from the OnlineGameSettings class
	GameSettings.BuildURL(TravelURL);

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

    // Not showing server on the screen at this point
    //GFxTrMenuMoviePlayer(Outer).ASC_UpdateServers();
}

function String GetCommonOptionsURL()
{
	local string URL;

	// Set player name using the OnlinePlayerData	    
	URL $= "?name=" $ "Player";

	return URL;
}*/

defaultproperties
{
   Name="Default__GFxTrScene_PlayNow"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
