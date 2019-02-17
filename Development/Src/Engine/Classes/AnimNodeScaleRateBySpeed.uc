/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNodeScaleRateBySpeed extends AnimNodeScalePlayRate
	native(Anim)
	hidecategories(Object);

var() float	BaseSpeed;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
	

cpptext
{
	virtual FLOAT	GetScaleValue();

}


defaultproperties
{
   BaseSpeed=350.000000
   Name="Default__AnimNodeScaleRateBySpeed"
   ObjectArchetype=AnimNodeScalePlayRate'Engine.Default__AnimNodeScalePlayRate'
}
