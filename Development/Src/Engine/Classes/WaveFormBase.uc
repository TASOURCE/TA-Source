/** 
 * This class is the base class for waveforms that can be played via AnimNotify_Rumble or any of the other PlayWaveform functions that exist
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class WaveFormBase extends Object
	native
	abstract;

/** This is the waveform data **/
var ForceFeedbackWaveform TheWaveForm;

defaultproperties
{
   TheWaveForm=ForceFeedbackWaveform'Engine.Default__WaveFormBase:ForceFeedbackWaveform'
   Name="Default__WaveFormBase"
   ObjectArchetype=Object'Core.Default__Object'
}
