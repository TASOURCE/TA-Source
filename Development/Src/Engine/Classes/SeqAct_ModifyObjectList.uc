/**
 * A ModifyObjectList Action is used to manipulate an ObjectListVar or a set
 * of ObjectListVars.
 *
 * Basically, a ModifyObjectList Action  should be thought of as the operations
 * that can be done to a set of ObjectLists.  You have the Action point to a set of
 * ObjectLists and then you use the normal kismet firing of events to
 * cause the Action to affect the Lists.
 *
 *
 * The action provides a number of actions:
 *
 * Add:  This will add objects that are being referenced to the List(s)
 * Remove:  This will remove objects that are being referenced from the List(s)
 * Empty:  This will remove all objects in the List(s)
 *
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * @todo - this should be a conditional
 */
class SeqAct_ModifyObjectList extends SeqAct_SetSequenceVariable
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
// (cpptext)
// (cpptext)

var() editconst int ListEntriesCount;

cpptext
{
	/**
	* When a ModifyObjectList is Activated() it may do a number of things.
	* In each of those cases we make use of a helper function.
	**/
	void Activated();

private:
	void ActivatedAddRemove();
	void ActivateAddRemove_Helper( INT LinkNum );

public:
	/**
	* SeqAct_ModifyObjectList determines which of its outputs should be
	* set to active
	**/
	void DeActivated();


}


defaultproperties
{
   InputLinks(0)=(LinkDesc="Add To List")
   InputLinks(1)=(LinkDesc="Remove From List")
   InputLinks(2)=(LinkDesc="Empty List")
   VariableLinks(0)=(LinkDesc="ObjectRef",PropertyName=)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_ObjectList',LinkDesc="ObjectListVar",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="ListEntriesCount",PropertyName="ListEntriesCount",bWriteable=True)
   ObjName="Modify ObjectList"
   ObjCategory="Object List"
   Name="Default__SeqAct_ModifyObjectList"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
