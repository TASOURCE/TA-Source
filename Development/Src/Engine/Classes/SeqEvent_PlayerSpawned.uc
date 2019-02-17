/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class SeqEvent_PlayerSpawned extends SequenceEvent;

var Object SpawnPoint;

defaultproperties
{
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Spawn Point",PropertyName="SpawnPoint",bWriteable=True)
   ObjName="Player Spawned"
   ObjCategory="Player"
   Name="Default__SeqEvent_PlayerSpawned"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
