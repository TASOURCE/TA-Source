class SkelControlWheel extends SkelControlSingleBone
	hidecategories(Translation,Rotation)
	native(Anim);

/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 *	Controller used by vehicle system for moving/rotating wheel.
 */


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Units to move the wheel up vertically. */
var(Wheel)		transient float	WheelDisplacement;

/** Maximum displacement that the wheel will be rendered at. Used to avoid graphical clipping of wheel into chassis etc */
var(Wheel)		float	WheelMaxRenderDisplacement;

/** Current rolling angle of wheel. In degrees. */
var(Wheel)		transient float	WheelRoll;

/** Axis around which the wheel rolls. */
var(Wheel)		EAxis	WheelRollAxis;

/** Steering angle of wheel. In degrees. */
var(Wheel)		transient float	WheelSteering;

/** Axis around which wheel steering occurs. */
var(Wheel)		EAxis	WheelSteeringAxis;

/** If we should invert the rotation applied to the wheel for rolling motion. */
var(Wheel)		bool	bInvertWheelRoll;

/** If we should invert rotation applied to the wheel for steering. */
var(Wheel)		bool	bInvertWheelSteering;

cpptext
{
	// SkelControlWheel interface
	void UpdateWheelControl( FLOAT InDisplacement, FLOAT InRoll, FLOAT InSteering );
	void CalculateNewBoneTransforms(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<FBoneAtom>& OutBoneTransforms);

}


defaultproperties
{
   WheelMaxRenderDisplacement=50.000000
   WheelRollAxis=AXIS_X
   WheelSteeringAxis=AXIS_Z
   bApplyTranslation=True
   bApplyRotation=True
   bAddTranslation=True
   bAddRotation=True
   BoneTranslationSpace=BCS_BoneSpace
   BoneRotationSpace=BCS_BoneSpace
   bIgnoreWhenNotRendered=True
   Name="Default__SkelControlWheel"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
