/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * This is the base class of all Mobile sequence events.  
 */
class SeqEvent_MobileBase extends SequenceEvent
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


/**
 * Whenever a SeqEvent_MobileBase sequence is created, it needs to find the PlayerInput that is assoicated with it and 
 * add it'self to the list of Kismet sequences looking for input 
 */
event RegisterEvent()
{
	local WorldInfo WI;
	local GamePlayerController GPC;
	local MobilePlayerInput MPI;

	// Use the WorldInfo to find the current local player.  TODO: Add support for specifying which Player to use via Kismet 
	WI = class'WorldInfo'.static.GetWorldInfo();
	if (WI != none)
	{
		foreach WI.LocalPlayerControllers(class'GamePlayerController', GPC)
		{
			MPI = MobilePlayerInput(GPC.PlayerInput);
			if (MPI != none)
			{
				AddToMobileInput(MPI);
				break;
			}
		}
	}
}

/**
 * Tell the MPI to attach itself to it's list of events 
 */
event AddToMobileInput(MobilePlayerInput MPI)
{
	MPI.AddKismetEventHandler(self);
}

defaultproperties
{
   MaxTriggerCount=0
   Name="Default__SeqEvent_MobileBase"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
