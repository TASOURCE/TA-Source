/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKSkelControl_Rotate extends SkelControlSingleBone
	native(Animation);

/** Where we wish to get to */
var(Desired) rotator	DesiredBoneRotation;

/** The Rate we wish to rotate */
var(Desired) rotator	DesiredBoneRotationRate;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bApplyRotation=True
   bAddRotation=True
   BoneRotationSpace=BCS_BoneSpace
   Name="Default__UDKSkelControl_Rotate"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
