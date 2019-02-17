/**
 * An AccessObjectList Action is used to access the contents of an ObjectListVar.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_AccessObjectList extends SeqAct_SetSequenceVariable
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

var() editconst Object OutputObject;
var() int ObjectIndex;

cpptext
{
	/**
	* When a AccessObjectList is Activated() it may do a number of things.
	* In each of those cases we make use of a helper function.
	**/
	void Activated();

public:
	/**
	* SeqAct_AccessObjectList determines which of its outputs should be
	* set to active
	**/
	void DeActivated();


}


defaultproperties
{
   InputLinks(0)=(LinkDesc="Random")
   InputLinks(1)=(LinkDesc="First")
   InputLinks(2)=(LinkDesc="Last")
   InputLinks(3)=(LinkDesc="At Index")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_ObjectList',LinkDesc="Object List",PropertyName=,MaxVars=1)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Index",PropertyName="ObjectIndex")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Output Object",PropertyName="OutputObject",bWriteable=True)
   ObjName="Access ObjectList"
   ObjCategory="Object List"
   Name="Default__SeqAct_AccessObjectList"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
