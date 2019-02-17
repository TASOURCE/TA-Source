/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ConvertToString extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() bool bIncludeVarComment;
var() string VarSeparator;
var() int NumberOfInputs;

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	void Activated();
	void AppendVariables(TArray<USequenceVariable*> &LinkedVariables, FString &CombinedString, INT &VarCount);
	void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   bIncludeVarComment=True
   VarSeparator=", "
   NumberOfInputs=1
   VariableLinks(0)=(LinkDesc="Inputs",bAllowAnyType=True)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="Output",bWriteable=True)
   ObjName="Convert To String"
   ObjCategory="Misc"
   Name="Default__SeqAct_ConvertToString"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
