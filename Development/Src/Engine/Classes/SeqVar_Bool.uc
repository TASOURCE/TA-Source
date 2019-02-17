/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_Bool extends SequenceVariable
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

var() int			bValue;

// Red bool - gives you wings!

cpptext
{
	virtual UBOOL* GetRef()
	{
		return (UBOOL*)&bValue;
	}

	FString GetValueStr()
	{
		return bValue ? GTrue : GFalse;
	}

	virtual UBOOL SupportsProperty(UProperty *Property)
	{
		return (Property->IsA(UBoolProperty::StaticClass()));
	}

	virtual void PublishValue(USequenceOp *Op, UProperty *Property, FSeqVarLink &VarLink);
	virtual void PopulateValue(USequenceOp *Op, UProperty *Property, FSeqVarLink &VarLink);

}


defaultproperties
{
   ObjName="Bool"
   ObjColor=(B=0,G=0,R=255,A=255)
   Name="Default__SeqVar_Bool"
   ObjectArchetype=SequenceVariable'Engine.Default__SequenceVariable'
}
