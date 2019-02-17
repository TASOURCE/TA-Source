/**
 * Bitwise animation compression only; performs no key reduction.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class AnimationCompressionAlgorithm_BitwiseCompressOnly extends AnimationCompressionAlgorithm
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
	 * Bitwise animation compression only; performs no key reduction.
	 */
	virtual void DoReduction(class UAnimSequence* AnimSeq, class USkeletalMesh* SkelMesh, const TArray<class FBoneData>& BoneData);

}


defaultproperties
{
   Description="Bitwise Compress Only"
   Name="Default__AnimationCompressionAlgorithm_BitwiseCompressOnly"
   ObjectArchetype=AnimationCompressionAlgorithm'Engine.Default__AnimationCompressionAlgorithm'
}
