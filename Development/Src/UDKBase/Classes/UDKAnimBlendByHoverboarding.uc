/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKAnimBlendByHoverboarding extends UDKAnimBlendBase
	native(Animation);

var	int		LastActiveChildIndex;
var	float	BoardLeanAmount;

var()	float	FallTimeBeforeAnim;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   FallTimeBeforeAnim=0.300000
   Children(0)=(Name="Standing")
   Children(1)=(Name="TurnLeft")
   Children(2)=(Name="TurnRight")
   Children(3)=(Name="LeanLeft")
   Children(4)=(Name="LeanRight")
   Children(5)=(Name="StrafeLeft")
   Children(6)=(Name="StrafeRight")
   Children(7)=(Name="Crouching")
   Children(8)=(Name="Jumping")
   Children(9)=(Name="Falling")
   Children(10)=(Name="Landed")
   Children(11)=(Name="GrabTrick")
   Children(12)=(Name="Spinning")
   Children(13)=(Name="SpinWarmupLeft")
   Children(14)=(Name="SpinWarmupRight")
   Children(15)=(Name="Trick1")
   Children(16)=(Name="Trick2")
   Children(17)=(Name="Trick3")
   bFixNumChildren=True
   Name="Default__UDKAnimBlendByHoverboarding"
   ObjectArchetype=UDKAnimBlendBase'UDKBase.Default__UDKAnimBlendBase'
}
