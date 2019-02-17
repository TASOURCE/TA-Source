/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKAnimBlendByDriving extends AnimNodeBlend
	native(Animation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Force an update of the driving state now. */
native function UpdateDrivingState();

defaultproperties
{
   Children(0)=(Name="Not-Driving")
   Children(1)=(Name="Driving")
   Name="Default__UDKAnimBlendByDriving"
   ObjectArchetype=AnimNodeBlend'Engine.Default__AnimNodeBlend'
}
