/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTDeathmatch extends UTGame
	config(game)
    native; //$$ native.

function bool WantsPickups(UTBot B)
{
	return true;
}

/** return a value based on how much this pawn needs help */
function int GetHandicapNeed(Pawn Other)
{
	local float ScoreDiff;

	if ( Other.PlayerReplicationInfo == None )
	{
		return 0;
	}

	// base handicap on how far pawn is behind top scorer
	UTGameReplicationInfo(GameReplicationInfo).SortPRIArray();
	ScoreDiff = GameReplicationInfo.PriArray[0].Score - Other.PlayerReplicationInfo.Score;

	if ( ScoreDiff < 3 )
	{
		// ahead or close
		return 0;
	}
	return ScoreDiff/3;
}

defaultproperties
{
   bScoreDeaths=True
   bIgnoreTeamForVoiceChat=True
   bGivePhysicsGun=False
   Acronym="DM"
   Description="Free-for-all kill or be killed.  The player with the most frags wins."
   MapPrefixes(0)="DM"
   EndOfMatchRulesTemplateStr_Scoring="First to make `g frags wins"
   EndOfMatchRulesTemplateStr_Time="most frags in `t mins. wins"
   GameName="DeathMatch"
   OnlineGameSettingsClass=Class'UTGame.UTGameSettingsDM'
   Name="Default__UTDeathmatch"
   ObjectArchetype=UTGame'UTGame.Default__UTGame'
}
