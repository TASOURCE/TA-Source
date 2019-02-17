/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKAnimBlendByVehicle extends UDKAnimBlendBase
	native(Animation);

var bool	  	bLastPawnDriving;
var Vehicle 	LastVehicle;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Force an update of the vehicle state now. */
native function UpdateVehicleState();

defaultproperties
{
   Children(0)=(Name="Default",Weight=1.000000)
   bFixNumChildren=True
   Name="Default__UDKAnimBlendByVehicle"
   ObjectArchetype=UDKAnimBlendBase'UDKBase.Default__UDKAnimBlendBase'
}
