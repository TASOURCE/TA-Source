/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetMatInstScalarParam extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() MaterialInstanceConstant	MatInst;
var() Name						ParamName;

var() float ScalarValue;

cpptext
{
	void Activated();

}


defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="ScalarValue",PropertyName="ScalarValue")
   ObjName="Set ScalarParam"
   ObjCategory="Material Instance"
   Name="Default__SeqAct_SetMatInstScalarParam"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
