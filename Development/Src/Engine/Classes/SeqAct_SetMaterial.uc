/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetMaterial extends SequenceAction
	native(Sequence);

/** Material to apply to target when action is activated. */
var()	MaterialInterface	NewMaterial;

/** Index in the Materials array to replace with NewMaterial when this action is activated. */
var()	INT					MaterialIndex;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// UObject interface.
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   VariableLinks(0)=(bModifiesLinkedObject=True)
   ObjName="Set Material"
   ObjCategory="Actor"
   Name="Default__SeqAct_SetMaterial"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
