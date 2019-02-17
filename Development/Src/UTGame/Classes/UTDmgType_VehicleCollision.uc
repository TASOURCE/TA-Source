/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTDmgType_VehicleCollision extends UTDamageType
	abstract;

defaultproperties
{
   DamageOverlayTime=0.000000
   KillStatsName="EVENT_RANOVERKILLS"
   DeathStatsName="EVENT_RANOVERDEATHS"
   DeathString="`k hit `o with ramming speed."
   FemaleSuicide="`o had an accident."
   MaleSuicide="`o had an accident."
   bArmorStops=False
   KDamageImpulse=0.000000
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_VehicleCollision:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_VehicleCollision:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_VehicleCollision"
   ObjectArchetype=UTDamageType'UTGame.Default__UTDamageType'
}
