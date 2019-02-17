/**
 * 
 */
class TrProj_SpikeGrenade extends TrProj_Grenade;

/** Has this grenade shot out the AOE spikes? */
var bool m_bStartedFractal;

/** Remaining fractal time. */
var transient float m_fRemainingFractalTime;

/** How long to undergo the fractal process. */
var float m_fFractalTime;

/** How long between each fractal shot. */
var float m_fFractalInterval;

/** Time to ascend. */
var float m_fAscentTime;

/** Ideal ascend height. */
var float m_fAscentHeight;

/** Cached hit normal for when we explode. */
var Vector m_CachedHitNormal;

/** Controls moving the mesh upwards. */
var SkelControlSingleBone m_AscendControl;

/** Distance to shoot a fractal shot. */
var float m_fFractalShotDistance;
var float m_fZFractalShotDistance;

/** Location of the grenade once fully ascended. */
var Vector m_vAscentLocation;

/** Used for replication of explosion data. */
var repnotify Vector r_vFlashExplosionLocation;

/** Damage from each fractal shard. */
var int m_nFractalDamage;

/** Damage radius of each fractal shard. */
var float m_fFractalDamageRadius;

/** Effects template for fractal explosions. */
var ParticleSystem m_FractalExplosionTemplate;

/** Effects template for fractal beam. */
var ParticleSystem m_FractalBeamTemplate;

/** Sound for fractal explosions. */
var SoundCue m_FractalExplosionSound;

replication
{
	if( Role == ROLE_Authority )
		r_vFlashExplosionLocation;
}

simulated event ReplicatedEvent(name VarName)
{   
    if(VarName == 'r_vFlashExplosionLocation')
    {
        ClientReceivedExplosionLocation();
        return;
    }

    super.ReplicatedEvent(VarName);
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == m_ProjMesh )
    {
        // Cache skel control
        m_AscendControl = SkelControlSingleBone(SkelComp.FindSkelControl('AscendControl'));
    }
}

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
	super.InitProjectile(Direction, ClassToInherit);
	SetRotation(rot(0,0,0));
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	local Vector AscentHitNormal, TraceEnd;

	if( !m_bStartedFractal )
	{
		m_bStartedFractal = true;
		m_CachedHitNormal = HitNormal;

		// We're committed to the current location.
		Velocity = vect(0,0,0);
		SetPhysics(PHYS_None);

		// Check to see how far up we can go.
		TraceEnd = Location;
		TraceEnd.Z += m_fAscentHeight;
		if( Trace(m_vAscentLocation, AscentHitNormal, TraceEnd, Location) == none )
		{
			m_vAscentLocation = TraceEnd;
		}
		
		// Start the ascent.
		if( m_AscendControl != none )
		{
			m_AscendControl.BoneTranslation = m_vAscentLocation;
			m_AscendControl.BlendInTime = m_fAscentTime;
			m_AscendControl.SetSkelControlActive(true);
		}

		if( Role == ROLE_Authority )
		{
			// Once the ascent is done, the fractalling begins.
			SetTimer(m_fAscentTime, false, 'StartFractalShots');
		}
	}
	else if( !IsFractalActive() )
	{
		// Explode the main grenade.
		super.Explode(m_vAscentLocation, HitNormal);
	}
}

/** Play the explosions from fractal hits client-side. */
simulated function ClientReceivedExplosionLocation()
{
	SpawnFractalExplosionEffects(r_vFlashExplosionLocation);
}

/** Are we currently shooting out fractal shots? */
function bool IsFractalActive()
{
	return IsTimerActive('StartFractalShots') || IsTimerActive('EndFractal');
}

/** Starts the fractal sequence. */
function StartFractalShots()
{
	SetTimer(m_fFractalTime, false, 'EndFractal');
	SetTimer(m_fFractalInterval, true, 'ShootFractalShot');
	LifeSpan = FMax(LifeSpan, m_fFractalTime);
}

