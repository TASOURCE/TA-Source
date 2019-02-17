/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_Float extends SequenceVariable
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

var() float			FloatValue;

cpptext
{
	virtual FLOAT* GetRef()
	{
		return &FloatValue;
	}

	virtual FString GetValueStr()
	{
		return FString::Printf(TEXT("%2.3f"),FloatValue);
	}

	virtual UBOOL SupportsProperty(UProperty *Property)
	{
		return (Property->IsA(UFloatProperty::StaticClass()) ||
				(Property->IsA(UArrayProperty::StaticClass()) && ((UArrayProperty*)Property)->Inner->IsA(UFloatProperty::StaticClass())));
	}

	virtual void PublishValue(USequenceOp *Op, UProperty *Property, FSeqVarLink &VarLink);
	virtual void PopulateValue(USequenceOp *Op, UProperty *Property, FSeqVarLink &VarLink);

}


defaultproperties
{
   ObjName="Float"
   ObjCategory="Float"
   ObjColor=(B=255,G=0,R=0,A=255)
   Name="Default__SeqVar_Float"
   ObjectArchetype=SequenceVariable'Engine.Default__SequenceVariable'
}
