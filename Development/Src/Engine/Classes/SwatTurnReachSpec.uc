/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class SwatTurnReachSpec extends ForcedReachSpec
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

// Value CoverLink.ECoverDirection for movement direction along this spec
var() editconst Byte SpecDirection;

cpptext
{
	virtual INT CostFor(APawn* P);
	virtual INT defineFor( class ANavigationPoint *begin, class ANavigationPoint * dest, class APawn * Scout );
	virtual FVector GetForcedPathSize( class ANavigationPoint* Start, class ANavigationPoint* End, class AScout* Scout );

}


defaultproperties
{
   PruneSpecList(0)=Class'Engine.ReachSpec'
   Name="Default__SwatTurnReachSpec"
   ObjectArchetype=ForcedReachSpec'Engine.Default__ForcedReachSpec'
}
