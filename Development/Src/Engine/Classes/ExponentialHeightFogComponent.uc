/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ExponentialHeightFogComponent extends ActorComponent
	native(FogVolume)
	collapsecategories
	hidecategories(Object)
	editinlinenew;

/** True if the fog is enabled. */
var()	const			bool	bEnabled;

/** z-height for the fog plane - updated by the owning actor */
var		const			float	FogHeight;

/** Global density factor. */
var()	const	interp	float	FogDensity;

/** 
 * Height density factor, controls how the density increases as height decreases.  
 * Smaller values make the visible transition larger.
 */
var()	const	interp	float	FogHeightFalloff;

/** 
 * Maximum opacity of the fog.  
 * A value of 1 means the fog can become fully opaque at a distance and replace scene color completely,
 * A value of 0 means the fog color will not be factored in at all.
 */
var()	const	interp	float	FogMaxOpacity;

/** Distance from the camera that the fog will start, in world units. */
var()	const	interp	float	StartDistance;

/** 
 * LightInscatteringColor is used in the direction of the dominant directional light, and OppositeLightColor is used in the opposite direction.
 * LightTerminatorAngle is the angle in degrees from the dominant directional light that an even amount of OppositeLightColor and LightInscatteringColor are used for the final fog color.
 * If there is no dominant directional light enabled, LightInscatteringColor will correspond to up in world space.
 */
var()	const	interp	float	LightTerminatorAngle;

/** Scales OppositeLightColor. */
var()	const	interp	float	OppositeLightBrightness;

/** Fog Color used for the opposite direction from the dominant directional light. */
var()	const	interp	color	OppositeLightColor;

/** Scales LightInscatteringColor. */
var()	const	interp	float	LightInscatteringBrightness;

/** Fog Color used for the direction of the dominant directional light. */
var()	const	interp	color	LightInscatteringColor;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Changes the enabled state of the height fog component.
 * @param bSetEnabled - The new value for bEnabled.
 */
final native function SetEnabled(bool bSetEnabled);

cpptext
{
protected:
	// ActorComponent interface.
	virtual void SetParentToWorld(const FMatrix& ParentToWorld);
	virtual void Attach();
	virtual void UpdateTransform();
	virtual void Detach( UBOOL bWillReattach = FALSE );
public:
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   bEnabled=True
   FogDensity=0.020000
   FogHeightFalloff=0.200000
   FogMaxOpacity=1.000000
   LightTerminatorAngle=45.000000
   OppositeLightBrightness=0.200000
   OppositeLightColor=(B=255,G=208,R=177,A=0)
   LightInscatteringBrightness=1.000000
   LightInscatteringColor=(B=41,G=212,R=245,A=0)
   Name="Default__ExponentialHeightFogComponent"
   ObjectArchetype=ActorComponent'Engine.Default__ActorComponent'
}
