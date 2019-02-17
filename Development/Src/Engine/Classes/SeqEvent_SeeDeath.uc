/**
 * Despite the name, seem to be activated anytime a pawn is killed in the game.
 * Originator: the pawn that owns this event
 * Instigator: the pawn that was killed
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_SeeDeath extends SequenceEvent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual UBOOL CheckActivate(AActor *InOriginator, AActor *InInstigator, UBOOL bTest=FALSE, TArray<INT>* ActivateIndices = NULL, UBOOL bPushTop = FALSE);

}


defaultproperties
{
   bPlayerOnly=False
   VariableLinks(0)=(LinkDesc="Victim")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Killer",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Witness",bWriteable=True)
   ObjName="See Death"
   ObjCategory="Pawn"
   Name="Default__SeqEvent_SeeDeath"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
