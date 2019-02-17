class OnlineSubsystemMcts extends OnlineSubsystemCommonImpl
	native
	implements(OnlinePlayerInterface,OnlineSystemInterface,OnlineChatInterface)
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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


var const OnlineGameInterfaceMcts  MctsGameInt;             // Pointer to the object that handles the game interface
var const OnlineVoiceInterfaceMcts MctsVoiceInt;            // Pointer to the object that handles the voice interface

var const localized string  LocalProfileName;               // The name to use for local profiles
var const string            LoggedInPlayerName;             // The name of the player that is logged in
var const UniqueNetId       LoggedInPlayerId;               // The unique id of the logged in player
var const int               LoggedInPlayerNum;              // The number of the player that called the login function
var const ELoginStatus      LoggedInStatus;                 // The current login status for the player
var config string           ProfileDataDirectory;           // The directory profile data should be stored in
var config string           ProfileDataExtension;           // The file extension to use when saving profile data

var array<delegate<OnConnectionStatusChange> >   ConnectionStatusChangeDelegates;       // This is the list of delegates requesting notification Mcts's connection state changes
var array<delegate<OnLoginChange> >              LoginChangeDelegates;                  // This is the list of requested delegates to fire when a login fails to process
var array<delegate<OnLoginFailed> >              LoginFailedDelegates;                  // This is the list of requested delegates to fire when a login fails to process
var array<delegate<OnLogoutCompleted> >          LogoutCompletedDelegates;              // This is the list of requested delegates to fire when a logout completes
var array<delegate<OnLinkStatusChange> >         LinkStatusDelegates;                   // This is the list of delegates requesting notification of network link status changes
var array<delegate<OnChatMessage> >              ChatMessageDelegates;                  // Chat message delegates.


/** Holds the results of async keyboard input */
var const string KeyboardResultsString;

/** Whether the user canceled keyboard input or not */
var const byte bWasKeyboardInputCanceled;

/** Whether the keyboard needs to be ticked */
var const bool bNeedsKeyboardTicking;

/** This is the list of requested delegates to fire when keyboard UI has completed */
var array<delegate<OnKeyboardInputComplete> > KeyboardInputDelegates;


/** Struct to hold current and previous frame's game state */
struct native ControllerConnectionState
{
	/** Whether the controller is connected or not */
	var const int bIsControllerConnected;
	/** Last frame's version of the above */
	var const int bLastIsControllerConnected;
};

/** Upto 4 player split screen support */
var ControllerConnectionState ControllerStates[4];

/** Whether the last frame has connection status or not */
var bool bLastHasConnection;

/** The amount of time to elapse before checking for connection status change */
var float ConnectionPresenceTimeInterval;

/** Used to check when to verify connection status */
var float ConnectionPresenceElapsedTime;

/** Whether to use MCP for news or not */
var const config bool bShouldUseMcp;

/**  Where Mcts notifications will be displayed on the screen */
var config ENetworkNotificationPosition CurrentNotificationPosition;





/**
 * Called from engine start up code to allow the subsystem to initialize
 *
 * @return TRUE if the initialization was successful, FALSE otherwise
 */
native event bool Init();

/**
 * Delegate used in login notifications
 *
 * @param LocalUserNum the player that had the login change
 */
delegate OnLoginChange(byte LocalUserNum);



/**
 * Logs the player into the online service. If this fails, it generates a
 * OnLoginFailed notification
 *
 * @param LocalUserNum the controller number of the associated user
 * @param LoginName the unique identifier for the player
 * @param Password the password for this account
 * @param bWantsLocalOnly whether the player wants to sign in locally only or not
 *
 * @return true if the async call started ok, false otherwise
 */
native function bool Login(byte LocalUserNum,string LoginName,string Password,optional bool bWantsLocalOnly);

/**
 * //$$ JCR - Fires a login with the desired player name, callbacks will determine if it succeeded
 */
native function bool RequestNewPlayer(byte LocalUserNum,string LoginName,string Password,string DesiredPlayerName);

/**
 * Logs the player into the online service using parameters passed on the
 * command line. Expects -Login=<UserName> -Password=<password>. If either
 * are missing, the function returns false and doesn't start the login
 * process
 *
 * @return true if the async call started ok, false otherwise
 */
