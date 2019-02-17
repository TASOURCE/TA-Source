/** 
 *  This actor is meant to be used by Matinee for all of the usage scenerios where you have an invisible
 * InterpActor moving around some track that the camera is eventually attached to.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpActor_ForCinematic extends InterpActor
	placeable;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__InterpActor:StaticMeshComponent0'
      WireframeColor=(B=255,G=0,R=255,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__InterpActor_ForCinematic:MyLightEnvironment'
      BlockRigidBody=False
      RBCollideWithChannels=(Default=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__InterpActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__InterpActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__InterpActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   TickFrequencyAtEndDistance=0.000000
   CollisionComponent=StaticMeshComponent0
   Name="Default__InterpActor_ForCinematic"
   ObjectArchetype=InterpActor'Engine.Default__InterpActor'
}
