/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This class is used to connect to a host mesh beacon in order to 
 * establish a connected mesh network.
 */
class MeshBeaconClient extends MeshBeacon
	native;

/** 
 * Holds a reference to the data that is used to reach the potential host 
 * while a connection is being established for this client 
 */
var const OnlineGameSearchResult HostPendingRequest;

/** Used to send the initial client connection request to the host */
struct native ClientConnectionRequest
{
	/** Net Id of primary player on this client */
	var UniqueNetId PlayerNetId;
	/** NAT Type for this client */
	var ENatType NatType;
	/** TRUE if the client is able to host a vs match */
	var bool bCanHostVs;
	/** Ratio of successful vs unsuccessful matches hosted by this client in the past */
	var float GoodHostRatio;
	/** History of bandwidth results from previous tests. Saved/loaded in the player's profile */
	var array<ConnectionBandwidthStats> BandwidthHistory;
	/** Elapsed time in minutes since the last bandwidth test */
	var int MinutesSinceLastTest;
};
/** Active connection request that is pending for this client */
var const ClientConnectionRequest ClientPendingRequest;

/** Keeps track of all data needed for the current upstream bandwidth test */
struct native ClientBandwidthTestData
{
	/** Type of test current being done */
	var EMeshBeaconBandwidthTestType TestType;
	/** State of the bandwidth test for the client */
	var EMeshBeaconBandwidthTestState CurrentState;
	/** Total bytes expected to be sent in order to complete this test */
	var int NumBytesToSendTotal;
	/** Tally of bytes that have been sent so far for the test */
	var int NumBytesSentTotal;
	/** Size of last buffer that was sent for the test */
	var int NumBytesSentLast;
	/** Time since test was started */
	var float ElapsedTestTime;
};
/** The upstream test state for the client */
var ClientBandwidthTestData CurrentBandwidthTest;

/** Used to drive the client state machine */
enum EMeshBeaconClientState
{
	// Inactive or unknown
	MBCS_None,
	// A connection request is outstanding with host
	MBCS_Connecting,
	// Connected to the host and is ready to send
	MBCS_Connected,
	// Failed to establish a connection
	MBCS_ConnectionFailed,
	// Client has sent to the host and is awaiting for replies
	MBCS_AwaitingResponse,
	// The client has closed the connection
	MBCS_Closed
};

/** The state of the client beacon as it establishes a connection to the host */
var EMeshBeaconClientState ClientBeaconState;

/** The pending request to be sent */
var EMeshBeaconPacketType ClientBeaconRequestType;

/** Indicates how long the client should wait for a connection response before timing out */
var config float ConnectionRequestTimeout;

/** Used to track how long we've been waiting for a connection response */
var float ConnectionRequestElapsedTime;

/** Name of the class to use for address resolving and registering */
var config string ResolverClassName;

/** Class to use for address resolving and registering */
var class<ClientBeaconAddressResolver> ResolverClass;

/** Platform specific address resolver for this beacon. Instantiated using the ResolverClass type. */
var ClientBeaconAddressResolver Resolver;

/** TRUE if address was registered with the beacon address resolver */
var transient bool bUsingRegisteredAddr;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
 * Stops listening for requests/responses and releases any allocated memory
 */
native event DestroyBeacon();

/**
 * Request a connection to be established to the remote host. As part of the 
 * connection request also send the NAT type and bandwidth history data for the client.
 * Note this request is async and the results will be sent via the delegate
 *
 * @param DesiredHost the server that the connection will be made to
 * @param ClientRequest the client data that is going to be sendt with the request
 * @param bRegisterSecureAddress if TRUE then then key exchange is required to connect with the host
 * @return TRUE if the request async task started ok, false if it failed to send
 */
native function bool RequestConnection(const out OnlineGameSearchResult DesiredHost,const out ClientConnectionRequest ClientRequest,bool bRegisterSecureAddress);

/**
 * Have this client start a bandwidth test on the connected host by sending a start packet 
 * and then streaming as many dummy packets as possible before timeout (MaxBandwidthTestSendTime).
 *
 * @param TestType test to run based on enum of EMeshBeaconBandwidthTestType supported bandwidth test types
 * @param TestBufferSize size in bytes of total data to be sent for the bandwidth test
 * @return TRUE if the test was successfully started
 */
native function bool BeginBandwidthTest(EMeshBeaconBandwidthTestType TestType,INT TestBufferSize);

/**
 * Delegate called by the client mesh beacon when a connection request has been responded to by the destination host
 *
 * @param ConnectionResult whether the connection request was successful
 */
delegate OnConnectionRequestResult(EMeshBeaconConnectionResult ConnectionResult);

/**
 * Delegate called by the client mesh beacon when a new bandwidth test request has been received from the host.
 *
 * @param TestType test to run based on enum of EMeshBeaconBandwidthTestType supported bandwidth test types
 */
delegate OnReceivedBandwidthTestRequest(EMeshBeaconBandwidthTestType TestType);

/**
 * Delegate called by the client mesh beacon when bandwidth testing has completed on the host
 * and the results have been sent back to this client.
 *
 * @param TestType test that completed based on enum of EMeshBeaconBandwidthTestType supported bandwidth test types
 * @param TestResult overall result from running the test
 * @param BandwidthStats statistics and timing information from running the test
 */
delegate OnReceivedBandwidthTestResults(
	EMeshBeaconBandwidthTestType TestType,
	EMeshBeaconBandwidthTestResult TestResult,
	const out ConnectionBandwidthStats BandwidthStats);

/**
 * Delegate called by the client mesh beacon when the host sends a request for all clients to travel to
 * the destination included in the packet.
 *
 * @param SessionName the name of the session to register
 * @param SearchClass the search that should be populated with the session
 * @param PlatformSpecificInfo the binary data to place in the platform specific areas
 */
delegate OnTravelRequestReceived(name SessionName,class<OnlineGameSearch> SearchClass,const out byte PlatformSpecificInfo[80]);

/**
 * Delegate called by the client mesh beacon when the host sends a request for a client to create a new game session.
 * Used during game session migration to a new host.
 *
 * @param SessionName the name of the session to register
 * @param SearchClass the search that should be populated with the session
 * @param Players list of players to register on the newly created session
 */
delegate OnCreateNewSessionRequestReceived(name SessionName,class<OnlineGameSearch> SearchClass,const out array<PlayerMember> Players);

/**
 * Notify host of a newly created game session by this client. Host can decide to use/discard the new game session.
 *
 * @param bSuccess TRUE if the session was created successfully
 * @param SessionName the name of the session that was created
 * @param SearchClass the search that should be populated with the session
 * @param PlatformSpecificInfo the binary data to place in the platform specific areas
 */
native function bool SendHostNewGameSessionResponse(bool bSuccess,name SessionName,class<OnlineGameSearch> SearchClass,const out byte PlatformSpecificInfo[80]);

defaultproperties
{
   Name="Default__MeshBeaconClient"
   ObjectArchetype=MeshBeacon'IpDrv.Default__MeshBeacon'
}
