/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
/** 
 * Defines the parameters for an in world looping ambient sound e.g. a wind sound
 */
 
class SoundNodeAmbient extends SoundNode
	native( Sound )
	hidecategories( Object )
	AutoExpandCategories( Attenuation, LowPassFilter, Modulation, Sounds, Spatialization )
	DontSortCategories( Attenuation, LowPassFilter, Modulation, Sounds, Spatialization )
	dependson( SoundNodeAttenuation )
	editinlinenew;

struct native AmbientSoundSlot
{
	var()	SoundNodeWave	Wave;
	var()	float			PitchScale;
	var()	float			VolumeScale;
	var()	float			Weight;

	structdefaultproperties
	{
		PitchScale=1.0
		VolumeScale=1.0
		Weight=1.0
	}
	
	structcpptext
	{
		FAmbientSoundSlot( void )
		{
			PitchScale = 1.0f;
			VolumeScale = 1.0f;
			Weight = 1.0f;
		}
	}
};

/* The settings for attenuating. */
var( Attenuation )		bool					bAttenuate<ToolTip=Enable attenuation via volume>;
var( Attenuation )		bool					bSpatialize<ToolTip=Enable the source to be positioned in 3D>;
var( Attenuation )		float					dBAttenuationAtMax<ToolTip=The volume at maximum distance in deciBels>;

/** What kind of attenuation model to use */
var( Attenuation )		SoundDistanceModel		DistanceModel<ToolTip=The type of volume versus distance algorithm to use>;

var( Attenuation )		float					RadiusMin<ToolTip=The range at which the sound starts attenuating>;
var( Attenuation )		float					RadiusMax<ToolTip=The range at which the sound has attenuated completely>;

/* The settings for attenuating with a low pass filter. */
var( LowPassFilter )	bool					bAttenuateWithLPF<ToolTip=Enable attenuation via low pass filter>;
var( LowPassFilter )	float					LPFRadiusMin<ToolTip=The range at which to start applying a low passfilter>;
var( LowPassFilter )	float					LPFRadiusMax<ToolTip=The range at which to apply the maximum amount of low pass filter>;

var( Modulation )		float					PitchMin<ToolTip=The lower bound of pitch (1.0 is no change)>;
var( Modulation )		float					PitchMax<ToolTip=The upper bound of pitch (1.0 is no change)>;

var( Modulation )		float					VolumeMin<ToolTip=The lower bound of volume (1.0 is no change)>;
var( Modulation )		float					VolumeMax<ToolTip=The upper bound of volume (1.0 is no change)>;

var( Sounds )			array<AmbientSoundSlot>	SoundSlots<ToolTip=Sounds to play>;

var			deprecated	SoundNodeWave			Wave;
var			deprecated	bool					bAttenuateWithLowPassFilter;
var			deprecated	rawdistributionfloat	MinRadius;
var			deprecated	rawdistributionfloat	MaxRadius;
var			deprecated	rawdistributionfloat	LPFMinRadius;
var			deprecated	rawdistributionfloat	LPFMaxRadius;
var			deprecated	rawdistributionfloat	PitchModulation;
var			deprecated	rawdistributionfloat	VolumeModulation;

defaultproperties
{
   bAttenuate=True
   bSpatialize=True
   dBAttenuationAtMax=-60.000000
   RadiusMin=2000.000000
   RadiusMax=5000.000000
   LPFRadiusMin=3500.000000
   LPFRadiusMax=7000.000000
   PitchMin=1.000000
   PitchMax=1.000000
   VolumeMin=0.700000
   VolumeMax=0.700000
   MinRadius=(Distribution=DistributionMinRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(400.000000,400.000000,400.000000,400.000000))
   MaxRadius=(Distribution=DistributionMaxRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(5000.000000,5000.000000,5000.000000,5000.000000))
   LPFMinRadius=(Distribution=DistributionLPFMinRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1500.000000,1500.000000,1500.000000,1500.000000))
   LPFMaxRadius=(Distribution=DistributionLPFMaxRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(2500.000000,2500.000000,2500.000000,2500.000000))
   PitchModulation=(Distribution=DistributionPitch,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   VolumeModulation=(Distribution=DistributionVolume,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.700000,0.700000,0.700000,0.700000))
   Name="Default__SoundNodeAmbient"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
