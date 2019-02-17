/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqCond_CompareBool extends SequenceCondition
	native(Sequence);

/** Result of comparison is written to this variable */
var bool bResult;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	void Activated();

}


defaultproperties
{
   OutputLinks(0)=(LinkDesc="True")
   OutputLinks(1)=(LinkDesc="False")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Bool")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Result",PropertyName="bResult",bWriteable=True)
   ObjName="Compare Bool"
   ObjCategory="Comparison"
   Name="Default__SeqCond_CompareBool"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
