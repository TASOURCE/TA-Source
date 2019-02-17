class TrTripActor extends Actor
	native;

var Actor r_Left;
var Actor r_Right;
var bool r_bIsPowered;
var float r_fSleepEndTime;
var repnotify bool r_bIsInitialized;
var bool m_bRequiresTwoNotifiers;

var float m_fSleepTime;
var Interface_TrTripNotifier m_DestroyNotifier;
var Interface_TrTripNotifier m_LeftNotifier;
var Interface_TrTripNotifier m_RightNotifier;
var ParticleSystem m_LaserTemplate;
var ParticleSystemComponent m_pscLaserEffect;
var TrTripComponent m_TripComponent;

replication
{
	if (Role == ROLE_Authority && bNetDirty)
		r_bIsInitialized, r_bIsPowered, r_Left, r_Right, r_fSleepEndTime;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'r_bIsInitialized')
	{
		ClientCreateVisualEffect();
	}
}

native final function CreateTripComponent();

simulated function ClientCreateVisualEffect()
{
	local bool bSocketPositionsFound;
	local vector LeftLocation, RightLocation;

	// Invalid notifiers! Wait a bit then try again.
	if (r_Left == none || (m_bRequiresTwoNotifiers && r_Right == none))
	{
		SetTimer(0.1f, false, nameof(ClientCreateVisualEffect));
		return;
	}

	if (m_LeftNotifier == none)
		m_LeftNotifier = Interface_TrTripNotifier(r_Left);

	if (m_RightNotifier == none)
		m_RightNotifier = Interface_TrTripNotifier(r_Right);

	m_LaserTemplate = m_LeftNotifier.GetParticleSystemName();

	// Attempt to find the socket positions, if they aren't found wait a bit.
	bSocketPositionsFound = m_LeftNotifier.GetTripSocketPosition(true, LeftLocation);
	bSocketPositionsFound = bSocketPositionsFound && m_RightNotifier.GetTripSocketPosition(false, RightLocation);
	if (!bSocketPositionsFound)
	{
		SetTimer(0.1f, false, nameof(ClientCreateVisualEffect));
		return;
	}

	// Spawn the laser effect.
	if (r_bIsInitialized && m_pscLaserEffect == none)
	{
		m_pscLaserEffect = WorldInfo.MyEmitterPool.SpawnEmitter(m_LaserTemplate, LeftLocation);
		if (m_pscLaserEffect != none)
		{
			m_pscLaserEffect.SetDepthPriorityGroup(SDPG_World);
			m_pscLaserEffect.SetTickGroup(TG_EffectsUpdateWork);
			m_pscLaserEffect.SetVectorParameter('TracerStart', LeftLocation);
			m_pscLaserEffect.SetVectorParameter('TracerEnd', RightLocation);
		}
	}
}

simulated function DestroyNotify(Interface_TrTripNotifier Notifier)
{
	m_DestroyNotifier = Notifier;
	Destroy();
}

simulated function Destroyed()
{
	if (Role == ROLE_Authority)
	{
		if (m_LeftNotifier != none && m_LeftNotifier != m_DestroyNotifier)
			m_LeftNotifier.RemoveTripActor(self);
		if (m_RightNotifier != none && m_RightNotifier != m_DestroyNotifier)
			m_RightNotifier.RemoveTripActor(self);
	}

	if (m_pscLaserEffect != none)
		m_pscLaserEffect.DeactivateSystem();

	m_pscLaserEffect = none;
	m_DestroyNotifier = none;
	m_LeftNotifier = none;
	m_RightNotifier = none;

	super.Destroyed();
}

