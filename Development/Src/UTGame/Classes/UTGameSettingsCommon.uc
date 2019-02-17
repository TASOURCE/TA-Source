/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** Holds the settings that are common to all match types */
class UTGameSettingsCommon extends UDKGameSettingsCommon;










const GS_USERNAME_MAXLENGTH					 = 15;
const GS_PASSWORD_MAXLENGTH					 = 30;
const GS_MESSAGE_MAXLENGTH					 = 255;
const GS_EMAIL_MAXLENGTH					 = 50;
const GS_CDKEY_PART_MAXLENGTH				 = 4;


const CONTEXT_PRESENCE_MENUPRESENCE              = 0;

const CONTEXT_GAME_MODE							 = 0x0000800B;


const CONTEXT_GAME_MODE_DM                       = 0;
const CONTEXT_GAME_MODE_CTF                      = 1;
const CONTEXT_GAME_MODE_WAR                      = 2;
const CONTEXT_GAME_MODE_VCTF					 = 3;
const CONTEXT_GAME_MODE_TDM                      = 4;
const CONTEXT_GAME_MODE_DUEL                     = 5;
const CONTEXT_GAME_MODE_CUSTOM                   = 6;
const CONTEXT_GAME_MODE_CAMPAIGN                 = 7;

const CONTEXT_MAPNAME                            = 0;
const CONTEXT_LOCKEDSERVER                       = 1;
const CONTEXT_ALLOWKEYBOARD                      = 2;

const CONTEXT_BOTSKILL                           = 10;
const CONTEXT_PURESERVER                         = 11;
const CONTEXT_VSBOTS                             = 12;
const CONTEXT_CAMPAIGN                           = 13;
const CONTEXT_FORCERESPAWN                       = 14;
const CONTEXT_FULLSERVER                         = 15;
const CONTEXT_EMPTYSERVER                        = 16;
const CONTEXT_DEDICATEDSERVER                    = 17;


const CONTEXT_MAPNAME_CUSTOM                     = 0;



const CONTEXT_BOTSKILL_NOVICE                    = 0;
const CONTEXT_BOTSKILL_AVERAGE                   = 1;
const CONTEXT_BOTSKILL_EXPERIENCED               = 2;
const CONTEXT_BOTSKILL_SKILLED                   = 3;
const CONTEXT_BOTSKILL_ADEPT                     = 4;
const CONTEXT_BOTSKILL_MASTERFUL                 = 5;
const CONTEXT_BOTSKILL_INHUMAN                   = 6;
const CONTEXT_BOTSKILL_GODLIKE                   = 7;



const CONTEXT_GOALSCORE_5                        = 0;
const CONTEXT_GOALSCORE_10                       = 1;
const CONTEXT_GOALSCORE_15                       = 2;
const CONTEXT_GOALSCORE_20                       = 3;
const CONTEXT_GOALSCORE_30                       = 4;



const CONTEXT_NUMBOTS_0                          = 0;
const CONTEXT_NUMBOTS_1                          = 1;
const CONTEXT_NUMBOTS_2                          = 2;
const CONTEXT_NUMBOTS_3                          = 3;
const CONTEXT_NUMBOTS_4                          = 4;
const CONTEXT_NUMBOTS_5                          = 5;
const CONTEXT_NUMBOTS_6                          = 6;
const CONTEXT_NUMBOTS_7                          = 7;
const CONTEXT_NUMBOTS_8                          = 8;



const CONTEXT_TIMELIMIT_5                        = 0;
const CONTEXT_TIMELIMIT_10                       = 1;
const CONTEXT_TIMELIMIT_15                       = 2;
const CONTEXT_TIMELIMIT_20                       = 3;
const CONTEXT_TIMELIMIT_30                       = 4;



const CONTEXT_PURESERVER_NO                      = 0;
const CONTEXT_PURESERVER_YES                     = 1;
const CONTEXT_PURESERVER_ANY                     = 2;



const CONTEXT_LOCKEDSERVER_NO                    = 0;
const CONTEXT_LOCKEDSERVER_YES                   = 1;



const CONTEXT_CAMPAIGN_NO                        = 0;
const CONTEXT_CAMPAIGN_YES                       = 1;



const CONTEXT_FORCERESPAWN_NO                        = 0;
const CONTEXT_FORCERESPAWN_YES                       = 1;



const CONTEXT_ALLOWKEYBOARD_NO                        = 0;
const CONTEXT_ALLOWKEYBOARD_YES                       = 1;
const CONTEXT_ALLOWKEYBOARD_ANY						= 2;


const CONTEXT_FULLSERVER_NO						= 0;
const CONTEXT_FULLSERVER_YES					= 1;


