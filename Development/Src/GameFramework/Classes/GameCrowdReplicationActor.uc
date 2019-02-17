/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class GameCrowdReplicationActor extends Actor
	native;

/** Pointer to crowd spawning action we are replicating. */
var	repnotify	SeqAct_GameCrowdSpawner	Spawner;
/** If crowd spawning is active. */
var	repnotify	bool				bSpawningActive;
/** Use to replicate when we want to destroy all crowd agents. */
var repnotify	int					DestroyAllCount;

// FIXME - add native rep
replication
{
	if(Role == Role_Authority)
		Spawner, bSpawningActive, DestroyAllCount;
}

simulated event ReplicatedEvent(name VarName)
{
	if(VarName == 'Spawner' || VarName == 'bSpawningActive')
	{
		if(Spawner != None)
		{
			Spawner.bSpawningActive = bSpawningActive;

			// Cache spawner kismet vars on client
			if(bSpawningActive)
			{
				Spawner.CacheSpawnerVars();
			}
		}
	}
	else if(VarName == 'DestroyAllCount')
	{
		Spawner.KillAgents();

		Spawner.bSpawningActive = FALSE;
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

auto state ReceivingReplication
{
	simulated event Tick(float DeltaTime)
	{
		Super.Tick(DeltaTime);

		if ( Role == ROLE_Authority )
		{
			GotoState('');
		}
		else if( Spawner != None && Spawner.bSpawningActive )
		{
			Spawner.UpdateSpawning(DeltaTime);
		}
	}
}

defaultproperties
{
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   TickGroup=TG_DuringAsyncWork
   bAlwaysRelevant=True
   bReplicateMovement=False
   bSkipActorPropertyReplication=True
   bOnlyDirtyReplication=True
   NetUpdateFrequency=1.000000
   NetPriority=2.700000
   Name="Default__GameCrowdReplicationActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