native function bool AutoLogin();

/**
 * Delegate used in notifying the UI/game that the manual login failed
 *
 * @param LocalUserNum the controller number of the associated user
 * @param ErrorCode the async error code that occurred
 */
delegate OnLoginFailed(byte LocalUserNum,EOnlineServerConnectionStatus ErrorCode);

/**
 * Sets the delegate used to notify the gameplay code that a login failed
 *
 * @param LocalUserNum the controller number of the associated user
 * @param LoginDelegate the delegate to use for notifications
 */
function AddLoginFailedDelegate(byte LocalUserNum,delegate<OnLoginFailed> LoginFailedDelegate)
{
	// Add this delegate to the array if not already present
	if (LoginFailedDelegates.Find(LoginFailedDelegate) == INDEX_NONE)
	{
		LoginFailedDelegates[LoginFailedDelegates.Length] = LoginFailedDelegate;
	}
}

/**
 * Removes the specified delegate from the notification list
 *
 * @param LocalUserNum the controller number of the associated user
 * @param LoginDelegate the delegate to use for notifications
 */
function ClearLoginFailedDelegate(byte LocalUserNum,delegate<OnLoginFailed> LoginFailedDelegate)
{
	local int RemoveIndex;

	// Remove this delegate from the array if found
	RemoveIndex = LoginFailedDelegates.Find(LoginFailedDelegate);
	if (RemoveIndex != INDEX_NONE)
	{
		LoginFailedDelegates.Remove(RemoveIndex,1);
	}
}

/**
 * Signs the player out of the online service
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return TRUE if the call succeeded, FALSE otherwise
 */
native function bool Logout(byte LocalUserNum);

/**
 * Delegate used in notifying the UI/game that the manual logout completed
 *
 * @param bWasSuccessful whether the async call completed properly or not
 */
delegate OnLogoutCompleted(bool bWasSuccessful);

/**
 * Sets the delegate used to notify the gameplay code that a logout completed
 *
 * @param LocalUserNum the controller number of the associated user
 * @param LogoutDelegate the delegate to use for notifications
 */
function AddLogoutCompletedDelegate(byte LocalUserNum,delegate<OnLogoutCompleted> LogoutDelegate)
{
	// Add this delegate to the array if not already present
	if (LogoutCompletedDelegates.Find(LogoutDelegate) == INDEX_NONE)
	{
		LogoutCompletedDelegates[LogoutCompletedDelegates.Length] = LogoutDelegate;
	}
}

/**
 * Removes the specified delegate from the notification list
 *
 * @param LocalUserNum the controller number of the associated user
 * @param LogoutDelegate the delegate to use for notifications
 */
function ClearLogoutCompletedDelegate(byte LocalUserNum,delegate<OnLogoutCompleted> LogoutDelegate)
{
	local int RemoveIndex;

	// Remove this delegate from the array if found
	RemoveIndex = LogoutCompletedDelegates.Find(LogoutDelegate);
	if (RemoveIndex != INDEX_NONE)
	{
		LogoutCompletedDelegates.Remove(RemoveIndex,1);
	}
}

/**
 * Fetches the login status for a given player
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return the enum value of their status
 */
native function ELoginStatus GetLoginStatus(byte LocalUserNum);

/**
 * Determines whether the specified user is a guest login or not
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return true if a guest, false otherwise
 */
function bool IsGuestLogin(byte LocalUserNum);

/**
 * Determines whether the specified user is a local (non-online) login or not
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return true if a local profile, false otherwise
 */
function bool IsLocalLogin(byte LocalUserNum);

/**
 * Gets the platform specific unique id for the specified player
 *
 * @param LocalUserNum the controller number of the associated user
 * @param PlayerId the byte array that will receive the id
 *
 * @return TRUE if the call succeeded, FALSE otherwise
 */
function bool GetUniquePlayerId(byte LocalUserNum,out UniqueNetId PlayerId)
{
	PlayerId = LoggedInPlayerId;
	;	
	return true;
}

/**
 * Reads the player's nick name from the online service
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return a string containing the players nick name
 */
function string GetPlayerNickname(byte LocalUserNum)
{
	//return LoggedInPlayerName;
    return GetPlayerMctsName();
}

