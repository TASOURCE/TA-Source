/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKAnimBlendByFlying extends UDKAnimBlendBase
	native(Animation);

//Order is important here (corresponds to blendlist node children)
var const enum EFlyingState
{
	Flying_NotFlying,
	Flying_OpeningWings,
	Flying_Flying,
	Flying_ClosingWings
} FlyingState;

/** Access to the flying pawn */
var UDKPawn Pawn;

/** Access to the state of the flying animation */
var UDKAnimBlendBase FlyingMode;

/** Access to the aim offset controlling flight direction */
var AnimNodeAimOffset FlyingDir;

/** Does this pawn have a special start anim to play */
var() name StartingAnimName;
var bool bHasStartingAnim;

/** Does this pawn have a special end anim to play */
var() name EndingAnimName;
var bool bHasEndingAnim;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Force an update of the flying state now. */
native function UpdateFlyingState();

defaultproperties
{
   StartingAnimName="Wings_Open"
   EndingAnimName="Wings_Close"
   Children(0)=(Name="Not Flying",Weight=0.800000)
   Children(1)=(Name="Flying",Weight=0.200000)
   bFixNumChildren=True
   Name="Default__UDKAnimBlendByFlying"
   ObjectArchetype=UDKAnimBlendBase'UDKBase.Default__UDKAnimBlendBase'
}
