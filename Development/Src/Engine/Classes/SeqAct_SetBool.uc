/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetBool extends SeqAct_SetSequenceVariable
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() bool DefaultValue<autocomment=true>;

cpptext
{
	void Activated();

}


defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Value",PropertyName=,MinVars=0)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Target",bWriteable=True)
   ObjName="Bool"
   Name="Default__SeqAct_SetBool"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
