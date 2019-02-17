class TrPaperDollMainMenu extends TrPaperDoll
	placeable;

/** Update mesh position per-frame? (Editor only)*/
var() editoronly bool m_bEditorMode;

/** When the paper doll is a full character, use this value as the CharacterLightingContrastFactor. */
var() float m_fFullCharacterLightingContrastFactor;

/** Cached list of extra skeletal mesh components for the background meshes. */
var array<UDKSkeletalMeshComponent> m_ChildSkeletalMeshComponents;

/** The 'reset' rotation of this actor. */
var rotator m_rZeroedRotation;

/** The last content data type requested. */
var EContentDataType m_OldContentDataType;

/** Was the last menu request to show a main menu content scene? */
var transient bool m_bWasLastMeshSwapRequestMainMenuContentScene;

simulated event PostBeginPlay()
{
	m_rZeroedRotation = Rotation;

	super.PostBeginPlay();
}

event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	// For debugging things like the position of the mesh component.
	if( m_bEditorMode )
	{
		if( SkeletalMeshComponent != none && !SkeletalMeshComponent.HiddenGame )
		{
			SkeletalMeshComponent.SetTranslation(m_CurrentPaperDollInfo.Translation);
			SkeletalMeshComponent.SetRotation(m_CurrentPaperDollInfo.Rotation);
			SkeletalMeshComponent.SetScale(m_CurrentPaperDollInfo.Scale);
		}

		if( m_CharacterMesh != none && !m_CharacterMesh.HiddenGame )
		{
			m_CharacterMesh.SetTranslation(m_CurrentPaperDollInfo.Translation);
			m_CharacterMesh.SetRotation(m_CurrentPaperDollInfo.Rotation);
			m_CharacterMesh.SetScale(m_CurrentPaperDollInfo.Scale);
		}
	}
}

function PaperDollInfo GetDevicePaperDollInfo(class<TrDevice> WeaponClass)
{
	if( WeaponClass != none )
	{
		return WeaponClass.default.m_MainMenuPaperDollInfo;
	}
}

/** Updates the 'main mesh' of the paper doll. Use this for showing one and only one model. */
function SetMainMesh(PaperDollInfo NewInfo)
{
	DetachAndDestroyMeshAttachments(SkeletalMeshComponent);
	EmptyChildrenMeshes();

	super.SetMainMesh(NewInfo);

	// Set post process effects.
	WorldInfo.CharacterLightingContrastFactor = NewInfo.CharacterLightingContrastFactor;
}

function OnCharacterMeshContentDataClassLoaded(class<TrPlayerSkin3PData> Skin3PDataClass)
{
	if( m_bWasLastMeshSwapRequestMainMenuContentScene )
	{
		return;
	}
	super.OnCharacterMeshContentDataClassLoaded(Skin3PDataClass);
}

function OnDeviceContentDataClassLoaded(class<TrDeviceContentData> DeviceContentDataClass)
{
	if( m_bWasLastMeshSwapRequestMainMenuContentScene )
	{
		return;
	}
	super.OnDeviceContentDataClassLoaded(DeviceContentDataClass);
}

function TryUpdatingPaperDoll()
{
	if( m_bWasLastMeshSwapRequestMainMenuContentScene )
	{
		return;
	}
	super.TryUpdatingPaperDoll();
}

function SetWeaponOnlyMesh(class<TrDevice> WeaponClass)
{
	m_bWasLastMeshSwapRequestMainMenuContentScene = false;
	SetSpinning(false, true);
	super.SetWeaponOnlyMesh(WeaponClass);
}

