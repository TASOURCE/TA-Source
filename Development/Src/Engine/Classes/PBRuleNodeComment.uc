/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeComment extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);

/** Horizontal size of comment box in pixels. */
var()	int			SizeX;

/** Vertical size of comment box in pixels. */
var()	int			SizeY;

/** Width of border of comment box in pixels. */
var()	int			BorderWidth;

/** If we are drawing a box for this comment object, what colour should the border be. */
var()	Color		BorderColor;

/** If we are drawing a box, should it be filled, or just an outline. */
var()	bool		bFilled;

/** If bFilled is true, what colour should the background be. */
var()	Color		FillColor;



// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

	

cpptext
{
	virtual void DrawRuleNode(FLinkedObjectDrawHelper* InHelper, FViewport* Viewport, FCanvas* Canvas, UBOOL bSelected);

}


defaultproperties
{
   SizeX=128
   SizeY=64
   BorderWidth=1
   BorderColor=(B=0,G=0,R=0,A=255)
   bFilled=True
   FillColor=(B=255,G=255,R=255,A=16)
   Name="Default__PBRuleNodeComment"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
