/**
 * 
 */
class TrProj_Grenade extends TrProjectile
	native;

var bool    m_bStuckOnPlayer;
var bool	m_bTimedExplosion;
var float	m_fExplosionTime;
var bool    m_bExplodeOnTouchEvent;        // If the grenade should explode on a touch event.
var bool    m_bBounceRequiredForExplode;   // Grenade will not explode until it's bounced once, even if timer expired.

var ParticleSystemComponent	m_StuckOnTargetEffects; // This effect will play when projectile is stuck on a target.
var ParticleSystem m_StuckOnTargetTemplate; // Template for sticking particle component.
var SoundCue m_StuckOnPawnLoopingSound;

var vector m_OverloadHitNormal;

var bool m_bDoRandSpin;

/** 
 *  Should this grenade have inheritence that falls off based on (TossDir dot Instigator.Velocity)
 *  or should it have 'full inheritence' like in the TrProjectile base class?
 */
var bool m_bFullyInheritVelocity;

/** Damage multiplier - after sticking a target */
var(Projectile) float m_fStuckDamageMultiplier;

/** Momentum multiplier - after sticking a target */
var(Projectile) float m_fStuckMomentumMultiplier;

/** Detonation proxy. */
var transient TrCollisionProxy m_CollisionProxy;
var class<TrCollisionProxy> m_CollisionProxyClass;

/** Defines the cylinder for the detonation proxy. */
var float	m_fProxyDetonationRadius;
var float	m_fProxyDetonationHeight;
var bool    m_bScanProxyOnInit;
var bool    m_bSpawnProxyOnInit;

/** Anything in this array are pawns that are targets but do not have line of sight. */
var array<Pawn> m_PotentialTargets;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * 
 * Set the initial velocity and cook time
 */
simulated function PostBeginPlay()
{
	if (m_bTimedExplosion && m_fExplosionTime > 0.0f)
	{	
		SetTimer(m_fExplosionTime, false);
	}
	
	if( m_bDoRandSpin )
	{
		RandSpin(100000);
	}
	Super.PostBeginPlay();
}

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
	local Rotator rot;

	rot = Rotator(Direction);
	SetRotation(rot);

	Velocity = Speed * Direction;
	Velocity.Z += TossZ;

	ApplyInheritance(Direction);

	Acceleration = AccelRate * Normal(Velocity);

	// Generate a random lifespan.
	if (Role == ROLE_Authority && m_fMaxLifespan > 0.0f && m_fMinLifespan != m_fMaxLifespan)
	{
		SetTimer(RandRange(m_fMinLifespan, m_fMaxLifespan), false, 'ExplodeFromTimeLimit');
	}

	if (Role == ROLE_Authority && m_bSpawnProxyOnInit)
	{
		SpawnCollisionProxy();
	}
}

simulated function SpawnCollisionProxy()
{
	// Spawn collision proxy
	if (m_CollisionProxyClass != none && Role == ROLE_Authority)
	{
		m_CollisionProxy = Spawn(m_CollisionProxyClass, self,,Location,,,true);
		m_CollisionProxy.SetBase(self);
		m_CollisionProxy.SetCollisionSize(m_fProxyDetonationRadius, m_fProxyDetonationHeight);

		if (m_bScanProxyOnInit)
		{
			m_CollisionProxy.ForceProximityScan(m_fProxyDetonationRadius);
		}
	}
}

simulated function DestroyCollisionProxy()
{
	if( m_CollisionProxy != none )
	{
		m_CollisionProxy.Destroy();
	}
}

simulated function Shutdown()
{
	if( m_CollisionProxy != none )
	{
		m_CollisionProxy.Destroy();
	}

	super.Shutdown();
}

simulated function ApplyInheritance(Vector ProjectileDir)
{
	local float ForwardPct;

	if( m_bFullyInheritVelocity )
	{
		super.ApplyInheritance(ProjectileDir);
	}
	else
	{
		// The amount of inheritance falls off as the direction of the throw differs from the
		// direction of the velocity of the instigator.
		ForwardPct = normal(Instigator.Velocity) dot normal(ProjectileDir);
		if( ForwardPct > 0 )
		{
			Velocity += ForwardPct * Instigator.Velocity;
		}
	}
}

