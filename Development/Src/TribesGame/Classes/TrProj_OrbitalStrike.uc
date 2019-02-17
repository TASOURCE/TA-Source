/**
 * 
 */
class TrProj_OrbitalStrike extends TrProj_CallInBase;

simulated function SpawnFlightEffects()
{
	if (WorldInfo.NetMode != NM_DedicatedServer && ProjFlightTemplate != None && r_TargetLocation != vect(0,0,0))
	{
		ProjEffects = WorldInfo.MyEmitterPool.SpawnEmitter(ProjFlightTemplate, r_TargetLocation);
		ProjEffects.OnSystemFinished = MyOnParticleSystemFinished;
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_CallInBase:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_OrbitalStrike:MyLightEnvironment'
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
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_CallInBase:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_bLimitXYDamageCheck=True
   m_fXYDamageRadius=1500.000000
   m_fProjInheritVelocityPct=0.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_CallInBase:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_CallInBase:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fDirectHitMultiplier=2.000000
   m_fAmbientSoundFadeIn=0.200000
   m_fAmbientSoundFadeOut=0.200000
   m_bDestroyProjEffects=False
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=350.000000
   DecalHeight=350.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_CallInBase:ProjectilePointLight'
      Radius=128.000000
      Brightness=15.000000
      LightColor=(B=245,G=227,R=141,A=255)
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_CallInBase:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   ExplosionLightClass=Class'TribesGame.TrExplosionLight_Spinfusor'
   bCheckProjectileLight=True
   CheckRadius=42.000000
   TerminalVelocity=5000.000000
   Speed=5000.000000
   MaxSpeed=5000.000000
   Damage=4000.000000
   DamageRadius=2000.000000
   MomentumTransfer=85000.000000
   MyDamageType=Class'TribesGame.TrDmgType_OrbitalStrike'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_CallInBase:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_CallInBase:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   Rotation=(Pitch=0,Yaw=0,Roll=16384)
   LifeSpan=10.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_OrbitalStrike"
   ObjectArchetype=TrProj_CallInBase'TribesGame.Default__TrProj_CallInBase'
}
