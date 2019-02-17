/**
 * 
 */
class TrProj_HavocPilot extends TrProjectile;

function float CalculateHijackMetric(TrProj_TrackingMissile Tracker)
{
	// If the missile isn't coming towards our vehicle, ignore.
	if (Tracker == none || Tracker.SeekTarget != InstigatorBaseVehicle)
		return -1.0f;

	return vector(Tracker.Rotation) dot Normal(Location - Tracker.Location);
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	/*if (Role == ROLE_Authority)
	{
		SetTimer(0.1f, true, 'HijackMissileGuidance');
	}*/
}

simulated function HijackMissileGuidance()
{
	local TrProj_TrackingMissile Tracker;

	if (bShuttingDown)
	{
		ClearTimer('HijackMissileGuidance');
		return;
	}

	// Loop through all tracking missiles, distracting missiles coming towards our owner.
	foreach DynamicActors(class'TrProj_TrackingMissile', Tracker)
	{
		if (CalculateHijackMetric(Tracker) >= 0.0f)
		{
			Tracker.SetSeekTarget(self);
		}
	}
}

simulated function Destroyed()
{
	super.Destroyed();

	ClearTimer('HijackMissileGuidance');
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_HavocPilot:MyLightEnvironment'
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
   m_fProjInheritVelocityPct=0.000000
   m_fProjInheritVelocityPctZ=0.000000
   m_fMaxProjInheritPct=0.000000
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
   ProjectileLightClass=Class'UTGame.UTRocketLight'
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      Brightness=15.000000
      LightColor=(B=245,G=227,R=141,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   bCheckProjectileLight=True
   CheckRadius=42.000000
   CustomGravityScaling=0.400000
   Speed=2500.000000
   MaxSpeed=3500.000000
   Damage=650.000000
   DamageRadius=700.000000
   MomentumTransfer=85000.000000
   MyDamageType=Class'TribesGame.TrDmgType_HavocPilot'
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
   LifeSpan=10.000000
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=50000)
   Name="Default__TrProj_HavocPilot"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
