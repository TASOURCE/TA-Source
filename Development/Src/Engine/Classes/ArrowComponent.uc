/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ArrowComponent extends PrimitiveComponent
	native
	noexport
	collapsecategories
	hidecategories(Object)
	editinlinenew;

var() color					ArrowColor;
var() float					ArrowSize;
/** If TRUE, don't show the arrow when SHOW_Sprites is disabled. */
var() bool					bTreatAsASprite;

defaultproperties
{
   ArrowColor=(B=0,G=0,R=255,A=255)
   ArrowSize=1.000000
   ReplacementPrimitive=None
   HiddenGame=True
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   Name="Default__ArrowComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
