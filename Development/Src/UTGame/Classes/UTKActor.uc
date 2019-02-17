/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTKActor extends UDKKActorBreakable;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'UDKBase.Default__UDKKActorBreakable:StaticMeshComponent0'
      WireframeColor=(B=128,G=255,R=0,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTKActor:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'UDKBase.Default__UDKKActorBreakable:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'UDKBase.Default__UDKKActorBreakable:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UDKBase.Default__UDKKActorBreakable:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   CollisionComponent=StaticMeshComponent0
   Name="Default__UTKActor"
   ObjectArchetype=UDKKActorBreakable'UDKBase.Default__UDKKActorBreakable'
}
