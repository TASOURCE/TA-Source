/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTDmgType_Encroached extends UTDamageType
	abstract;

defaultproperties
{
   bAlwaysGibs=True
   GibPerterbation=1.000000
   DeathString="`o's atoms have been replaced by `k's."
   FemaleSuicide="`o teleported into something solid."
   MaleSuicide="`o teleported into something solid."
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Encroached:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Encroached:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_Encroached"
   ObjectArchetype=UTDamageType'UTGame.Default__UTDamageType'
}
