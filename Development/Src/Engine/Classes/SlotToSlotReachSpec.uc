/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SlotToSlotReachSpec extends ForcedReachSpec
	native;

// (cpptext)
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
	virtual INT defineFor( class ANavigationPoint *begin, class ANavigationPoint * dest, class APawn * Scout );
	virtual INT CostFor(APawn* P);
	virtual UBOOL CanBeSkipped( APawn* P );
	virtual UBOOL PrepareForMove(AController * C);

}


defaultproperties
{
   PruneSpecList(0)=Class'Engine.ReachSpec'
   Name="Default__SlotToSlotReachSpec"
   ObjectArchetype=ForcedReachSpec'Engine.Default__ForcedReachSpec'
}
