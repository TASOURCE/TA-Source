/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class GameThirdPersonCameraMode_Default extends GameThirdPersonCameraMode
	config(Camera)
	native(Camera);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


/** Z adjustment to camera worst location if target pawn is in aiming stance */
var() protected const float WorstLocAimingZOffset;

var protected transient bool	bTemporaryOriginRotInterp;
var() protected const float		TemporaryOriginRotInterpSpeed;

defaultproperties
{
   WorstLocAimingZOffset=-10.000000
   TemporaryOriginRotInterpSpeed=12.000000
   BlendTime=0.250000
   bValidateWorstLoc=False
   StrafeLeftAdjustment=(X=0.000000,Y=-15.000000,Z=0.000000)
   StrafeRightAdjustment=(X=0.000000,Y=15.000000,Z=0.000000)
   StrafeOffsetScalingThreshold=200.000000
   RunFwdAdjustment=(X=20.000000,Y=0.000000,Z=0.000000)
   RunBackAdjustment=(X=-30.000000,Y=0.000000,Z=0.000000)
   RunOffsetScalingThreshold=200.000000
   WorstLocOffset=(X=-8.000000,Y=1.000000,Z=95.000000)
   ViewOffset=(OffsetHigh=(X=-128.000000,Y=56.000000,Z=40.000000),OffsetMid=(X=-160.000000,Y=48.000000,Z=16.000000),OffsetLow=(X=-160.000000,Y=48.000000,Z=56.000000))
   ViewOffset_ViewportAdjustments(1)=(OffsetHigh=(X=0.000000,Y=-20.000000,Z=0.000000),OffsetMid=(X=0.000000,Y=-20.000000,Z=0.000000),OffsetLow=(X=0.000000,Y=-20.000000,Z=0.000000))
   ViewOffset_ViewportAdjustments(2)=(OffsetHigh=(X=0.000000,Y=0.000000,Z=-12.000000),OffsetMid=(X=0.000000,Y=0.000000,Z=-12.000000),OffsetLow=(X=0.000000,Y=0.000000,Z=-12.000000))
   ViewOffset_ViewportAdjustments(3)=(OffsetHigh=(X=0.000000,Y=0.000000,Z=17.000000),OffsetMid=(X=0.000000,Y=0.000000,Z=17.000000),OffsetLow=(X=0.000000,Y=0.000000,Z=17.000000))
   ViewOffset_ViewportAdjustments(4)=(OffsetHigh=(X=0.000000,Y=0.000000,Z=-15.000000),OffsetMid=(X=0.000000,Y=0.000000,Z=-15.000000),OffsetLow=(X=0.000000,Y=0.000000,Z=-15.000000))
   Name="Default__GameThirdPersonCameraMode_Default"
   ObjectArchetype=GameThirdPersonCameraMode'GameFramework.Default__GameThirdPersonCameraMode'
}
