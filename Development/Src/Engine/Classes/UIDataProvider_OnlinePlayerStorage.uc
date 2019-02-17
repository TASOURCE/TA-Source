/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This class is responsible for mapping properties in an OnlineGameSettings
 * object to something that the UI system can consume.
 */
class UIDataProvider_OnlinePlayerStorage extends UIDataProvider_OnlinePlayerDataBase
	native(inherit)
	config(Game)
	dependson(OnlineSubsystem)
	transient;

/** The storage settings that are used to load/save with the online subsystem */
var OnlinePlayerStorage Profile;

/** For displaying in the provider tree */
var const name ProviderName;

/**
 * If there was an error, it was possible the read was already in progress. This
 * indicates to re-read upon a good completion
 */
var bool bWasErrorLastRead;

/** Keeps a list of providers for each storage settings id */
struct native PlayerStorageArrayProvider
{
	/** The storage settings id that this provider is for */
	var int PlayerStorageId;
	/** Cached to avoid extra look ups */
	var name PlayerStorageName;
	/** The provider object to expose the data with */
	var UIDataProvider_OnlinePlayerStorageArray Provider;
};

/** The list of mappings from settings id to their provider */
var array<PlayerStorageArrayProvider> PlayerStorageArrayProviders;

/** The amount of storage needed for this game */
var config int DeviceStorageSizeNeeded;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Reads the data
 *
 * @param PlayerInterface is the OnlinePlayerInterface used
 * @param LocalUserNum the user that we are reading the data for
 * @param DeviceId device for local read of player data (-1 for no device)
 * @param PlayerStorage the object to copy the results to and contains the list of items to read
 *
 * @return true if the call succeeds, false otherwise
 */
function bool ReadData(OnlinePlayerInterface PlayerInterface, byte LocalUserNum, int DeviceId, OnlinePlayerStorage PlayerStorage)
{
	return PlayerInterface.ReadPlayerStorage(LocalUserNum, PlayerStorage, DeviceId);
}

/**
 * Writes the online  data for a given local user to the online data store
 *
 * @param PlayerInterface is the OnlinePlayerInterface used
 * @param LocalUserNum the user that we are writing the data for
 * @param DeviceId device for local write of player data (-1 for no device)
 * @param PlayerStorage the object that contains the list of items to write
 *
 * @return true if the call succeeds, false otherwise
 */
function bool WriteData(OnlinePlayerInterface PlayerInterface, byte LocalUserNum, int DeviceId, OnlinePlayerStorage PlayerStorage)
{
	return PlayerInterface.WritePlayerStorage(LocalUserNum,PlayerStorage, DeviceId);
}

/**
 * Fetches the requested object from the online layer's cache
 *
 * @param PlayerInterface is the OnlinePlayerInterface used
 * @param LocalUserNum the user that we are writing the data for
 * @param PlayerStorage the object that contains the list of items to write
 *
 * @return true if the call succeeds, false otherwise
 */
function bool GetData(OnlinePlayerInterface PlayerInterface, byte LocalUserNum,OnlinePlayerStorage PlayerStorage)
{
	local OnlinePlayerStorage CachedStorage;

	CachedStorage = PlayerInterface.GetPlayerStorage(LocalUserNum);
	if (CachedStorage != None)
	{
		// If there is one in the cache, the read will return immediately
		PlayerInterface.ReadPlayerStorage(LocalUserNum, PlayerStorage);
		PlayerStorage.DeviceId = CachedStorage.DeviceId;
		return true;
	}
	return false;
}

/**
 * Sets the delegate used to notify the gameplay code that the last read request has completed 
 *
 * @param PlayerInterface is the OnlinePlayerInterface used
 * @param LocalUserNum which user to watch for read complete notifications
 */
function AddReadCompleteDelegate(OnlinePlayerInterface PlayerInterface, byte LocalUserNum)
{
	PlayerInterface.AddReadPlayerStorageCompleteDelegate(LocalUserNum,OnReadStorageComplete);
}

