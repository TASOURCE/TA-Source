/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_RandomInt extends SeqVar_Int
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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Min value for randomness */
var() int Min;

/** Max value for randomness */
var() int Max;

cpptext
{
	virtual INT* GetRef()
	{
		if( Min < Max )
		{
			IntValue = Min + (appRand() % (Max - Min + 1));
		}
		else
		{
			IntValue = Max + (appRand() % (Min - Max + 1));
		}
		return &IntValue;
	}

	virtual FString GetValueStr()
	{
		return FString::Printf(TEXT("%d..%d"),Min,Max);
	}

	virtual UBOOL SupportsProperty(UProperty *Property)
	{
		return FALSE;
	}

}


defaultproperties
{
   Max=100
   ObjName="Random Int"
   Name="Default__SeqVar_RandomInt"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
}
