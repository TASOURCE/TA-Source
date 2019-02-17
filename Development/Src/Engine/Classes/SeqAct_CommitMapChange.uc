/**
 * SeqAct_CommitMapChange
 *
 * Kismet action commiting pending map change
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_CommitMapChange extends SequenceAction
	native(Sequence);

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
   InputLinks(0)=(LinkDesc="Commit")
   ObjName="Commit Map Change"
   ObjCategory="Level"
   Name="Default__SeqAct_CommitMapChange"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
