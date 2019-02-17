/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Allows a client to register and resolve the address for a host that it wants to connect to.
 * The platform specific implementation for this resolver will handle the specifics of generating 
 * a secure key to allow for a connection.
 */
class ClientBeaconAddressResolver extends Object
	native
	config(Engine);

/** The port that the beacon will listen on */
var int BeaconPort;

/** The name to use when logging (helps debugging) */
var name BeaconName;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__ClientBeaconAddressResolver"
   ObjectArchetype=Object'Core.Default__Object'
}
