/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 **/

class UTSD_SpawnedKActor extends KActor
	notplaceable;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__KActor:StaticMeshComponent0'
      WireframeColor=(B=128,G=255,R=0,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTSD_SpawnedKActor:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__KActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__KActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__KActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   RemoteRole=ROLE_None
   bNoDelete=False
   CollisionComponent=StaticMeshComponent0
   Name="Default__UTSD_SpawnedKActor"
   ObjectArchetype=KActor'Engine.Default__KActor'
}
