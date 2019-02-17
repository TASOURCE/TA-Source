class TrInventoryStation_Spawnable extends TrInventoryStation
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, 
				 class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local Actor	    DamagingActor;
	local float		ColRadius, ColHeight;
	local float		DamageScale, Dist;
	local vector	Dir;
	local class<TrDmgType_Base> TrDamageType;
	local TrProjectile TrProj;

	DamageScale = 1.0;
	DamagingActor = class'TrDmgType_Base'.static.GetActorCausingDamage(EventInstigator,DamageCauser);

	TrDamageType = class<TrDmgType_Base>(DamageType);

	if (DamagingActor!=None)
	{
		GetBoundingCylinder(ColRadius, ColHeight);
		Dir	= Location - DamagingActor.Location;
		TrProj = TrProjectile(DamagingActor);
		if (TrProj != none)
		{
			if (TrProj.m_bIsBullet)
			{
				Dir = TrProj.r_vSpawnLocation - HitLocation;
			}
			else
			{
				Dir = Location - HitLocation;
			}
		}
		Dist = VSize(Dir);
		Dist = FMax(Dist - ColRadius,0.f);

		DamageScale = class'TrDmgType_Base'.static.GetDamageScale(DamageCauser,Dist,TrDamageType);
	}

	if( EventInstigator != none)
    {
		DamageAmount *= DamageScale;

        super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
}

defaultproperties
{
   m_fStationAnimTime=0.833350
   m_fStationReleaseTime=0.500000
   m_bForceHealthRegen=False
   m_fStationZOffset=50.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrInventoryStation:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrInventoryStation:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrInventoryStation:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrInventoryStation:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrInventoryStation:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrInventoryStation_Spawnable:ObjectiveMesh.AnimNodeSeq0'
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrInventoryStation_Spawnable:MyLightEnvironment'
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrInventoryStation:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   m_nCriticalHealthThreshold=0
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrInventoryStation:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrInventoryStation:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_bAutoPlayOnlineSound=False
   m_bReceivesPowerFromGenerator=False
   m_bPostRenderForEnemy=True
   m_bIsRepairableAfterDeath=False
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrInventoryStation:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrInventoryStation:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrInventoryStation:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrInventoryStation:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrInventoryStation:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrInventoryStation:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrInventoryStation:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrInventoryStation:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   m_fLifeAfterDeathSecs=1.000000
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrInventoryStation:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrInventoryStation:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrInventoryStation:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrInventoryStation:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrInventoryStation:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrInventoryStation:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrInventoryStation:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrInventoryStation:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=CollisionMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrInventoryStation:CollisionMesh'
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenGame=True
      HiddenEditor=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="CollisionMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrInventoryStation:CollisionMesh'
   End Object
   Components(5)=CollisionMesh
   Components(6)=ShieldMesh
   Components(7)=OnlineSound
   Components(8)=CriticalSound
   Components(9)=ShieldHitSound
   Components(10)=PowerDownSound
   Components(11)=DestroyedSound
   bNoDelete=False
   bCanBeDamaged=True
   NetUpdateFrequency=100.000000
   CollisionComponent=CollisionMesh
   Name="Default__TrInventoryStation_Spawnable"
   ObjectArchetype=TrInventoryStation'TribesGame.Default__TrInventoryStation'
}
