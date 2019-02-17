/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTDmgType_Pancake extends UTDmgType_RanOver
	abstract;


static function SmallReward(UTPlayerController Killer, int KillCount)
{
	Killer.ReceiveLocalizedMessage(class'UTVehicleKillMessage', 4);
}

defaultproperties
{
   bAlwaysGibs=True
   GibPerterbation=1.000000
   DeathString="`o was crushed by `k"
   FemaleSuicide="`o was crushed."
   MaleSuicide="`o was crushed."
   bArmorStops=False
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Pancake:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_Pancake:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_Pancake"
   ObjectArchetype=UTDmgType_RanOver'UTGame.Default__UTDmgType_RanOver'
}
