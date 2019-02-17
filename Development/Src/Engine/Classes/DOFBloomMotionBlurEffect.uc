/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DOFBloomMotionBlurEffect extends DOFAndBloomEffect
	native;

/** Maximum blur velocity amount. This is a clamp on the amount of blur. */
var(MotionBlur) float MaxVelocity;

/** This is a scale that could be considered as the "sensitivity" of the blur. */
var(MotionBlur) float MotionBlurAmount;

/** Whether everything (static/dynamic objects) should motion blur or not. If disabled, only moving objects may blur. */
var(MotionBlur) bool FullMotionBlur;

/** Threshhold for when to turn off motion blur when the camera rotates swiftly during a single frame (in degrees). */
var(MotionBlur) float CameraRotationThreshold;

/** Threshhold for when to turn off motion blur when the camera translates swiftly during a single frame (in world units). */
var(MotionBlur) float CameraTranslationThreshold;

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
   MaxVelocity=1.000000
   MotionBlurAmount=0.500000
   FullMotionBlur=True
   CameraRotationThreshold=90.000000
   CameraTranslationThreshold=10000.000000
   bShowInEditor=False
   Name="Default__DOFBloomMotionBlurEffect"
   ObjectArchetype=DOFAndBloomEffect'Engine.Default__DOFAndBloomEffect'
}
