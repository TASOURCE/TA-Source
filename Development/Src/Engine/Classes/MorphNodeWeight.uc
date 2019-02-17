/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MorphNodeWeight extends MorphNodeWeightBase
	native(Anim)
	hidecategories(Object);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
 
/** Weight to apply to all child nodes of this one. */
var		float	NodeWeight;


/** 
 *	Change the current NodeWeight of this MorphNodeWeight.
 */
native function		SetNodeWeight(float NewWeight);

cpptext
{
	virtual void GetActiveMorphs(TArray<FActiveMorph>& OutMorphs);
	
	virtual FLOAT GetSliderPosition();
	virtual void HandleSliderMove(FLOAT NewSliderValue);

}


defaultproperties
{
   NodeConns(0)=(ConnName="In")
   bDrawSlider=True
   Name="Default__MorphNodeWeight"
   ObjectArchetype=MorphNodeWeightBase'Engine.Default__MorphNodeWeightBase'
}
