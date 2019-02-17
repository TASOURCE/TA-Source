/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


/** event that is triggered when a PickupFactory's status changes */
class SeqEvent_PickupStatusChange extends SequenceEvent;

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Available")
   OutputLinks(1)=(LinkDesc="Taken")
   ObjName="Pickup Status Change"
   Name="Default__SeqEvent_PickupStatusChange"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
