/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_Character extends SeqVar_Object
	abstract
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

/** Pawn class for the character we're looking for */
var class<Pawn> PawnClass;

cpptext
{
	UObject** GetObjectRef( INT Idx );

	virtual FString GetValueStr()
	{
		return ObjName;
	}

	virtual UBOOL SupportsProperty(UProperty *Property)
	{
		return FALSE;
	}

#if WITH_EDITOR
	virtual void CheckForErrors();
#endif

}


defaultproperties
{
   ObjCategory="Player"
   Name="Default__SeqVar_Character"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
}
