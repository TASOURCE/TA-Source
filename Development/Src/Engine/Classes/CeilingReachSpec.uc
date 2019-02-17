/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class CeilingReachSpec extends ReachSpec
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual INT CostFor( APawn* P );
	virtual INT AdjustedCostFor( APawn* P, const FVector& StartToGoalDir, ANavigationPoint* Goal, INT Cost );

}


defaultproperties
{
   Name="Default__CeilingReachSpec"
   ObjectArchetype=ReachSpec'Engine.Default__ReachSpec'
}
