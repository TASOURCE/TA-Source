/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class SeqAct_SetMotionBlurParams extends SeqAct_Latent
	native(Sequence);
	
/** This is a scalar on the blur */
var() float MotionBlurAmount;
/** Time to interpolate values over */
var() float InterpolateSeconds;
/** Elapsed interpolation time */
var float InterpolateElapsed;

// Previous values, used in lerp()
var float OldMotionBlurAmount;

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
   MotionBlurAmount=0.100000
   InterpolateSeconds=2.000000
   InputLinks(0)=(LinkDesc="Enable")
   InputLinks(1)=(LinkDesc="Disable")
   ObjName="Motion Blur"
   ObjCategory="Camera"
   Name="Default__SeqAct_SetMotionBlurParams"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