function SetFamilyInfo(class<TrFamilyInfo> NewFamilyInfoClass, class<TrDevice> DeviceClass, class<TrSkin> SkinClass, int TeamNum)
{
	m_bWasLastMeshSwapRequestMainMenuContentScene = false;
	DetachAndDestroyMeshAttachments(SkeletalMeshComponent);
	EmptyChildrenMeshes();
	SetSpinning(false, true);

	super.SetFamilyInfo(NewFamilyInfoClass, DeviceClass, SkinClass, TeamNum);

	if( m_CharacterMesh != none )
	{
		m_CharacterMesh.SetFOV(0.0);

		// Set transforms.
		m_CharacterMesh.SetTranslation(m_CurrentPaperDollInfo.Translation);
		m_CharacterMesh.SetRotation(m_CurrentPaperDollInfo.Rotation);
		m_CharacterMesh.SetScale(m_CurrentPaperDollInfo.Scale);
	}
	if( m_WeaponMesh != none )
	{
		m_WeaponMesh.SetFOV(0.0);
	}

	if( m_SidekickMesh != none )
	{
		m_SidekickMesh.SetFOV(0.0);
	}

	// Set post process effects.
	WorldInfo.CharacterLightingContrastFactor = m_fFullCharacterLightingContrastFactor;
}

function SetMainMeshInfo(TrMainMenuMeshInfo NewMainMeshInfo, EContentDataType ContentDataType)
{
	if( NewMainMeshInfo != none )
	{
		m_bWasLastMeshSwapRequestMainMenuContentScene = true;
		m_LastSkinIdRequest = INDEX_NONE;
		StopLoadingGraphic();
		m_bWasLastMeshSwapRequestNonWeapon = true;
		
		// Update the mesh.
		SetMainMesh(NewMainMeshInfo.MeshInfo);

		// Attach any particle systems.
		CreateAndAttachParticleSystems(SkeletalMeshComponent, NewMainMeshInfo.AttachedParticleSystems);

		AddChildrenMeshes(NewMainMeshInfo);
		ForceUpdateComponents(false, false);

		// Spin the mesh.
		SetSpinning(true, m_OldContentDataType != ContentDataType);
		
		// Cache the type of mesh.
		m_OldContentDataType = ContentDataType;
	}
	else
	{
		// There is no mesh data to update, so detach everything and leave the scene blank.
		DetachAndDestroyMeshAttachments(SkeletalMeshComponent);
		EmptyChildrenMeshes();

		if( m_CharacterMesh != none )
		{
			m_CharacterMesh.SetHidden(true);
		}
		if( m_WeaponMesh != none )
		{
			m_WeaponMesh.SetHidden(true);
		}

		if( m_SidekickMesh != none )
		{
			m_SidekickMesh.SetHidden(true);
		}
		if( SkeletalMeshComponent != none )
		{
			SkeletalMeshComponent.SetHidden(true);
		}
	}
}

function CreateAndAttachParticleSystems(SkeletalMeshComponent MeshComponent, array<ParticleSystemInfo> ParticleSystems)
{
	local int i;
	local UDKParticleSystemComponent PSC;

	for( i=0; i < ParticleSystems.Length; i++ )
	{
		PSC = new(self) class'UDKParticleSystemComponent';
		PSC.SetTemplate(ParticleSystems[i].ParticleSystem);
		PSC.SetFOV(45.0);
		MeshComponent.AttachComponentToSocket(PSC, ParticleSystems[i].SocketName);
	}
}

function DetachAndDestroyMeshAttachments(SkeletalMeshComponent MeshComponent)
{
	local int i;

	for( i = 0; i < MeshComponent.Attachments.Length; i++ )
	{
		MeshComponent.Attachments[i].Component.DetachFromAny();
		i--;
	}
}

function SetSpinning(bool bShouldSpin, bool bReset)
{
	SetPhysics(bShouldSpin ? PHYS_Rotating : PHYS_None);
	
	// Reset rotation.
	if( bReset )
	{
		SetRotation(m_rZeroedRotation);
	}
}

function EmptyChildrenMeshes()
{
	local int i;

	while( m_ChildSkeletalMeshComponents.Length > 0 )
	{
		i = m_ChildSkeletalMeshComponents.Length - 1;
		DetachAndDestroyMeshAttachments(m_ChildSkeletalMeshComponents[i]);
		m_ChildSkeletalMeshComponents[i].SetHidden(true);
		m_ChildSkeletalMeshComponents[i].DetachFromAny();
		m_ChildSkeletalMeshComponents.Remove(i,1);
	}
}

