/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DynamicSpriteComponent extends SpriteComponent
	DontCollapseCategories
	native;

/** Animated Scale. Relative to DrawScale. */
var() InterpCurveFloat AnimatedScale;

/** Animated color + alpha */
var() InterpCurveLinearColor AnimatedColor;

/** Animated 2D position (screen space). Relative to StartPosition. */
var() InterpCurveVector2D AnimatedPosition;

/** 3D world space offset from Location */
var() Vector LocationOffset;

/** How many times to loop (-1 = infinite) */
var() int LoopCount;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   LoopCount=-1
   ReplacementPrimitive=None
   Name="Default__DynamicSpriteComponent"
   ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
}
