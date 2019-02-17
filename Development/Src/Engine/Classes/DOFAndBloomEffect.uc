/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Depth of Field post process effect
 *
 */
class DOFAndBloomEffect extends DOFEffect
	native;

/** A scale applied to blooming colors. */
var(Bloom) float BloomScale;

/** Any component of a pixel's color must be larger than this to contribute bloom. */
var(Bloom) float BloomThreshold;

/** Multiplies against the bloom color. */
var(Bloom) color BloomTint;

/** 
 * Scene color luminance must be less than this to receive bloom. 
 * This behaves like Photoshop's screen blend mode and prevents over-saturation from adding bloom to already bright areas.
 * The default value of 1 means that a pixel with a luminance of 1 won't receive any bloom, but a pixel with a luminance of .5 will receive half bloom.
 */
var(Bloom) float BloomScreenBlendThreshold;

/** A multiplier applied to all reads of scene color. */
var deprecated float SceneMultiplier;

/** the radius of the bloom effect 0..64 */
var(Bloom) float BlurBloomKernelSize;

/** Whether Bloom and DOF should be processed independently pass (slower, more memory) */
var deprecated bool bEnableSeparateBloom;

/** Whether the reference Depth of Field effect is enabled. (can be very slow) */
var(Advanced) bool bEnableReferenceDOF;

/** Whether the high quality mode of the (non reference) Depth of Field is enabled.  */
var(Advanced) bool bEnableDepthOfFieldHQ;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// UPostProcessEffect interface

	/**
	 * Creates a proxy to represent the render info for a post process effect
	 * @param WorldSettings - The world's post process settings for the view.
	 * @return The proxy object.
	 */
	virtual class FPostProcessSceneProxy* CreateSceneProxy(const FPostProcessSettings* WorldSettings);

	/**
	 * @param View - current view
	 * @return TRUE if the effect should be rendered
	 */
	virtual UBOOL IsShown(const FSceneView* View) const;

}


defaultproperties
{
   BloomScale=1.000000
   BloomThreshold=1.000000
   BloomTint=(B=255,G=255,R=255,A=0)
   BloomScreenBlendThreshold=10.000000
   BlurBloomKernelSize=16.000000
   BlurKernelSize=16.000000
   Name="Default__DOFAndBloomEffect"
   ObjectArchetype=DOFEffect'Engine.Default__DOFEffect'
}
