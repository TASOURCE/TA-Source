/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** 
 * Defines the parameters for an in world non looping ambient sound e.g. a car driving by
 */

class SoundNodeAmbientNonLoopToggle extends SoundNodeAmbientNonLoop
	native( Sound )
	hidecategories( Object )
	dependson( SoundNodeAttenuation )
	editinlinenew;

defaultproperties
{
   DelayTime=(Distribution=DistributionDelayTime)
   MinRadius=(Distribution=DistributionMinRadius)
   MaxRadius=(Distribution=DistributionMaxRadius)
   LPFMinRadius=(Distribution=DistributionLPFMinRadius)
   LPFMaxRadius=(Distribution=DistributionLPFMaxRadius)
   PitchModulation=(Distribution=DistributionPitch)
   VolumeModulation=(Distribution=DistributionVolume)
   Name="Default__SoundNodeAmbientNonLoopToggle"
   ObjectArchetype=SoundNodeAmbientNonLoop'Engine.Default__SoundNodeAmbientNonLoop'
}
