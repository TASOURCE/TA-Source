/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SkeletalMeshActorMATWalkable extends SkeletalMeshActorMAT;

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActorMAT:SkeletalMeshComponent0'
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActorMATWalkable:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      CollideActors=True
      BlockZeroExtent=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActorMAT:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActorMAT:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      bAllowDynamicShadowsOnTranslucency=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActorMAT:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'Engine.Default__SkeletalMeshActorMAT:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'Engine.Default__SkeletalMeshActorMAT:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=MyLightEnvironment
   Components(1)=SkeletalMeshComponent0
   Components(2)=FaceAudioComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   Components(3)=CollisionCylinder
   Physics=PHYS_Walking
   bCollideActors=True
   bCollideWorld=True
   bBlockActors=True
   CollisionComponent=CollisionCylinder
   Name="Default__SkeletalMeshActorMATWalkable"
   ObjectArchetype=SkeletalMeshActorMAT'Engine.Default__SkeletalMeshActorMAT'
}
