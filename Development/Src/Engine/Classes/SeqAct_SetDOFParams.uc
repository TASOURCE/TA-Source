/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class SeqAct_SetDOFParams extends SeqAct_Latent
	native(Sequence);
	
/** exponent to apply to blur amount after it has been normalized to [0,1] */
var() float FalloffExponent;
/** affects the radius of the DepthOfField bohek / how blurry the scene gets */
var() float BlurKernelSize;
/** [0,1] value for clamping how much blur to apply to items in front of the focus plane */
var(BlurAmount) float MaxNearBlurAmount<DisplayName=MaxNear>;
/** [0,1] value for clamping how much blur to apply */
var(BlurAmount) float MinBlurAmount<DisplayName=Min>;
/** [0,1] value for clamping how much blur to apply to items behind the focus plane */
var(BlurAmount) float MaxFarBlurAmount<DisplayName=MaxFar>;
/** blur color for debugging etc */
var deprecated color ModulateBlurColor;

/** inner focus radius */
var() float FocusInnerRadius;
/** used when FOCUS_Distance is enabled */
var() float FocusDistance;
/** used when FOCUS_Position is enabled */
var() vector FocusPosition;
/** Time to interpolate values over */
var() float InterpolateSeconds;
/** Elapsed interpolation time */
var float InterpolateElapsed;

// Previous values, used in lerp()
var float OldFalloffExponent;
var float OldBlurKernelSize;
var float OldMaxNearBlurAmount;
var float OldMinBlurAmount;
var float OldMaxFarBlurAmount;
var deprecated color OldModulateBlurColor;
var float OldFocusInnerRadius;
var float OldFocusDistance;
var vector OldFocusPosition;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	void Activated();
	void DeActivated();
	virtual UBOOL UpdateOp(FLOAT DeltaTime);

}


defaultproperties
{
   FalloffExponent=4.000000
   BlurKernelSize=5.000000
   MaxNearBlurAmount=1.000000
   MaxFarBlurAmount=1.000000
   FocusInnerRadius=600.000000
   FocusDistance=600.000000
   InterpolateSeconds=2.000000
   InputLinks(0)=(LinkDesc="Enable")
   InputLinks(1)=(LinkDesc="Disable")
   ObjName="Depth Of Field"
   ObjCategory="Camera"
   Name="Default__SeqAct_SetDOFParams"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
