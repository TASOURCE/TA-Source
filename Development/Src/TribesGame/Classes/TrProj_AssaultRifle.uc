/**
 * 
 */
class TrProj_AssaultRifle extends TrProjectile;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_AssaultRifle:MyLightEnvironment'
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
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_bFastProjectile=True
   m_bSimulateAutonomousProjectiles=True
   m_bIsBullet=True
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
   m_fBounceDampingPercent=0.000000
   m_fAmbientSoundFadeIn=0.100000
   m_fInstigatorExtraZMomentum=0.000000
   ImpactEffects(0)=(MaterialType="Composite")
   ImpactEffects(1)=(MaterialType="Concrete")
   ImpactEffects(2)=(MaterialType="Dirt")
   ImpactEffects(3)=(MaterialType="Grass")
   ImpactEffects(4)=(MaterialType="Metal")
   ImpactEffects(5)=(MaterialType="MetalGrate")
   ImpactEffects(6)=(MaterialType="Rock")
   ImpactEffects(7)=(MaterialType="Water")
   ImpactEffects(8)=(MaterialType="Pawn")
   ImpactEffects(9)=(MaterialType="ForceField")
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=30.000000
   DecalHeight=30.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   ExplosionLightClass=None
   bWideCheck=True
   CheckRadius=50.000000
   CustomGravityScaling=0.000000
   Speed=21000.000000
   MaxSpeed=21000.000000
   Damage=80.000000
   MyDamageType=Class'TribesGame.TrDmgType_AssaultRifle'
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
   bNetTemporary=True
   bCollideComplex=True
   LifeSpan=1.000000
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=1)
   Name="Default__TrProj_AssaultRifle"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
