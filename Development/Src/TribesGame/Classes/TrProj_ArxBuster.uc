/**
 * 
 */
class TrProj_ArxBuster extends TrProj_StickyGrenade;

defaultproperties
{
   m_fExplosionTime=0.700000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_StickyGrenade:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_ArxBuster:MyLightEnvironment'
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
   CustomGravityScaling=0.300000
   Speed=3820.000000
   MaxSpeed=8000.000000
   Damage=600.000000
   DamageRadius=360.000000
   MomentumTransfer=68000.000000
   MyDamageType=Class'TribesGame.TrDmgType_ArxBuster'
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
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_ArxBuster"
   ObjectArchetype=TrProj_StickyGrenade'TribesGame.Default__TrProj_StickyGrenade'
}
