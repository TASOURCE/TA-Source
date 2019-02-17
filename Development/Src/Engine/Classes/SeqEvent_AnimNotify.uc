/**
 * Activated when an AnimNotify_Kismet is fired on this actor
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_AnimNotify extends SequenceEvent
	native(Sequence);

var() name NotifyName;

defaultproperties
{
   bPlayerOnly=False
   bAutoActivateOutputLinks=True
   ObjName="Anim Notify"
   ObjCategory="Actor"
   Name="Default__SeqEvent_AnimNotify"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
