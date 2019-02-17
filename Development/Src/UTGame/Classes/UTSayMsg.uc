/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTSayMsg extends UTLocalMessage;

var color RedTeamColor,BlueTeamColor;

static function color GetConsoleColor( PlayerReplicationInfo RelatedPRI_1 )
{
	if ( (RelatedPRI_1 == None) || (RelatedPRI_1.Team == None) )
		return Default.DrawColor;

	if ( RelatedPRI_1.Team.TeamIndex == 0 )
		return Default.RedTeamColor;
	else
		return Default.BlueTeamColor;
}

defaultproperties
{
   RedTeamColor=(B=64,G=64,R=255,A=255)
   BlueTeamColor=(B=255,G=192,R=64,A=255)
   bBeep=True
   Lifetime=6.000000
   DrawColor=(B=0,G=255,R=255,A=255)
   Name="Default__UTSayMsg"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
