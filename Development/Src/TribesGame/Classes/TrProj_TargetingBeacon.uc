/**
 * Claymore projectile. Direction based mine.
 */
class TrProj_TargetingBeacon extends TrProj_ThrowDeployable;

defaultproperties
{
   m_DeployableToSpawn=Class'TribesGame.TrDeployable_TargetingBeacon'
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_ThrowDeployable:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_TargetingBeacon:MyLightEnvironment'
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
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_ThrowDeployable:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_fProjInheritVelocityPct=0.500000
   m_fProjInheritVelocityPctZ=0.500000
   m_fMaxProjInheritPct=0.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_ThrowDeployable:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_ThrowDeployable:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fClientSimulatedSpeed=1760.000000
   TossZ=0.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_ThrowDeployable:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_ThrowDeployable:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   Speed=1400.000000
   MaxSpeed=1600.000000
   MyDamageType=None
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_ThrowDeployable:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=15.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_ThrowDeployable:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   Physics=PHYS_Projectile
   bProjTarget=False
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_TargetingBeacon"
   ObjectArchetype=TrProj_ThrowDeployable'TribesGame.Default__TrProj_ThrowDeployable'
}
