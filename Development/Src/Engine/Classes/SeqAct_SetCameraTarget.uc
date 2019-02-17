/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetCameraTarget extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Internal.  Holds a ref to the new desired camera target. */
var transient Actor		CameraTarget;

/** Parameters that define how the camera will transition to the new target. */
var() const Camera.ViewTargetTransitionParams	TransitionParams;

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	void Activated();

}


defaultproperties
{
   TransitionParams=(BlendFunction=VTBlend_Cubic,BlendExp=2.000000)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Cam Target")
   ObjName="Set Camera Target"
   ObjCategory="Camera"
   Name="Default__SeqAct_SetCameraTarget"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
