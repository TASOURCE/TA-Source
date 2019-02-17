/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTDmgType_Lava extends UTDmgType_Burning
	abstract;

defaultproperties
{
   DamageBodyMatColor=(R=50.000000,G=50.000000,B=0.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   DeathString="`o was incinerated by `k."
   FemaleSuicide="`o was incinerated."
   MaleSuicide="`o was incinerated."
   bCausedByWorld=True
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Lava:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Lava:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_Lava"
   ObjectArchetype=UTDmgType_Burning'UTGame.Default__UTDmgType_Burning'
}