/**
 * Explode
 */
simulated function Timer()
{
	
	if ( m_bBounceRequiredForExplode )
	{
		// Only explode if the projectile has already bounced.
		if ( m_bHasBounced )
		{
			Explode(Location, vect(0,0,1));
		}
	} 
	else
	{
		Explode(Location, vect(0,0,1));
	}

}

/**
 * Give a little bounce
 */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	bBlockedByInstigator = true;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		PlaySound(ImpactSound, true);
	}

	// If we hit something that is like a wall, explode if it meets criteria.
	if (Wall != none && m_bExplodeOnTouchEvent && (WorldInfo.GRI.r_bFriendlyFire || Wall.GetTeamNum() != GetTeamNum()) && Wall.GetTeamNum() != 255)
	{
		Explode(Location, HitNormal);
	}
	// Explode now if the timer has run out
	else if ( m_bBounceRequiredForExplode && !IsTimerActive() )
	{
		Explode(Location, HitNormal);
	}
	else
	{
		Bounce(Wall, HitNormal);

		if (Velocity.Z > 400)
		{
			Velocity.Z = 0.5 * (400 + Velocity.Z);
		}
	
		// If we are moving too slowly, go ahead and stop.
		if ( Speed < 10 && Wall.bWorldGeometry )
		{
			ImpactedActor = Wall;
			SetPhysics(PHYS_None);
		}
	}
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (DamageRadius > 0.0)
	{
		if (m_bExplodeOnTouchEvent && (WorldInfo.GRI.r_bFriendlyFire || Other.GetTeamNum() != GetTeamNum()))
		{
			Explode( HitLocation, HitNormal );
		}
		else
		{		
			//Explode if timer is out and waiting for a bounce.
			if ( m_bBounceRequiredForExplode && !IsTimerActive() )
			{
				Explode(Location, vect(0,0,1));
			}

			//Bounce off actor.
			else
			{
				Bounce(Other, HitNormal);
			}
		}
	}
	else
	{
		Other.TakeDamage(Damage,InstigatorController,HitLocation,MomentumTransfer * Normal(Velocity), MyDamageType,, self);
		Shutdown();
	}
}

/**
 * When a grenade enters water, kill effects/velocity and let it sink
 */
simulated function PhysicsVolumeChange( PhysicsVolume NewVolume )
{
	if ( WaterVolume(NewVolume) != none )
	{
		Velocity *= 0.25;
	}

	Super.PhysicsVolumeChange(NewVolume);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	// Overload the hit normal.
	if (IsZero(m_OverloadHitNormal))
		super.Explode(HitLocation, HitNormal);
	else
		super.Explode(HitLocation, m_OverloadHitNormal);
}

/** Sticks this grenade to a target actor. */
function bool StickToTarget(Actor Target, Vector HitLocation, Vector HitNormal)
{
	local TrPawn TrP;

	if( Target.IsA('TrFlagBase') )
	{
		return false;
	}

	// Overload the hit normal.
	m_OverloadHitNormal = HitNormal;

	// Increase the damage and momentum since we have stickied.
	Damage = default.Damage * m_fStuckDamageMultiplier;
	MomentumTransfer = default.MomentumTransfer * m_fStuckMomentumMultiplier;

	Velocity *= 0;
	ImpactedActor = Target;
	SetPhysics(PHYS_None);
	SetRotation(Rotator(HitNormal));
	
	TrP = TrPawn(ImpactedActor);
	if( TrP != none )
	{
		m_bStuckOnPlayer = true;
		TrP.StickGrenadeToPawn(self);
	}
	else
	{
		// Just stick to the target
		SetLocation(HitLocation);
		SetBase(ImpactedActor);
	}

	if (m_fExplosionTime > 0.0f)
	{
		SetTimer(m_fExplosionTime, false);
	}

	return true;
}