function ShootFractalShot()
{
	local Vector ShotLocation, HitLocation, HitNormal;

	// Determine where this fractal shot will explode.
	ShotLocation.X = RandRange(m_fFractalShotDistance * -1.0, m_fFractalShotDistance);
	ShotLocation.Y = RandRange(m_fFractalShotDistance* -1.0, m_fFractalShotDistance);
	ShotLocation.Z = RandRange(m_fZFractalShotDistance * -1.0, m_fZFractalShotDistance);
	ShotLocation += m_vAscentLocation;

	// If there is something in the way, shoot on the obstruction's surface.
	if( Trace(HitLocation, HitNormal, ShotLocation, m_vAscentLocation) != none )
	{
		ShotLocation = HitLocation;
	}
	
	// Let clients know about this shot.
	r_vFlashExplosionLocation = ShotLocation;
	bNetDirty = true;
	
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		SpawnFractalExplosionEffects(ShotLocation);
	}

	// Damage surrounding actors.
	HurtRadius(m_nFractalDamage, m_fFractalDamageRadius, MyDamageType, MomentumTransfer, ShotLocation);
}

simulated function SpawnFractalExplosionEffects(Vector ShotLocation)
{
	local ParticleSystemComponent BeamEmitter;

	if (m_FractalExplosionTemplate != None && EffectIsRelevant(ShotLocation, false, MaxEffectDistance))
	{
		// Explosion.
		WorldInfo.MyEmitterPool.SpawnEmitter(m_FractalExplosionTemplate, ShotLocation);
		
		// Beam.
		BeamEmitter = WorldInfo.MyEmitterPool.SpawnEmitter(m_FractalBeamTemplate, m_vAscentLocation);
		BeamEmitter.SetVectorParameter('TracerEnd', ShotLocation);
		BeamEmitter.SetDepthPriorityGroup(SDPG_World);
		BeamEmitter.SetTickGroup(TG_PostUpdateWork);
	}

	if (m_FractalExplosionSound != None && !bSuppressSounds)
	{
		PlaySound(m_FractalExplosionSound, true, , , ShotLocation);
	}
}

/** The fractal process has ended, so explode the grenade itself. */
function EndFractal() 
{
	ClearTimer('ShootFractalShot');
	ClearTimer('EndFractal');
	Explode(m_vAscentLocation, m_CachedHitNormal);
}

simulated function SpawnExplosionEffects(vector HitLocation, vector HitNormal)
{
	// Force the location of the explosion effects to where the grenade floats
	// rather than the location.
	super.SpawnExplosionEffects(m_vAscentLocation, HitNormal);
}

defaultproperties
{
   m_fFractalTime=5.500000
   m_fFractalInterval=0.200000
   m_fAscentTime=1.000000
   m_fAscentHeight=90.000000
   m_fFractalShotDistance=900.000000
   m_fZFractalShotDistance=100.000000
   m_nFractalDamage=370
   m_fFractalDamageRadius=300.000000
   m_bBounceRequiredForExplode=True
   m_bDoRandSpin=False
   m_fExplosionTime=2.000000
   Begin Object Class=SkeletalMeshComponent Name=SkelMesh
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_SpikeGrenade:MyLightEnvironment'
      bUseAsOccluder=False
      bCastDynamicShadow=False
      bDisableAllRigidBody=True
      Scale=1.500000
      Name="SkelMesh"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   m_ProjMesh=SkelMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fBounceDampingPercent=0.750000
   m_fAmbientSoundFadeIn=0.100000
   m_fAmbientSoundFadeOut=0.200000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
      Radius=128.000000
      Brightness=15.000000
      LightColor=(B=0,G=255,R=125,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   TerminalVelocity=7000.000000
   Speed=1200.000000
   Damage=1500.000000
   MomentumTransfer=40000.000000
   MyDamageType=Class'TribesGame.TrDmgType_SpikeGrenade'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_Grenade:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_Grenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=SkelMesh
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_SpikeGrenade"
   ObjectArchetype=TrProj_Grenade'TribesGame.Default__TrProj_Grenade'
}
