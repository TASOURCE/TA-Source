/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_MobileSaveLoadValue extends SequenceAction
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

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

defaultproperties
{
   InputLinks(0)=(LinkDesc="Save")
   InputLinks(1)=(LinkDesc="Load")
   OutputLinks(0)=(LinkDesc="Saved")
   OutputLinks(1)=(LinkDesc="Loaded")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Int Vars",PropertyName=)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Float Vars")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Bool Vars")
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Vector Vars")
   ObjName="Save/Load Values"
   ObjCategory="Mobile"
   Name="Default__SeqAct_MobileSaveLoadValue"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
