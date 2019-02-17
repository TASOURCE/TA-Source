/**
 *  Some of this is leveraged from Epic's tracer logic.
 */
class TrProj_ClientTracer extends TrProjectile;

/** The class we inherited from */
var class<TrProjectile> m_InheritedClass;

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
	m_InheritedClass = ClassToInherit;

	if( ProjectileLight != none && m_InheritedClass != none )
	{
		if( m_InheritedClass.default.ProjectileLight != none && m_InheritedClass.default.ProjectileLight.Brightness > 0.0 && m_InheritedClass.default.ProjectileLight.bEnabled )
		{
			ProjectileLight.SetEnabled(true);
			ProjectileLight.SetLightProperties(m_InheritedClass.default.ProjectileLight.Brightness, m_InheritedClass.default.ProjectileLight.LightColor);
			ProjectileLight.Radius = m_InheritedClass.default.ProjectileLight.Radius;
		}
		else
		{
			DetachComponent(ProjectileLight);
		}
	}

	super.InitProjectile(Direction, ClassToInherit);
}

simulated function SoundCue GetExplosionSound(PhysicalMaterial HitMaterial, Actor HitActor)
{
	local int i;
	local name PhysMaterialName;
	local TrPhysicalMaterialProperty PhysicalProperty;
	local TrMapInfo TrMI;

	if (m_InheritedClass == none)
	{
		return default.ExplosionSound;
	}

	if (Terrain(HitActor) != none || Terrain(ImpactedActor) != none)
	{
		// If we hit terrain, return the map's default phys mat.
		TrMI = TrMapInfo(WorldInfo.GetMapInfo());
		if( TrMI != none )
		{
			PhysMaterialName = TrMI.m_DefaultPhysicalMaterialName;
		}
		else
		{
			PhysMaterialName = '';
		}
	}
	else if (TrPawn(HitActor) != none || TrPawn(ImpactedActor) != none)
	{
		PhysMaterialName = 'Pawn';
	}
	else if (TrDeployable_ForceField(HitActor) != none || TrDeployable_ForceField(ImpactedActor) != none)
	{
		PhysMaterialName = 'ForceField';
	}
	else if (HitMaterial != None)
	{
		PhysicalProperty = TrPhysicalMaterialProperty(HitMaterial.GetPhysicalMaterialProperty(class'TrPhysicalMaterialProperty'));

		if (PhysicalProperty != none)
		{
			PhysMaterialName = PhysicalProperty.MaterialType;
		}
	}

	if (PhysMaterialName != 'none' && PhysMaterialName != '')
	{
		i = m_InheritedClass.default.ImpactEffects.Find('MaterialType', PhysMaterialName);
		if (i != INDEX_NONE)
		{
			return m_InheritedClass.default.ImpactEffects[i].Sound;
		}
	}

	return m_InheritedClass.default.ExplosionSound;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if( m_bAuthoritativeExploding )
	{
		// Ignore touch events on pawns if we are the client..
		if (Other != none && Other.IsA('TrPawn') && WorldInfo.NetMode == NM_Client)
		{
			return;
		}
	}

	Shutdown();
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_ClientTracer:MyLightEnvironment'
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
   m_fMaxProjInheritPct=0.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fAmbientSoundFadeIn=0.200000
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   ExplosionLightClass=None
   bCheckProjectileLight=True
   CheckRadius=42.000000
   AccelRate=100000.000000
   Speed=3820.000000
   MaxSpeed=21000.000000
   MyDamageType=None
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
   Rotation=(Pitch=0,Yaw=0,Roll=16384)
   RemoteRole=ROLE_None
   LifeSpan=1.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_ClientTracer"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
