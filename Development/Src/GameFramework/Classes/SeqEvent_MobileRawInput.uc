/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileRawInput extends SequenceEvent
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Holds the index in to the multi-touch array that we wish to manage. */
var(Mobile) int TouchIndex;

var float TouchLocationX;
var float TouchLocationY;
var float TimeStamp;

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
				MPI.AddKismetRawInputEventHandler(self);
				break;
			}
		}
	}
}

defaultproperties
{
   MaxTriggerCount=0
   OutputLinks(0)=(LinkDesc="Touch Begin")
   OutputLinks(1)=(LinkDesc="Touch Update")
   OutputLinks(2)=(LinkDesc="Touch End")
   OutputLinks(3)=(LinkDesc="Touch Cancel")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Touch Location X",PropertyName="TouchLocationX",bWriteable=False)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Touch Location Y",PropertyName="TouchLocationY")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Timestamp",PropertyName="TimeStamp")
   ObjName="Mobile Raw Input Access"
   ObjCategory="Input"
   Name="Default__SeqEvent_MobileRawInput"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
