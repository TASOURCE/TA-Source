//=============================================================================
// TeamInfo.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class TeamInfo extends ReplicationInfo
	native(ReplicationInfo)
	nativereplication;

var localized string TeamName;
var int Size; //number of players on this team in the level
//$$ML:Added repnotify to score.
var repnotify float Score;
var repnotify int TeamIndex;
var color TeamColor;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	// Variables the server should send to the client.
	if( bNetDirty && (Role==ROLE_Authority) )
		Score;
	if ( bNetInitial && (Role==ROLE_Authority) )
		TeamName, TeamIndex;
}

simulated event ReplicatedEvent(name VarName)
{
	//`log(GetFuncName()@`showvar(VarName));
	if (VarName == 'TeamIndex')
	{
		if (WorldInfo.GRI != None)
		{
			// register this TeamInfo instance now
			WorldInfo.GRI.SetTeam(TeamIndex, self);
		}
	}
	else
	{

		Super.ReplicatedEvent(VarName);
	}
}

simulated event Destroyed()
{
	local TeamInfo OtherTeam;

	Super.Destroyed();

	// see if there's another TeamInfo that should take our spot in the GRI
	// (this could happen after seamless travel as there may be a time during which both the old and new TeamInfos are around)
	if (WorldInfo.GRI != None)
	{
		foreach DynamicActors(class'TeamInfo', OtherTeam)
		{
			if (OtherTeam != self && OtherTeam.TeamIndex == TeamIndex)
			{
				WorldInfo.GRI.SetTeam(TeamIndex, OtherTeam);
				break;
			}
		}
	}
}

function bool AddToTeam( Controller Other )
{
	// make sure loadout works for this team
	if ( Other == None )
	{
		;
		return false;
	}

	if (Other.PlayerReplicationInfo == None)
	{
		;
		ScriptTrace();
		return false;
	}

	Size++;
	Other.PlayerReplicationInfo.SetPlayerTeam(Self);
	return true;
}

function RemoveFromTeam(Controller Other)
{
	Size--;
	if ( Other != None && Other.PlayerReplicationInfo != None )
	{
		Other.PlayerReplicationInfo.SetPlayerTeam(None);
	}
}

simulated function string GetHumanReadableName()
{
	return TeamName;
}

simulated native function byte GetTeamNum();

cpptext
{
	INT* GetOptimizedRepList( BYTE* InDefault, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );

}


defaultproperties
{
   TeamName="Team"
   TeamIndex=-1
   TeamColor=(B=64,G=64,R=255,A=255)
   TickGroup=TG_DuringAsyncWork
   NetUpdateFrequency=2.000000
   Name="Default__TeamInfo"
   ObjectArchetype=ReplicationInfo'Engine.Default__ReplicationInfo'
}
