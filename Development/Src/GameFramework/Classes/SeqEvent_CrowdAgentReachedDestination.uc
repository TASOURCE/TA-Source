/**
 * Originator: the pawn that owns this event
 * Instigator: the pawn that was killed
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_CrowdAgentReachedDestination extends SequenceEvent
	native;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Agent Reached Destination")
   VariableLinks(0)=(LinkDesc="Agent")
   ObjName="Agent Reached"
   ObjCategory="Crowd"
   Name="Default__SeqEvent_CrowdAgentReachedDestination"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
