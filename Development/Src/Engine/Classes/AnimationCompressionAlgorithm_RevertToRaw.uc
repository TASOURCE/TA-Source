/**
 * Reverts any animation compression, restoring the animation to the raw data.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class AnimationCompressionAlgorithm_RevertToRaw extends AnimationCompressionAlgorithm
	native(Anim);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
protected:
	/**
	 * Reverts any animation compression, restoring the animation to the raw data.
	 */
	virtual void DoReduction(class UAnimSequence* AnimSeq, class USkeletalMesh* SkelMesh, const TArray<class FBoneData>& BoneData);

}


defaultproperties
{
   Description="Revert To Raw"
   RotationCompressionFormat=ACF_None
   Name="Default__AnimationCompressionAlgorithm_RevertToRaw"
   ObjectArchetype=AnimationCompressionAlgorithm'Engine.Default__AnimationCompressionAlgorithm'
}
