/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_MultiplyFloat extends SeqAct_SetSequenceVariable
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
// (cpptext)
// (cpptext)

var() float ValueA;
var() float ValueB;
var float FloatResult;
var int IntResult;

cpptext
{
	void Activated()
	{
		FloatResult = ValueA * ValueB;
		OutputLinks(0).bHasImpulse = TRUE;
		
		// Round the float result into the integer result
		IntResult = appRound( FloatResult );
	}

}


defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="A",PropertyName="ValueA")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="B",PropertyName="ValueB")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="FloatResult",PropertyName="FloatResult",bWriteable=True)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="IntResult",PropertyName="IntResult",bWriteable=True)
   ObjName="Multiply Float"
   ObjCategory="Math"
   Name="Default__SeqAct_MultiplyFloat"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
