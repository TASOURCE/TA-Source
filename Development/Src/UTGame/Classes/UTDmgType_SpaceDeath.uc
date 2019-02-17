/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTDmgType_SpaceDeath extends UTDamageType;

defaultproperties
{
   bAlwaysGibs=True
   DeathString="`o became one with the universe."
   FemaleSuicide="`o became one with the universe."
   MaleSuicide="`o became one with the universe."
   bCausedByWorld=True
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_SpaceDeath:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_SpaceDeath:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_SpaceDeath"
   ObjectArchetype=UTDamageType'UTGame.Default__UTDamageType'
}