/**
 * Determines whether the player is allowed to play online
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return the Privilege level that is enabled
 */
native function EFeaturePrivilegeLevel CanPlayOnline(byte LocalUserNum);


/**
 * Determines whether the player is allowed to download user created content
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return the Privilege level that is enabled
 */
function EFeaturePrivilegeLevel CanDownloadUserContent(byte LocalUserNum)
{
	return CanPlayOnline(LocalUserNum);
}

/**
 * Determines whether the player is allowed to buy content online
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return the Privilege level that is enabled
 */
function EFeaturePrivilegeLevel CanPurchaseContent(byte LocalUserNum)
{
	return FPL_Enabled;
}

/**
 * Determines whether the player is allowed to view other people's player profile
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return the Privilege level that is enabled
 */
function EFeaturePrivilegeLevel CanViewPlayerProfiles(byte LocalUserNum)
{
	return FPL_Enabled;
}

/**
 * Determines whether the player is allowed to have their online presence
 * information shown to remote clients
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return the Privilege level that is enabled
 */
function EFeaturePrivilegeLevel CanShowPresenceInformation(byte LocalUserNum)
{
	return FPL_Enabled;
}

/**
 * Checks that a unique player id is part of the specified user's friends list
 *
 * @param LocalUserNum the controller number of the associated user
 * @param PlayerId the id of the player being checked
 *
 * @return TRUE if a member of their friends list, FALSE otherwise
 */
native function bool IsFriend(byte LocalUserNum,UniqueNetId PlayerId);

/**
 * Checks that whether a group of player ids are among the specified player's
 * friends
 *
 * @param LocalUserNum the controller number of the associated user
 * @param Query an array of players to check for being included on the friends list
 *
 * @return TRUE if the call succeeded, FALSE otherwise
 */
native function bool AreAnyFriends(byte LocalUserNum,out array<FriendsQuery> Query);


native function string GetPlayerMctsName();

/**
 * Sets the delegate used to notify the gameplay code that a login changed
 *
 * @param LoginDelegate the delegate to use for notifications
 */
function AddLoginChangeDelegate(delegate<OnLoginChange> LoginDelegate)
{
	// Add this delegate to the array if not already present
	if (LoginChangeDelegates.Find(LoginDelegate) == INDEX_NONE)
	{
		LoginChangeDelegates[LoginChangeDelegates.Length] = LoginDelegate;
	}
}

/**
 * Removes the specified delegate from the notification list
 *
 * @param LoginDelegate the delegate to use for notifications
 */
function ClearLoginChangeDelegate(delegate<OnLoginChange> LoginDelegate)
{
	local int RemoveIndex;

	// Remove this delegate from the array if found
	RemoveIndex = LoginChangeDelegates.Find(LoginDelegate);
	if (RemoveIndex != INDEX_NONE)
	{
		LoginChangeDelegates.Remove(RemoveIndex,1);
	}
}


/**
 * //$$JR - Call to find whether the player needs to accept the latest EULA
 */
native function bool NeedEULA();


/**
 * Returns the name of the player for the specified index
 *
 * @param UserIndex the user to return the name of
 *
 * @return the name of the player at the specified index
 */
event string GetPlayerNicknameFromIndex(int UserIndex)
{
	if (UserIndex == 0)
	{
		//return LoggedInPlayerName;
        return GetPlayerMctsName();
	}
	return "";
}

/**
 * Returns the unique id of the player for the specified index
 *
 * @param UserIndex the user to return the id of
 *
 * @return the unique id of the player at the specified index
 */
event UniqueNetId GetPlayerUniqueNetIdFromIndex(int UserIndex)
{
	local UniqueNetId Zero;

	if (UserIndex == 0)
	{
		return LoggedInPlayerId;
	}
	return Zero;
}

/**
 * Determines if the ethernet link is connected or not
 */
native function bool HasLinkConnection();

/**
 * Delegate fired when the network link status changes
 *
 * @param bIsConnected whether the link is currently connected or not
 */
delegate OnLinkStatusChange(bool bIsConnected);

/**
 * Adds the delegate used to notify the gameplay code that link status changed
 *
 * @param LinkStatusDelegate the delegate to use for notifications
 */
