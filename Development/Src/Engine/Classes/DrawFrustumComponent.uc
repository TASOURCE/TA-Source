/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DrawFrustumComponent extends PrimitiveComponent
	native
	noexport
	collapsecategories
	hidecategories(Object)
	editinlinenew;

/**
 *	Utility component for drawing a view frustum. Origin is at the component location, frustum points down position X axis.
 */

/** Color to draw the wireframe frustum. */
var()	color			FrustumColor;

/** Angle of longest dimension of view shape. 
  * If the angle is 0 then an orthographic projection is used */
var()	float			FrustumAngle;

/** Ratio of horizontal size over vertical size. */
var()	float			FrustumAspectRatio;

/** Distance from origin to start drawing the frustum. */
var()	float			FrustumStartDist;

/** Distance from origin to stop drawing the frustum. */
var()	float			FrustumEndDist;

/** optional texture to show on the near plane */
var()	Texture			Texture;

defaultproperties
{
   FrustumColor=(B=255,G=0,R=255,A=255)
   FrustumAngle=90.000000
   FrustumAspectRatio=1.333330
   FrustumStartDist=100.000000
   FrustumEndDist=1000.000000
   ReplacementPrimitive=None
   HiddenGame=True
   Name="Default__DrawFrustumComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
