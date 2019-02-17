//=============================================================================
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class FracturedSMActorSpawnable extends FracturedStaticMeshActor;

defaultproperties
{
   Begin Object Class=FracturedStaticMeshComponent Name=FracturedStaticMeshComponent0 Archetype=FracturedStaticMeshComponent'Engine.Default__FracturedStaticMeshActor:FracturedStaticMeshComponent0'
      bUseDynamicIBWithHiddenFragments=True
      WireframeColor=(B=255,G=128,R=0,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__FracturedSMActorSpawnable:LightEnvironment0'
      bAllowApproximateOcclusion=True
      Name="FracturedStaticMeshComponent0"
      ObjectArchetype=FracturedStaticMeshComponent'Engine.Default__FracturedStaticMeshActor:FracturedStaticMeshComponent0'
   End Object
   FracturedStaticMeshComponent=FracturedStaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=LightEnvironment0 Archetype=DynamicLightEnvironmentComponent'Engine.Default__FracturedStaticMeshActor:LightEnvironment0'
      bDynamic=False
      bEnabled=False
      bForceNonCompositeDynamicLights=True
      Name="LightEnvironment0"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__FracturedStaticMeshActor:LightEnvironment0'
   End Object
   Components(0)=LightEnvironment0
   Begin Object Class=FracturedSkinnedMeshComponent Name=FracturedSkinnedComponent0 Archetype=FracturedSkinnedMeshComponent'Engine.Default__FracturedStaticMeshActor:FracturedSkinnedComponent0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__FracturedSMActorSpawnable:LightEnvironment0'
      bDisableAllRigidBody=True
      Name="FracturedSkinnedComponent0"
      ObjectArchetype=FracturedSkinnedMeshComponent'Engine.Default__FracturedStaticMeshActor:FracturedSkinnedComponent0'
   End Object
   Components(1)=FracturedSkinnedComponent0
   Components(2)=FracturedStaticMeshComponent0
   bNoDelete=False
   CollisionComponent=FracturedStaticMeshComponent0
   Name="Default__FracturedSMActorSpawnable"
   ObjectArchetype=FracturedStaticMeshActor'Engine.Default__FracturedStaticMeshActor'
}