function AddLinkStatusChangeDelegate(delegate<OnLinkStatusChange> LinkStatusDelegate)
{
	// Only add to the list once
	if (LinkStatusDelegates.Find(LinkStatusDelegate) == INDEX_NONE)
	{
		LinkStatusDelegates[LinkStatusDelegates.Length] = LinkStatusDelegate;
	}
}

/**
 * Removes the delegate from the notify list
 *
 * @param LinkStatusDelegate the delegate to remove
 */
function ClearLinkStatusChangeDelegate(delegate<OnLinkStatusChange> LinkStatusDelegate)
{
	local int RemoveIndex;
	// See if the specified delegate is in the list
	RemoveIndex = LinkStatusDelegates.Find(LinkStatusDelegate);
	if (RemoveIndex != INDEX_NONE)
	{
		LinkStatusDelegates.Remove(RemoveIndex,1);
	}
}

/**
 * Delegate fired when an external UI display state changes (opening/closing)
 *
 * @param bIsOpening whether the external UI is opening or closing
 */
delegate OnExternalUIChange(bool bIsOpening);

/**
 * Sets the delegate used to notify the gameplay code that external UI state
 * changed (opened/closed)
 *
 * @param ExternalUIDelegate the delegate to use for notifications
 */
function AddExternalUIChangeDelegate(delegate<OnExternalUIChange> ExternalUIDelegate);

/**
 * Removes the delegate from the notification list
 *
 * @param ExternalUIDelegate the delegate to remove
 */
function ClearExternalUIChangeDelegate(delegate<OnExternalUIChange> ExternalUIDelegate);

/**
 * Determines the current notification position setting
 */
function ENetworkNotificationPosition GetNetworkNotificationPosition()
{
	return CurrentNotificationPosition;
}

delegate OnControllerChange(int ControllerId,bool bIsConnected);
function AddControllerChangeDelegate(delegate<OnControllerChange> ControllerChangeDelegate);
function ClearControllerChangeDelegate(delegate<OnControllerChange> ControllerChangeDelegate);

/**
 * Determines if the specified controller is connected or not
 *
 * @param ControllerId the controller to query
 *
 * @return true if connected, false otherwise
 */
native function bool IsControllerConnected(int ControllerId);

// Delegate fire when the online server connection state changes
delegate OnConnectionStatusChange(EOnlineServerConnectionStatus ConnectionStatus);

function AddConnectionStatusChangeDelegate(delegate<OnConnectionStatusChange> ConnectionStatusDelegate)
{
	if (ConnectionStatusChangeDelegates.Find(ConnectionStatusDelegate) == INDEX_NONE)
	{
		ConnectionStatusChangeDelegates[ConnectionStatusChangeDelegates.Length] = ConnectionStatusDelegate;
	}
}

function ClearConnectionStatusChangeDelegate(delegate<OnConnectionStatusChange> ConnectionStatusDelegate)
{
	local int RemoveIndex;

	RemoveIndex = ConnectionStatusChangeDelegates.Find(ConnectionStatusDelegate);

	if (RemoveIndex != INDEX_NONE)
	{
		ConnectionStatusChangeDelegates.Remove(RemoveIndex, 1);
	}
}

/**
 * Determines the NAT type the player is using
 */
native function ENATType GetNATType();

/**
 * Delegate fired when a storage device change is detected
 */
delegate OnStorageDeviceChange();

/**
 * Adds the delegate to the list to be notified when a storage device changes
 *
 * @param StorageDeviceChangeDelegate the delegate to add
 */
function AddStorageDeviceChangeDelegate(delegate<OnStorageDeviceChange> StorageDeviceChangeDelegate);

/**
 * Removes the delegate from the notify list
 *
 * @param StorageDeviceChangeDelegate the delegate to remove
 */
function ClearStorageDeviceChangeDelegate(delegate<OnStorageDeviceChange> StorageDeviceChangeDelegate);


/** Delegate used when a chat message has been received. */
delegate OnChatMessage(int Channel, string Sender, string Message);

/** Adds the delegate used to notify when a chat message has been received. */
function AddChatMessageDelegate(delegate<OnChatMessage> ChatDelegate)
{
	// Only add to the list once
	if (ChatMessageDelegates.Find(ChatDelegate) == INDEX_NONE)
	{
		ChatMessageDelegates[ChatMessageDelegates.Length] = ChatDelegate;
	}
}

