/**
 * Event which is activated when some pawn has a line of sight to an LOS trigger.
 * Originator: the trigger that owns this event
 * Instigator: the Pawn of the Player that saw the LOS trigger which owns this event
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_LOS extends SequenceEvent;

/** Distance from the screen center before activating this event */
var() float ScreenCenterDistance;

/** Distance from the trigger before activating this event */
var() float TriggerDistance;

/** Force a clear line of sight to the trigger? */
var() bool bCheckForObstructions;

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

defaultproperties
{
   ScreenCenterDistance=50.000000
   TriggerDistance=2048.000000
   bCheckForObstructions=True
   OutputLinks(0)=(LinkDesc="Look")
   OutputLinks(1)=(LinkDesc="Stop Look")
   ObjName="Line Of Sight"
   ObjCategory="Pawn"
   Name="Default__SeqEvent_LOS"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
