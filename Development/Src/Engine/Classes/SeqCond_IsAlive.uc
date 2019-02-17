/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class SeqCond_IsAlive extends SequenceCondition
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Activated();

}


defaultproperties
{
   OutputLinks(0)=(LinkDesc="True")
   OutputLinks(1)=(LinkDesc="False")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Players")
   ObjName="Is Alive"
   Name="Default__SeqCond_IsAlive"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