/** Adds the delegate used to notify when a chat message has been received. */
function ClearChatMessageDelegate(delegate<OnChatMessage> ChatDelegate)
{
	local int RemoveIndex;
	RemoveIndex = ChatMessageDelegates.Find(ChatDelegate);
	if (RemoveIndex != INDEX_NONE)
	{
		ChatMessageDelegates.Remove(RemoveIndex,1);
	}
}

/** Sends a chat message on the designated channel. */
native function SendChatMessage(int Channel, string Message);

/** Sends a chat message to the designated player. */
native function SendPrivateChatMessage(string PlayerName, string Message);

/** Sets the player's classes for use in-game from the configuration menu. */
native function WriteActiveCharacterClass(int ClassId);

/** Gets all the player's classes he has ever owned. */
native function ReadCharacterClasses(out array<int> CharList);

/** Gets the player's classes available for us in-game. */
native function int ReadActiveCharacterClass();

/** Server sets the updated profile data after a match. */
native function bool WritePlayerProfileData(qword UniqueId, TgPlayerProfile Profile);

/** Retrieve player profile data - Rank, XP, GP */
native function bool ReadPlayerProfileData(qword UniqueId, TgPlayerProfile Profile);

/** Notifies the subsystem of a team change. */
native function NotifyTeamChange(QWORD PlayerUid, byte TeamId);

/** Notifies the subsystem of a team change. */
native function int GetCharacterIdFromClassId(qword UniqueId, int nClassId);

/**
 * Checks that a unique player id is on the specified user's mute list
 *
 * @param LocalUserNum the controller number of the associated user
 * @param PlayerId the id of the player being checked
 *
 * @return TRUE if the player should be muted, FALSE otherwise
 */
function bool IsMuted(byte LocalUserNum,UniqueNetId PlayerId);

/**
 * Determines whether the player is allowed to use voice or text chat online
 *
 * @param LocalUserNum the controller number of the associated user
 *
 * @return the Privilege level that is enabled
 */
native function EFeaturePrivilegeLevel CanCommunicate(byte LocalUserNum);

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
delegate OnLoginStatusChange(ELoginStatus NewStatus,UniqueNetId NewId);
function AddLoginStatusChangeDelegate(delegate<OnLoginStatusChange> LoginStatusDelegate,byte LocalUserNum);
function ClearLoginStatusChangeDelegate(delegate<OnLoginStatusChange> LoginStatusDelegate,byte LocalUserNum);

delegate OnLoginCancelled();
function AddLoginCancelledDelegate(delegate<OnLoginCancelled> CancelledDelegate);
function ClearLoginCancelledDelegate(delegate<OnLoginCancelled> CancelledDelegate);

function bool ReadProfileSettings(byte LocalUserNum,OnlineProfileSettings ProfileSettings);
function bool WriteProfileSettings(byte LocalUserNum,OnlineProfileSettings ProfileSettings);
function OnlineProfileSettings GetProfileSettings(byte LocalUserNum);

delegate OnMutingChange();
function AddMutingChangeDelegate(delegate<OnMutingChange> MutingDelegate);
function ClearMutingChangeDelegate(delegate<OnMutingChange> MutingDelegate);

delegate OnReadProfileSettingsComplete(byte LocalUserNum,bool bWasSuccessful);
function AddReadProfileSettingsCompleteDelegate(byte LocalUserNum,delegate<OnReadProfileSettingsComplete> ReadProfileSettingsCompleteDelegate);
function ClearReadProfileSettingsCompleteDelegate(byte LocalUserNum,delegate<OnReadProfileSettingsComplete> ReadProfileSettingsCompleteDelegate);

delegate OnWriteProfileSettingsComplete(byte LocalUserNum,bool bWasSuccessful);
function AddWriteProfileSettingsCompleteDelegate(byte LocalUserNum,delegate<OnWriteProfileSettingsComplete> WriteProfileSettingsCompleteDelegate);
function ClearWriteProfileSettingsCompleteDelegate(byte LocalUserNum,delegate<OnWriteProfileSettingsComplete> WriteProfileSettingsCompleteDelegate);

