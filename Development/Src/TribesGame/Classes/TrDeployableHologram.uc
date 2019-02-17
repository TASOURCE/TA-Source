class TrDeployableHologram extends SkeletalMeshActorSpawnable
	native;

/** The material instance constant for the mesh, authored by artists. */
var() MaterialInstanceConstant m_HologramMaterial;

/** The runtime-generated MIC. */
var() MaterialInstanceConstant m_RuntimeMIC;

/** Deployable hologram status last tick. */
var transient int m_nOldInvalidDeployReason;

event SetValidDeployableLocation(bool bValidLocation, optional int InvalidDeployReason)
{
	local TrPlayerController PC;

	if( m_RuntimeMIC != none )
	{
		m_RuntimeMIC.SetScalarParameterValue('IsValidLocation', bValidLocation ? 1.0 : 0.0);
	}
	
	ClearAllMessages();

	if( !bValidLocation )
	{
		PC = TrPlayerController(GetALocalPlayerController());
		if( PC != none )
		{
			TrHUD(PC.myHUD).AddToPromptPanelTime(class'TrDeployableMessage'.static.GetString(InvalidDeployReason), -1, GC_APT_HIGH);
		}
	}
}

function ClearAllMessages()
{
	local TrPlayerController PC;

	PC = TrPlayerController(GetALocalPlayerController());
	if( PC != none )
	{
		TrHUD(PC.myHUD).ClearPromptPanelMessage(class'TrDeployableMessage'.static.GetString(0));
		TrHUD(PC.myHUD).ClearPromptPanelMessage(class'TrDeployableMessage'.static.GetString(1));
		TrHUD(PC.myHUD).ClearPromptPanelMessage(class'TrDeployableMessage'.static.GetString(2));
		TrHUD(PC.myHUD).ClearPromptPanelMessage(class'TrDeployableMessage'.static.GetString(3));
	}
}

simulated event Destroyed()
{
	ClearAllMessages();
	super.Destroyed();
}

simulated function PreBeginPlay()
{
	super.PreBeginPlay();

	if( m_HologramMaterial != none )
	{
		SkeletalMeshComponent.SetMaterial(0, m_HologramMaterial);
		m_RuntimeMIC = SkeletalMeshComponent.CreateAndSetMaterialInstanceConstant(0);
	}
}

simulated function Init(class <TrDeployable> DeployableClass)
{
	// Set the hologram mesh to the deployable's mesh.
	SkeletalMeshComponent.SetSkeletalMesh(DeployableClass.default.m_Mesh.SkeletalMesh);
	SkeletalMeshComponent.SetPhysicsAsset(DeployableClass.default.m_Mesh.PhysicsAsset);
	SkeletalMeshComponent.SetScale(DeployableClass.default.m_Mesh.Scale);
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActorSpawnable:SkeletalMeshComponent0'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'Engine.Default__SkeletalMeshActorSpawnable:SkeletalMeshComponent0.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'Engine.Default__SkeletalMeshActorSpawnable:SkeletalMeshComponent0.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployableHologram:SkeletalMeshComponent0.AnimNodeSeq0'
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployableHologram:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      MotionBlurScale=0.000000
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActorSpawnable:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActorSpawnable:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActorSpawnable:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'Engine.Default__SkeletalMeshActorSpawnable:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'Engine.Default__SkeletalMeshActorSpawnable:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=MyLightEnvironment
   Components(1)=SkeletalMeshComponent0
   Components(2)=FaceAudioComponent
   bProjTarget=False
   CollisionComponent=SkeletalMeshComponent0
   Name="Default__TrDeployableHologram"
   ObjectArchetype=SkeletalMeshActorSpawnable'Engine.Default__SkeletalMeshActorSpawnable'
}
