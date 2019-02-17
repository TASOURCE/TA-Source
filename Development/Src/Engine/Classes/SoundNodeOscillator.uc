/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** 
 * Defines how a sound oscillates
 */

class SoundNodeOscillator extends SoundNode
	native( Sound )
	hidecategories( Object )
	editinlinenew;

var( Oscillator )		bool					bModulateVolume<ToolTip=Whether to oscillate volume>;
var( Oscillator )		bool					bModulatePitch<ToolTip=Whether to oscillate pitch>;

var( Oscillator )		float					AmplitudeMin<ToolTip=An amplitude of 0.25 would oscillate between 0.75 and 1.25>;
var( Oscillator )		float					AmplitudeMax<ToolTip=An amplitude of 0.25 would oscillate between 0.75 and 1.25>;
var( Oscillator )		float					FrequencyMin<ToolTip=A frequency of 20 would oscillate at 10Hz>;
var( Oscillator )		float					FrequencyMax<ToolTip=A frequency of 20 would oscillate at 10Hz>;
var( Oscillator )		float					OffsetMin<ToolTip=Offset into the sine wave. Value modded by 2 * PI>;
var( Oscillator )		float					OffsetMax<ToolTip=Offset into the sine wave. Value modded by 2 * PI>;
var( Oscillator )		float					CenterMin<ToolTip=A center of 0.5 would oscillate around 0.5>;
var( Oscillator )		float					CenterMax<ToolTip=A center of 0.5 would oscillate around 0.5>;

var			deprecated	rawdistributionfloat	Amplitude;
var			deprecated	rawdistributionfloat	Frequency;
var			deprecated	rawdistributionfloat	Offset;
var			deprecated	rawdistributionfloat	Center;

defaultproperties
{
   Amplitude=(Distribution=DistributionAmplitude,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Frequency=(Distribution=DistributionFrequency,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Offset=(Distribution=DistributionOffset,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Center=(Distribution=DistributionCenter,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Name="Default__SoundNodeOscillator"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
