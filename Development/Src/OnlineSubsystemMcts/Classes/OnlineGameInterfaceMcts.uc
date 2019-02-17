/**
 * Class that implements the Mcts (Managed Client to Server) specific functionality
 */
class OnlineGameInterfaceMcts extends OnlineGameInterfaceImpl within OnlineSubsystemCommonImpl
    native
    config(Engine);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** The type of server search we're doing at the moment. */
enum EMctsMatchmakingType
{
    SMT_Invalid,
    SMT_LAN,
    SMT_Internet
};

var         MctsOnlineSettings          MctsSettings;
var const   OnlineVoiceInterfaceMcts    MctsVoiceInt;       // Pointer to the object that handles the voice interface

/** The list of delegates to notify when a game invite is accepted */
var array<delegate<OnGameInviteAccepted> > GameInviteAcceptedDelegates;

/** Game game settings associated with this invite */
var const private OnlineGameSearch InviteGameSearch;

/** This is the list of requested delegates to fire when complete */
var array<delegate<OnRegisterPlayerComplete> > RegisterPlayerCompleteDelegates;

/** This is the list of requested delegates to fire when complete */
var array<delegate<OnUnregisterPlayerComplete> > UnregisterPlayerCompleteDelegates;



///////////////////////////////////////////////////////////////////////////////

native function      SealMatch(optional bool bSeal = true, optional bool bLateSeal = true);
native function      HoldInvites(optional bool bHold = true);
native function      EndGame(optional int nWaitSeconds = 0);

native function bool MatchQueueJoin(int nQueueId);
native function bool MatchQueueLeave(optional int nQueueId = 0);
native function bool MatchChooseClass(int nClassId);
native function bool MatchChooseSkin(int nSkinId);
native function bool MatchAcceptInvite();
native function bool MatchLockIn();
native function bool MatchLobbyEquipItems(int eType, int nItem1, int nItem2);

///////////////////////////////////////////////////////////////////////////////



/**
 * Updates the localized settings/properties for the game in question
 *
 * @param SessionName the name of the session to update
 * @param UpdatedGameSettings the object to update the game settings with
 * @param bShouldRefreshOnlineData whether to submit the data to the backend or not
 *
 * @return true if successful creating the session, false otherwsie
 */
native function bool UpdateOnlineGame(name SessionName,OnlineGameSettings UpdatedGameSettings,optional bool bShouldRefreshOnlineData = false);


function OnlineGameSettings GetGameSettings(name SessionName)
{
    local int SessionIndex;

    if (SessionName == 'Game')
    {
        return (GameSettings);
    }

    SessionIndex = Sessions.Find('SessionName', SessionName);

    if (SessionIndex != INDEX_NONE)
    {
        return Sessions[SessionIndex].GameSettings;
    }

    return None;
}


/**
 * Sets the delegate used to notify the gameplay code when a game invite has been accepted
 *
 * @param LocalUserNum the user to request notification for
 * @param GameInviteAcceptedDelegate the delegate to use for notifications
 */
function AddGameInviteAcceptedDelegate(byte LocalUserNum,delegate<OnGameInviteAccepted> GameInviteAcceptedDelegate)
{
    if (GameInviteAcceptedDelegates.Find(GameInviteAcceptedDelegate) == INDEX_NONE)
    {
        GameInviteAcceptedDelegates[GameInviteAcceptedDelegates.Length] = GameInviteAcceptedDelegate;
    }
}

/**
 * Removes the specified delegate from the notification list
 *
 * @param LocalUserNum the user to request notification for
 * @param GameInviteAcceptedDelegate the delegate to use for notifications
 */
function ClearGameInviteAcceptedDelegate(byte LocalUserNum,delegate<OnGameInviteAccepted> GameInviteAcceptedDelegate)
{
    local int RemoveIndex;

    RemoveIndex = GameInviteAcceptedDelegates.Find(GameInviteAcceptedDelegate);
    if (RemoveIndex != INDEX_NONE)
    {
        GameInviteAcceptedDelegates.Remove(RemoveIndex,1);
    }
}

/**
 * Called when a user accepts a game invitation. Allows the gameplay code a chance
 * to clean up any existing state before accepting the invite. The invite must be
 * accepted by calling AcceptGameInvite() on the OnlineGameInterface after clean up
 * has completed
 *
 * @param InviteResult the search/settings for the game we're joining via invite
 */
delegate OnGameInviteAccepted(const out OnlineGameSearchResult InviteResult);

/**
 * Tells the online subsystem to accept the game invite that is currently pending
 *
 * @param LocalUserNum the local user accepting the invite
 * @param SessionName the name of the session this invite is to be known as
 *
 * @return true if the game invite was able to be accepted, false otherwise
 */
