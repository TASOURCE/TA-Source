/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** 
 * Defines the parameters for an in world non looping ambient sound e.g. a car driving by
 */

class SoundNodeAmbientNonLoop extends SoundNodeAmbient
	native( Sound )
	hidecategories( Object )
	AutoExpandCategories( Delay )
	dontsortcategories( Delay )
	dependson( SoundNodeAttenuation )
	editinlinenew;

var( Delay )			float					DelayMin<ToolTip=The lower bound of the delay in seconds>;
var( Delay )			float					DelayMax<ToolTip=The upper bound of the delay in seconds>;

var			deprecated	rawdistributionfloat	DelayTime;

defaultproperties
{
   DelayTime=(Distribution=DistributionDelayTime,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   MinRadius=(Distribution=DistributionMinRadius)
   MaxRadius=(Distribution=DistributionMaxRadius)
   LPFMinRadius=(Distribution=DistributionLPFMinRadius)
   LPFMaxRadius=(Distribution=DistributionLPFMaxRadius)
   PitchModulation=(Distribution=DistributionPitch)
   VolumeModulation=(Distribution=DistributionVolume)
   Name="Default__SoundNodeAmbientNonLoop"
   ObjectArchetype=SoundNodeAmbient'Engine.Default__SoundNodeAmbient'
}
