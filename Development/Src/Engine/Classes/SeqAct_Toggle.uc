/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Toggle extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void PostLoad();
	virtual void Activated();

}


defaultproperties
{
   InputLinks(0)=(LinkDesc="Turn On")
   InputLinks(1)=(LinkDesc="Turn Off")
   InputLinks(2)=(LinkDesc="Toggle")
   VariableLinks(0)=(bModifiesLinkedObject=True)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Bool",MinVars=0)
   EventLinks(0)=(LinkDesc="Event")
   ObjName="Toggle"
   ObjCategory="Toggle"
   Name="Default__SeqAct_Toggle"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