simulated function PlayStuckOnEffects()
{
	local TrPawn TrP;

	TrP = TrPawn(Base);
	if( TrP != none )
	{
		// Since we are stuck on the pawn, replace the ambient sound with a more alarming pawn sound.
		if( m_StuckOnPawnLoopingSound != none )
		{
			AmbientComponent = CreateAudioComponent(m_StuckOnPawnLoopingSound, true, true);
		}
	}

	// Turn off flight particles.
	if( ProjEffects != none )
	{
		ProjEffects.DeactivateSystem();
	}

	// Turn on stuck particles.
	if (WorldInfo.NetMode != NM_DedicatedServer && m_StuckOnTargetTemplate != None)
	{
		m_StuckOnTargetEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(m_StuckOnTargetTemplate);
		m_StuckOnTargetEffects.SetAbsolute(false, false, false);
		m_StuckOnTargetEffects.SetLODLevel(WorldInfo.bDropDetail ? 1 : 0);
		m_StuckOnTargetEffects.OnSystemFinished = MyOnParticleSystemFinished;
		m_StuckOnTargetEffects.bUpdateComponentInTick = true;
		AttachComponent(m_StuckOnTargetEffects);
	}

	// Play impact sound.
	if (ImpactSound != None && !bSuppressSounds)
	{
		PlaySound(ImpactSound, true);
	}
}

simulated function MyOnParticleSystemFinished(ParticleSystemComponent PSC)
{
	if( PSC == m_StuckOnTargetEffects )
	{
		// clear component and return to pool
		DetachComponent(m_StuckOnTargetEffects);
		WorldInfo.MyEmitterPool.OnParticleSystemFinished(m_StuckOnTargetEffects);
		m_StuckOnTargetEffects = None;
	}
	else
	{
		super.MyOnParticleSystemFinished(PSC);
	}
}

/** Override these and provide a class for m_CollisionProxyClass to have the collision proxy work */
/** A pawn has entered the detonation area. */
function PawnEnteredDetonationArea(Pawn Other)
{
	// Not a pawn we really care about.
	if (Other==None || (!Other.IsA('TrPawn') && !Other.IsA('TrVehicle')))
	{
		return;
	}

	// We only care if we are not on the same team and are on a valid team.
	if ((WorldInfo.GRI.r_bFriendlyFire || Other.GetTeamNum() != GetTeamNum()) && Other.GetTeamNum() != 255)
	{
		if( !IsBlockedByBlocker(self, Other) )
		{
			ImpactedActor = Other;
			Explode(Location, vect(0,0,1));	
		}
		else
		{
			// Add the target to our 'watch list'. Explode if he no longer is blocked.
			m_PotentialTargets.AddItem(Other);
		}
	}
}

/** A pawn has left the detonation area. */
function PawnLeftDetonationArea(Pawn Other)
{
	m_PotentialTargets.RemoveItem(Other);
}

/** This is called when we lacked LOS in the proxy and have just come back into it */
simulated event NativeExplode(vector HitLocation, vector HitNormal)
{
	Explode(HitLocation, HitNormal);
}

defaultproperties
{
   m_bTimedExplosion=True
   m_bDoRandSpin=True
   m_fExplosionTime=1.500000
   m_fStuckDamageMultiplier=1.000000
   m_fStuckMomentumMultiplier=1.000000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
      bUseAsOccluder=False
      bAcceptsStaticDecals=False
      bAcceptsDynamicDecals=False
      bCastDynamicShadow=False
      CollideActors=False
      BlockActors=False
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      BlockRigidBody=False
      bDisableAllRigidBody=True
      Scale=1.500000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_bAuthoritativeExploding=False
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=256.000000
   DecalHeight=256.000000
   TossZ=45.000000
   ProjectileLightClass=Class'UTGame.UTRocketLight'
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   bCheckProjectileLight=True
   CheckRadius=42.000000
   CustomGravityScaling=0.500000
   Speed=1400.000000
   MaxSpeed=1600.000000
   Damage=900.000000
   DamageRadius=520.000000
   MomentumTransfer=85000.000000
   MyDamageType=Class'TribesGame.TrDmgType_Grenade'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   Physics=PHYS_Falling
   bUpdateSimulatedPosition=True
   bBounce=True
   LifeSpan=8.000000
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=50000)
   Name="Default__TrProj_Grenade"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
