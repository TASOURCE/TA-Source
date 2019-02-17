/**
 * Activated when an actor hits a wall
 * Originator: the actor that owns this event
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_HitWall extends SequenceEvent;

defaultproperties
{
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bAutoActivateOutputLinks=True
   ObjName="Hit Wall"
   ObjCategory="Physics"
   Name="Default__SeqEvent_HitWall"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
