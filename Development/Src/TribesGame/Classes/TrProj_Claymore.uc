/**
 * Claymore projectile. Direction based mine.
 */
class TrProj_Claymore extends TrProj_Mine
	native;

/** [0-360] specifies the radial angle for detonation. Converts to [-1 - 1] scalar using ((2V/360-1) * -1). */
var() float m_fDetonationAngle;

/** Use this for computations of angles with dot products. Set during init() using m_fDetonationAngle. */
var transient float m_fScalarAngle; 

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
	Velocity = (Speed * Direction) + (Instigator.Velocity * m_fProjInheritVelocityPct);

	TossZ = TossZ + (FRand() * TossZ / 2.0) - (TossZ / 4.0);
	Velocity.Z += TossZ;
	Acceleration = AccelRate * Normal(Velocity);

	// Angle used for directional damage computations.
	m_fScalarAngle = Cos((m_fDetonationAngle / 2) * DegToRad);

	// Generate a random lifespan.
	if (Role == ROLE_Authority && m_fMaxLifespan > 0.0f && m_fMinLifespan != m_fMaxLifespan)
	{
		SetTimer(RandRange(m_fMinLifespan, m_fMaxLifespan), false, 'ExplodeFromTimeLimit');
	}
}

simulated function SetExplosionEffectParameters(ParticleSystemComponent ProjExplosion)
{
	super.SetExplosionEffectParameters(ProjExplosion);

	ProjExplosion.SetTickGroup(TG_PostUpdateWork);
}

/** A pawn has entered the detonation area. */
function PawnEnteredDetonationArea(Pawn Other)
{
	// Not a pawn we really care about.
	if (Other==None || (!Other.IsA('TrPawn') && !Other.IsA('TrVehicle')))
	{
		return;
	}

	// We only care if we are armed, are not on the same team, and are on a valid team.
	if( m_bArmed && Other.GetTeamNum() != GetTeamNum() && Other.GetTeamNum() != 255 )
	{
		if( !IsBlockedByBlocker(self, Other) && Normal(Other.Location - Location) dot Vector(Rotation) > m_fScalarAngle )
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

simulated function Texture2D GetMarker()
{
	return class'TrHud'.default.DeployableClaymore;
}

defaultproperties
{
   m_fDetonationAngle=95.000000
   m_fDetonationRadius=300.000000
   m_fDetonationHeight=100.000000
   m_sScreenName="Claymore"
   m_nMarkerOffset=48
   m_nIconStackId=35
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_Mine:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Claymore:MyLightEnvironment'
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
      Rotation=(Pitch=0,Yaw=-16384,Roll=0)
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_Mine:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
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
   MyDamageType=Class'TribesGame.TrDmgType_Claymore'
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
   Components(2)=ProjectileMeshComp
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_Claymore"
   ObjectArchetype=TrProj_Mine'TribesGame.Default__TrProj_Mine'
}
