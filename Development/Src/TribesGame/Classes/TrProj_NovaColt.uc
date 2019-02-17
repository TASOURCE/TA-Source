/**
 * 
 */
class TrProj_NovaColt extends TrProjectile;

var int    m_nBouncesAllowed;   // How many bounces are allowed on the projectile.
var int    m_nNumberBounces; // How many bounces have happened.

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

	// Bounced to long. Shutdown.
	if ( m_nNumberBounces == m_nBouncesAllowed )
	{
		Shutdown();
	}
	else
	{
		Bounce(Wall, HitNormal);
		m_nNumberBounces = m_nNumberBounces + 1;
	}
}

defaultproperties
{
   m_nBouncesAllowed=2
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_NovaColt:MyLightEnvironment'
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
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fBounceDampingPercent=0.000000
   m_fAmbientSoundFadeIn=0.100000
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=20.000000
   DecalHeight=20.000000
   ProjectileLightClass=Class'UTGame.UTRocketLight'
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      Brightness=15.000000
      LightColor=(B=0,G=10,R=255,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   ExplosionLightClass=None
   bWideCheck=True
   bCheckProjectileLight=True
   CheckRadius=15.000000
   AccelRate=45000.000000
   CustomGravityScaling=0.000000
   Speed=8000.000000
   MaxSpeed=18000.000000
   Damage=350.000000
   MomentumTransfer=100.000000
   MyDamageType=Class'TribesGame.TrDmgType_NovaColt'
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
   bCollideComplex=True
   bBounce=True
   LifeSpan=1.000000
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=1)
   Name="Default__TrProj_NovaColt"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
