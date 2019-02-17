/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify_CameraEffect extends AnimNotify
	native(Anim);

/** The effect to play non the camera **/
var() class<EmitterCameraLensEffectBase> CameraLensEffect;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// AnimNotify interface.
	virtual void Notify( class UAnimNodeSequence* NodeSeq );

}


defaultproperties
{
   Name="Default__AnimNotify_CameraEffect"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}