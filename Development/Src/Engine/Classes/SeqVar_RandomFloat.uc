/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_RandomFloat extends SeqVar_Float
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

/** Min value for randomness */
var() float Min;

/** Max value for randomness */
var() float Max;

cpptext
{
	virtual FLOAT* GetRef()
	{
		FloatValue = Min + appFrand() * (Max - Min);
		return &FloatValue;
	}

	virtual FString GetValueStr()
	{
		return FString::Printf(TEXT("%2.2f..%2.2f"),Min,Max);
	}

	virtual UBOOL SupportsProperty(UProperty *Property)
	{
		return FALSE;
	}

}


defaultproperties
{
   Max=1.000000
   ObjName="Random Float"
   Name="Default__SeqVar_RandomFloat"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
}
