/**
 * 
 */
class TrProj_MIRVLauncher extends TrProj_Grenade;

/** The class to spawn for secondary explosions */
var class<TrProjectile> m_SecondaryProjectile;

/** The number of secondary explosions to launch */
var int m_nSecondaryExplosions;

simulated function rotator GetRandomSpread(rotator BaseDirection)
{
	local vector X, Y, Z;
	local float CurrentSpread, Rand, RandY, RandZ;

    // Add in any spread.
	GetAxes(BaseDirection, X, Y, Z);

    CurrentSpread = FRand();   // random radius in the circle
    Rand = FRand() * 2 * PI;    // random angle
	RandY = cos(Rand);  // generate a based on the angle (y = horizontal axis, z = vertical axis)
	RandZ = sin(Rand);
	return rotator(X + CurrentSpread * (RandY * Y + RandZ * Z) );
}

simulated function SpawnSecondaryProjectile(vector Direction)
{
	local TrProjectile SpawnedProjectile;

	SpawnedProjectile = Spawn(m_SecondaryProjectile, Instigator, , Location + 16.0f * Direction);
	if( SpawnedProjectile != None && !SpawnedProjectile.bDeleteMe )
	{
		SpawnedProjectile.Instigator = Instigator;
		SpawnedProjectile.InstigatorController = InstigatorController;
		SpawnedProjectile.InitProjectile(Direction);
		SpawnedProjectile.m_SpawnedEquipPoint = m_SpawnedEquipPoint;

		// Re-calculate the projectiles velocity.
		SpawnedProjectile.Velocity = SpawnedProjectile.Speed * Direction;
		SpawnedProjectile.Velocity.X += SpawnedProjectile.m_fProjInheritVelocityPct * Velocity.X;
		SpawnedProjectile.Velocity.Y += SpawnedProjectile.m_fProjInheritVelocityPct * Velocity.Y;
		SpawnedProjectile.Velocity.Z += SpawnedProjectile.TossZ + SpawnedProjectile.m_fProjInheritVelocityPctZ * Velocity.Z;
	}
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	local int i;
	local rotator ExplodeDirection;

	if (bShuttingDown)
		return;

	if (Role == ROLE_Authority)
	{
		if (IsZero(m_OverloadHitNormal))
		{
			ExplodeDirection = rotator(Normal(Velocity));
		}
		else
		{
			ExplodeDirection = rotator(m_OverloadHitNormal);
		}

		// Spawn the secondary projectiles.
		for (i = 0; i < m_nSecondaryExplosions; i++)
		{
			SpawnSecondaryProjectile(vector(GetRandomSpread(ExplodeDirection)));
		}
	}

	super.Explode(HitLocation, HitNormal);
}

simulated function Bounce(Actor Other, Vector WallNormal)
{
	m_OverloadHitNormal = WallNormal;

	super.Bounce(Other, WallNormal);
}

defaultproperties
{
   m_SecondaryProjectile=Class'TribesGame.TrProj_MIRVLauncherSecondary'
   m_nSecondaryExplosions=4
   m_bFullyInheritVelocity=True
   m_fExplosionTime=2.000000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_Grenade:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_MIRVLauncher:MyLightEnvironment'
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
      Scale=3.000000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_Grenade:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_fProjInheritVelocityPct=0.500000
   m_fProjInheritVelocityPctZ=0.500000
   m_fMaxProjInheritPct=0.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fBounceDampingPercent=0.750000
   m_fAmbientSoundFadeIn=0.200000
   DecalWidth=768.000000
   DecalHeight=768.000000
   TossZ=200.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
      Radius=128.000000
      Brightness=15.000000
      LightColor=(B=200,G=255,R=0,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   TerminalVelocity=7000.000000
   CustomGravityScaling=0.800000
   Speed=3600.000000
   MaxSpeed=7000.000000
   Damage=100.000000
   DamageRadius=700.000000
   MomentumTransfer=2000.000000
   MyDamageType=Class'TribesGame.TrDmgType_MIRVLauncher'
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
   Components(2)=ProjectileMeshComp
   LifeSpan=20.000000
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=0)
   Name="Default__TrProj_MIRVLauncher"
   ObjectArchetype=TrProj_Grenade'TribesGame.Default__TrProj_Grenade'
}
