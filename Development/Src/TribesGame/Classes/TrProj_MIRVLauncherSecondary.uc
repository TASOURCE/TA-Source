/**
 * 
 */
class TrProj_MIRVLauncherSecondary extends TrProjectile;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_MIRVLauncherSecondary:MyLightEnvironment'
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
      Scale=3.000000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_bFastProjectile=True
   m_fProjInheritVelocityPct=1.000000
   m_fProjInheritVelocityPctZ=1.000000
   m_fMaxProjInheritPct=0.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fAmbientSoundFadeIn=0.100000
   m_fInstigatorExtraZMomentum=45000.000000
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=256.000000
   DecalHeight=256.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      Brightness=15.000000
      LightColor=(B=200,G=255,R=0,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   bCheckProjectileLight=True
   CheckRadius=42.000000
   TerminalVelocity=7000.000000
   Speed=400.000000
   MaxSpeed=8000.000000
   Damage=450.000000
   DamageRadius=700.000000
   MomentumTransfer=45000.000000
   MyDamageType=Class'TribesGame.TrDmgType_MIRVLauncher'
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
   LifeSpan=20.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_MIRVLauncherSecondary"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
