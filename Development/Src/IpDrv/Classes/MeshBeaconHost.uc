/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This class is used to handle connections from client mesh beacons in order to 
 * establish a mesh network.
 */
class MeshBeaconHost extends MeshBeacon
	native;

/** Stats stored for the current bandwidth test on a client connection */
struct native ClientConnectionBandwidthTestData
{
	/** Current progress of bandwidth test. Only one client should be MB_BandwidthTestState_InProgress at a time. */
	var EMeshBeaconBandwidthTestState CurrentState;
	/** Type of bandwidth test currently running */
	var EMeshBeaconBandwidthTestType TestType;
	/** Total bytes needed to complete the test */
	var int BytesTotalNeeded;
	/** Total bytes received by the client so far */
	var int BytesReceived;
	/** Time when request was first sent to client to start the test*/
	var double RequestTestStartTime;
	/** Time when first response was received from client to being the test */
	var double TestStartTime;
	/** Resulting stats from the bandwidth test */
	var ConnectionBandwidthStats BandwidthStats;
};

/** Holds the information for a client and whether they've timed out */
struct native ClientMeshBeaconConnection
{
	/** The unique id of the player for this connection */
	var UniqueNetId PlayerNetId;
	/** How long it's been since the last heartbeat */
	var float ElapsedHeartbeatTime;
	/** The socket this client is communicating on */
	var native transient pointer Socket{FSocket};
	/** True if the client connection has already been accepted for this player */
	var bool bConnectionAccepted;
	/** Bandwidth test being run for the client */
	var ClientConnectionBandwidthTestData BandwidthTest;
	/** The NAT of the client as reported by the client */
	var ENatType NatType;
	/** TRUE if the client is able to host a vs match */
	var bool bCanHostVs;
	/** Ratio of successful vs unsuccessful matches hosted by this client in the past */
	var float GoodHostRatio;	
	/** 
	 * Previous bandwidth history reported by the client ordered from newest to oldest.  
	 * New bandwidth tests that occur on this host also get added to this history.
	 */
	var array<ConnectionBandwidthStats> BandwidthHistory;
	/** Elapsed time in minutes since the last bandwidth test */
	var int MinutesSinceLastTest;
};

/** The object that is used to send/receive data with the remote host/client */
var const array<ClientMeshBeaconConnection> ClientConnections;

/** List of players this beacon is waiting to establish connections to. */
var private array<UniqueNetId> PendingPlayerConnections;

/** Net Id of player that is hosting this beacon */
var const UniqueNetId OwningPlayerId;

/** TRUE if new bandwidth test requests should be handled. Set to false to ignore any pending and new requests. */
var private bool bAllowBandwidthTesting;

/** The number of connections to allow before refusing them */
var config int ConnectionBacklog;

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
 * Creates a listening host mesh beacon to accept new client connections.
 *
 * @param InOwningPlayerId Net Id of player that is hosting this beacon
 * @return true if the beacon was created successfully, false otherwise
 */
native function bool InitHostBeacon(UniqueNetId InOwningPlayerId);

/**
 * Stops listening for clients and releases any allocated memory
 */
native event DestroyBeacon();

/**
 * Send a request to a client connection to initiate a new bandwidth test.
 *
 * @param PlayerNetId player with an active connection to receive test request
 * @param TestType EMeshBeaconBandwidthTestType type of bandwidth test to request
 * @param TestBufferSize size of buffer in bytes to use for running the test
 * @return TRUE if the request was successfully sent to the client
 */
native function bool RequestClientBandwidthTest(UniqueNetId PlayerNetId,EMeshBeaconBandwidthTestType TestType,int TestBufferSize);

/**
 * Determine if a client is currently running a bandwidth test.
 *
 * @return TRUE if a client connection is currently running a bandwidth test
 */
native function bool HasInProgressBandwidthTest();

/**
 * Cancel any bandwidth tests that are already in progress.
 */
native function CancelInProgressBandwidthTests();

/**
 * Determine if a client is currently waiting/pending for a bandwidth test.
 *
 * @return TRUE if a client connection is currently pending a bandwidth test
 */
native function bool HasPendingBandwidthTest();

/**
 * Cancel any bandwidth tests that are pending.
 */
native function CancelPendingBandwidthTests();

