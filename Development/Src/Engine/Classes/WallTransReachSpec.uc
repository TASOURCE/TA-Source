/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class WallTransReachSpec extends ForcedReachSpec
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual INT CostFor(APawn* P);

}


defaultproperties
{
   bSkipPrune=True
   Name="Default__WallTransReachSpec"
   ObjectArchetype=ForcedReachSpec'Engine.Default__ForcedReachSpec'
}
