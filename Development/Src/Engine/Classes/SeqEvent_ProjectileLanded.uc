/**
 * Event which is activated by gameplay code when a projectile lands.
 * Originator: the Pawn that owns this event.
 * Instigator: a projectile actor which was fired by the Pawn that owns this event
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_ProjectileLanded extends SequenceEvent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() float MaxDistance;

cpptext
{
	virtual UBOOL CheckActivate(AActor *InOriginator, AActor *InInstigator, UBOOL bTest=FALSE, TArray<INT>* ActivateIndices = NULL, UBOOL bPushTop = FALSE);

}


defaultproperties
{
   bPlayerOnly=False
   VariableLinks(0)=(LinkDesc="Projectile")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Shooter",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Witness",bWriteable=True)
   ObjName="Projectile Landed"
   ObjCategory="Physics"
   Name="Default__SeqEvent_ProjectileLanded"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
