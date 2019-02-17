/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class CoverSlipReachSpec extends ForcedReachSpec
	native;

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
	virtual FVector GetForcedPathSize( class ANavigationPoint* Start, class ANavigationPoint* End, class AScout* Scout );

}


defaultproperties
{
   bSkipPrune=True
   Name="Default__CoverSlipReachSpec"
   ObjectArchetype=ForcedReachSpec'Engine.Default__ForcedReachSpec'
}
