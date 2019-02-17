/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTDmgType_Drowned extends UTDamageType
	abstract;

defaultproperties
{
   bOverrideHitEffectColor=True
   HitEffectColor=(R=-1.000000,G=-1.000000,B=2.000000,A=1.000000)
   DeathString="`o forgot to come up for air."
   FemaleSuicide="`o forgot to come up for air."
   MaleSuicide="`o forgot to come up for air."
   bArmorStops=False
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Drowned:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Drowned:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_Drowned"
   ObjectArchetype=UTDamageType'UTGame.Default__UTDamageType'
}
