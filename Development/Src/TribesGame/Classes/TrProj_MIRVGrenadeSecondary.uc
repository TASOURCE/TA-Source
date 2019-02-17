/**
 * 
 */
class TrProj_MIRVGrenadeSecondary extends TrProj_Grenade;

defaultproperties
{
   m_fExplosionTime=3.000000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_Grenade:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_MIRVGrenadeSecondary:MyLightEnvironment'
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
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_Grenade:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_fProjInheritVelocityPct=1.000000
   m_fProjInheritVelocityPctZ=1.000000
   m_fMaxProjInheritPct=0.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Grenade:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fInstigatorExtraZMomentum=45000.000000
   m_fMaxLifespan=2.200000
   m_fMinLifespan=1.800000
   DecalWidth=512.000000
   DecalHeight=512.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Grenade:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   TerminalVelocity=7000.000000
   Speed=400.000000
   MaxSpeed=8000.000000
   Damage=425.000000
   DamageRadius=600.000000
   MomentumTransfer=25000.000000
   MyDamageType=Class'TribesGame.TrDmgType_MIRVGrenade'
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
   Name="Default__TrProj_MIRVGrenadeSecondary"
   ObjectArchetype=TrProj_Grenade'TribesGame.Default__TrProj_Grenade'
}
