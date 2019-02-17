/**
 * 
 */
class TrProj_TrackingMissile_MKD extends TrProjectile;

simulated function Destroyed()
{
	// If our lifetime destroyed us, explode... this won't affect us already exploding.
	Explode(Location, vector(Rotation));
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_TrackingMissile_MKD:MyLightEnvironment'
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
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fDirectHitMultiplier=1.250000
   m_fAmbientSoundFadeIn=0.200000
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=768.000000
   DecalHeight=768.000000
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
   Speed=3000.000000
   MaxSpeed=8000.000000
   Damage=650.000000
   DamageRadius=450.000000
   MomentumTransfer=85000.000000
   MyDamageType=Class'TribesGame.TrDmgType_TrackingMissile_MKD'
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
   LifeSpan=1.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_TrackingMissile_MKD"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
