/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNodeMirror extends AnimNodeBlendBase
	native(Anim)
	hidecategories(Object);

var()	bool	bEnableMirroring;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void GetBoneAtoms(FBoneAtomArray& Atoms, const TArray<BYTE>& DesiredBones, FBoneAtom& RootMotionDelta, INT& bHasRootMotion, FCurveKeyArray& CurveKeys);

}


defaultproperties
{
   bEnableMirroring=True
   Children(0)=(Name="Child",Weight=1.000000)
   bFixNumChildren=True
   CategoryDesc="Mirror"
   Name="Default__AnimNodeMirror"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
