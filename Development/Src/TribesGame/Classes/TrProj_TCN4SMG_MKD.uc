/**
 * 
 */
class TrProj_TCN4SMG_MKD extends TrProj_TCN4SMG;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_TCN4SMG:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_TCN4SMG_MKD:MyLightEnvironment'
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
      Scale=1.200000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_TCN4SMG:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_TCN4SMG:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_TCN4SMG:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_TCN4SMG:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_TCN4SMG:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   Damage=105.000000
   MyDamageType=Class'TribesGame.TrDmgType_TCN4SMG_MKD'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_TCN4SMG:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_TCN4SMG:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_TCN4SMG_MKD"
   ObjectArchetype=TrProj_TCN4SMG'TribesGame.Default__TrProj_TCN4SMG'
}
