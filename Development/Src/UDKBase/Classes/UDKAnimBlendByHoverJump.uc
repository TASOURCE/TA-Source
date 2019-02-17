/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKAnimBlendByHoverJump extends UDKAnimBlendByFall
	Native(Animation);

var const transient Pawn	OwnerP;
var const transient UDKVehicle OwnerHV;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bIgnoreDoubleJumps=True
   Name="Default__UDKAnimBlendByHoverJump"
   ObjectArchetype=UDKAnimBlendByFall'UDKBase.Default__UDKAnimBlendByFall'
}
