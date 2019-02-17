/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTDmgType_VehicleExplosion extends UTDmgType_Burning
	abstract;

defaultproperties
{
   bThrowRagdoll=True
   GibPerterbation=0.150000
   KillStatsName="KILLS_VEHICLEEXPLOSION"
   DeathStatsName="DEATHS_VEHICLEEXPLOSION"
   SuicideStatsName="SUICIDES_VEHICLEEXPLOSION"
   DeathString="`k took out `o with a vehicle explosion."
   FemaleSuicide="`o was a little too close to the vehicle she blew up."
   MaleSuicide="`o was a little too close to the vehicle he blew up."
   KDamageImpulse=1000.000000
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_VehicleExplosion:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_VehicleExplosion:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_VehicleExplosion"
   ObjectArchetype=UTDmgType_Burning'UTGame.Default__UTDmgType_Burning'
}
