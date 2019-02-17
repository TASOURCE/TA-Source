/**
 * Represents a set of actors based on Actor.Group vs GroupName.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_Group extends SeqVar_Object
	native(Sequence)
	deprecated;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() Name GroupName;

/** Has the list been cached? */
var transient bool bCachedList;
/** List of actors w/ matching Group, @note using Object simply for GetObjectRef(), typing isn't really important here */
var transient array<Object> Actors;

cpptext
{
	virtual FString GetValueStr();
	virtual UObject** GetObjectRef(INT Idx);

}


defaultproperties
{
   ObjName="Group"
   Name="Default__SeqVar_Group"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
}
