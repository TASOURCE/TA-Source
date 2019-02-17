/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
/** 
 * Defines a random volume and pitch modification as a sound plays
 */
  
class SoundNodeModulatorContinuous extends SoundNode
	native( Sound )
	hidecategories( Object )
	editinlinenew;

/* 
 * NOTE:  If you have a looping sound the PlaybackTime will keep increasing.  And PlaybackTime
 * is what is used to get values from the Distributions.   So the Modulation will work the first
 * time through but subsequent times will not work for distributions with have a "size" to them.
 *
 * In short using a SoundNodeModulatorContinuous for looping sounds is not advised. 
 */
var()			rawdistributionfloat	PitchModulation;
var()			rawdistributionfloat	VolumeModulation;

defaultproperties
{
   PitchModulation=(Distribution=DistributionPitch,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=(0.950000,1.050000,0.950000,1.050000,0.950000,1.050000))
   VolumeModulation=(Distribution=DistributionVolume,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=(0.950000,1.050000,0.950000,1.050000,0.950000,1.050000))
   Name="Default__SoundNodeModulatorContinuous"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
