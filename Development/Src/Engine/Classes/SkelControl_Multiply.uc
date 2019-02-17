/**
 *	Simple controller for multiplication node.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SkelControl_Multiply extends SkelControlBase
	native(Anim);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** How much to scale the angle */
var()   FLOAT   Multiplier;

cpptext
{
	// USkelControlBase interface
	virtual void GetAffectedBones(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<INT>& OutBoneIndices);
	virtual void CalculateNewBoneTransforms(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<FBoneAtom>& OutBoneTransforms);
	FQuat ExtractAngle(INT BoneIndex, USkeletalMeshComponent* SkelComp);

}


defaultproperties
{
   Multiplier=1.000000
   bIgnoreWhenNotRendered=True
   CategoryDesc="Single Bone"
   Name="Default__SkelControl_Multiply"
   ObjectArchetype=SkelControlBase'Engine.Default__SkelControlBase'
}
