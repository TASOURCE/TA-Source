/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKTeamOwnedInfo extends ReplicationInfo
	native;

/** Team associated with this info */
var TeamInfo Team;

simulated native function byte GetTeamNum();

defaultproperties
{
   Name="Default__UDKTeamOwnedInfo"
   ObjectArchetype=ReplicationInfo'Engine.Default__ReplicationInfo'
}
