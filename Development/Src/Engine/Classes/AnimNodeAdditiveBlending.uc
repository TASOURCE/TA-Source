/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class AnimNodeAdditiveBlending extends AnimNodeBlend
	native(Anim);

/**
 * if TRUE, pass through (skip additive animation blending) when mesh is not rendered
 */
var(Performance) bool	bPassThroughWhenNotRendered;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Overridden so we can keep child zero weight at 1.
 */
native function SetBlendTarget( float BlendTarget, float BlendTime );

cpptext
{
	virtual void InitAnim(USkeletalMeshComponent* MeshComp, UAnimNodeBlendBase* Parent);
	virtual	void TickAnim(FLOAT DeltaSeconds);
	void GetChildAtoms(INT ChildIndex, FBoneAtomArray& Atoms, const TArray<BYTE>& DesiredBones, FBoneAtom& RootMotionDelta, INT& bHasRootMotion, FCurveKeyArray& CurveKeys);
	virtual void GetBoneAtoms(FBoneAtomArray& Atoms, const TArray<BYTE>& DesiredBones, FBoneAtom& RootMotionDelta, INT& bHasRootMotion, FCurveKeyArray& CurveKeys);

}


defaultproperties
{
   bPassThroughWhenNotRendered=True
   Child2Weight=1.000000
   Child2WeightTarget=1.000000
   Children(0)=(Name="Base Anim Input")
   Children(1)=(Name="Additive Anim Input",Weight=1.000000)
   CategoryDesc="Additive"
   Name="Default__AnimNodeAdditiveBlending"
   ObjectArchetype=AnimNodeBlend'Engine.Default__AnimNodeBlend'
}
