/**
 * 
 */
class TrProj_SpikeLauncher extends TrProj_StickyGrenade;

/** The class to spawn for second and third explosions */
var class<TrProjectile> m_SecondProjectile;
var class<TrProjectile> m_ThirdProjectile;

/** Was this projectile a direct-hit? */
var bool m_bInAirHit;

/** Particle explosion template for direct-hits */
var ParticleSystem ProjExplosionTemplateAir;

simulated function PreBeginPlay()
{
	super.PreBeginPlay();

	if( Role == ROLE_Authority && !bShuttingDown )
	{
		// Destroy after a time unless it sticks onto a target.
		LifeSpan = 4.0;
	}
}

function bool StickToTarget(Actor Target, Vector HitLocation, Vector HitNormal)
{
	// Force a proximity scan when we stick.
	if (super.StickToTarget(Target, HitLocation, HitNormal))
	{
		LifeSpan = 0;
		return true;
	}

	return false;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if( Role == ROLE_Authority )
	{
		// We're already stuck to something, and in this specific instance we don't want the instigator to take full damage.
		if (m_bHasStuckToTarget)
		{
			return;
		}

		// If we hit a pawn or vehicle, explode. Otherwise, stick to the target.
		if (Other != none && (Other.IsA('TrPawn') || Other.IsA('TrVehicle')) && Other != Instigator)
		{
			m_bInAirHit = true;
			ProjExplosionTemplate = ProjExplosionTemplateAir;
			Explode(HitLocation, HitNormal);
		}
		else if (!m_bHasStuckToTarget)
		{
			StickToTarget(Other, HitLocation, HitNormal);
		}
	}
}

simulated function Explode(vector HitLocation, vector HitNormal)
{

	if (bShuttingDown)
		return;

	// If we didn't do a mid-air hit, spawn a secondary and tertiary projectile.
	if (Role == ROLE_Authority && !m_bInAirHit)
	{
		SpawnSecondaryProjectile(HitNormal);
	}

	super.Explode(HitLocation, HitNormal);
}

simulated function SpawnSecondaryProjectile(vector Direction)
{
	local TrProjectile SpawnedProjectile;
	local TrProjectile SpawnedProjectile2;

	// Spawn the second projectile.
	SpawnedProjectile = Spawn(m_SecondProjectile, Instigator, , Location, , , true);
	if( SpawnedProjectile != None && !SpawnedProjectile.bDeleteMe )
	{
		SpawnedProjectile.Instigator = Instigator;
		SpawnedProjectile.InstigatorController = InstigatorController;
		SpawnedProjectile.InitProjectile(Direction);
		SpawnedProjectile.m_SpawnedEquipPoint = m_SpawnedEquipPoint;
	}

	// Spawn the third projectile.
	SpawnedProjectile2 = Spawn(m_ThirdProjectile, Instigator, , Location, , , true);
	if( SpawnedProjectile2 != None && !SpawnedProjectile.bDeleteMe )
	{
		SpawnedProjectile2.Instigator = Instigator;
		SpawnedProjectile2.InstigatorController = InstigatorController;
		SpawnedProjectile2.InitProjectile(Direction);
		SpawnedProjectile2.m_SpawnedEquipPoint = m_SpawnedEquipPoint;
	}
}

defaultproperties
{
   m_SecondProjectile=Class'TribesGame.TrProj_SpikeLauncherSecondary'
   m_ThirdProjectile=Class'TribesGame.TrProj_SpikeLauncherThird'
   m_bTimedExplosion=False
   m_bFullyInheritVelocity=True
   m_fExplosionTime=0.550000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_SpikeLauncher:MyLightEnvironment'
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
      Rotation=(Pitch=16384,Yaw=0,Roll=0)
      Scale=1.500000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_fProjInheritVelocityPct=0.500000
   m_fProjInheritVelocityPctZ=0.500000
   m_fMaxProjInheritPct=0.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_StickyGrenade:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_StickyGrenade:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fDirectHitMultiplier=1.400000
   m_fAmbientSoundFadeIn=0.100000
   m_fClientSimulatedSpeed=1760.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectilePointLight'
      Radius=128.000000
      Brightness=10.000000
      LightColor=(B=0,G=15,R=255,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   TerminalVelocity=8000.000000
   CustomGravityScaling=0.450000
   Speed=3820.000000
   MaxSpeed=8000.000000
   Damage=800.000000
   DamageRadius=200.000000
   MyDamageType=Class'TribesGame.TrDmgType_SpikeLauncher'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_StickyGrenade:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_StickyGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   Rotation=(Pitch=10312,Yaw=0,Roll=0)
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=0)
   Name="Default__TrProj_SpikeLauncher"
   ObjectArchetype=TrProj_StickyGrenade'TribesGame.Default__TrProj_StickyGrenade'
}
