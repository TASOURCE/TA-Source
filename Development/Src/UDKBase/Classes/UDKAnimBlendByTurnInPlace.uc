/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKAnimBlendByTurnInPlace extends UDKAnimBlendBase
	native(Animation);

var() float	RootYawSpeedThresh;
var() float TurnInPlaceBlendSpeed;
var const transient UDKPawn OwnerUTP;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Children(0)=(Name="Idle",Weight=1.000000)
   Children(1)=(Name="TurnInPlace")
   bFixNumChildren=True
   Name="Default__UDKAnimBlendByTurnInPlace"
   ObjectArchetype=UDKAnimBlendBase'UDKBase.Default__UDKAnimBlendBase'
}
