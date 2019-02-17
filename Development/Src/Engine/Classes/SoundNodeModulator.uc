/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
/** 
 * Defines a random volume and pitch modification when a sound starts
 */
 
class SoundNodeModulator extends SoundNode
	native( Sound )
	hidecategories( Object )
	editinlinenew;

var( Modulation )		float					PitchMin<ToolTip=The lower bound of pitch (1.0 is no change)>;
var( Modulation )		float					PitchMax<ToolTip=The upper bound of pitch (1.0 is no change)>;

var( Modulation )		float					VolumeMin<ToolTip=The lower bound of volume (1.0 is no change)>;
var( Modulation )		float					VolumeMax<ToolTip=The upper bound of volume (1.0 is no change)>;

var			deprecated	rawdistributionfloat	PitchModulation;
var			deprecated	rawdistributionfloat	VolumeModulation;

defaultproperties
{
   PitchMin=0.950000
   PitchMax=1.050000
   VolumeMin=0.950000
   VolumeMax=1.050000
   PitchModulation=(Distribution=DistributionPitch,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=(0.950000,1.050000,0.950000,1.050000,0.950000,1.050000))
   VolumeModulation=(Distribution=DistributionVolume,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=(0.950000,1.050000,0.950000,1.050000,0.950000,1.050000))
   Name="Default__SoundNodeModulator"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
