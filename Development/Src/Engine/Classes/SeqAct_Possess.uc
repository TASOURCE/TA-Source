/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Possess extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var transient	Pawn	PawnToPossess;

/** true if should kill old pawn */
var()			bool	bKillOldPawn;

/** Try to leave vehicle if manning one */
var()			bool	bTryToLeaveVehicle;

cpptext
{
	void Activated();

}


defaultproperties
{
   bTryToLeaveVehicle=True
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Pawn Target")
   ObjName="Possess Pawn"
   ObjCategory="Pawn"
   Name="Default__SeqAct_Possess"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
