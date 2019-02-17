/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SeqAct_CameraFade extends SequenceAction
	native(Sequence);

/** Color to use as the fade */
var() color FadeColor;
/** Range of alpha to fade, FadeAlpha.X + ((1.f - FadeTimeRemaining/FadeTime) * (FadeAlpha.Y - FadeAlpha.X)) */
var deprecated vector2d FadeAlpha;
/** The opacity that the camera will fade to */
var() float FadeOpacity<ClampMin=0.0 | ClampMax=1.0>;
/** How long to fade to FadeOpacity from the camera's current fade opacity */
var() float FadeTime<ClampMin=0.0>;
/** Should the fade persist? */
var() bool bPersistFade;

/** Time left before reaching full alpha */
var float FadeTimeRemaining;
/** List of PCs this action is applied to */
var transient array<PlayerController> CachedPCs;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	void Activated();
	UBOOL UpdateOp(FLOAT DeltaTime);
	virtual void UpdateObject();

}


defaultproperties
{
   FadeAlpha=(X=0.000000,Y=1.000000)
   FadeOpacity=1.000000
   FadeTime=1.000000
   bPersistFade=True
   bLatentExecution=True
   bAutoActivateOutputLinks=False
   OutputLinks(1)=(LinkDesc="Finished")
   VariableLinks(0)=(bHidden=True)
   ObjName="Fade"
   ObjCategory="Camera"
   Name="Default__SeqAct_CameraFade"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
