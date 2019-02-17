/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_GetLocationAndRotation extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** The location of the actor */
var() editconst Vector Location;
/** A normalized vector in the direction of the actor's rotation */
var() editconst	Vector RotationVector;
/** A vector that holds floating point versions of the FRotator rotation */
var() editconst	Vector Rotation;

/**
 * OPTIONAL: Name of a socket or bone to get the world-space location and rotation of (if this actor contains a skeletal mesh)
 * If left empty or there is no skeletal mesh, this action will still get the actor location and rotation
 */
var() Name SocketOrBoneName;

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
	return Super.GetObjClassVersion() + 2;
}

cpptext
{
	void Activated();

}


defaultproperties
{
   VariableLinks(0)=(MaxVars=1)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Location",PropertyName="Location",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Rotation Vector",PropertyName="RotationVector",bWriteable=True)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Rotation",PropertyName="Rotation",bWriteable=True)
   ObjName="Get Location and Rotation"
   ObjCategory="Actor"
   Name="Default__SeqAct_GetLocationAndRotation"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
