/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class DrawCylinderComponent extends PrimitiveComponent
	native
	noexport
	collapsecategories
	hidecategories(Object)
	editinlinenew;

var()	color			CylinderColor;
var()	material		CylinderMaterial;
var()	float			CylinderRadius;
var()	float			CylinderTopRadius;
var()	float			CylinderHeight;
var()	float			CylinderHeightOffset;
var()	int				CylinderSides;
var()	bool			bDrawWireCylinder;
var()	bool			bDrawLitCylinder;
var()	bool			bDrawOnlyIfSelected;

defaultproperties
{
   CylinderColor=(B=0,G=0,R=255,A=255)
   CylinderRadius=100.000000
   CylinderTopRadius=100.000000
   CylinderHeight=100.000000
   CylinderSides=16
   bDrawWireCylinder=True
   ReplacementPrimitive=None
   HiddenGame=True
   Name="Default__DrawCylinderComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
