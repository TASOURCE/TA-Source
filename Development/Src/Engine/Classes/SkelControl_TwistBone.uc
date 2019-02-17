/**
 *	Simple controller for Twist/Roll bones.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SkelControl_TwistBone extends SkelControlBase
	native(Anim);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Name of source bone to use. For a forearm twist, that would be the hand bone name. */
var()   Name    SourceBoneName;
/** How much to scale down the roll angle */
var()   FLOAT   TwistAngleScale;

cpptext
{
	// USkelControlBase interface
	virtual void GetAffectedBones(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<INT>& OutBoneIndices);
	virtual void CalculateNewBoneTransforms(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<FBoneAtom>& OutBoneTransforms);
	FQuat ExtractRollAngle(INT BoneIndex, USkeletalMeshComponent* SkelComp);

}


defaultproperties
{
   TwistAngleScale=-0.500000
   bIgnoreWhenNotRendered=True
   CategoryDesc="Single Bone"
   Name="Default__SkelControl_TwistBone"
   ObjectArchetype=SkelControlBase'Engine.Default__SkelControlBase'
}
