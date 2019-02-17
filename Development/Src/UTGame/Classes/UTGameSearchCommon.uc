/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Holds the search items common to all game types.
 */
class UTGameSearchCommon extends OnlineGameSearch
	abstract;










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

#linenumber 11

defaultproperties
{
   MaxSearchResults=1000
   FilterQuery=(OrClauses=((OrParams=((EntryId=32779,EntryType=OGSET_LocalizedSetting))),(OrParams=((EntryId=11,EntryType=OGSET_LocalizedSetting))),(OrParams=((EntryId=1,EntryType=OGSET_LocalizedSetting))),(OrParams=((EntryId=2,EntryType=OGSET_LocalizedSetting))),(OrParams=((EntryId=15,EntryType=OGSET_LocalizedSetting))),(OrParams=((EntryId=16,EntryType=OGSET_LocalizedSetting))),(OrParams=((EntryId=17,EntryType=OGSET_LocalizedSetting)))))
   LocalizedSettings(0)=(Id=32779,AdvertisementType=ODAT_OnlineService)
   LocalizedSettings(1)=(Id=11,ValueIndex=2,AdvertisementType=ODAT_OnlineService)
   LocalizedSettings(2)=(Id=1,ValueIndex=1,AdvertisementType=ODAT_OnlineService)
   LocalizedSettings(3)=(Id=13,AdvertisementType=ODAT_OnlineService)
   LocalizedSettings(4)=(Id=2,ValueIndex=2,AdvertisementType=ODAT_OnlineService)
   LocalizedSettings(5)=(Id=15,ValueIndex=1,AdvertisementType=ODAT_OnlineService)
   LocalizedSettings(6)=(Id=16,ValueIndex=1,AdvertisementType=ODAT_OnlineService)
   LocalizedSettings(7)=(Id=17,AdvertisementType=ODAT_OnlineService)
   LocalizedSettingsMappings(1)=(Id=11,Name="PureServer",ValueMappings=(,(Id=1),(Id=2,bIsWildcard=True)))
   LocalizedSettingsMappings(2)=(Id=1,Name="LockedServer",ValueMappings=(,(Id=1,bIsWildcard=True)))
   LocalizedSettingsMappings(3)=(Id=13,Name="Campaign",ValueMappings=(,(Id=1)))
   LocalizedSettingsMappings(4)=(Id=2,Name="AllowKeyboard",ValueMappings=(,(Id=1),(Id=2,bIsWildcard=True)))
   LocalizedSettingsMappings(5)=(Id=15,Name="ShowFullServers",ValueMappings=(,(Id=1,bIsWildcard=True)))
   LocalizedSettingsMappings(6)=(Id=16,Name="ShowEmptyServers",ValueMappings=(,(Id=1,bIsWildcard=True)))
   LocalizedSettingsMappings(7)=(Id=17,Name="IsDedicated",ValueMappings=((bIsWildcard=True),(Id=1)))
   Name="Default__UTGameSearchCommon"
   ObjectArchetype=OnlineGameSearch'Engine.Default__OnlineGameSearch'
}
