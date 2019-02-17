/** 
 * Version of KAsset that can be dynamically spawned and destroyed during gameplay 
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 **/
class KAssetSpawnable extends KAsset
	notplaceable;

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=KAssetSkelMeshComponent Archetype=SkeletalMeshComponent'Engine.Default__KAsset:KAssetSkelMeshComponent'
      PhysicsWeight=1.000000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__KAssetSpawnable:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="KAssetSkelMeshComponent"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__KAsset:KAssetSkelMeshComponent'
   End Object
   SkeletalMeshComponent=KAssetSkelMeshComponent
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__KAsset:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__KAsset:MyLightEnvironment'
   End Object
   Components(0)=MyLightEnvironment
   Components(1)=KAssetSkelMeshComponent
   bNoDelete=False
   CollisionComponent=KAssetSkelMeshComponent
   Name="Default__KAssetSpawnable"
   ObjectArchetype=KAsset'Engine.Default__KAsset'
}
