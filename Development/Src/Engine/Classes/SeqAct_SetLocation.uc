/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetLocation extends SeqAct_SetSequenceVariable
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Default value to use if no variables are linked */
var() bool bSetLocation;
var() vector LocationValue;
/** Default value to use if no variables are linked */
var() Rotator RotationValue;
var() bool bSetRotation;


/** Object that will be moved */ 
var Object Target;


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
   bSetLocation=True
   bSetRotation=True
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Location",PropertyName=,MaxVars=1)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Rotation",MaxVars=1)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Target",PropertyName="Target",bWriteable=True,MaxVars=1)
   ObjName="Set Actor Location"
   ObjCategory="Actor"
   Name="Default__SeqAct_SetLocation"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
