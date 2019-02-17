class TrVehiclePad extends SkeletalMeshActor
	ClassGroup(Objective)
    placeable;

var TrAnimNodeBlendList m_VehiclePadBlendNode;

var TrSkelControl_SpinControl m_SpinControl;

simulated event PostBeginPlay()
{
    Super.PostBeginPlay();

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // Set the animation tree
        SkeletalMeshComponent.SetAnimTreeTemplate(AnimTree'STN_Vehicle.AT_Station_Spawner');
    }
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == SkeletalMeshComponent && SkeletalMeshComponent.Animations != none )
    {
		m_VehiclePadBlendNode = TrAnimNodeBlendList(SkeletalMeshComponent.Animations.FindAnimNode('VehiclePadBlendNode'));
		m_SpinControl = TrSkelControl_SpinControl(SkeletalMeshComponent.FindSkelControl('SpinControl'));
    }
}

simulated function PlayIdleAnim()
{
	if( m_VehiclePadBlendNode != none )
	{
		m_VehiclePadBlendNode.SetActiveChild(0, 0.0);
	}
	if( m_SpinControl != none )
	{
		m_SpinControl.Spin(false);
	}
}

simulated function PlayDeployAnim()
{
	if( m_VehiclePadBlendNode != none )
	{
		m_VehiclePadBlendNode.SetActiveChild(1, 0.0);
	}
	if( m_SpinControl != none )
	{
		m_SpinControl.Spin(true);
	}
}

simulated function PlayCollapseAnim()
{
	if( m_VehiclePadBlendNode != none )
	{
		m_VehiclePadBlendNode.SetActiveChild(2, 0.0);
	}
	if( m_SpinControl != none )
	{
		m_SpinControl.Spin(false);
	}
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
      AnimSets(0)=None
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehiclePad:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      CollideActors=True
      BlockZeroExtent=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
      bDynamic=False
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
   Name="Default__TrVehiclePad"
   ObjectArchetype=SkeletalMeshActor'Engine.Default__SkeletalMeshActor'
}
