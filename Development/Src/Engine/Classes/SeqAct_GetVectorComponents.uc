/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_GetVectorComponents extends SequenceAction
	native(Sequence);

var vector InVector;
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
		X = InVector.X;
		Y = InVector.Y;
		Z = InVector.Z;
		OutputLinks(0).bHasImpulse = TRUE;
	}

}


defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Input Vector",PropertyName="InVector")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="X",PropertyName="X")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Y",PropertyName="Y")
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Z",PropertyName="Z")
   ObjName="Get Vector Components"
   ObjCategory="Math"
   Name="Default__SeqAct_GetVectorComponents"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
