/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqCond_IsSameTeam extends SequenceCondition
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
   ObjName="Same Team"
   Name="Default__SeqCond_IsSameTeam"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
