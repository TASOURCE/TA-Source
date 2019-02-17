/**
 * 
 */
class TrProj_PlasmaCannon extends TrProjectile;

simulated function SpawnFlightEffects()
{
    Super.SpawnFlightEffects();

    if( ProjEffects != None )
    {
        ProjEffects.SetRotation(rot(0,0,16384));
    }
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_PlasmaCannon:MyLightEnvironment'
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
   m_fDirectHitMultiplier=1.250000
   m_fAmbientSoundFadeIn=0.100000
   m_fInstigatorExtraZMomentum=25000.000000
   m_fClientSimulatedSpeed=1760.000000
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=100.000000
   DecalHeight=100.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      Brightness=7.000000
      LightColor=(B=77,G=199,R=255,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   bWideCheck=True
   bCheckProjectileLight=True
   CheckRadius=35.000000
   Speed=3620.000000
   MaxSpeed=8000.000000
   Damage=460.000000
   DamageRadius=270.000000
   MomentumTransfer=25000.000000
   MyDamageType=Class'TribesGame.TrDmgType_PlasmaCannon'
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
   LifeSpan=3.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_PlasmaCannon"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
