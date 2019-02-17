/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKSkelControl_SpinControl extends SkelControlSingleBone
	native(Animation)
	hidecategories(Adjustments,Translation,Rotation);

/** How fast is the core to spin at max health */

var(Spin)	float 	DegreesPerSecond;
var(Spin)	vector	Axis;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   DegreesPerSecond=180.000000
   bApplyRotation=True
   bAddRotation=True
   BoneRotationSpace=BCS_ActorSpace
   Name="Default__UDKSkelControl_SpinControl"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