native function bool AcceptGameInvite(byte LocalUserNum,name SessionName);

/**
 * Registers a player with the online service as being part of the online game
 *
 * @param SessionName the name of the session the player is joining
 * @param UniquePlayerId the player to register with the online service
 * @param bWasInvited whether the player was invited to the game or searched for it
 *
 * @return true if the call succeeds, false otherwise
 */
native function bool RegisterPlayer(name SessionName,UniqueNetId PlayerId,bool bWasInvited);

/**
 * Delegate fired when the registration process has completed
 *
 * @param SessionName the name of the session the player joined or not
 * @param PlayerId the player that was unregistered from the online service
 * @param bWasSuccessful true if the async action completed without error, false if there was an error
 */
delegate OnRegisterPlayerComplete(name SessionName,UniqueNetId PlayerId,bool bWasSuccessful);

/**
 * Sets the delegate used to notify the gameplay code that the player
 * registration request they submitted has completed
 *
 * @param RegisterPlayerCompleteDelegate the delegate to use for notifications
 */
function AddRegisterPlayerCompleteDelegate(delegate<OnRegisterPlayerComplete> RegisterPlayerCompleteDelegate)
{
    if (RegisterPlayerCompleteDelegates.Find(RegisterPlayerCompleteDelegate) == INDEX_NONE)
    {
        RegisterPlayerCompleteDelegates[RegisterPlayerCompleteDelegates.Length] = RegisterPlayerCompleteDelegate;
    }
}

/**
 * Removes the specified delegate from the notification list
 *
 * @param RegisterPlayerCompleteDelegate the delegate to use for notifications
 */
function ClearRegisterPlayerCompleteDelegate(delegate<OnRegisterPlayerComplete> RegisterPlayerCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = RegisterPlayerCompleteDelegates.Find(RegisterPlayerCompleteDelegate);
    if (RemoveIndex != INDEX_NONE)
    {
        RegisterPlayerCompleteDelegates.Remove(RemoveIndex,1);
    }
}

/**
 * Unregisters a player with the online service as being part of the online game
 *
 * @param SessionName the name of the session the player is leaving
 * @param PlayerId the player to unregister with the online service
 *
 * @return true if the call succeeds, false otherwise
 */
native function bool UnregisterPlayer(name SessionName,UniqueNetId PlayerId);

/**
 * Delegate fired when the unregistration process has completed
 *
 * @param SessionName the name of the session the player left
 * @param PlayerId the player that was unregistered from the online service
 * @param bWasSuccessful true if the async action completed without error, false if there was an error
 */
delegate OnUnregisterPlayerComplete(name SessionName,UniqueNetId PlayerId,bool bWasSuccessful);

/**
 * Sets the delegate used to notify the gameplay code that the player
 * Unregistration request they submitted has completed
 *
 * @param UnregisterPlayerCompleteDelegate the delegate to use for notifications
 */
function AddUnregisterPlayerCompleteDelegate(delegate<OnUnregisterPlayerComplete> UnregisterPlayerCompleteDelegate)
{
    if (UnregisterPlayerCompleteDelegates.Find(UnregisterPlayerCompleteDelegate) == INDEX_NONE)
    {
        UnregisterPlayerCompleteDelegates[UnregisterPlayerCompleteDelegates.Length] = UnregisterPlayerCompleteDelegate;
    }
}

/**
 * Removes the specified delegate from the notification list
 *
 * @param UnregisterPlayerCompleteDelegate the delegate to use for notifications
 */
function ClearUnregisterPlayerCompleteDelegate(delegate<OnUnregisterPlayerComplete> UnregisterPlayerCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = UnregisterPlayerCompleteDelegates.Find(UnregisterPlayerCompleteDelegate);
    if (RemoveIndex != INDEX_NONE)
    {
        UnregisterPlayerCompleteDelegates.Remove(RemoveIndex,1);
    }
}

/**
 * Fetches the additional data a session exposes outside of the online service.
 * NOTE: notifications will come from the OnFindOnlineGamesComplete delegate
 *
 * @param StartAt the search result index to start gathering the extra information for
 * @param NumberToQuery the number of additional search results to get the data for
 *
 * @return true if the query was started, false otherwise
 */
function bool QueryNonAdvertisedData(int StartAt,int NumberToQuery)
{
    ;  // ignored on Live, too.
    return false;
}

defaultproperties
{
   Name="Default__OnlineGameInterfaceMcts"
   ObjectArchetype=OnlineGameInterfaceImpl'IpDrv.Default__OnlineGameInterfaceImpl'
}
