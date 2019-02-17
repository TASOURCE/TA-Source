/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class AnimNodeBlend extends AnimNodeBlendBase
	native(Anim)
	hidecategories(Object);

var		float		Child2Weight;

var		float		Child2WeightTarget;
var		float		BlendTimeToGo; // Seconds

/** 
 * if TRUE, do not blend when the Skeletal Mesh is not visible.
 * Optimization to save on blending time when meshes are not rendered.
 * Instant switch instead.
 */
var() bool	bSkipBlendWhenNotRendered;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Set desired balance of this blend.
 *
 * @param BlendTarget	Target amount of weight to put on Children(1) (second child). Between 0.0 and 1.0.
 *						1.0 means take all animation from second child.
 * @param BlendTime		How long to take to get to BlendTarget.
 */
native function SetBlendTarget( float BlendTarget, float BlendTime );

cpptext
{
	// AnimNode interface
	virtual	void TickAnim(FLOAT DeltaSeconds);

	virtual INT GetNumSliders() const { return 1; }
	virtual FLOAT GetSliderPosition(INT SliderIndex, INT ValueIndex);
	virtual void HandleSliderMove(INT SliderIndex, INT ValueIndex, FLOAT NewSliderValue);
	virtual FString GetSliderDrawValue(INT SliderIndex);

}


defaultproperties
{
   bSkipBlendWhenNotRendered=True
   Children(0)=(Name="Child1",Weight=1.000000)
   Children(1)=(Name="Child2")
   bFixNumChildren=True
   Name="Default__AnimNodeBlend"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
