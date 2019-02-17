/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_CastToFloat extends SeqAct_SetSequenceVariable
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var int Value;
var float FloatResult;

cpptext
{
	void Activated()
	{
		OutputLinks(0).bHasImpulse = TRUE;
		
		FloatResult = (FLOAT)Value;
	}

}


defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Int",PropertyName="Value")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Result",PropertyName="FloatResult",bWriteable=True)
   ObjName="Cast To Float"
   ObjCategory="Math"
   Name="Default__SeqAct_CastToFloat"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
