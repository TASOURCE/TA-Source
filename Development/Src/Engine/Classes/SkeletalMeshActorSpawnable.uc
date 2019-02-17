/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SkeletalMeshActorSpawnable extends SkeletalMeshActor
	native(Anim)
	notplaceable;

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'Engine.Default__SkeletalMeshActorSpawnable:SkeletalMeshComponent0.AnimNodeSeq0'
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActorSpawnable:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      CollideActors=True
      BlockZeroExtent=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'Engine.Default__SkeletalMeshActor:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'Engine.Default__SkeletalMeshActor:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=MyLightEnvironment
   Components(1)=SkeletalMeshComponent0
   Components(2)=FaceAudioComponent
   bNoDelete=False
   CollisionComponent=SkeletalMeshComponent0
   Name="Default__SkeletalMeshActorSpawnable"
   ObjectArchetype=SkeletalMeshActor'Engine.Default__SkeletalMeshActor'
}
