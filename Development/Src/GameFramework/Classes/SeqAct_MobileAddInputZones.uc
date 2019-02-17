/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_MobileAddInputZones extends SequenceAction
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Name for this zone, it will be used in Kismet zone input events */
var() name ZoneName;

/** All the details needed to set up a zone */
var() editinline MobileInputZone NewZone;

defaultproperties
{
   ObjName="Add Input Zone"
   ObjCategory="Mobile"
   Name="Default__SeqAct_MobileAddInputZones"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