/**
 * Clears the delegate used to notify the gameplay code that the last read request has completed 
 *
 * @param PlayerInterface is the OnlinePlayerInterface used
 * @param LocalUserNum which user to stop watching for read complete notifications
 */
function ClearReadCompleteDelegate(OnlinePlayerInterface PlayerInterface, byte LocalUserNum)
{
	PlayerInterface.ClearReadPlayerStorageCompleteDelegate(LocalUserNum,OnReadStorageComplete);
}

/**
 * Binds the player to this provider. Starts the async friends list gathering
 *
 * @param InPlayer the player that we are retrieving friends for
 */
event OnRegister(LocalPlayer InPlayer)
{
	local OnlineSubsystem OnlineSub;
	local OnlinePlayerInterface PlayerInterface;

	Super.OnRegister(InPlayer);

	// If the player is None, we are in the editor
	if (PlayerControllerId != -1)
	{
		// Figure out if we have an online subsystem registered
		OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
		if (OnlineSub != None)
		{
			// Grab the player interface to verify the subsystem supports it
			PlayerInterface = OnlineSub.PlayerInterface;
			if (PlayerInterface != None)
			{
				// Register that we are interested in any sign in change for this player
				PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
				// Set our callback function per player
				AddReadCompleteDelegate(PlayerInterface,PlayerControllerId);
				// Refresh our data
				RefreshStorageData();
			}
		}
		// Request notifications of device removal
		if (OnlineSub.SystemInterface != None)
		{
			OnlineSub.SystemInterface.AddStorageDeviceChangeDelegate(OnStorageDeviceChange);
		}
	}
}

/**
 * Clears our delegate for getting login change notifications
 */
event OnUnregister()
{
	local OnlineSubsystem OnlineSub;
	local OnlinePlayerInterface PlayerInterface;
	
	// Figure out if we have an online subsystem registered
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSub != None)
	{
		// Grab the player interface to verify the subsystem supports it
		PlayerInterface = OnlineSub.PlayerInterface;
		if (PlayerInterface != None)
		{
			// Clear our delegate
			PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
			ClearReadCompleteDelegate(PlayerInterface,PlayerControllerId);
		}
		// Request notifications of device removal
		if (OnlineSub.SystemInterface != None)
		{
			OnlineSub.SystemInterface.ClearStorageDeviceChangeDelegate(OnStorageDeviceChange);
		}
	}
	Super.OnUnregister();
}

/**
 * Handles the notification that the async read of the storage data is done
 *
 * @param bWasSuccessful whether the call succeeded or not
 */
function OnReadStorageComplete(byte LocalUserNum,bool bWasSuccessful)
{
	local OnlineSubsystem OnlineSub;
	local OnlinePlayerInterface PlayerInterface;

	if (bWasSuccessful == true)
	{
		if (!bWasErrorLastRead)
		{
			// Notify any subscribers that we have new data
			NotifyPropertyChanged();
		}
		else
		{
			// Figure out if we have an online subsystem registered
			OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
			if (OnlineSub != None)
			{
				// Grab the player interface to verify the subsystem supports it
				PlayerInterface = OnlineSub.PlayerInterface;
				if (PlayerInterface != None)
				{
					bWasErrorLastRead = false;
					// Read again to copy any data from a read in progress
					if (ReadData(PlayerInterface,PlayerControllerId,Profile.DeviceId,Profile) == false)
					{
						bWasErrorLastRead = true;
					}
				}
			}
		}
	}
	else
	{
		bWasErrorLastRead = true;
		;
	}
}

/**
 * Executes a refetching of the storage data when the login for this player changes
 *
 * @param LocalUserNum the player that logged in/out
 */
