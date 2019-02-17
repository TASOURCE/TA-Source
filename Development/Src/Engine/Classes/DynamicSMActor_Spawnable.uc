/** 
 * Concrete version of DynamicSMActor for spawning mid-game. 
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DynamicSMActor_Spawnable extends DynamicSMActor;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__DynamicSMActor:StaticMeshComponent0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor_Spawnable:MyLightEnvironment'
      BlockRigidBody=False
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__DynamicSMActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   bCollideActors=True
   bBlockActors=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__DynamicSMActor_Spawnable"
   ObjectArchetype=DynamicSMActor'Engine.Default__DynamicSMActor'
}
