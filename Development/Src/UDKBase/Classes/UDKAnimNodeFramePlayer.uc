/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKAnimNodeFramePlayer extends AnimNodeSequence
	native(Animation);

native function SetAnimation(name Sequence, float RateScale);
native function SetAnimPosition(float Perc);

defaultproperties
{
   Name="Default__UDKAnimNodeFramePlayer"
   ObjectArchetype=AnimNodeSequence'Engine.Default__AnimNodeSequence'
}
