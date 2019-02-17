/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNodeScalePlayRate extends AnimNodeBlendBase
	native(Anim)
	hidecategories(Object);

var() float	ScaleByValue;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	TickAnim(FLOAT DeltaSeconds);
	virtual FLOAT	GetScaleValue();

}


defaultproperties
{
   ScaleByValue=1.000000
   Children(0)=(Name="Input",Weight=1.000000)
   bFixNumChildren=True
   Name="Default__AnimNodeScalePlayRate"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
