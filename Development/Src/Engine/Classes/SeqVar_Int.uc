/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_Int extends SequenceVariable
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

var() int				IntValue;

cpptext
{
	virtual INT* GetRef()
	{
		return &IntValue;
	}

	virtual FString GetValueStr()
	{
		return FString::Printf(TEXT("%d"),IntValue);
	}

	virtual UBOOL SupportsProperty(UProperty *Property)
	{
		return (Property->IsA(UIntProperty::StaticClass()) ||
				(Property->IsA(UArrayProperty::StaticClass()) && ((UArrayProperty*)Property)->Inner->IsA(UIntProperty::StaticClass())));
	}

	virtual void PublishValue(USequenceOp *Op, UProperty *Property, FSeqVarLink &VarLink);
	virtual void PopulateValue(USequenceOp *Op, UProperty *Property, FSeqVarLink &VarLink);

}


defaultproperties
{
   ObjName="Int"
   ObjCategory="Int"
   ObjColor=(B=255,G=255,R=0,A=255)
   Name="Default__SeqVar_Int"
   ObjectArchetype=SequenceVariable'Engine.Default__SequenceVariable'
}
