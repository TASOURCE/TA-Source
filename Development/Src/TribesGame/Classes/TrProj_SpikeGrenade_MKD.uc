/**
 * 
 */
class TrProj_SpikeGrenade_MKD extends TrProj_SpikeGrenade;

defaultproperties
{
   m_fFractalTime=6.500000
   m_nFractalDamage=350
   Begin Object Class=SkeletalMeshComponent Name=SkelMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrProj_SpikeGrenade:SkelMesh'
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_SpikeGrenade_MKD:MyLightEnvironment'
      bUseAsOccluder=False
      bCastDynamicShadow=False
      bDisableAllRigidBody=True
      Scale=1.500000
      Name="SkelMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrProj_SpikeGrenade:SkelMesh'
   End Object
   m_ProjMesh=SkelMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_SpikeGrenade:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_SpikeGrenade:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_SpikeGrenade:ProjectilePointLight'
      Radius=128.000000
      Brightness=15.000000
      LightColor=(B=100,G=195,R=255,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_SpikeGrenade:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   MyDamageType=Class'TribesGame.TrDmgType_SpikeGrenade_MKD'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_SpikeGrenade:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_SpikeGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=SkelMesh
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_SpikeGrenade_MKD"
   ObjectArchetype=TrProj_SpikeGrenade'TribesGame.Default__TrProj_SpikeGrenade'
}