simulated function InitializeTripPhysics(Interface_TrTripNotifier Left, Interface_TrTripNotifier Right)
{
	// Invalid notifiers!
	if (Left == none || (m_bRequiresTwoNotifiers && Right == none))
	{
		Destroy();
		return;
	}

	if (Left != none)
	{
		r_Left = Actor(Left);
		m_LeftNotifier = Left;

		if (!m_bRequiresTwoNotifiers)
		{
			r_Right = Actor(Left);
			m_RightNotifier = Left;
		}
	}
	if (Right != none && m_bRequiresTwoNotifiers)
	{
		r_Right = Actor(Right);
		m_RightNotifier = Right;
	}

	// Add ourselves to the left and right notifier.
	if (m_LeftNotifier != none)
	{
		m_LeftNotifier.AddTripActor(self);
		m_LeftNotifier.OnTripAwake();
	}
	if (m_RightNotifier != none && m_RightNotifier != m_LeftNotifier)
	{
		m_RightNotifier.AddTripActor(self);
		m_RightNotifier.OnTripAwake();
	}

	// Say that we are initialized.
	r_bIsInitialized = true;
	bNetDirty = true;

	// Create the necessary components and effects.
	CreateTripComponent();
	ClientCreateVisualEffect();
}

simulated function GoToSleep(optional bool bIsPowered)
{
	r_bIsPowered = bIsPowered;

	if (r_bIsPowered)
	{
		r_fSleepEndTime = WorldInfo.TimeSeconds + m_fSleepTime;
	}

	GotoState('TripSleep');
}

simulated event Tick(float DeltaTime)
{
	local float SleepTimePercentage;

	if (IsInState('TripSleep') && r_bIsPowered)
	{
		if (r_fSleepEndTime <= WorldInfo.TimeSeconds)
			GotoState('TripAwake');
		else
		{
			// Slowly bring the laser back online.
			if (m_pscLaserEffect != none)
			{
				SleepTimePercentage = FClamp((WorldInfo.TimeSeconds - r_fSleepEndTime) / m_fSleepTime, 0.0f, 1.0f);

				m_pscLaserEffect.SetFloatParameter('IsAwake', SleepTimePercentage);
			}
		}
	}
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal);

auto state TripAwake
{
    simulated function BeginState(name PreviousStateName)
	{
		if (m_LeftNotifier != none)
			m_LeftNotifier.OnTripAwake();

		if (m_RightNotifier != none)
			m_RightNotifier.OnTripAwake();
	}

	simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
	{
		local float LeftDist, RightDist;

		if (m_LeftNotifier == none || r_Left == none || (m_bRequiresTwoNotifiers && (r_Right == none || m_RightNotifier == none)))
			return;

		// Did a Pawn hit us?
		if (Other.IsA('Pawn'))
		{
			if (m_bRequiresTwoNotifiers)
			{
				LeftDist = VSizeSq(r_Left.Location - HitLocation);
				RightDist = VSizeSq(r_Right.Location - HitLocation);

				// Use the notifier of whichever prism mine is closest.
				if (LeftDist <= RightDist)
					m_LeftNotifier.TripActivated(Pawn(Other), HitLocation, self);
				else
					m_RightNotifier.TripActivated(Pawn(Other), HitLocation, self);
			}
			else
			{
				m_LeftNotifier.TripActivated(Pawn(Other), HitLocation, self);
			}
		}
	}
}

simulated state TripSleep
{
    simulated function BeginState(name PreviousStateName)
	{
		if (m_pscLaserEffect != none)
		{
			m_pscLaserEffect.SetFloatParameter('IsAwake', 0.0f);
		}

		if (m_LeftNotifier != none)
			m_LeftNotifier.OnTripAwake();

		if (m_RightNotifier != none)
			m_RightNotifier.OnTripSleep();

		super.BeginState(PreviousStateName);
	}

	simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
	{
		// Ignore touch events while we are asleep.
	}
}

defaultproperties
{
   m_bRequiresTwoNotifiers=True
   Begin Object Class=TrTripComponent Name=TripComponent
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=True
      Name="TripComponent"
      ObjectArchetype=TrTripComponent'TribesGame.Default__TrTripComponent'
   End Object
   m_TripComponent=TripComponent
   Components(0)=TripComponent
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bAlwaysRelevant=True
   bCollideActors=True
   CollisionComponent=TripComponent
   Name="Default__TrTripActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
