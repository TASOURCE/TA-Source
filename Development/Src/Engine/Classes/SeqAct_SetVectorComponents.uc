/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetVectorComponents extends SequenceAction
	native(Sequence);

var vector OutVector;
var float X, Y, Z;

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

cpptext
{
	void Activated()
	{
		OutVector.X = X;
		OutVector.Y = Y;
		OutVector.Z = Z;
		OutputLinks(0).bHasImpulse = TRUE;
	}

}


defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Output Vector",PropertyName="OutVector",bWriteable=True)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="X",PropertyName="X")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Y",PropertyName="Y")
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Z",PropertyName="Z")
   ObjName="Set Vector Components"
   ObjCategory="Math"
   Name="Default__SeqAct_SetVectorComponents"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
