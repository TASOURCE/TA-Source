//=============================================================================
// AdvancedReachSpec.
//
// An AdvancedReachspec can only be used by Controllers with bCanDoSpecial==true
//
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
class AdvancedReachSpec extends ReachSpec
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
		// purple path = advanced
		return FPlane(1.f,0.f,1.f, 0.f);
	}
	virtual INT CostFor(APawn* P);

}


defaultproperties
{
   bCanCutCorners=False
   Name="Default__AdvancedReachSpec"
   ObjectArchetype=ReachSpec'Engine.Default__ReachSpec'
}
