/**
 * 
 */
class TrProj_FlareGrenade extends TrProj_Grenade;

//
//	calculate likelihood of hijacking this missile given its orientation and distance
//
function float CalculateHijackMetric(TrProj_TrackingMissile missile)
{
	local float ret;
	local vector toMissile;

	// calculate cosine of the angle between the missile's direction and our position
	toMissile = Location-missile.Location;
	ret = Vector(missile.Rotation) dot Normal(toMissile);

	// if it is not coming toward us, metric is zero
	if (ret<0.7) return -1;

	return (1-ret)*VSize(toMissile);
}

//
//	enumerate active projectiles and see if we can hijack the guidance system on one of them
//
simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if (Role==ROLE_Authority)
	{
		HijackMissileGuidance();
	}
}

simulated function HijackMissileGuidance()
{
	local TrProj_TrackingMissile missile;
	local TrProj_TrackingMissile hijackMissile;
	local float hijackQuality;
	local float bestHijackQuality;

	bestHijackQuality=-1;
	foreach DynamicActors(class'TrProj_TrackingMissile', missile)
	{
		hijackQuality = CalculateHijackMetric(missile);
		if (bestHijackQuality==-1 || hijackQuality < bestHijackQuality)
		{
			hijackMissile = missile;
			bestHijackQuality = hijackQuality;
		}
	}

	// if we did not find a missile to hijack, try again a little later
	if (bestHijackQuality==-1)
	{
		SetTimer(0.1,false,'HijackMissileGuidance');
	}
	else
	{
		//`log(self@"Hijacking guidance on "@hijackMissile@bestHijackQuality);
		hijackMissile.SetSeekTarget(self);
	}
}

simulated function Destroyed()
{
	super.Destroyed();
	ClearTimer('HijackMissileGuidance');
}

defaultproperties
{
   m_bDoRandSpin=False
   m_fExplosionTime=8.000000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_Grenade:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_FlareGrenade:MyLightEnvironment'
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
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_Grenade:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fBounceDampingPercent=0.450000
   DecalWidth=128.000000
   DecalHeight=128.000000
   TossZ=200.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   CustomGravityScaling=0.800000
   Speed=3500.000000
   MaxSpeed=3500.000000
   Damage=0.000000
   DamageRadius=0.000000
   MyDamageType=None
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
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=0)
   Name="Default__TrProj_FlareGrenade"
   ObjectArchetype=TrProj_Grenade'TribesGame.Default__TrProj_Grenade'
}
