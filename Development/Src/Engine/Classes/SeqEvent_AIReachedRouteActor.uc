/** 
 * Event triggered by AI when an actor along a route is reached.
 * Firing the event at the proper time should be handled by game code.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SeqEvent_AIReachedRouteActor extends SequenceEvent;

defaultproperties
{
   bPlayerOnly=False
   ObjName="Reached Route Actor"
   ObjCategory="AI"
   Name="Default__SeqEvent_AIReachedRouteActor"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
