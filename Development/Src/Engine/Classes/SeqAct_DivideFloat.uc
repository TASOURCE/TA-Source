/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_DivideFloat extends SeqAct_SetSequenceVariable
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
		if( ValueB == 0.0f )
		{
			ValueB = 1.0f;
		}
		
		FloatResult = ValueA / ValueB;
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
   ObjName="Divide Float"
   ObjCategory="Math"
   Name="Default__SeqAct_DivideFloat"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
