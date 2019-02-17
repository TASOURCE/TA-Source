/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 */
class UTDmgType_RanOver extends UTDamageType
	abstract;

var int NumMessages;

static function int IncrementKills(UTPlayerReplicationInfo KillerPRI)
{
	local int KillCount;

	KillCount = super.IncrementKills(KillerPRI);
	if ( (KillCount != Default.RewardCount)  && (UTPlayerController(KillerPRI.Owner) != None) )
	{
		SmallReward(UTPlayerController(KillerPRI.Owner), KillCount);
	}
	return KillCount;
}

static function SmallReward(UTPlayerController Killer, int KillCount)
{
	Killer.ReceiveLocalizedMessage(class'UTVehicleKillMessage', KillCount % 4);
}

static function SpawnHitEffect(Pawn P, float Damage, vector Momentum, name BoneName, vector HitLocation)
{
	Super.SpawnHitEffect(P,Damage,Momentum,BoneName,HitLocation);
	if(UTPawn(P) != none)
	{
		UTPawn(P).SoundGroupClass.Static.PlayCrushedSound(P);
	}
}

defaultproperties
{
   NumMessages=4
   bNeverGibs=True
   bUseTearOffMomentum=True
   bVehicleHit=True
   GibPerterbation=0.500000
   KillStatsName="EVENT_RANOVERKILLS"
   DeathStatsName="EVENT_RANOVERDEATHS"
   RewardCount=10
   RewardAnnouncementClass=Class'UTGame.UTVehicleKillMessage'
   RewardAnnouncementSwitch=7
   RewardEvent="REWARD_ROADRAMPAGE"
   DeathString="`k ran over `o"
   FemaleSuicide="`o ran over herself."
   MaleSuicide="`o ran over himself."
   bExtraMomentumZ=False
   DamagedFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_RanOver:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'UTGame.Default__UTDmgType_RanOver:ForceFeedbackWaveform1'
   Name="Default__UTDmgType_RanOver"
   ObjectArchetype=UTDamageType'UTGame.Default__UTDamageType'
}
