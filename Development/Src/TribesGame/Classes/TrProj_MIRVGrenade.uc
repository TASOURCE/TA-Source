/**
 * 
 */
class TrProj_MIRVGrenade extends TrProj_MIRVLauncher;

defaultproperties
{
   m_SecondaryProjectile=Class'TribesGame.TrProj_MIRVGrenadeSecondary'
   m_nSecondaryExplosions=5
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_MIRVLauncher:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_MIRVGrenade:MyLightEnvironment'
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
      Scale=1.250000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_MIRVLauncher:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_MIRVLauncher:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_MIRVLauncher:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fBounceDampingPercent=0.550000
   DecalWidth=128.000000
   DecalHeight=128.000000
   TossZ=45.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_MIRVLauncher:ProjectilePointLight'
      Radius=128.000000
      Brightness=7.000000
      LightColor=(B=77,G=199,R=255,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_MIRVLauncher:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   ExplosionLightClass=None
   CustomGravityScaling=0.500000
   Speed=1200.000000
   MaxSpeed=1600.000000
   Damage=400.000000
   DamageRadius=400.000000
   MomentumTransfer=10000.000000
   MyDamageType=Class'TribesGame.TrDmgType_MIRVGrenade'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_MIRVLauncher:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_MIRVLauncher:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_MIRVGrenade"
   ObjectArchetype=TrProj_MIRVLauncher'TribesGame.Default__TrProj_MIRVLauncher'
}
