/**
 * 
 */
class TrProj_RemoteArxBuster extends TrProj_StickyGrenade;

/** Is this projectile exploding because of a detonation? */
var bool m_bIsDetonating;

simulated function PreBeginPlay()
{
	super.PreBeginPlay();

	if( Role == ROLE_Authority && !bShuttingDown )
	{
		// Destroy after a time unless it sticks onto a target.
		LifeSpan = 6.0;
	}
}

/*
* explode when shot
*/
simulated function TakeRadiusDamage
(
	Controller			EventInstigator,
	float				BaseDamage,
	float				InDamageRadius,
	class<DamageType>	DamageType,
	float				Momentum,
	vector				HurtOrigin,
	bool				bFullDamage,
	Actor               DamageCauser,
	optional float      DamageFalloffExponent=1.f
)
{
	local TrProjectile Projectile;

	Projectile = TrProjectile(DamageCauser);
	if (Projectile != none)
	{
		// Projectile hit a force field? Only damage pawns on the side that the projectile exploded on.
		if( Projectile.ImpactedActor != none && Projectile.ImpactedActor.IsA('TrDeployable_ForceField') )
		{
			if( Normal(Projectile.Velocity) dot Normal(Projectile.Location - Location) < 0.0 )
			{
				return;
			}
		}
		// Projectile can't be blocked by a blocker.
		else if( Projectile.IsBlockedByBlocker(DamageCauser, self,, false, Projectile.m_bIsBullet ? HurtOrigin : vect(0,0,0)) )
		{
			return;
		}
	}

	super.TakeRadiusDamage(EventInstigator, BaseDamage, InDamageRadius, DamageType, Momentum, HurtOrigin, bFullDamage, DamageCauser, DamageFalloffExponent);
}

event TakeDamage(int damageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	// Mines can only be exploded by enemy fire (unless friendly fire is on) or other mines around them.
	if ((WorldInfo.GRI.r_bFriendlyFire || EventInstigator.GetTeamNum() != GetTeamNum() || DamageCauser.IsA('TrProj_Mine')) && damageAmount > 0)
	{
		DetonateObsolete(!DamageCauser.IsA('TrProj_Mine'));
	}
	super.TakeDamage(damageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
}

function ReportDestroyedByOtherToParentDevice()
{
	local TrDevice_RemoteArxBuster RemoteArxBuster;
	local TrPawn TrP;
	local TrInventoryManager TrIM;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrIM = TrInventoryManager(TrP.InvManager);
		if( TrIM != none )
		{
			RemoteArxBuster = TrDevice_RemoteArxBuster(TrIM.GetDeviceByWeaponClass(class'TrDevice_RemoteArxBuster'));
			if( RemoteArxBuster != none )
			{
				// Inform the parent device that a projectile has been destroyed.
				RemoteArxBuster.OnRemoteProjectileDestroyedByOther(self);
			}
		}
	}
}

/** Sticks this grenade to a target actor. */
function bool StickToTarget(Actor Target, Vector HitLocation, Vector HitNormal)
{
	if( super.StickToTarget(Target, HitLocation, HitNormal) )
	{
		if( !bShuttingDown )
		{
			// If we've attached to something, don't destroy ourselves through Lifespan.
			LifeSpan = 0;

			// For some reason our collision cylinder is getting reset to 0, so set it back to the default.
			SetCollisionSize(CylinderComponent.default.CollisionRadius,CylinderComponent.default.CollisionHeight);
		}
		return true;
	}
	return false;
}

simulated event Destroyed()
{
	// If we were destroyed without detonation, report it to the parent device.
	if( !m_bIsDetonating )
	{
		ReportDestroyedByOtherToParentDevice();
	}
	super.Destroyed();
}

defaultproperties
{
   m_bTimedExplosion=False
   m_fExplosionTime=0.000000
   m_fStuckDamageMultiplier=2.000000
   m_fStuckMomentumMultiplier=2.000000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_RemoteArxBuster:MyLightEnvironment'
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
      Scale=5.000000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_StickyGrenade:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_StickyGrenade:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fClientSimulatedSpeed=1760.000000
   ProjectileLightClass=None
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectilePointLight'
      Radius=128.000000
      Brightness=0.000000
      LightColor=(B=0,G=0,R=0,A=255)
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   TerminalVelocity=8000.000000
   CustomGravityScaling=0.400000
   Speed=3820.000000
   MaxSpeed=8000.000000
   Damage=200.000000
   DamageRadius=360.000000
   MomentumTransfer=20000.000000
   MyDamageType=Class'TribesGame.TrDmgType_RemoteArxBuster'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_StickyGrenade:CollisionCylinder'
      CollisionHeight=8.000000
      CollisionRadius=8.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_StickyGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   bProjTarget=True
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
   Name="Default__TrProj_RemoteArxBuster"
   ObjectArchetype=TrProj_StickyGrenade'TribesGame.Default__TrProj_StickyGrenade'
}
