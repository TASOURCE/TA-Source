/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_External extends SequenceVariable
	within Sequence
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

/** */
var() class<SequenceVariable> ExpectedType;

/** Name of the variable link to create on the parent sequence */
var() string VariableLabel;

cpptext
{
	// UObject interface
	virtual void PostLoad();

	// SequenceObject interface
	virtual void OnConnect(USequenceObject* connObj, INT connIdx);

	// SequenceVariable interface
	virtual FString GetValueStr();

	/**
	 * Returns whether this SequenceObject can exist in a sequence without being linked to anything else (i.e. does not require
	 * another sequence object to activate it)
	 */
	virtual UBOOL IsStandalone() const { return TRUE; }

}


defaultproperties
{
   VariableLabel="Default Var"
   ObjName="External Variable"
   Name="Default__SeqVar_External"
   ObjectArchetype=SequenceVariable'Engine.Default__SequenceVariable'
}
