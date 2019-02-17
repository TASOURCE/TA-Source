/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_GetProperty extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Name of property to search for */
var() Name PropertyName;

cpptext
{
	virtual void Activated();

}


defaultproperties
{
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Object",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Int",bWriteable=True)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Float",bWriteable=True)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="String",bWriteable=True)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Bool",bWriteable=True)
   ObjName="Get Property"
   ObjCategory="Object Property"
   Name="Default__SeqAct_GetProperty"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
