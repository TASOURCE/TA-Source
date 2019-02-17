/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Provides an in game gameplay events/stats upload mechanism via the MCP backend
 */
class OnlineEventsInterfaceMcp extends MCPBase
	native
	implements(OnlineEventsInterface);

/** 
 * The types of events that are to be uploaded 
 * Keep in sync with [IpDrv.OnlineEventsInterfaceMcp] entries
 */
enum EEventUploadType
{
	EUT_GenericStats,
	EUT_ProfileData,
	EUT_MatchmakingData,
	EUT_PlaylistPopulation
};

/** Holds the configuration and instance data for event uploading */
struct native EventUploadConfig
{
	/** The type of upload this config is for */
	var const EEventUploadType UploadType;
	/** The URL to send the data to */
	var const string UploadUrl;
	/** The amount of time to wait before erroring out */
	var const float TimeOut;
	/** Whether to compress the data before sending or not */
	var const bool bUseCompression;
};

/**
 * This is the array of upload task configurations
 */
var const config array<EventUploadConfig> EventUploadConfigs;

/** List of HTTP downloader objects that are POSTing the data */
var native const array<pointer> HttpPostObjects{class FHttpDownloadString};

/** A list of upload types that are disabled (don't upload) */
var config array<EEventUploadType> DisabledUploadTypes;

/** if true, the stats data will be sent as a binary blob instead of XML */
var const config bool bBinaryStats;

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
 * Sends the profile data to the server for statistics aggregation
 *
 * @param UniqueId the unique id for the player
 * @param PlayerNick the player's nick name
 * @param ProfileSettings the profile object that is being sent
 * @param PlayerStorage the player storage object that is being sent
 *
 * @return true if the async task was started successfully, false otherwise
 */
native function bool UploadPlayerData(UniqueNetId UniqueId,string PlayerNick,OnlineProfileSettings ProfileSettings,OnlinePlayerStorage PlayerStorage);

/**
 * Sends gameplay event data to MCP
 *
 * @param UniqueId the player that is sending the stats
 * @param Payload the stats data to upload
 *
 * @return true if the async send started ok, false otherwise
 */
native function bool UploadGameplayEventsData(UniqueNetId UniqueId,const out array<byte> Payload);

/**
 * Sends the network backend the playlist population for this host
 *
 * @param PlaylistId the playlist we are updating the population for
 * @param NumPlayers the number of players on this host in this playlist
 *
 * @return true if the async send started ok, false otherwise
 */
native function bool UpdatePlaylistPopulation(int PlaylistId,int NumPlayers);

/**
 * Sends matchmaking stats data to MCP
 *
 * @param UniqueId the unique id for the player
 * @param MMStats object that contains aggregated matchmaking stats data
 *
 * @return true if the async send started ok, false otherwise
 */
native function bool UploadMatchmakingStats(UniqueNetId UniqueId,OnlineMatchmakingStats MMStats);

defaultproperties
{
   Name="Default__OnlineEventsInterfaceMcp"
   ObjectArchetype=MCPBase'IpDrv.Default__MCPBase'
}
