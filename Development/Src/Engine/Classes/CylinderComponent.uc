/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class CylinderComponent extends PrimitiveComponent
	native
	noexport
	collapsecategories
	editinlinenew;

var() const export float	CollisionHeight;
var() const export float	CollisionRadius;

/** Color used to draw the cylinder. */
var() const	color			CylinderColor;

/**	Whether to draw the red bounding box for this cylinder. */
var		const bool			bDrawBoundingBox;

/** If TRUE, this cylinder will always draw when SHOW_Collision is on, even if CollideActors is FALSE. */
var		const bool			bDrawNonColliding;

/** If TRUE, this cylinder will always draw when the actor is selected. */
var		const bool			bAlwaysRenderIfSelected;

native final function SetCylinderSize(float NewRadius, float NewHeight);

// The rotation part of the local-to-world transformation has no effect on the cylinder; it is always
// assumed to be aligned with the z-axis. The translation part is however taken into consideration.

defaultproperties
{
   CollisionHeight=22.000000
   CollisionRadius=22.000000
   CylinderColor=(B=157,G=149,R=223,A=255)
   bDrawBoundingBox=True
   ReplacementPrimitive=None
   HiddenGame=True
   bCastDynamicShadow=False
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   Name="Default__CylinderComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
