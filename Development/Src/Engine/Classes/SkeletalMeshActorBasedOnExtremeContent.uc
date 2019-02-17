/**
 * This is an actor which can be used to change its material based on whether Extreme Content is on or not  
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SkeletalMeshActorBasedOnExtremeContent extends SkeletalMeshActor
	native(Anim)
	placeable;


/** This is set so the LD can map specific MaterialIndex on the target to some material **/
struct native SkelMaterialSetterDatum
{
	var() int MaterialIndex;
	var() MaterialInterface TheMaterial;
};

/** The material to use for ExtremeContent (e.g. blood and gore!) **/
var() array<SkelMaterialSetterDatum> ExtremeContent;

/** The material to use for NonExtremeContent (e.g. blackness everywhere there used to be blood and gore) **/
var() array<SkelMaterialSetterDatum> NonExtremeContent;



simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	SetMaterialBasedOnExtremeContent();
}


/** This will set the material of this Actor based on the ExtremeContent setting. **/
simulated function SetMaterialBasedOnExtremeContent()
{
	local int Idx;

	if( WorldInfo.GRI.ShouldShowGore() )
	{
		for( Idx = 0; Idx < ExtremeContent.Length; ++Idx )
		{
			//`log( "SKA ExtremeContent" @ ExtremeContent[Idx].MaterialIndex @ ExtremeContent[Idx].TheMaterial );
			SkeletalMeshComponent.SetMaterial( ExtremeContent[Idx].MaterialIndex, ExtremeContent[Idx].TheMaterial );
		}
	}
	else
	{
		for( Idx = 0; Idx < NonExtremeContent.Length; ++Idx )
		{
			//`log( "SKA NonExtremeContent" @ NonExtremeContent[Idx].MaterialIndex @  NonExtremeContent[Idx].TheMaterial );
			SkeletalMeshComponent.SetMaterial( NonExtremeContent[Idx].MaterialIndex, NonExtremeContent[Idx].TheMaterial );
		}
	}
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'Engine.Default__SkeletalMeshActorBasedOnExtremeContent:SkeletalMeshComponent0.AnimNodeSeq0'
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActorBasedOnExtremeContent:MyLightEnvironment'
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
   CollisionComponent=SkeletalMeshComponent0
   Name="Default__SkeletalMeshActorBasedOnExtremeContent"
   ObjectArchetype=SkeletalMeshActor'Engine.Default__SkeletalMeshActor'
}
