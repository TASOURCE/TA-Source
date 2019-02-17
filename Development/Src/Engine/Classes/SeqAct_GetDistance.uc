/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_GetDistance extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() editconst float Distance;

cpptext
{
	void Activated();

}


defaultproperties
{
   VariableLinks(0)=(LinkDesc="A",PropertyName=)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="B")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Distance",PropertyName="Distance",bWriteable=True)
   ObjName="Get Distance"
   ObjCategory="Actor"
   Name="Default__SeqAct_GetDistance"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
