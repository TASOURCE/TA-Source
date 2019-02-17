/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_RandomSwitch extends SeqAct_Switch
	native(Sequence);

/** List of indices we've already used once and disabled (for when bLooping and bAutoDisableLinks are both checked) **/
var array<INT> AutoDisabledIndices; 

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	virtual void Activated();

}


defaultproperties
{
   InputLinks(1)=(LinkDesc="Reset")
   VariableLinks(0)=(LinkDesc="Active Link",bWriteable=True,MinVars=0)
   ObjName="Random"
   Name="Default__SeqAct_RandomSwitch"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
}