const CONTEXT_EMPTYSERVER_NO					= 0;
const CONTEXT_EMPTYSERVER_YES					= 1;


const CONTEXT_DEDICATEDSERVER_NO                = 0;
const CONTEXT_DEDICATEDSERVER_YES               = 1;



const  CONTEXT_VSBOTS_NONE                       = 0;
const  CONTEXT_VSBOTS_1_TO_2                     = 1;
const  CONTEXT_VSBOTS_1_TO_1                     = 2;
const  CONTEXT_VSBOTS_3_TO_2					 = 3;
const  CONTEXT_VSBOTS_2_TO_1                     = 4;
const  CONTEXT_VSBOTS_3_TO_1                     = 5;
const  CONTEXT_VSBOTS_4_TO_1                     = 6;

const PROPERTY_NUMBOTS							 = 0x100000F7;
const PROPERTY_TIMELIMIT				         = 0x1000000A;
const PROPERTY_GOALSCORE						 = 0x1000000B;
const PROPERTY_LEADERBOARDRATING	             = 0x20000004;
const PROPERTY_EPICMUTATORS                      = 0x10000105;


const PROPERTY_CUSTOMMAPNAME                     = 0x40000001;
const PROPERTY_CUSTOMGAMEMODE                    = 0x40000002;
const PROPERTY_SERVERDESCRIPTION                 = 0x40000003;
const PROPERTY_CUSTOMMUTATORS                    = 0x40000004;


const QUERY_DM									 = 0;
const QUERY_TDM									 = 1;
const QUERY_CTF									 = 2;
const QUERY_VCTF								 = 3;
const QUERY_WAR									 = 4;
const QUERY_DUEL								 = 5;
const QUERY_CAMPAIGN							 = 6;



const STATS_VIEW_DM_PLAYER_ALLTIME                         = 1;
const STATS_VIEW_DM_RANKED_ALLTIME                         = 2;
const STATS_VIEW_DM_WEAPONS_ALLTIME                        = 3;
const STATS_VIEW_DM_VEHICLES_ALLTIME                       = 4;
const STATS_VIEW_DM_VEHICLEWEAPONS_ALLTIME                 = 5;
const STATS_VIEW_DM_VEHICLES_RANKED_ALLTIME                = 6;
const STATS_VIEW_DM_VEHICLEWEAPONS_RANKED_ALLTIME          = 7;
const STATS_VIEW_DM_WEAPONS_RANKED_ALLTIME                 = 8;

#linenumber 8

/** The maximum number of players allowed on this server. */
var databinding int MaxPlayers;

/** The minumum number of players that must be present before the match starts. */
var databinding int MinNetPlayers;

/**
 * Sets the property that advertises the custom map name
 *
 * @param MapName the string to use
 */
function SetCustomMapName(string MapName)
{
	local SettingsData CustomMap;

	if (Properties[4].PropertyId == PROPERTY_CUSTOMMAPNAME)
	{
		SetSettingsDataString(CustomMap,MapName);
		Properties[4].Data = CustomMap;
	}
	else
	{
		;
	}
}

/**
 * Sets the property that advertises the official mutators being used in the game.
 *
 * @param	MutatorBitmask	bitmask of epic mutators that are active for this game session (bits are derived
 *							by left-shifting by the mutator's index into the UTUIDataStore_MenuItems' list of
 *							UTUIDataProvider_Mutators
 */
function SetOfficialMutatorBitmask( int MutatorBitmask )
{
	SetIntProperty(PROPERTY_EPICMUTATORS, MutatorBitmask);
}

/**
 * Builds a URL string out of the properties/contexts and databindings of this object.
 */
