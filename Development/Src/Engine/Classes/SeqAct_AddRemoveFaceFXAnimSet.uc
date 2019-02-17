/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SeqAct_AddRemoveFaceFXAnimSet extends SequenceAction;

/** List of FaceFXAnimSets to add to Pawn Target */
var() deprecated Array<FaceFXAnimSet> FaceFXAnimSets;

defaultproperties
{
   InputLinks(0)=(LinkDesc="Add FaceFXAnimSets")
   InputLinks(1)=(LinkDesc="Remove FaceFXAnimSets")
   ObjName="Add Remove FaceFXAnimSet"
   ObjCategory="Pawn"
   Name="Default__SeqAct_AddRemoveFaceFXAnimSet"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
