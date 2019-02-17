/**
* Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
*/
class SeqAct_PlayAgentAnimation extends SeqAct_Latent
	dependson(GameCrowdAgent)
	native;

/** List of animations to play while at this node */
var() Array<name> AnimationList;

var() float BlendInTime;
var() float BlendOutTime;

var() bool bUseRootMotion;

/** If true, face action target before starting animation */
var() bool bFaceActionTargetFirst;

/** If true, loop the last animation in the list forever */
var() bool bLooping;

/** Which animation to loop in AnimationList if bLooping == TRUE */
var() int LoopIndex;

/** How long to loop the animation if bLooping == TRUE, -1.f == infinite */
var() float LoopTime;

/** Whether should blend between animations in the list.  Set True if they don't match at start/end */
var() bool bBlendBetweenAnims;


/** Optional other actor that actions should point at, instead of at the actual destination location. */
var actor ActionTarget;

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

function SetCurrentAnimationActionFor(GameCrowdAgentSkeletal Agent)
{
	local GameCrowdBehavior_PlayAnimation AnimBehavior;
	local int i;
	
	// init behavior properties
	AnimBehavior = new(Agent) class'GameCrowdBehavior_PlayAnimation';
	AnimBehavior.AnimSequence = self;
	AnimBehavior.BlendInTime = BlendInTime;
	AnimBehavior.BlendOutTime = BlendOutTime;
	AnimBehavior.bUseRootMotion = bUseRootMotion;
	AnimBehavior.bFaceActionTargetFirst = bFaceActionTargetFirst;
	AnimBehavior.bLooping = bLooping;
	AnimBehavior.LoopIndex = LoopIndex;
	AnimBehavior.LoopTime = LoopTime;
	AnimBehavior.bBlendBetweenAnims = bBlendBetweenAnims;
	AnimBehavior.CustomActionTarget = ActionTarget;
	
	for ( i=0; i<AnimationList.Length; i++ )
	{
		AnimBehavior.AnimationList[i] = AnimationList[i];
	}

	// activate behavior
	Agent.ActivateInstancedBehavior(AnimBehavior);
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   BlendInTime=0.200000
   BlendOutTime=0.200000
   LoopTime=-1.000000
   bAutoActivateOutputLinks=False
   InputLinks(0)=(LinkDesc="Play")
   InputLinks(1)=(LinkDesc="Stop")
   OutputLinks(1)=(LinkDesc="Stopped")
   OutputLinks(2)=(LinkDesc="Started")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Action Focus",PropertyName="ActionTarget")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Out Agent",bWriteable=True)
   ObjName="Play Agent Animation"
   ObjCategory="Crowd"
   Name="Default__SeqAct_PlayAgentAnimation"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
