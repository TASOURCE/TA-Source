/*=============================================================================
	ApexDestructibleActorSpawnable .uc: PhysX APEX integration. 
	Copyright 2008-2009 NVIDIA Corporation.
==============================================================================*/
class ApexDestructibleActorSpawnable extends ApexDestructibleActor
      notplaceable;

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=LightEnvironment0 Archetype=DynamicLightEnvironmentComponent'Engine.Default__ApexDestructibleActor:LightEnvironment0'
      bEnabled=False
      Name="LightEnvironment0"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__ApexDestructibleActor:LightEnvironment0'
   End Object
   LightEnvironment=LightEnvironment0
   Begin Object Class=ApexStaticDestructibleComponent Name=DestructibleComponent0 Archetype=ApexStaticDestructibleComponent'Engine.Default__ApexDestructibleActor:DestructibleComponent0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__ApexDestructibleActorSpawnable:LightEnvironment0'
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      Name="DestructibleComponent0"
      ObjectArchetype=ApexStaticDestructibleComponent'Engine.Default__ApexDestructibleActor:DestructibleComponent0'
   End Object
   StaticDestructibleComponent=DestructibleComponent0
   Components(0)=LightEnvironment0
   Components(1)=DestructibleComponent0
   bNoDelete=False
   CollisionComponent=DestructibleComponent0
   Name="Default__ApexDestructibleActorSpawnable"
   ObjectArchetype=ApexDestructibleActor'Engine.Default__ApexDestructibleActor'
}