function AddChildrenMeshes(TrMainMenuMeshInfo Parent)
{
	local int i;
	local UDKSkeletalMeshComponent ChildSkeletalMeshComponent;

	for( i = 0; i < Parent.Children.Length; i++ )
	{
		// Create a new skeletal mesh child.
		ChildSkeletalMeshComponent = new(self) class'UDKSkeletalMeshComponent';
		ChildSkeletalMeshComponent.SetSkeletalMesh(Parent.Children[i].MeshInfo.SkelMesh);
		ChildSkeletalMeshComponent.SetPhysicsAsset(Parent.Children[i].MeshInfo.PhysAsset);
		ChildSkeletalMeshComponent.SetAnimTreeTemplate(Parent.Children[i].MeshInfo.AnimTreeTemplate);
		if( Parent.Children[i].MeshInfo.AnimSet != none )
		{
			ChildSkeletalMeshComponent.AnimSets.AddItem(Parent.Children[i].MeshInfo.AnimSet);
		}

		AttachComponent(ChildSkeletalMeshComponent);

		ChildSkeletalMeshComponent.SetTranslation(Parent.Children[i].MeshInfo.Translation);
		ChildSkeletalMeshComponent.SetRotation(Parent.Children[i].MeshInfo.Rotation);
		ChildSkeletalMeshComponent.SetScale(Parent.Children[i].MeshInfo.Scale * Parent.MeshInfo.Scale);

		ChildSkeletalMeshComponent.SetLightEnvironment(SkeletalMeshComponent.LightEnvironment);
		ChildSkeletalMeshComponent.SetShadowParent(SkeletalMeshComponent);

		// Add particle systems
		CreateAndAttachParticleSystems(ChildSkeletalMeshComponent, Parent.Children[i].AttachedParticleSystems);

		ChildSkeletalMeshComponent.ForceUpdate(false);
		ChildSkeletalMeshComponent.UpdateAnimations();


		// Keep track of the child.
		m_ChildSkeletalMeshComponents.AddItem(ChildSkeletalMeshComponent);

		// Add any children.
		AddChildrenMeshes(Parent.Children[i]);
	}
}

defaultproperties
{
   m_bEditorMode=True
   m_fFullCharacterLightingContrastFactor=1.400000
   Begin Object Class=UDKSkeletalMeshComponent Name=CharacterMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:CharacterMesh'
      ForcedLodModel=1
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDollMainMenu:MyLightEnvironment'
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      LightingChannels=(Dynamic=True)
      Rotation=(Pitch=0,Yaw=4551,Roll=0)
      Name="CharacterMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:CharacterMesh'
   End Object
   m_CharacterMesh=CharacterMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=WeaponMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:WeaponMesh'
      FOV=45.000000
      ForcedLodModel=1
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDollMainMenu:MyLightEnvironment'
      LightingChannels=(Dynamic=True)
      Name="WeaponMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:WeaponMesh'
   End Object
   m_WeaponMesh=WeaponMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=SidekickMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:SidekickMesh'
      ForcedLodModel=1
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDollMainMenu:MyLightEnvironment'
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      LightingChannels=(Dynamic=True)
      Name="SidekickMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:SidekickMesh'
   End Object
   m_SidekickMesh=SidekickMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=MainMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:MainMesh'
      FOV=45.000000
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDollMainMenu:MyLightEnvironment'
      HiddenGame=True
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      LightingChannels=(Dynamic=True)
      Name="MainMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:MainMesh'
   End Object
   SkeletalMeshComponent=MainMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDoll:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      bAllowDynamicShadowsOnTranslucency=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDoll:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'TribesGame.Default__TrPaperDoll:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPaperDoll:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=MyLightEnvironment
   Components(1)=FaceAudioComponent
   Components(2)=MyLightEnvironment
   Components(3)=MainMesh
   Components(4)=WeaponMesh
   Components(5)=CharacterMesh
   Components(6)=SidekickMesh
   Components(7)=MyLightEnvironment
   RotationRate=(Pitch=0,Yaw=455,Roll=0)
   Name="Default__TrPaperDollMainMenu"
   ObjectArchetype=TrPaperDoll'TribesGame.Default__TrPaperDoll'
}
