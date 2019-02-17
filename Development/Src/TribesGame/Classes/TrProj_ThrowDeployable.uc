/**
 * Claymore projectile. Direction based mine.
 */
class TrProj_ThrowDeployable extends TrProj_Mine
	native;

/** The class of the deployable to spawn */
var class<TrDeployable> m_DeployableToSpawn;

native function TrDeployable SpawnDeployable();

simulated function DestroyOldestOverLimit()
{
	local TrDeployable dep;
	local int deployedCount, ableToDeployCount, MaxDeployedLimit;
	local TrDeployable firstFound;
	local TrGameReplicationInfo GRI;

	deployedCount = 0;

    GRI = TrGameReplicationInfo(WorldInfo.GRI);
    if(GRI!=None)
    {
		foreach GRI.m_Deployables(dep)
		{
			if (dep.m_Controller == InstigatorController && !dep.r_bInDestroyedState && dep.Class == m_DeployableToSpawn)
			{
				if (firstFound == none || dep.CreationTime < firstFound.CreationTime)
					firstFound = dep;

				deployedCount++;
			}
		}
    }

	MaxDeployedLimit = GetMaxDeployedLimit();
	ableToDeployCount = MaxDeployedLimit;
    
	if (deployedCount >= ableToDeployCount)
	{
		firstFound.r_Health=0;
		firstFound.OnHealthChanged(true);
	}
}

simulated function int GetMaxDeployedLimit()
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	if( Instigator != none )
	{
		TrPRI = TrPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				return default.m_nPerPlayerMaxDeployed + VM.m_nExtraDeployablesOutBuff;
			}
		}
	}

	return default.m_nPerPlayerMaxDeployed;
}

simulated function ArmedTimer()
{
	local TrDeployable NewDeployable;

	if (Role == ROLE_Authority)
	{
		Shutdown();

		DestroyOldestOverLimit();

		NewDeployable = SpawnDeployable();
		if (NewDeployable != none)
		{
			NewDeployable.SetInstigatorController(TrPlayerController(Instigator.Controller));

			TrGameReplicationInfo(WorldInfo.GRI).m_Deployables.AddItem(NewDeployable);
		}
	}
}

defaultproperties
{
   m_bUsesDetonationProxy=False
   m_bDrawOwnerName=False
   m_bIsPostRendered=False
   m_fDeploySeconds=0.100000
   m_fDetonationRadius=500.000000
   m_fDetonationHeight=200.000000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProj_Mine:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_ThrowDeployable:MyLightEnvironment'
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
   m_nPerPlayerMaxDeployed=1
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Mine:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Mine:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   bCheckProjectileLight=True
   Damage=0.000000
   DamageRadius=0.000000
   MomentumTransfer=0.000000
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
   Name="Default__TrProj_ThrowDeployable"
   ObjectArchetype=TrProj_Mine'TribesGame.Default__TrProj_Mine'
}