function BuildURL(out string OutURL)
{
	local int SettingIdx;
	local int OutValue;
	local float Ratio;
	local name SettingName;
	local name PropertyName;
	local string Description;

	OutURL = "";

	// Append properties marked with the databinding keyword to the URL
	AppendDataBindingsToURL(OutURL);

	// Iterate through localized settings and append them
	for (SettingIdx = 0; SettingIdx < LocalizedSettings.length; SettingIdx++)
	{
		SettingName = GetStringSettingName(LocalizedSettings[SettingIdx].Id);
		if (SettingName != '')
		{
			// For certain context's, output their string value name instead of their value index.
			switch(LocalizedSettings[SettingIdx].Id)
			{
			case CONTEXT_BOTSKILL:
				OutURL $= "?Difficulty=" $ LocalizedSettings[SettingIdx].ValueIndex;
				break;

			case CONTEXT_VSBOTS:
				if(GetStringSettingValue(CONTEXT_VSBOTS, OutValue))
				{
					Ratio = -1.0f;

					// Convert the vs bot context value to a floating point ratio of bots to players.
					switch(OutValue)
					{
					case CONTEXT_VSBOTS_1_TO_2:
						Ratio = 0.5f;
						break;
					case CONTEXT_VSBOTS_1_TO_1:
						Ratio = 1.0f;
						break;
					case CONTEXT_VSBOTS_3_TO_2:
						Ratio = 1.5f;
						break;
					case CONTEXT_VSBOTS_2_TO_1:
						Ratio = 2.0f;
						break;
					case CONTEXT_VSBOTS_3_TO_1:
						Ratio = 3.0f;
						break;
					case CONTEXT_VSBOTS_4_TO_1:
						Ratio = 4.0f;
						break;
					default:
						break;
					}

					if(Ratio > 0)
					{
						OutURL $= "?VsBots=" $ Ratio;
					}
				}
				break;

			// these are the values that are handled in other ways (don't append the values here)
			case CONTEXT_MAPNAME:		// index of map - but we go by mapname
			case CONTEXT_FULLSERVER:	// calculated on the server as players login
			case CONTEXT_EMPTYSERVER:	// calculated on the server as players login
			case CONTEXT_DEDICATEDSERVER:	// calculated on server based on the databinding property bIsDedicated
				break;

				// GameInfo.UpdateGameSettingsCounts() won't be called until a player logs in, so pass IsEmptyServer=1
				// on the URL so that dedicated servers will start off with this set
			case CONTEXT_ALLOWKEYBOARD:
				if ( class'WorldInfo'.static.IsConsoleBuild(CONSOLE_PS3) )	// Only set allow keyboard option on ps3.
				{
					OutURL $= "?" $ SettingName $ "=" $ LocalizedSettings[SettingIdx].ValueIndex;
				}
				break;
			default:
				OutURL $= "?" $ SettingName $ "=" $ LocalizedSettings[SettingIdx].ValueIndex;
				break;
			}
		}
	}

	// Now add all properties the same way
	for (SettingIdx = 0; SettingIdx < Properties.length; SettingIdx++)
	{
		PropertyName = GetPropertyName(Properties[SettingIdx].PropertyId);
		if (PropertyName != '')
		{
			switch(Properties[SettingIdx].PropertyId)
			{
			case PROPERTY_NUMBOTS:
				// Will be handled by game launching code.
				break;

			case PROPERTY_SERVERDESCRIPTION:
				Description=GetPropertyAsString(PROPERTY_SERVERDESCRIPTION);
				// encode the string so that we don't have to worry about parsing errors
				OutURL $= "?ServerDescription=" $ BlobToString(Description);
				break;

			// skip this property because we assemble the mask on the server side based on the mutator class names
			case PROPERTY_EPICMUTATORS:
			// skip this property because we assemble the list of friendly names based on the active mutators
			case PROPERTY_CUSTOMMUTATORS:
				break;

			default:
				OutURL $= "?" $ PropertyName $ "=" $ GetPropertyAsString(Properties[SettingIdx].PropertyId);
				break;
			}
		}
	}
}

/**
 * Updates the game settings object from parameters passed on the URL
 *
 * @param URL the URL to parse for settings
 */
function UpdateFromURL(const out string URL, GameInfo Game)
{
	local string Description;
	local string RealDescription;
	local string BotSkillString, BotCountString;

	Super.UpdateFromURL(URL, Game);

	// Put back the question marks in the server description
	Description = GetPropertyAsString(PROPERTY_SERVERDESCRIPTION);

	// Make sure that we don't exceed our max allowing player counts for this game type!  Usually this is 32.
	NumPublicConnections = Clamp( NumPublicConnections, 0, Game.MaxPlayers );
	NumPrivateConnections = Clamp( NumPrivateConnections, 0, Game.MaxPlayers - NumPublicConnections );

	// Unblob the string
	if(StringToBlob(Description, RealDescription))
	{
		SetStringProperty(PROPERTY_SERVERDESCRIPTION, RealDescription);
	}

	SetMutators(URL);

	BotSkillString = class'GameInfo'.static.ParseOption(URL, "Difficulty");
	if ( BotSkillString != "" )
	{
		SetStringSettingValueByName('BotSkill', int(BotSkillString), true);
	}

	BotCountString = class'GameInfo'.static.ParseOption(URL, "NumPlay");
	if ( BotCountString != "" )
	{
		SetIntProperty(PROPERTY_NUMBOTS, int(BotCountString) - 1);
	}

	if (Game.WorldInfo.NetMode == NM_DedicatedServer || class'GameInfo'.static.HasOption(URL, "Dedicated"))
	{
		bIsDedicated = true;
	}

	if ( bIsDedicated )
	{
		SetStringSettingValue(CONTEXT_DEDICATEDSERVER,CONTEXT_DEDICATEDSERVER_YES,true);
	}
}


