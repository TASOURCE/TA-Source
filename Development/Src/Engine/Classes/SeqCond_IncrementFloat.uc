/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqCond_IncrementFloat extends SequenceCondition
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

var() float			IncrementAmount;

/** Default value to use if no variables are linked to A */
var() float			ValueA;

/** Default value to use if no variables are linked to B */
var() float			ValueB;

cpptext
{
	void Activated()
	{
		// first increment the value
		ValueA += IncrementAmount;
		// compare the values and set appropriate output impulse
		if (ValueA <= ValueB)
		{
			OutputLinks(0).bHasImpulse = TRUE;
		}
		if (ValueA > ValueB)
		{
			OutputLinks(1).bHasImpulse = TRUE;
		}
		if (ValueA == ValueB)
		{
			OutputLinks(2).bHasImpulse = TRUE;
		}
		if (ValueA < ValueB)
		{
			OutputLinks(3).bHasImpulse = TRUE;
		}
		if (ValueA >= ValueB)
		{
			OutputLinks(4).bHasImpulse = TRUE;
		}
	}

}


defaultproperties
{
   IncrementAmount=1.000000
   OutputLinks(0)=(LinkDesc="A <= B")
   OutputLinks(1)=(LinkDesc="A > B")
   OutputLinks(2)=(LinkDesc="A == B")
   OutputLinks(3)=(LinkDesc="A < B")
   OutputLinks(4)=(LinkDesc="A >= B")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="A",PropertyName="ValueA")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="B",PropertyName="ValueB")
   ObjName="Float Counter"
   ObjCategory="Counter"
   Name="Default__SeqCond_IncrementFloat"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
