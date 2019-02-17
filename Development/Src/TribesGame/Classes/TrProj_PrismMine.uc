/**
 * Prism Mine projectile.
 */
class TrProj_PrismMine extends TrProj_Mine
	implements(Interface_TrTripNotifier)
	native;

/** The actor that handles trip notifications */
var TrTripActor m_TripActor;

/** The distance to run from the left and to the right */
var float m_fTripDistance;

/** The particle system for the visual effect */
var ParticleSystem m_LaserTemplate;

/** The socket name to use for laser positioning */
var name m_nSocketTraceName;

/** The laser locations */
var vector r_vLeftHit;
var vector r_vRightHit;

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		r_vLeftHit, r_vRightHit;
}

function PawnEnteredDetonationArea(Pawn Other);

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
	Velocity = (Speed * Direction) + (Instigator.Velocity * m_fProjInheritVelocityPct);

	TossZ = TossZ + (FRand() * TossZ / 2.0) - (TossZ / 4.0);
	Velocity.Z += TossZ;
	Acceleration = AccelRate * Normal(Velocity);

	// Generate a random lifespan.
	if (Role == ROLE_Authority && m_fMaxLifespan > 0.0f && m_fMinLifespan != m_fMaxLifespan)
	{
		SetTimer(RandRange(m_fMinLifespan, m_fMaxLifespan), false, 'ExplodeFromTimeLimit');
	}
}

simulated function ArmedTimer()
{
	local Actor HitActor;
	local SkeletalMeshComponent PrismMesh;
	local vector SocketLocation, Forward, Right, Up;
	local vector HitLocation, HitNormal;

	super.ArmedTimer();

	if (Role == ROLE_Authority && !bShuttingDown)
	{
		// Fetch the location where the beam will be.
		PrismMesh = SkeletalMeshComponent(m_ProjMesh);
		if (PrismMesh != none && PrismMesh.GetSocketWorldLocationAndRotation(m_nSocketTraceName, SocketLocation))
		{
			// Get our rotation vectors.
			GetAxes(Rotation, Forward, Right, Up);

			// Determine where the trip ends to the right.
			HitActor = Trace(HitLocation, HitNormal, SocketLocation + Right * m_fTripDistance, SocketLocation, false, , , TRACEFLAG_Bullet);
			if (HitActor != none)
			{
				r_vRightHit = HitLocation;
			}
			else
			{
				r_vRightHit = SocketLocation + Right * m_fTripDistance;
			}

			// Determine where the trip ends to the left.
			HitActor = Trace(HitLocation, HitNormal, SocketLocation - Right * m_fTripDistance, SocketLocation, false, , , TRACEFLAG_Bullet);
			if (HitActor != none)
			{
				r_vLeftHit = HitLocation;
			}
			else
			{
				r_vLeftHit = SocketLocation - Right * m_fTripDistance;
			}

			bNetDirty = true;

			CreateTripActor();
		}
	}
}

simulated function Shutdown()
{
	if (Role == ROLE_Authority && !bShuttingDown)
	{
		if( m_TripActor != none )
		{
			m_TripActor.Destroy();
		}
	}

	super.Shutdown();
}

/** Create the trip actor */
simulated function CreateTripActor()
{
	local vector TripLocation, LookDirection;

	// Calculate the direction of the trip, and the mid-point for bounds purposes.
	LookDirection = r_vRightHit - r_vLeftHit;
	TripLocation = r_vLeftHit + (LookDirection) / 2.0f;

	// Spawn and initialize the trip actor.
	m_TripActor = Spawn(class'TrTripActor',,, TripLocation, rotator(Normal(LookDirection)),,true);
	if (m_TripActor != none)
	{
		m_TripActor.m_bRequiresTwoNotifiers = false;
		m_TripActor.m_fSleepTime = 0.0f;
		m_TripActor.InitializeTripPhysics(self, none);
	}
}

/** Notify the owner of the trip being activated */
simulated function TripActivated(Pawn Other, vector ActivateLocation, TrTripActor TripActor)
{
	if (Other == none || TripActor == none)
		return;

	// Ignore trip if we are on the same team.
	if (GetTeamNum() == Other.GetTeamNum())
		return;

	// Is there something in the way of detecting?
	if(IsBlockedByBlocker(self, Other))
		return;

	// Cause ourselves to explode.
	Explode(ActivateLocation, Normal(ActivateLocation - Location));
}

/** Called to get the ParticleSystem used for effects */
simulated function ParticleSystem GetParticleSystemName()
{
	return m_LaserTemplate;
}

/** Fetch the socket position in world-space where the trip starts */
simulated event bool GetTripSocketPosition(bool bIsLeft, out vector SocketPosition)
{
	if (bIsLeft)
	{
		SocketPosition = r_vLeftHit;
	}
	else
	{
		SocketPosition = r_vRightHit;
	}

	return !IsZero(SocketPosition);
}

/** Called when the trip actor is awake */
simulated event OnTripAwake()
{
	PlaySound(SoundCue'AUD_WEP_Prism_Mine.Activate.A_CUE_WEP_Prism_Mine_Activate', false, false, false);
}

/** Called when the trip actor is asleep */
simulated event OnTripSleep();

/** Add a trip actor to our list */
simulated function AddTripActor(TrTripActor NewTrip);

/** Remove a trip actor from our list */
simulated function RemoveTripActor(TrTripActor RemoveTrip);

defaultproperties
{
   m_fTripDistance=512.000000
   m_nSocketTraceName="WSO_Emit_01"
   m_bUsesDetonationProxy=False
   m_fDetonationRadius=300.000000
   m_fDetonationHeight=100.000000
   m_sScreenName="Prism Mine"
   m_nMarkerOffset=48
   m_nIconStackId=36
   Begin Object Class=SkeletalMeshComponent Name=PrismMesh
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_PrismMine:MyLightEnvironment'
      Scale=0.900000
      Name="PrismMesh"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   m_ProjMesh=PrismMesh
   m_bOrientToWall=False
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Mine:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Mine:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Mine:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Mine:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   CustomGravityScaling=10.000000
   Speed=20.000000
   MaxSpeed=20.000000
   Damage=800.000000
   DamageRadius=530.000000
   MyDamageType=Class'TribesGame.TrDmgType_PrismMine'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_Mine:CollisionCylinder'
      CollisionHeight=20.000000
      CollisionRadius=18.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_Mine:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=PrismMesh
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_PrismMine"
   ObjectArchetype=TrProj_Mine'TribesGame.Default__TrProj_Mine'
}
