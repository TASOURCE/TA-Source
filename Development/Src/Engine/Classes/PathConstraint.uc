/**
* Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
*/
class PathConstraint extends Object
	native(AI);

// index into the constraint cache for this class' pool
var const int CacheIdx;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Next constraint in the list */
var PathConstraint NextConstraint;

// called when this object is about to be re-used from the cache
event Recycle()
{
	NextConstraint = None;
}

event String GetDumpString()
{
	return String(self);
}

cpptext
{
	// Interface
	virtual UBOOL EvaluatePath( UReachSpec* Spec, APawn* Pawn, INT& out_PathCost, INT& out_HeuristicCost );

}


defaultproperties
{
   CacheIdx=-1
   Name="Default__PathConstraint"
   ObjectArchetype=Object'Core.Default__Object'
}
