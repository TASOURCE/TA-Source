class TrProj_ArmoredClaymore extends TrProj_Mine;
// THIS IS A HORRIBLY NAMED CLASS. IT IS NOT A CLAYMORE.

/** How fast a target must be moving in order to detonate. */
var float DetonationSpeed;

function bool MeetsDetonationRequirements(Pawn Other)
{
	return (VSizeSq(Other.Velocity) > (DetonationSpeed * DetonationSpeed));
}

defaultproperties
{
   DetonationSpeed=1667.000000
   m_fDetonationRadius=180.000000
   m_nMarkerOffset=48
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_Mine:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_ArmoredClaymore:MyLightEnvironment'
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
      Rotation=(Pitch=0,Yaw=-16384,Roll=0)
      Scale=2.250000
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProj_Mine:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Mine:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Mine:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Mine:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Mine:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   MyDamageType=Class'TribesGame.TrDmgType_ArmoredClaymore'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_Mine:CollisionCylinder'
      CollisionHeight=12.000000
      CollisionRadius=15.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_Mine:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_ArmoredClaymore"
   ObjectArchetype=TrProj_Mine'TribesGame.Default__TrProj_Mine'
}
