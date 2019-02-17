/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTCTFTeamAI extends UTTeamAI;

var UTCTFFlag FriendlyFlag, EnemyFlag;
var float LastGotFlag;

function UTSquadAI AddSquadWithLeader(Controller C, UTGameObjective O)
{
	local UTCTFSquadAI S;

	if ( O == None )
		O = UTGameObjective(EnemyFlag.HomeBase);
	S = UTCTFSquadAI(Super.AddSquadWithLeader(C,O));
	if ( S != None )
	{
		S.FriendlyFlag = FriendlyFlag;
		S.EnemyFlag = EnemyFlag;
	}
	return S;
}

function UTGameObjective GetPriorityFreelanceObjectiveFor(UTSquadAI InFreelanceSquad)
{
	if (InFreelanceSquad != None)
	{
		InFreelanceSquad.bFreelanceAttack = true;
	}
	return GetPriorityAttackObjectiveFor(InFreelanceSquad, (InFreelanceSquad != None) ? InFreelanceSquad.SquadLeader : None);
}

defaultproperties
{
   SquadType=Class'UTGame.UTCTFSquadAI'
   OrderList(0)="ATTACK"
   OrderList(1)="Defend"
   OrderList(2)="ATTACK"
   OrderList(4)="ATTACK"
   OrderList(5)="Defend"
   OrderList(6)="ATTACK"
   OrderList(7)="ATTACK"
   Name="Default__UTCTFTeamAI"
   ObjectArchetype=UTTeamAI'UTGame.Default__UTTeamAI'
}
