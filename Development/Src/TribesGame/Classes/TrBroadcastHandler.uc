class TrBroadcastHandler extends BroadcastHandler
	config(Game)
	dependson(TrVGSCommandList);

/** Keeps track of actors that have been spotted. */
var transient array<TrSpottedTarget> m_SpottedTargets;

/** How often to update the spotted actors list. */
var float m_fSpottedActorsUpdateFrequency;

function TeamBroadcastVGSCommand(PlayerReplicationInfo SenderPRI, VGSCommandType VGSCommandIndex )
{
	local TrPlayerController P;

	foreach WorldInfo.AllControllers(class'TrPlayerController', P)
	{
		if (P.PlayerReplicationInfo.Team == SenderPRI.Team)
		{
			P.ClientReceiveVGSCommand(SenderPRI, VGSCommandIndex);
		}
	}
}

function GlobalBroadcastVGSCommand(PlayerReplicationInfo SenderPRI, VGSCommandType VGSCommandIndex )
{
	local TrPlayerController P;

	foreach WorldInfo.AllControllers(class'TrPlayerController', P)
	{
		P.ClientReceiveVGSCommand(SenderPRI, VGSCommandIndex);
	}
}

function TeamBroadcastVGSContextCommand(PlayerReplicationInfo SenderPRI, EVGSContextActor ContextActor, EVGSContextLocation ContextLocation, bool bEnemyLocation )
{
	local TrPlayerController P;

	foreach WorldInfo.AllControllers(class'TrPlayerController', P)
	{
		if (P.PlayerReplicationInfo.Team == SenderPRI.Team)
		{
			P.ClientReceiveVGSContextCommand(SenderPRI, ContextActor, ContextLocation, bEnemyLocation);
		}
	}
}

function OnActorSpotted(Actor SpottedActor, optional class<TrSpottedTarget> SpottedTargetClass)
{
	local int i;
	local bool bFoundExistingActor;
	local TrSpottedTarget NewSpottedTarget;

	if (SpottedTargetClass == none)
	{
		SpottedTargetClass = class'TrSpottedTarget';
	}

	for( i = 0; i < m_SpottedTargets.Length; i++ )
	{
		if( m_SpottedTargets[i].m_SpottedActor == SpottedActor )
		{
			// We are already keeping track of this actor, so just update its spotted data.
			bFoundExistingActor = true;
			m_SpottedTargets[i].m_fLastSpottedTimestamp = WorldInfo.TimeSeconds;
			m_SpottedTargets[i].SetLocation(SpottedActor.Location);
			break;
		}
	}

	if( !bFoundExistingActor )
	{
		// Keep track of the newly spotted actor.
		NewSpottedTarget = Spawn(SpottedTargetClass, self,, SpottedActor.Location, SpottedActor.Rotation,,true);
		if( NewSpottedTarget != none )
		{
			NewSpottedTarget.SetSpottedActor(SpottedActor);
			m_SpottedTargets.AddItem(NewSpottedTarget);
		}
	}

	SetTimer(m_fSpottedActorsUpdateFrequency, false, 'UpdateSpottedActorsTimer');
}

function UpdateSpottedActorsTimer()
{
	local int i;

	for( i = 0; i < m_SpottedTargets.Length; i++ )
	{
		if( m_SpottedTargets[i].m_fLastSpottedTimestamp + m_SpottedTargets[i].m_fSpottedActorDuration < WorldInfo.TimeSeconds )
		{
			// This spotted actor has timed out.
			m_SpottedTargets[i].Destroy();
			m_SpottedTargets.Remove(i--,1);
		}
	}

	// Continue to update the spotted actors list.
	if( m_SpottedTargets.Length > 0 )
	{
		SetTimer(m_fSpottedActorsUpdateFrequency, false, 'UpdateSpottedActorsTimer');
	}
}

defaultproperties
{
   m_fSpottedActorsUpdateFrequency=0.200000
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__BroadcastHandler:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__BroadcastHandler:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__TrBroadcastHandler"
   ObjectArchetype=BroadcastHandler'Engine.Default__BroadcastHandler'
}
