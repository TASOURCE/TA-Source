/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_AttachToEvent extends SequenceAction
	native(Sequence);

/** prefer to attach events to Controllers instead of Pawns (for events you want to persist beyond the target dying and respawning) */
var() bool bPreferController;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	void Activated();

}


defaultproperties
{
   VariableLinks(0)=(LinkDesc="Attachee",PropertyName=)
   EventLinks(0)=(LinkDesc="Event")
   ObjName="Attach To Event"
   ObjCategory="Event"
   Name="Default__SeqAct_AttachToEvent"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
