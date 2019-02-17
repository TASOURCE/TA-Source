/**
 * 
 */
class TrProj_HeavyBoltLauncher extends TrProjectile;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_HeavyBoltLauncher:MyLightEnvironment'
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
   m_bFastProjectile=True
   m_fProjInheritVelocityPct=0.500000
   m_fProjInheritVelocityPctZ=0.500000
   m_fMaxProjInheritPct=0.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fDirectHitMultiplier=1.400000
   m_fAmbientSoundFadeIn=0.100000
   m_fInstigatorExtraZMomentum=25000.000000
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=350.000000
   DecalHeight=350.000000
   ProjectileLightClass=Class'UTGame.UTRocketLight'
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      Brightness=15.000000
      LightColor=(B=255,G=150,R=60,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   ExplosionLightClass=Class'TribesGame.TrExplosionLight_Spinfusor'
   bWideCheck=True
   bCheckProjectileLight=True
   CheckRadius=10.000000
   TerminalVelocity=3520.000000
   CustomGravityScaling=0.400000
   Speed=3820.000000
   MaxSpeed=8000.000000
   Damage=750.000000
   DamageRadius=360.000000
   MomentumTransfer=90000.000000
   MyDamageType=Class'TribesGame.TrDmgType_HeavyBoltLauncher'
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
   LifeSpan=6.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_HeavyBoltLauncher"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