function OnLoginChange(byte LocalUserNum)
{
	local OnlineSubsystem OnlineSub;
	local OnlinePlayerInterface PlayerInterface;
	local ELoginStatus LoginStatus;
	local UniqueNetId NetId;

	if (LocalUserNum == PlayerControllerId)
	{
		// Figure out if we have an online subsystem registered
		OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
		if (OnlineSub != None)
		{
			// Grab the player interface to verify the subsystem supports it
			PlayerInterface = OnlineSub.PlayerInterface;
			if (PlayerInterface != None)
			{
				LoginStatus = PlayerInterface.GetLoginStatus(PlayerControllerId);
				PlayerInterface.GetUniquePlayerId(PlayerControllerId,NetId);
				if (LoginStatus == LS_NotLoggedIn)
				{
					// Reset the profile only when they've signed out
					Profile.SetToDefaults();
				}
			}
		}
		RefreshStorageData();
	}
}

/**
 * Reads this user's storage data from the online subsystem.
 */
function RefreshStorageData()
{
	local OnlineSubsystem OnlineSub;
	local bool bFoundCachedData;

	// Figure out if we have an online subsystem registered
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSub != None &&
		OnlineSub.PlayerInterface != None &&
		OnlineSub.PlayerInterfaceEx != None)
	{
		if (OnlineSub.PlayerInterface.GetLoginStatus(PlayerControllerId) > LS_NotLoggedIn &&
			!OnlineSub.PlayerInterface.IsGuestLogin(PlayerControllerId))
		{
			// Determine if the cached data is present
			bFoundCachedData = GetData(OnlineSub.PlayerInterface,PlayerControllerId,Profile);
			if (!bFoundCachedData ||
				// If they have cached data and that device is valid, skip the prompt
				(bFoundCachedData &&
				// If they already have a valid device, don't prompt
				!OnlineSub.PlayerInterfaceEx.IsDeviceValid(Profile.DeviceId,DeviceStorageSizeNeeded)))
			{
				OnlineSub.PlayerInterfaceEx.AddDeviceSelectionDoneDelegate(PlayerControllerId,OnDeviceSelectionComplete);
				// Get the device that their data may be stored on locally
				OnlineSub.PlayerInterfaceEx.ShowDeviceSelectionUI(PlayerControllerId,DeviceStorageSizeNeeded);
			}
		}
	}
}

/**
 * Called once the user has selected their device
 *
 * @param bWasSuccessful true if the async action completed without error, false if there was an error
 */
function OnDeviceSelectionComplete(bool bWasSuccessful)
{
	local OnlineSubsystem OnlineSub;
	local string Ignored;

	// Get the latest device id if this worked
	if (bWasSuccessful)
	{
		// We know we have one, because this event was called
		OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
		OnlineSub.PlayerInterfaceEx.ClearDeviceSelectionDoneDelegate(PlayerControllerId,OnDeviceSelectionComplete);
		// Get the device that was selected
		Profile.DeviceId = OnlineSub.PlayerInterfaceEx.GetDeviceSelectionResults(PlayerControllerId,Ignored);
		;
		// Start the async task
		if (ReadData(OnlineSub.PlayerInterface,PlayerControllerId,Profile.DeviceId,Profile) == false)
		{
			// Notify any owner data stores that we have changed data
			NotifyPropertyChanged();
		}
	}
	else
	{
		// Failed, so default to no storage
		Profile.DeviceId = -1;
	}
}

/**
 * Called when a setting or property which is bound to one of our array providers is updated.
 *
 * @param	SourceProvider		the data provider that generated the notification
 * @param	PropTag				the property that changed
 */
function ArrayProviderPropertyChanged( UIDataProvider SourceProvider, optional name PropTag )
{
	local int Index;
	local delegate<OnDataProviderPropertyChange> Subscriber;

	// Loop through and notify all subscribed delegates
	for (Index = 0; Index < ProviderChangedNotifies.Length; Index++)
	{
		Subscriber = ProviderChangedNotifies[Index];
		Subscriber(SourceProvider, PropTag);
	}
}

