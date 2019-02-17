/**
 *	Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *	Advanced version of SkeletalMeshCinematicActor which uses an AnimTree instead of having a single AnimNodeSequence defined in its defaultproperties
 */

class SkeletalMeshActorMAT extends SkeletalMeshCinematicActor
	native(Anim)
	placeable;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Array of Slots */
var transient Array<AnimNodeSlot>	SlotNodes;

/** Update AnimTree from track weights */
native function MAT_SetAnimWeights(Array<AnimSlotInfo> SlotInfos);

native function MAT_SetMorphWeight(name MorphNodeName, float MorphWeight);

native function MAT_SetSkelControlScale(name SkelControlName, float Scale);

simulated event Destroyed()
{
	// Clear AnimNode references.
	ClearAnimNodes();

	Super.Destroyed();
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	ClearAnimNodes();
	CacheAnimNodes();
}

simulated function CacheAnimNodes()
{
	local AnimNodeSlot SlotNode;

	// Cache all AnimNodeSlots.
	foreach SkeletalMeshComponent.AllAnimNodes(class'AnimNodeSlot', SlotNode)
	{
		SlotNodes[SlotNodes.Length] = SlotNode;
	}
}

simulated function ClearAnimNodes()
{
	SlotNodes.Length = 0;
}

/** Called each from while the Matinee action is running, with the desired sequence name and position we want to be at. */
simulated event SetAnimPosition(name SlotName, int ChannelIndex, name InAnimSeqName, float InPosition, bool bFireNotifies, bool bLooping, bool bEnableRootMotion)
{
	MAT_SetAnimPosition(SlotName, ChannelIndex, InAnimSeqName, InPosition, bFireNotifies, bLooping, bEnableRootMotion);
}
/** Update AnimTree from track info */
native function MAT_SetAnimPosition(name SlotName, int ChannelIndex, name InAnimSeqName, float InPosition, bool bFireNotifies, bool bLooping, bool bEnableRootMotion);

/** Called when we are done with the AnimControl track. */
simulated event FinishAnimControl(InterpGroup InInterpGroup)
{
	MAT_FinishAnimControl(InInterpGroup);
}

/** Called each frame by Matinee to update the weight of a particular MorphNodeWeight. */
simulated event SetMorphWeight(name MorphNodeName, float MorphWeight)
{
	MAT_SetMorphWeight(MorphNodeName, MorphWeight);
}

/** Called each frame by Matinee to update the scaling on a SkelControl. */
simulated event SetSkelControlScale(name SkelControlName, float Scale)
{
	MAT_SetSkelControlScale(SkelControlName, Scale);
}

cpptext
{
	virtual void GetAnimControlSlotDesc(TArray<struct FAnimSlotDesc>& OutSlotDescs);
	virtual void PreviewBeginAnimControl(class UInterpGroup* InInterpGroup);
	virtual void PreviewSetAnimPosition(FName SlotName, INT ChannelIndex, FName InAnimSeqName, FLOAT InPosition, UBOOL bLooping, UBOOL bFireNotifies, UBOOL bEnableRootMotion, FLOAT DeltaTime);
	virtual void PreviewSetAnimWeights(TArray<FAnimSlotInfo>& SlotInfos);
	virtual void PreviewFinishAnimControl(class UInterpGroup* InInterpGroup);
	virtual void PreviewSetMorphWeight(FName MorphNodeName, FLOAT MorphWeight);
	virtual void PreviewSetSkelControlScale(FName SkelControlName, FLOAT Scale);

	/** Called each from while the Matinee action is running, to set the animation weights for the actor. */
	virtual void SetAnimWeights( const TArray<struct FAnimSlotInfo>& SlotInfos );

}


defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshCinematicActor:SkeletalMeshComponent0'
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActorMAT:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      CollideActors=True
      BlockZeroExtent=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshCinematicActor:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshCinematicActor:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      bAllowDynamicShadowsOnTranslucency=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshCinematicActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'Engine.Default__SkeletalMeshCinematicActor:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'Engine.Default__SkeletalMeshCinematicActor:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=MyLightEnvironment
   Components(1)=SkeletalMeshComponent0
   Components(2)=FaceAudioComponent
   CollisionComponent=SkeletalMeshComponent0
   Name="Default__SkeletalMeshActorMAT"
   ObjectArchetype=SkeletalMeshCinematicActor'Engine.Default__SkeletalMeshCinematicActor'
}
