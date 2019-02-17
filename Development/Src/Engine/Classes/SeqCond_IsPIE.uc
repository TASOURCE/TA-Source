/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqCond_IsPIE extends SequenceCondition
	native(Sequence);

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
	return Super.GetObjClassVersion() + 0;
}

cpptext
{
	virtual void Activated();

}


defaultproperties
{
   OutputLinks(0)=(LinkDesc="Yes")
   OutputLinks(1)=(LinkDesc="No")
   ObjName="Is PIE?"
   Name="Default__SeqCond_IsPIE"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
