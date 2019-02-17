/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Trace extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Should actors be traced against? */
var() bool bTraceActors;

/** Should the world be traced against? */
var() bool bTraceWorld;

/** What extent should be used for the trace? */
var() vector TraceExtent;

var() vector StartOffset, EndOffset;

var() editconst Object HitObject;
var() editconst float  Distance;
var() editconst	Vector HitLocation;

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	virtual void Activated();
	virtual void DeActivated()
	{
	}

}


defaultproperties
{
   bTraceWorld=True
   OutputLinks(0)=(LinkDesc="Not Obstructed")
   OutputLinks(1)=(LinkDesc="Obstructed")
   VariableLinks(0)=(LinkDesc="Start",PropertyName=)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="End")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="HitObject",PropertyName="HitObject",bWriteable=True)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Distance",PropertyName="Distance",bWriteable=True)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="HitLoc",PropertyName="HitLocation",bWriteable=True)
   ObjName="Trace"
   ObjCategory="Misc"
   Name="Default__SeqAct_Trace"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