/**
 * Handler for the OnDataProviderPropertyChange delegate in our internal array providers.  Determines which provider sent the update
 * and propagates that update to this provider's own list of listeners.
 *
 * @param	SettingName		the name of the setting that was changed.
 */
function OnSettingValueUpdated( name SettingName )
{
	local int ProviderIdx;
	local UIDataProvider_OnlinePlayerStorageArray ArrayProvider;

	for ( ProviderIdx = 0; ProviderIdx < PlayerStorageArrayProviders.Length; ProviderIdx++ )
	{
		if ( SettingName == PlayerStorageArrayProviders[ProviderIdx].PlayerStorageName )
		{
			ArrayProvider = PlayerStorageArrayProviders[ProviderIdx].Provider;
			ArrayProviderPropertyChanged(ArrayProvider, SettingName);
			break;
		}
	}
}

/**
 * Verifies that the device for all of the installed DLC is still valid and reboots the game if not
 */
function OnStorageDeviceChange()
{
	local OnlineSubsystem OnlineSub;

	// Figure out if we have an online subsystem registered
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSub != None &&
		OnlineSub.SystemInterface != None)
	{
		// If our current device is no longer valid, re-request one
		if (!OnlineSub.PlayerInterfaceEx.IsDeviceValid(Profile.DeviceId,DeviceStorageSizeNeeded))
		{
			Profile.DeviceId = -1;
			RefreshStorageData();
		}
	}
}

cpptext
{
	/**
	 * Tells the provider the settings object it is resposible for exposing to
	 * the UI
	 *
	 * @param InSettings the settings object to expose
	 */
	virtual void BindPlayerStorage(UOnlinePlayerStorage* InStorage);

	/**
	 * Resolves the value of the data field specified and stores it in the output parameter.
	 *
	 * @param	FieldName		the data field to resolve the value for;  guaranteed to correspond to a property that this provider
	 *							can resolve the value for (i.e. not a tag corresponding to an internal provider, etc.)
	 * @param	OutFieldValue	receives the resolved value for the property specified.
	 *							@see GetDataStoreValue for additional notes
	 * @param	ArrayIndex		optional array index for use with data collections
	 */
	virtual UBOOL GetFieldValue(const FString& FieldName,FUIProviderFieldValue& OutFieldValue,INT ArrayIndex = INDEX_NONE);

	/**
	 * Resolves the value of the data field specified and stores the value specified to the appropriate location for that field.
	 *
	 * @param	FieldName		the data field to resolve the value for;  guaranteed to correspond to a property that this provider
	 *							can resolve the value for (i.e. not a tag corresponding to an internal provider, etc.)
	 * @param	FieldValue		the value to store for the property specified.
	 * @param	ArrayIndex		optional array index for use with data collections
	 */
	virtual UBOOL SetFieldValue(const FString& FieldName,const FUIProviderScriptFieldValue& FieldValue,INT ArrayIndex = INDEX_NONE);

	/**
	 * Builds a list of available fields from the array of properties in the
	 * game settings object
	 *
	 * @param OutFields	out value that receives the list of exposed properties
	 */
	virtual void GetSupportedDataFields(TArray<FUIDataProviderField>& OutFields);

	/**
	 * Resolves PropertyName into a list element provider that provides list elements for the property specified.
	 *
	 * @param	PropertyName	the name of the property that corresponds to a list element provider supported by this data store
	 *
	 * @return	a pointer to an interface for retrieving list elements associated with the data specified, or NULL if
	 *			there is no list element provider associated with the specified property.
	 */
	virtual TScriptInterface<class IUIListElementProvider> ResolveListElementProvider( const FString& PropertyName );

}


defaultproperties
{
   ProviderName="PlayerStorageData"
   WriteAccessType=ACCESS_WriteAll
   Name="Default__UIDataProvider_OnlinePlayerStorage"
   ObjectArchetype=UIDataProvider_OnlinePlayerDataBase'Engine.Default__UIDataProvider_OnlinePlayerDataBase'
}