function bool ReadPlayerStorage(byte LocalUserNum,OnlinePlayerStorage PlayerStorage,optional int DeviceId = -1);
delegate OnReadPlayerStorageComplete(byte LocalUserNum,bool bWasSuccessful);
function AddReadPlayerStorageCompleteDelegate(byte LocalUserNum,delegate<OnReadPlayerStorageComplete> ReadPlayerStorageCompleteDelegate);
function ClearReadPlayerStorageCompleteDelegate(byte LocalUserNum,delegate<OnReadPlayerStorageComplete> ReadPlayerStorageCompleteDelegate);

function bool ReadPlayerStorageForNetId(byte LocalUserNum,UniqueNetId NetId,OnlinePlayerStorage PlayerStorage);
delegate OnReadPlayerStorageForNetIdComplete(UniqueNetId NetId,bool bWasSuccessful);
function AddReadPlayerStorageForNetIdCompleteDelegate(UniqueNetId NetId,delegate<OnReadPlayerStorageForNetIdComplete> ReadPlayerStorageForNetIdCompleteDelegate);
function ClearReadPlayerStorageForNetIdCompleteDelegate(UniqueNetId NetId,delegate<OnReadPlayerStorageForNetIdComplete> ReadPlayerStorageForNetIdCompleteDelegate);

function OnlinePlayerStorage GetPlayerStorage(byte LocalUserNum);
function bool WritePlayerStorage(byte LocalUserNum,OnlinePlayerStorage PlayerStorage,optional int DeviceId = -1);
delegate OnWritePlayerStorageComplete(byte LocalUserNum,bool bWasSuccessful);
function AddWritePlayerStorageCompleteDelegate(byte LocalUserNum,delegate<OnWritePlayerStorageComplete> WritePlayerStorageCompleteDelegate);
function ClearWritePlayerStorageCompleteDelegate(byte LocalUserNum,delegate<OnWritePlayerStorageComplete> WritePlayerStorageCompleteDelegate);

delegate OnFriendsChange();
function AddFriendsChangeDelegate(byte LocalUserNum,delegate<OnFriendsChange> FriendsDelegate);
function ClearFriendsChangeDelegate(byte LocalUserNum,delegate<OnFriendsChange> FriendsDelegate);

function bool ReadFriendsList(byte LocalUserNum,optional int Count,optional int StartingAt);
delegate OnReadFriendsComplete(bool bWasSuccessful);
function AddReadFriendsCompleteDelegate(byte LocalUserNum,delegate<OnReadFriendsComplete> ReadFriendsCompleteDelegate);
function ClearReadFriendsCompleteDelegate(byte LocalUserNum,delegate<OnReadFriendsComplete> ReadFriendsCompleteDelegate);
function EOnlineEnumerationReadState GetFriendsList(byte LocalUserNum,out array<OnlineFriend> Friends,optional int Count,optional int StartingAt);

function SetOnlineStatus(byte LocalUserNum,int StatusId,const out array<LocalizedStringSetting> LocalizedStringSettings,const out array<SettingsProperty> Properties);

function bool ShowKeyboardUI(byte LocalUserNum,string TitleText,string DescriptionText,optional bool bIsPassword = false,optional bool bShouldValidate = true,optional string DefaultText,optional int MaxResultLength = 256);
delegate OnKeyboardInputComplete(bool bWasSuccessful);
function AddKeyboardInputDoneDelegate(delegate<OnKeyboardInputComplete> InputDelegate);
function ClearKeyboardInputDoneDelegate(delegate<OnKeyboardInputComplete> InputDelegate);
function string GetKeyboardInputResults(out byte bWasCanceled);

function bool AddFriend(byte LocalUserNum,UniqueNetId NewFriend,optional string Message);
function bool AddFriendByName(byte LocalUserNum,string FriendName,optional string Message);

delegate OnAddFriendByNameComplete(bool bWasSuccessful);
function AddAddFriendByNameCompleteDelegate(byte LocalUserNum,delegate<OnAddFriendByNameComplete> FriendDelegate);
function ClearAddFriendByNameCompleteDelegate(byte LocalUserNum,delegate<OnAddFriendByNameComplete> FriendDelegate);
function bool AcceptFriendInvite(byte LocalUserNum,UniqueNetId RequestingPlayer);
function bool DenyFriendInvite(byte LocalUserNum,UniqueNetId RequestingPlayer);
function bool RemoveFriend(byte LocalUserNum,UniqueNetId FormerFriend);

