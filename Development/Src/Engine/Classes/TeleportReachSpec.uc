/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


// represents the path of a teleporter
class TeleportReachSpec extends ReachSpec
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
   Distance=100
   bAddToNavigationOctree=False
   bCheckForObstructions=False
   Name="Default__TeleportReachSpec"
   ObjectArchetype=ReachSpec'Engine.Default__ReachSpec'
}
