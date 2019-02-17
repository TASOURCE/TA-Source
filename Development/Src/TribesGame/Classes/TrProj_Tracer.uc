/**
 *  Some of this is leveraged from Epic's tracer logic.
 */
class TrProj_Tracer extends TrProjectile;

/** Tracer PSC */
var     ParticleSystemComponent m_TracerPSC;

/** Acceleration rate of projectile */
var()	float				    m_fAccelRate;

/** This is the draw scale 3D for this tracer **/
var     vector                  m_vTracerDrawScale3D;

/** Time in seconds taken by the mesh to grow */
var()	float				    m_fMeshScaleUpTime;

/** Has mesh fully scaled up? */
var		bool				    m_bScaledUp;

/** Is Mesh scaling down? */
var		bool				    m_bScalingDown;

/** Current mesh scale. */
var		float				    m_fCurScale;

/** Time in seconds taken by the mesh to shrink.  Calculated programamatically. */
var		transient float		    m_fMeshScaleDownTime;

var protected transient vector  m_vDestinationLoc;

/** World velocity of the projectile's frame of reference at the time of firing. */
var transient repnotify vector  m_vInitialFrameOfRefVelocity;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	Acceleration.X = 0;
	Acceleration.Y = 0;
	Acceleration.Z = 0;
}

/** Check on various replicated data and act accordingly. */
simulated event ReplicatedEvent( name VarName )
{
	super.ReplicatedEvent( VarName );

	if ( (VarName == 'Velocity') || (VarName == 'm_vInitialFrameOfRefVelocity') )
	{
		CalcTracerAccel();
	}
}

simulated protected function CalcTracerAccel()
{
	local vector AccelDir;

	// if adding base vel, we still want to accelerate along the local-frame component of the velocity
	AccelDir = Velocity - m_vInitialFrameOfRefVelocity;
	Acceleration = Normal(AccelDir) * m_fAccelRate;
}

/** 'Turns on' the tracer. */
function InitTracer(vector Start, vector End)
{
	local vector	Direction;
	local float		LifeTime;

	m_vDestinationLoc = End;

	Direction = End - Start;
	super.Init( Normal(Direction) );

	// tweak direction to account for motion of base
	if ( (Instigator != None) && (Instigator.Base != None) && !Instigator.Base.bStatic )
	{
		m_vInitialFrameOfRefVelocity = Instigator.Base.Velocity + (Instigator.Base.AngularVelocity cross (Instigator.Location - Instigator.Base.Location));
		Velocity += m_vInitialFrameOfRefVelocity;
	}
	else
	{
		m_vInitialFrameOfRefVelocity = vect(0,0,0);
	}

    CalcTracerAccel();
	m_bScaledUp		= FALSE;
	m_bScalingDown	= FALSE;
	m_fCurScale		= 0.f;

	Enable('Tick');
	
	// force update on first frame
	Tick(0.f);

    LifeSpan	= 0.f;
	LifeTime	= VSize(Direction)/MaxSpeed-0.02f;
	SetTimer( LifeTime, FALSE, 'WakeProjectile');

	SetHidden(False);
	m_TracerPSC.SetHidden(FALSE);
}

/**
 * If not on dedicated server, then freeze projectile and scale staticmesh down.
 * Because mesh can be big, and just destroying it is too harsh.
 * On Dedicated server, destroy right away.
 */

simulated function KillProjectile()
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// calculate this so the tracer's apparent speed stays the same.
		// i.e. the tail doesn't appear to slow down just because the head stopped.
		m_fMeshScaleDownTime = m_TracerPSC.Bounds.BoxExtent.X * 2.f / VSize(Velocity);

		// Delay projectile's destruction until it has fully shrunk
		Enable('Tick');	
		SetPhysics( PHYS_None );
		m_bScaledUp		= true;
		m_bScalingDown	= true;
	}
	else
	{
		Recycle();
	}
}

simulated function ScaleDownFinishedNotify()
{
	Recycle();
}

simulated function ScaleUpFinishedNotify()
{
	m_bScaledUp		= TRUE;
	m_TracerPSC.SetScale3D( default.m_TracerPSC.Scale3D );
	Disable('Tick');

    if ( !IsTimerActive('WakeProjectile') )
	{
		// tracer woke up before going to sleep...
		Enable('Tick');
	}
}

/** Just in case. */
simulated event OutsideWorldBounds()
{
	Recycle();
}

simulated function Tick( float DeltaTime )
{
	local Vector	NewScale;

	super.Tick( DeltaTime );

	if( m_TracerPSC != None )
	{
		NewScale = default.m_TracerPSC.Scale3D;

		// If scaling down
		if( m_bScalingDown )
		{
			m_fCurScale -= DeltaTime / m_fMeshScaleDownTime;

			if (m_fCurScale > 0.f)
			{
				NewScale.X *= m_fCurScale;
				m_TracerPSC.SetScale3D( NewScale );
			}
			else
			{
				ScaleDownFinishedNotify();
			}
		}
		// If hasn't been scaled up yet, then do it
		else if( !m_bScaledUp )
		{
			m_fCurScale += DeltaTime / m_fMeshScaleUpTime;

			if( m_fCurScale < 1.f )
			{
				NewScale.X *= m_fCurScale;
				m_TracerPSC.SetScale3D( NewScale );
			}
			else
			{
				ScaleUpFinishedNotify();
			}
		}
	}

    if ( ((m_vDestinationLoc - Location) dot Velocity) < 0.f )
	{
		// we passed the dest loc, lock to it and kill the tracer
		SetLocation(m_vDestinationLoc);
		KillProjectile();
    }
	
}

/** Projectile's destruction */
simulated function Explode(vector HitLocation, vector HitNormal)
{
	KillProjectile();
}

/** 'Turns off' the tracer, ready to be used again. */
function Recycle()
{
	SetHidden(TRUE);
	m_TracerPSC.SetHidden(TRUE);

	m_bScaledUp = TRUE;
	m_bScalingDown = FALSE;

	SetPhysics(PHYS_None);

	ClearTimer('WakeProjectile');
	Disable('Tick');
}

function Reset()
{
	Recycle();
}

/** Re-enables ticking.  Call once we're close to our destination, to "feel" for arrival in the last few frames. */
simulated function WakeProjectile()
{
	Enable('Tick');
}

/** Overridden because we don't want to explode on Pawns */
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	// Do not allow self damage
	if( Other == Instigator )
	{
		return;
	}

	// If can deal damage, then do so and destroy projectile. Otherwise, check if laser can bounce off.
	if( !Other.IsA('Projectile') ||	Other.bProjTarget )
	{
		if( Pawn(Other) != None )
		{
			// don't spawn impact effect on Pawns, just destroy.
			Recycle();
		}
		else
		{
			Explode(HitLocation, HitNormal);
		}
	}
}

defaultproperties
{
   Begin Object Class=ParticleSystemComponent Name=TracerPSC
      ReplacementPrimitive=None
      Name="TracerPSC"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   m_TracerPSC=TracerPSC
   m_vTracerDrawScale3D=(X=5.000000,Y=5.000000,Z=5.000000)
   m_fMeshScaleUpTime=0.040000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Tracer:MyLightEnvironment'
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
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   AccelRate=30000.000000
   Speed=16000.000000
   MaxSpeed=30000.000000
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
   Components(2)=TracerPSC
   RemoteRole=ROLE_None
   TickGroup=TG_DuringAsyncWork
   bNetInitialRotation=True
   bCollideActors=False
   bCollideWorld=False
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_Tracer"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
