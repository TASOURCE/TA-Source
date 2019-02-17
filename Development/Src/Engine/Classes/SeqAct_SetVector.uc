/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetVector extends SeqAct_SetSequenceVariable;

/** Default value to use if no variables are linked */
var() vector DefaultValue;

event Activated()
{
	local bool bIgnoreDefault;
	local SeqVar_Vector VectVar;
	local vector Value;

	foreach LinkedVariables(class'SeqVar_Vector', VectVar, "Value")
	{
		bIgnoreDefault = true;
		// add all linked value variables together
		Value += VectVar.VectValue;
	}
	if (!bIgnoreDefault)
	{
		// no values were connected so use the default
		Value = DefaultValue;
	}
	// set the new value for all linked targets
	foreach LinkedVariables(class'SeqVar_Vector', VectVar, "Target")
	{
		VectVar.VectValue = Value;
	}
}

defaultproperties
{
   bCallHandler=False
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Value",PropertyName=)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Target",bWriteable=True)
   ObjName="Vector"
   Name="Default__SeqAct_SetVector"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
