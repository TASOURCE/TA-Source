/**
 * Event which is activated by the gameplay code when a pawn dies.
 * Originator: either the Pawn that died or the Controller for that Pawn
 * Instigator: the pawn that died.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_Death extends SequenceEvent;

defaultproperties
{
   bPlayerOnly=False
   ObjName="Death"
   ObjCategory="Pawn"
   Name="Default__SeqEvent_Death"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
