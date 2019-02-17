/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_GetVelocity extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() editconst float  VelocityMag;
var() editconst	Vector VelocityVect;

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
	void Activated();

}


defaultproperties
{
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Velocity Mag",PropertyName="VelocityMag",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Velocity Vect",PropertyName="VelocityVect",bWriteable=True)
   ObjName="Get Velocity"
   ObjCategory="Actor"
   Name="Default__SeqAct_GetVelocity"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
