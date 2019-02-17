/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class FloorToCeilingReachSpec extends ForcedReachSpec
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual INT CostFor(APawn* P);
	virtual INT AdjustedCostFor( APawn* P, const FVector& StartToGoalDir, ANavigationPoint* Goal, INT Cost );

}


defaultproperties
{
   bSkipPrune=True
   Name="Default__FloorToCeilingReachSpec"
   ObjectArchetype=ForcedReachSpec'Engine.Default__ForcedReachSpec'
}