function SetMutators( const out string URL )
{
	local DataStoreClient DSClient;
	local UTUIDataStore_MenuItems MenuDataStore;
	local string MutatorURLValue;
	local array<string> MutatorClassNames;

	DSClient = class'UIInteraction'.static.GetDataStoreClient();
	if ( DSClient != None )
	{
		MenuDataStore = UTUIDataStore_MenuItems(DSClient.FindDataStore('UTMenuItems'));
		if ( MenuDataStore != None )
		{
			// get the comma-delimited string of mutator class names from the URL
			MutatorURLValue = class'GameInfo'.static.ParseOption(URL, "Mutator");
			if ( MutatorURLValue != "" )
			{
				// separate into an array of strings
				ParseStringIntoArray(MutatorURLValue, MutatorClassNames, ",", true);
			}
		}
	}

	SetOfficialMutatorBitmask(GenerateMutatorBitmaskFromURL(MenuDataStore, MutatorClassNames));

	// now do the custom mutators
	SetCustomMutators(MenuDataStore, MutatorClassNames);
}

/**
 * Generates a bitmask of active mutators which were created by epic.  The bits are derived by left-shifting by
 * the mutator's index into the UTUIDataStore_MenuItems' list of UTUIDataProvider_Mutators.
 *
 * @return	a bitmask which has bits on for any enabled official mutators.
 */
function int GenerateMutatorBitmaskFromURL( UTUIDataStore_MenuItems MenuDataStore, out array<string> MutatorClassNames )
{
	local int Idx, MutatorIdx, EnabledMutatorBitmask;
	local string GameModeString;

	// Some mutators are filtered out based on the currently selected gametype, so in order to guarantee
	// that our bitmasks always match up (i.e. between a client and server), clear the setting that mutators
	// use for filtering so that we always get the complete list.  We'll restore it once we're done.
	class'UIRoot'.static.GetDataStoreStringValue("<Registry:SelectedGameMode>", GameModeString);
	class'UIRoot'.static.SetDataStoreStringValue("<Registry:SelectedGameMode>", "");

	for ( Idx = 0; Idx < MutatorClassNames.Length; Idx++ )
	{
		MutatorIdx = MenuDataStore.FindValueInProviderSet('OfficialMutators', 'ClassName', MutatorClassNames[Idx]);
		if ( MutatorIdx != INDEX_NONE )
		{
			EnabledMutatorBitmask = EnabledMutatorBitmask | (1 << MutatorIdx);
			MutatorClassNames.Remove(Idx--, 1);
		}
	}

	class'UIRoot'.static.SetDataStoreStringValue("<Registry:SelectedGameMode>", GameModeString);

	return EnabledMutatorBitmask;
}

/**
 * Sets the custom mutators property with a delimited string containing the friendly names for all active custom (non-epic) mutators.
 *
 * @param	MenuDataStore		the data store which contains the UI data for all game resources (mutators, maps, gametypes, etc.)
 * @param	MutatorClassNames	the array of pathnames for all mutators currently active in the game
 */
function SetCustomMutators( UTUIDataStore_MenuItems MenuDataStore, const out array<string> MutatorClassNames )
{
	local int Idx, MutatorIdx;
	local string MutatorName, CustomMutators, CustomMutatorDelimiter;

	// just cache the delimiter so we don't have to evaluate each time
	CustomMutatorDelimiter = Chr(28);
	for ( Idx = 0; Idx < MutatorClassNames.Length; Idx++ )
	{
		// find the index of the UTUIDataProvider_Mutator with the specified classname
		MutatorIdx = MenuDataStore.FindValueInProviderSet('Mutators', 'ClassName', MutatorClassNames[Idx]);
		if ( MutatorIdx != INDEX_NONE )
		{
			// get the value of the FriendlyName property for this UTUIDataProvider_Mutator
			if ( MenuDataStore.GetValueFromProviderSet('Mutators', 'FriendlyName', MutatorIdx, MutatorName) )
			{
				// append it to the string that will be set as the value for CustomMutators
				if ( CustomMutators != "" )
				{
					CustomMutators $= CustomMutatorDelimiter;
				}

				CustomMutators $= MutatorName;
			}
		}
	}

	//@note - CustomMutators might be blank
	SetStringProperty(PROPERTY_CUSTOMMUTATORS, CustomMutators);
}

defaultproperties
{
   Name="Default__UTGameSettingsCommon"
   ObjectArchetype=UDKGameSettingsCommon'UDKBase.Default__UDKGameSettingsCommon'
}