delegate OnFriendInviteReceived(byte LocalUserNum,UniqueNetId RequestingPlayer,string RequestingNick,string Message);
function AddFriendInviteReceivedDelegate(byte LocalUserNum,delegate<OnFriendInviteReceived> InviteDelegate);
function ClearFriendInviteReceivedDelegate(byte LocalUserNum,delegate<OnFriendInviteReceived> InviteDelegate);
function bool SendMessageToFriend(byte LocalUserNum,UniqueNetId Friend,string Message);
function bool SendGameInviteToFriend(byte LocalUserNum,UniqueNetId Friend,optional string Text);
function bool SendGameInviteToFriends(byte LocalUserNum,array<UniqueNetId> Friends,optional string Text);

delegate OnReceivedGameInvite(byte LocalUserNum,string InviterName);
function AddReceivedGameInviteDelegate(byte LocalUserNum,delegate<OnReceivedGameInvite> ReceivedGameInviteDelegate);
function ClearReceivedGameInviteDelegate(byte LocalUserNum,delegate<OnReceivedGameInvite> ReceivedGameInviteDelegate);

function bool JoinFriendGame(byte LocalUserNum,UniqueNetId Friend);
delegate OnJoinFriendGameComplete(bool bWasSuccessful);
function AddJoinFriendGameCompleteDelegate(delegate<OnJoinFriendGameComplete> JoinFriendGameCompleteDelegate);
function ClearJoinFriendGameCompleteDelegate(delegate<OnJoinFriendGameComplete> JoinFriendGameCompleteDelegate);

function GetFriendMessages(byte LocalUserNum,out array<OnlineFriendMessage> FriendMessages);
delegate OnFriendMessageReceived(byte LocalUserNum,UniqueNetId SendingPlayer,string SendingNick,string Message);
function AddFriendMessageReceivedDelegate(byte LocalUserNum,delegate<OnFriendMessageReceived> MessageDelegate);
function ClearFriendMessageReceivedDelegate(byte LocalUserNum,delegate<OnFriendMessageReceived> MessageDelegate);


function bool UnlockAchievement(byte LocalUserNum,int AchievementId);
function bool ReadAchievements(byte LocalUserNum,optional int TitleId = 0,optional bool bShouldReadText = true,optional bool bShouldReadImages = false);
function EOnlineEnumerationReadState GetAchievements(byte LocalUserNum,out array<AchievementDetails> Achievements,optional int TitleId = 0);

delegate OnUnlockAchievementComplete(bool bWasSuccessful);
function AddUnlockAchievementCompleteDelegate(byte LocalUserNum,delegate<OnUnlockAchievementComplete> UnlockAchievementCompleteDelegate);
function ClearUnlockAchievementCompleteDelegate(byte LocalUserNum,delegate<OnUnlockAchievementComplete> UnlockAchievementCompleteDelegate);

delegate OnReadAchievementsComplete(int TitleId);
function AddReadAchievementsCompleteDelegate(byte LocalUserNum,delegate<OnReadAchievementsComplete> ReadAchievementsCompleteDelegate);
function ClearReadAchievementsCompleteDelegate(byte LocalUserNum,delegate<OnReadAchievementsComplete> ReadAchievementsCompleteDelegate);


function bool DeleteMessage(byte LocalUserNum,int MessageIndex);
function bool ShowFriendsUI(byte LocalUserNum);
function bool ShowLoginUI(optional bool bShowOnlineOnly = false);

function SetNetworkNotificationPosition(ENetworkNotificationPosition NewPos);

function int GetLocale();

defaultproperties
{
   LoggedInPlayerName="Local Profile"
   CurrentNotificationPosition=NNP_BottomRight
   ConnectionPresenceTimeInterval=0.500000
   Name="Default__OnlineSubsystemMcts"
   ObjectArchetype=OnlineSubsystemCommonImpl'IpDrv.Default__OnlineSubsystemCommonImpl'
}