/**
 * Enable/disable future bandwidth test requests and current pending tests.
 *
 * @param bEnabled true to allow bandwidth testing to be processed by the beacon
 */
function AllowBandwidthTesting(bool bEnabled)
{
	bAllowBandwidthTesting = bEnabled;
}

/**
 * Delegate called by the host mesh beacon after establishing a new client socket and
 * receiving the data for a new connection request.
 *
 * @param NewClientConnection client that sent the request for a new connection
 */
delegate OnReceivedClientConnectionRequest(const out ClientMeshBeaconConnection NewClientConnection);

/**
 * Delegate called by the host mesh beacon when bandwidth testing has started for a client connection.
 * This occurs only when the client sends the start packet to initiate the test.
 *
 * @param PlayerNetId net id for player of client connection that started the test
 * @param TestType test to run based on enum of EMeshBeaconBandwidthTestType supported bandwidth test types
 */
delegate OnStartedBandwidthTest(UniqueNetId PlayerNetId,EMeshBeaconBandwidthTestType TestType);

/**
 * Delegate called by the host mesh beacon when bandwidth testing has completed for a client connection.
 * This occurs when the test completes successfully or due to error/timeout.
 *
 * @param PlayerNetId net id for player of client connection that finished the test
 * @param TestType test that completed based on enum of EMeshBeaconBandwidthTestType supported bandwidth test types
 * @param TestResult overall result from running the test
 * @param BandwidthStats statistics and timing information from running the test
 */
delegate OnFinishedBandwidthTest(
	 UniqueNetId PlayerNetId,
	 EMeshBeaconBandwidthTestType TestType,
	 EMeshBeaconBandwidthTestResult TestResult,
	 const out ConnectionBandwidthStats BandwidthStats);

/**
 * Set list of pending player ids we are waiting to connect with.
 * Once all connections are established then the OnAllPendingPlayersConnected delegate is called.
 *
 * @param Players list of player ids we are waiting to connect
 */
function SetPendingPlayerConnections(const out array<UniqueNetId> Players)
{
	PendingPlayerConnections = Players;
}

/**
 * Determine if the given player has an active connection on this host beacon.
 *
 * @param PlayerNetId player we are searching for
 * @return index within ClientConnections for the player's connection, -1 if not found
 */
native function int GetConnectionIndexForPlayer(UniqueNetId PlayerNetId);

/**
 * Determine if the players all have connections on this host beacon
 *
 * @param Players list of player ids we are searching for
 * @return TRUE if all players had connections
 */
native function bool AllPlayersConnected(const out array<UniqueNetId> Players);

/**
 * Delegate called by the host mesh beacon when all players in the PendingPlayerConnections list get connections.
 */
delegate OnAllPendingPlayersConnected();

/**
 * Tells all of the clients to go to a specific session (contained in platform
 * specific info). Used to route all clients to one destination.
 *
 * @param SessionName the name of the session to register
 * @param SearchClass the search that should be populated with the session
 * @param PlatformSpecificInfo the binary data to place in the platform specific areas
 */
native function TellClientsToTravel(name SessionName,class<OnlineGameSearch> SearchClass,const out byte PlatformSpecificInfo[80]);

/**
 * Sends a request to a specified client to create a new game session.
 *
 * @param PlayerNetId net id of player for client connection to send request to
 * @param SessionName the name of the session to create
 * @param SearchClass the search that should be with corresponding game settings when creating the session
 * @param Players list of players to register on the newly created session
 */
native function bool RequestClientCreateNewSession(UniqueNetId PlayerNetId,name SessionName,class<OnlineGameSearch> SearchClass,const out array<PlayerMember> Players);

/**
 * Delegate called by the host mesh beacon when it gets the results of a new game session creation on a client.
 *
 * @param bSucceeded TRUE if the the new session was created on the client
 * @param SessionName the name of the session to create
 * @param SearchClass the search that should be with corresponding game settings when creating the session
 * @param PlatformSpecificInfo the platform specific binary data of the new session
 */
delegate OnReceivedClientCreateNewSessionResult(bool bSucceeded,name SessionName,class<OnlineGameSearch> SearchClass,const out byte PlatformSpecificInfo[80]);

defaultproperties
{
   bAllowBandwidthTesting=True
   Name="Default__MeshBeaconHost"
   ObjectArchetype=MeshBeacon'IpDrv.Default__MeshBeacon'
}
