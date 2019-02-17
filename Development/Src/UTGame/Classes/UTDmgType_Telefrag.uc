/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTDmgType_Telefrag extends UTDamageType
	abstract;

defaultproperties
{
   bAlwaysGibs=True
   GibPerterbation=1.000000
   KillStatsName="KILLS_TRANSLOCATOR"
   DeathStatsName="DEATHS_TRANSLOCATOR"
   SuicideStatsName="SUICIDES_TRANSLOCATOR"
   DeathString="`o's atoms have been replaced by `k."
   FemaleSuicide="`o disrupted her own Translocator."
   MaleSuicide="`o disrupted his own Translocator."
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Telefrag:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Telefrag:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_Telefrag"
   ObjectArchetype=UTDamageType'UTGame.Default__UTDamageType'
}
