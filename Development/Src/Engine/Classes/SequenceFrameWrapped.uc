/**
 * This is a version of the comment box which wraps the comment text within the box region.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SequenceFrameWrapped extends SequenceFrame
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void DrawSeqObj(FCanvas* Canvas, UBOOL bSelected, UBOOL bMouseOver, INT MouseOverConnType, INT MouseOverConnIndex, FLOAT MouseOverTime);

}


defaultproperties
{
   bDrawBox=True
   ObjName="Sequence Comment Wrapped"
   Name="Default__SequenceFrameWrapped"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
}
