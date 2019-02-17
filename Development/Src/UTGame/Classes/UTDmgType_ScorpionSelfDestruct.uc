/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTDmgType_ScorpionSelfDestruct extends UTDmgType_Burning;

/** Amount of damage to given when hitting a vehicle **/
var int DamageGivenForSelfDestruct;

static function int IncrementKills(UTPlayerReplicationInfo KillerPRI)
{
	if ( UTPlayerController(KillerPRI.Owner) != None )
	{
		UTPlayerController(KillerPRI.Owner).BullseyeMessage();
	}
	return super.IncrementKills(KillerPRI);
}

defaultproperties
{
   DamageGivenForSelfDestruct=610
   bSelfDestructDamage=True
   bDontHurtInstigator=True
   KillStatsName="KILLS_SCORPIONSELFDESTRUCT"
   DeathStatsName="DEATHS_SCORPIONSELFDESTRUCT"
   SuicideStatsName="SUICIDES_SCORPIONSELFDESTRUCT"
   DeathString="`o was too close to `k's Scorpion self destruct."
   FemaleSuicide="`o fried herself with her own Scorpion self destruct."
   MaleSuicide="`o fried himself with his own Scorpion self destruct."
   KDamageImpulse=12000.000000
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_ScorpionSelfDestruct:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_ScorpionSelfDestruct:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_ScorpionSelfDestruct"
   ObjectArchetype=UTDmgType_Burning'UTGame.Default__UTDmgType_Burning'
}
