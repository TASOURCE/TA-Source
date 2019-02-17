/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * This is the base class for all mobile sequence events that require access to a specific zone.
 */
class SeqEvent_MobileZoneBase extends SeqEvent_MobileBase
	native
	abstract;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Holds the name of the zone we want to be assoicated with */	
var() string TargetZoneName;

/**
 * Try to find the mobile input zone this is assocated with and add it
 */
event AddToMobileInput(MobilePlayerInput MPI)
{
	local MobileInputZone Zone;
	Zone = MPI.Findzone(TargetZoneName);
	if (Zone != none)
	{
		Zone.AddKismetEventHandler(self);
	}
}

defaultproperties
{
   Name="Default__SeqEvent_MobileZoneBase"
   ObjectArchetype=SeqEvent_MobileBase'GameFramework.Default__SeqEvent_MobileBase'
}
