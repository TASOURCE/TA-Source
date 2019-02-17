/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
/** 
 * Defines how a sounds changes volume with distance to the listener
 */ 
 
class SoundNodeAttenuation extends SoundNode
	native( Sound )
	hidecategories( Object )
	dontsortcategories( Attenuation, LowPassFilter )
	editinlinenew;

enum SoundDistanceModel
{
	ATTENUATION_Linear,
	ATTENUATION_Logarithmic,
	ATTENUATION_Inverse,
	ATTENUATION_LogReverse,
	ATTENUATION_NaturalSound
};

enum ESoundDistanceCalc
{
	SOUNDDISTANCE_Normal,
	SOUNDDISTANCE_InfiniteXYPlane,
	SOUNDDISTANCE_InfiniteXZPlane,
	SOUNDDISTANCE_InfiniteYZPlane,
};

/* The settings for attenuating. */
var( Attenuation )		bool					bAttenuate<ToolTip=Enable attenuation via volume>;
var( Attenuation )		bool					bSpatialize<ToolTip=Enable the source to be positioned in 3D>;
var( Attenuation )		float					dBAttenuationAtMax<ToolTip=The volume at maximum distance in deciBels>;

/** What kind of attenuation model to use */
var( Attenuation )		SoundDistanceModel		DistanceAlgorithm<ToolTip=The type of volume versus distance algorithm to use>;

/** How to calculate the distance from the sound to the listener */
var( Attenuation )		ESoundDistanceCalc		DistanceType<ToolTip=Special attenuation modes>;

var( Attenuation )		float					RadiusMin<ToolTip=The range at which the sound starts attenuating>;
var( Attenuation )		float					RadiusMax<ToolTip=The range at which the sound has attenuated completely>;

/* The settings for attenuating with a low pass filter. */
var( LowPassFilter )	bool					bAttenuateWithLPF<ToolTip=Enable attenuation via low pass filter>;
var( LowPassFilter )	float					LPFRadiusMin<ToolTip=The range at which to start applying a low passfilter>;
var( LowPassFilter )	float					LPFRadiusMax<ToolTip=The range at which to apply the maximum amount of low pass filter>;

var	 editconst	deprecated	bool					bAttenuateWithLowPassFilter;
var	 editconst	deprecated	rawdistributionfloat	MinRadius;
var	 editconst	deprecated	rawdistributionfloat	MaxRadius;
var	 editconst	deprecated	rawdistributionfloat	LPFMinRadius;
var	 editconst	deprecated	rawdistributionfloat	LPFMaxRadius;
var	 editconst	deprecated	SoundDistanceModel		DistanceModel;

defaultproperties
{
   bAttenuate=True
   bSpatialize=True
   bAttenuateWithLowPassFilter=True
   dBAttenuationAtMax=-60.000000
   DistanceModel=ATTENUATION_Logarithmic
   RadiusMin=400.000000
   RadiusMax=4000.000000
   LPFRadiusMin=3000.000000
   LPFRadiusMax=6000.000000
   MinRadius=(Distribution=DistributionMinRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(400.000000,400.000000,400.000000,400.000000))
   MaxRadius=(Distribution=DistributionMaxRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(5000.000000,5000.000000,5000.000000,5000.000000))
   LPFMinRadius=(Distribution=DistributionLPFMinRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1500.000000,1500.000000,1500.000000,1500.000000))
   LPFMaxRadius=(Distribution=DistributionLPFMaxRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(5000.000000,5000.000000,5000.000000,5000.000000))
   Name="Default__SoundNodeAttenuation"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
