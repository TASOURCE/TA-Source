/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DrawBoxComponent extends PrimitiveComponent
	native
	noexport
	collapsecategories
	hidecategories(Object)
	editinlinenew;

var()	color			BoxColor;
var()	material		BoxMaterial;
var()	vector			BoxExtent;
var()	bool			bDrawWireBox;
var()	bool			bDrawLitBox;
var()	bool			bDrawOnlyIfSelected;

defaultproperties
{
   BoxColor=(B=0,G=0,R=255,A=255)
   BoxExtent=(X=200.000000,Y=200.000000,Z=200.000000)
   bDrawWireBox=True
   ReplacementPrimitive=None
   HiddenGame=True
   Name="Default__DrawBoxComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
