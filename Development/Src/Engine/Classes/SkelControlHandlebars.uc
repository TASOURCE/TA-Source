class SkelControlHandlebars extends SkelControlSingleBone
	hidecategories(Translation,Rotation)
	native(Anim);

/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 *	Controller used by vehicle system for rotating a steering wheel.
 *  Automatically orients a handlebar/steeringwheel based on the wheel orientation
 */

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Axis around which wheel rolling occurs. */
var(Handlebars)		EAxis	WheelRollAxis;

/** Name of the bone whose rotation will control the steering */
var(Handlebars)		name	WheelBoneName;

/** Axis around which steering occurs. */
var(Handlebars)		EAxis	HandlebarRotateAxis;

var(HandleBars)		bool	bInvertRotation;

/** Cached index of the wheel bone */ 
var int SteerWheelBoneIndex;

cpptext
{
	// SkelControl interface
	void CalculateNewBoneTransforms(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<FBoneAtom>& OutBoneTransforms);

	// Editor modification
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   WheelRollAxis=AXIS_Y
   HandlebarRotateAxis=AXIS_Z
   SteerWheelBoneIndex=-1
   bApplyRotation=True
   BoneTranslationSpace=BCS_BoneSpace
   BoneRotationSpace=BCS_BoneSpace
   bIgnoreWhenNotRendered=True
   Name="Default__SkelControlHandlebars"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
