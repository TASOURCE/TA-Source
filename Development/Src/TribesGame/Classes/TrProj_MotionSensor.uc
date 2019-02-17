/**
 * Claymore projectile. Direction based mine.
 */
class TrProj_MotionSensor extends TrProj_Mine;

simulated function Explode(vector HitLocation, vector HitNormal)
{
	local TrPlayerController TrPC;
	local TrBroadcastHandler TrBroadcast;

	if (Damage > 0)
	{
		// Notify the owning client.
		TrPC = TrPlayerController(InstigatorController);
		if (TrPC != none)
		{
			TrPC.ClientOnMotionSensorMineSounded();
		}

		// Display a HUD indicator.
		TrBroadcast = TrBroadcastHandler(WorldInfo.Game.BroadcastHandler);
		if( TrBroadcast != none )
		{
			TrBroadcast.OnActorSpotted(self, class'TrSpottedTarget_MotionMine');
		}
	}

	super.Explode(HitLocation, HitNormal);
}

function DetonateObsolete(optional bool bDetonateFromDamage)
{
	if (!bDetonateFromDamage)
	{
		Damage=0;
	}

	Explode(Location, vect(0,0,1));	
}

defaultproperties
{
   m_fDeploySeconds=0.100000
   m_fDetonationRadius=300.000000
   m_fDetonationHeight=200.000000
   m_sScreenName="Motion Sensor"
   m_nIconStackId=39
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_Mine:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_MotionSensor:MyLightEnvironment'
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
   bCheckProjectileLight=True
   Damage=10.000000
   DamageRadius=520.000000
   MomentumTransfer=1000.000000
   MyDamageType=Class'TribesGame.TrDmgType_MotionSensor'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_Mine:CollisionCylinder'
      CollisionHeight=5.000000
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
   Name="Default__TrProj_MotionSensor"
   ObjectArchetype=TrProj_Mine'TribesGame.Default__TrProj_Mine'
}
