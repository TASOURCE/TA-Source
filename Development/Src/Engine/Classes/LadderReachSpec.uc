//=============================================================================
// LadderReachSpec.
//
// A LadderReachSpec connects Ladder NavigationPoints in a LadderVolume
//
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class LadderReachSpec extends ReachSpec
	native;

// (cpptext)
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
	virtual FPlane PathColor()
	{
		// light purple = ladder
		return FPlane(1.f,0.5f, 1.f,0.f);
	}
	virtual INT CostFor(APawn* P);

}


defaultproperties
{
   bCanCutCorners=False
   Name="Default__LadderReachSpec"
   ObjectArchetype=ReachSpec'Engine.Default__ReachSpec'
}
