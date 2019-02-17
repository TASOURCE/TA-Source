/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This class is used to connect to a network beacon in order to request
 * a reservation for their party with that host
 */
class PartyBeaconClient extends PartyBeacon
	native;

/** Holds a reference to the data that is used to reach the potential host */
var const OnlineGameSearchResult HostPendingRequest;

/** The request to send once the socket is established */
var PartyReservation PendingRequest;

/** Used to drive the client state machine */
enum EPartyBeaconClientState
{
	// Inactive or unknown
	PBCS_None,
	// A connection request is outstanding with host
	PBCS_Connecting,
	// Connected to the host and is ready to send
	PBCS_Connected,
	// Failed to establish a connection
	PBCS_ConnectionFailed,
	// Client has sent to the host and is awaiting for replies
	PBCS_AwaitingResponse,
	// The client has closed the connection
	PBCS_Closed
};

/** The state of the client beacon */
var EPartyBeaconClientState ClientBeaconState;

/** Determine the pending request to be sent to the host */
enum EPartyBeaconClientRequest
{
	// Pending client request for creating a new reservation on the host
	PBClientRequest_NewReservation,
	// Pending client request for updating an existing reservation on the host
	PBClientRequest_UpdateReservation
};

/** The pending request to be sent */
var EPartyBeaconClientRequest ClientBeaconRequestType;

/** Indicates how long the client should wait for a response before timing out and trying a new server */
var config float ReservationRequestTimeout;

/** Used to track how long we've been waiting for a response */
var float ReservationRequestElapsedTime;

/** Name of the class to use for address resolving and registering */
var config string ResolverClassName;

/** Class to use for address resolving and registering */
var class<ClientBeaconAddressResolver> ResolverClass;

/** Platform specific address resolver for this beacon. Instantiated using the ResolverClass type. */
var ClientBeaconAddressResolver Resolver;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
 * Called by the beacon when a reservation request has been responded to by the destination host
 *
 * @param ReservationResult whether there was space allocated for the party or not
 */
delegate OnReservationRequestComplete(EPartyReservationResult ReservationResult);

/**
 * Called by the beacon when the host sends a reservation count update packet so
 * that any UI can be updated
 *
 * @param ReservationRemaining the number of reservations that are still available
 */
delegate OnReservationCountUpdated(int ReservationRemaining);

/**
 * Called by the beacon when the host sends a request for all clients to travel to
 * the destination included in the packet
 *
 * @param SessionName the name of the session to register
 * @param SearchClass the search that should be populated with the session
 * @param PlatformSpecificInfo the binary data to place in the platform specific areas
 */
delegate OnTravelRequestReceived(name SessionName,class<OnlineGameSearch> SearchClass,byte PlatformSpecificInfo[80]);

/**
 * Called by the beacon when the host sends the "ready" packet, so the client
 * can connect to the host to start the match
 */
delegate OnHostIsReady();

/**
 * Called by the beacon when the host sends the "cancellation" packet, so the client
 * can return to finding a new host
 */
delegate OnHostHasCancelled();

/**
 * Sends a request to the remote host to allow the specified members to reserve space
 * in the host's session. Note this request is async and the results will be sent via
 * the delegate
 *
 * @param DesiredHost the server that the connection will be made to
 * @param RequestingPartyLeader the leader of this party that will be joining
 * @param Players the list of players that want to reserve space
 *
 * @return true if the request able to be sent, false if it failed to send
 */
native function bool RequestReservation(const out OnlineGameSearchResult DesiredHost,UniqueNetId RequestingPartyLeader,const out array<PlayerReservation> Players);

/**
 * Sends a request to the remote host to update an existing reservation for the
 * specified party leader.  Any new players not already in the party leader's reservation
 * will be added to that reservation on the host.  Host sends a EPartyReservationResult back.
 *
 * @param DesiredHost the server that the connection will be made to
 * @param RequestingPartyLeader party leader that will be updating his existing reservation
 * @param PlayersToAdd the list of players that want to reserve space in an existing reservation
 *
 * @return true if the request able to be sent, false if it failed to send
 */
native function bool RequestReservationUpdate(const out OnlineGameSearchResult DesiredHost,UniqueNetId RequestingPartyLeader,const out array<PlayerReservation> PlayersToAdd);

/**
 * Sends a cancellation message to the remote host so that it knows there is more
 * space available
 *
 * @param CancellingPartyLeader the leader of this party that wants to cancel
 *
 * @return true if the request able to be sent, false if it failed to send
 */
native function bool CancelReservation(UniqueNetId CancellingPartyLeader);

/**
 * Stops listening for requests/responses and releases any allocated memory
 */
native event DestroyBeacon();

defaultproperties
{
   Name="Default__PartyBeaconClient"
   ObjectArchetype=PartyBeacon'IpDrv.Default__PartyBeacon'
}
