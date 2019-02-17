class TrPaperDoll extends SkeletalMeshActorMAT
	notplaceable
	abstract
	native;

/** Lights affecting just this paper doll. */
var() editinline array<LightComponent> m_Lights;

/** Camera-space view offset. */
var() vector m_vViewOffset4x3;
var() vector m_vViewOffset16x9;
var() vector m_vViewOffset16x10;

/** Current player class this paper doll represents. */
var() editinline class<TrFamilyInfo> m_FamilyInfoClass;

/** Current device class this paper doll is holding. */
var() editinline class<TrDevice> m_TrDeviceClass;

/** Character mesh. */
var() UDKSkeletalMeshComponent m_CharacterMesh;

/** Weapon mesh. */
var() UDKSkeletalMeshComponent m_WeaponMesh;

/** Sidekick mesh. */
var() UDKSkeletalMeshComponent m_SidekickMesh;

/** Backdrop mesh. */
var() UDKSkeletalMeshComponent m_BackdropMesh;
var MaterialInstanceConstant m_BloodEagleBackdropMaterial;
var MaterialInstanceConstant m_DiamondSwordBackdropMaterial;

/** Backdrop mesh scale offset. */
var() float m_fBackdropScale4x3;
var() float m_fBackdropScale16x9;
var() float m_fBackdropScale16x10;

var() Vector m_vBackdropOffset;

var() Vector m_vOffsetLight;
var() Vector m_vOffsetMedium;
var() Vector m_vOffsetHeavy;

/** Animation nodes. */
var AnimNodePlayCustomAnim m_CharacterCustomAnimNode;
var AnimNodePlayCustomAnim m_SidekickCustomAnimNode;

/** Range of time interval between playing custom animation. */
var float m_fMinCustomAnimTime;
var float m_fMaxCustomAnimTime;

/** The current info for our paper doll mesh. */
var() editinline PaperDollInfo m_CurrentPaperDollInfo;

/** PlayerController that is controlling this paper doll. */
var TrPlayerController m_TrPlayerController;

/** Was the last mesh swap request for a non-weapon mesh? */
var transient bool m_bWasLastMeshSwapRequestNonWeapon;

/** What device class was last requested to show? */
var transient class<TrDevice> m_LastDeviceClassRequest;

/** What device only class was last requested to show? */
var transient class<TrDevice> m_LastDeviceOnlyRequest;

/** What device class was last requested to show? */
var transient class<TrFamilyInfo> m_LastFamilyClassRequest;

/** The last skin we were interested in showing. */
var transient int m_LastSkinIdRequest;

/** Pending device class waiting to be shown (streaming). */
var transient PaperDollInfo m_PendingPaperDollInfoDevice;

/** Pending character skin mesh waiting to be shown (streaming). */
var transient PaperDollInfo m_PendingPaperDollInfoSkin;

/** How often to check for the pending paper doll info to be fully streamed. */
var float m_fCheckStreamingFrequency;

/** Timestamp for last pending paper doll stream check. */
var transient float m_fLastStreamingCheckTimestamp;

/** Current device data class. */
var transient class<TrDeviceContentData> m_DeviceContentDataClass;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function bool IsFullyStreamed(PaperDollInfo PaperDoll);

simulated event PostBeginPlay()
{
	local TrPlayerController TrPC;

	super.PostBeginPlay();

	TrPC = TrPlayerController(Owner);
	if( TrPC != none )
	{
		m_TrPlayerController = TrPC;
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	local TrSkelControl_SpinControl SpinSkelControl;

    if( SkelComp == m_CharacterMesh )
    {
        m_CharacterCustomAnimNode = AnimNodePlayCustomAnim(SkelComp.FindAnimNode('CustomAnim'));
		if( m_CharacterCustomAnimNode != none )
		{
			m_CharacterCustomAnimNode.SetActorAnimEndNotification(true);
		}
    }
	else if( SkelComp == m_SidekickMesh )
	{
		m_SidekickCustomAnimNode = AnimNodePlayCustomAnim(SkelComp.FindAnimNode('CustomAnim'));
		if( m_SidekickCustomAnimNode != none )
		{
			m_SidekickCustomAnimNode.SetActorAnimEndNotification(true);
		}
	}
	else if( SkelComp != SkeletalMeshComponent )
	{
		SpinSkelControl = TrSkelControl_SpinControl(SkelComp.FindSkelControl('Spinner'));

		if( SpinSkelControl != none )
		{
			// Reset the rotation transform.
			SpinSkelControl.BoneRotation.Pitch = 0;
			SpinSkelControl.BoneRotation.Yaw = 0;
			SpinSkelControl.BoneRotation.Roll = 0;
		}
	}
}

// Gets the skin of the mesh for a family info.
function SkeletalMesh GetCharacterSkeletalMesh(class<TrFamilyInfo> FamilyInfoClass, byte TeamNum)
{
	local string ClassString;
	local class<TrFamilyInfo> TeamFamilyInfoClass;

	if( m_TrPlayerController != none )
	{
		ClassString = string(FamilyInfoClass.Name);
		switch(TeamNum )
		{
			case 1:
				ClassString = ClassString$'_DS';
				break;

		}

		TeamFamilyInfoClass = class<TrFamilyInfo>(DynamicLoadObject("TribesGame."$ClassString, class'Class'));
		if( TeamFamilyInfoClass != none )
		{
			return TeamFamilyInfoClass.default.CharacterMesh;
		}
	}

	// No player pawn/controller is spawned, so just use the default for the family info.
	return FamilyInfoClass.default.CharacterMesh;
}

/** Called from a callback after finishing a preload for a character mesh. */
function OnCharacterMeshContentDataClassLoaded(class<TrPlayerSkin3PData> Skin3PDataClass)
{
	local PaperDollInfo NewPaperDollInfo;
	local int i;

	if( Skin3PDataClass == none )
	{
		;
		return;
	}

	if( m_LastSkinIdRequest == INDEX_NONE )
	{
		TryUpdatingPaperDoll();
		return;
	}

	if( m_LastSkinIdRequest != Skin3PDataClass.default.m_nSkinId )
	{
		// This isn't the current skin.
		return;
	}

	m_PendingPaperDollInfoSkin.bIsLoading = false;

	NewPaperDollInfo.SkelMesh = Skin3PDataClass.default.m_SkeletalMesh3p;
	m_CharacterMesh.SetSkeletalMesh(NewPaperDollInfo.SkelMesh);
	if( IsFullyStreamed(NewPaperDollInfo) )
	{
		OnSkeletalMeshFinishedStreaming(Skin3PDataClass.default.m_SkeletalMesh3p);
	}
	else
	{
		// The textures for this paper doll are not yet fully streamed, so start streaming.
		// The tick will then periodically check on the status of the streaming and when it's 
		// done, the fully streamed mesh will then finally show up. We have to check like this
		// because there is no callback mechanism for a material's texture streaming.
		m_PendingPaperDollInfoSkin = NewPaperDollInfo;
		m_PendingPaperDollInfoSkin.bIsStreaming = true;
		if( m_PendingPaperDollInfoSkin.SkelMesh != none )
		{
			for( i = 0; i < m_PendingPaperDollInfoSkin.SkelMesh.Materials.Length; i++ )
			{
				m_PendingPaperDollInfoSkin.SkelMesh.Materials[i].SetForceMipLevelsToBeResident(true, true, -1);
			}
		}
		
		PlayLoadingGraphic();
	}
}

event OnSkeletalMeshFinishedStreaming(SkeletalMesh NewSkelMesh)
{
	if( m_CharacterMesh.SkeletalMesh == NewSkelMesh )
	{
		TryUpdatingPaperDoll();
	}
}

/** Attempts to update the character paper doll. It may fail if the skin or weapon is not yet loaded. */
function TryUpdatingPaperDoll()
{
	local DynamicLightEnvironmentComponent DynamicLE;
	
	if( !m_PendingPaperDollInfoSkin.bIsStreaming && 
		!m_PendingPaperDollInfoSkin.bIsLoading &&
		!m_PendingPaperDollInfoDevice.bIsStreaming &&
		!m_PendingPaperDollInfoDevice.bIsLoading )
	{
		StopLoadingGraphic();

		// Character mesh.
		m_CharacterMesh.SetHidden(false);
		m_CharacterMesh.SetPhysicsAsset(PhysicsAsset'WEP_GenericPaperDoll.Physics.PHYS_CharacterPaperDoll');
		m_CharacterMesh.AnimSets.Remove(0, m_CharacterMesh.AnimSets.Length);
		m_CharacterMesh.SetFOV(m_FamilyInfoClass.default.m_fPaperDollFOV);
		m_CharacterMesh.SetLightEnvironment(LightEnvironment);

		// Weapon mesh.
		if( m_DeviceContentDataClass != none )
		{
			// Character anims.
			m_CharacterMesh.AnimSets.AddItem(m_DeviceContentDataClass.default.m_PaperDollAnimSet);
			m_CharacterMesh.UpdateAnimations();

			// Weapon mesh.
			m_WeaponMesh.SetHidden(m_CharacterMesh.HiddenGame);
			m_WeaponMesh.SetSkeletalMesh(m_DeviceContentDataClass.default.m_SkeletalMesh1p);
			m_WeaponMesh.SetPhysicsAsset(m_DeviceContentDataClass.default.m_PhysicsAsset1p);
			m_WeaponMesh.SetShadowParent(m_CharacterMesh);
			m_CharacterMesh.AttachComponentToSocket(m_WeaponMesh, class'TrPawn'.default.WeaponSocket);
			m_WeaponMesh.SetLightEnvironment(LightEnvironment);
		}

		// Sidekick mesh.
		if( m_FamilyInfoClass != none && m_FamilyInfoClass.default.m_PaperDollSidekickMesh != none )
		{
			m_SidekickMesh.SetHidden(m_CharacterMesh.HiddenGame);
			m_SidekickMesh.SetSkeletalMesh(m_FamilyInfoClass.default.m_PaperDollSidekickMesh);
			m_SidekickMesh.SetPhysicsAsset(m_FamilyInfoClass.default.m_PaperDollSidekickPhysics);
			m_SidekickMesh.SetAnimTreeTemplate(m_FamilyInfoClass.default.m_PaperDollSidekickAnimTree);
			m_SidekickMesh.AnimSets.Remove(0, m_SidekickMesh.AnimSets.Length);
			m_SidekickMesh.AnimSets.AddItem(m_FamilyInfoClass.default.m_PaperDollSidekickAnimset);
			m_SidekickMesh.UpdateAnimations();
			m_SidekickMesh.SetFOV(m_FamilyInfoClass.default.m_fPaperDollFOV);
			m_SidekickMesh.SetLightEnvironment(LightEnvironment);
		}
		else if( m_SidekickMesh.SkeletalMesh != none )
		{
			// No sidekick mesh anymore, clear it out.
			m_SidekickMesh.SetSkeletalMesh(none);
			m_SidekickCustomAnimNode = none;
		}

		ForceUpdateComponents(false, false);

		DynamicLE = DynamicLightEnvironmentComponent(LightEnvironment);
		if( DynamicLE != none )
		{
			DynamicLE.ResetEnvironment();
		}
	}
}

/** 
 *  Sets the class this paper doll represents and updates the visual elements corresponding
 *  to the class.
 */
function SetFamilyInfo(class<TrFamilyInfo> NewFamilyInfoClass, class<TrDevice> DeviceClass, class<TrSkin> SkinClass, int TeamNum)
{
    local int skinId;
    
    m_LastDeviceOnlyRequest = none;

    if (SkinClass == none && m_FamilyInfoClass != none)
    {
        SkinClass = m_FamilyInfoClass.default.DefaultSkinClass;
    }

    if (SkinClass != none)
	{
        if (SkinClass.default.Skins.Length > 1 && TeamNum == 1)
        {
            skinId = skinClass.default.Skins[1].SkinId;
        }
        else
        {
            skinId = skinClass.default.Skins[0].SkinId;
        }
	}

    if (NewFamilyInfoClass == m_LastFamilyClassRequest && DeviceClass == m_LastDeviceClassRequest && m_LastSkinIdRequest == skinId)
    {
        return;
    }

	m_bWasLastMeshSwapRequestNonWeapon = true;

	// Hide the main mesh.
	if( SkeletalMeshComponent != none )
	{
		SkeletalMeshComponent.SetLightEnvironment(none);
		SkeletalMeshComponent.SetHidden(true);
	}

	// Cache the info.
	m_CurrentPaperDollInfo = NewFamilyInfoClass.default.m_MainMenuPaperDollInfo;

	m_LastDeviceClassRequest = DeviceClass;
    m_LastFamilyClassRequest = NewFamilyInfoClass;

	if( DeviceClass != none && DeviceClass.default.m_sContentDataClassName != "" )
	{
		// TODO: This causes a hitch! Async load instead.
		m_DeviceContentDataClass = class<TrDeviceContentData>(FindObject(DeviceClass.default.m_sContentDataClassName,class'Class'));
		if( m_DeviceContentDataClass == none )
		{
			// We are not ready to update our character yet.
			m_PendingPaperDollInfoDevice.bIsLoading = true;
			m_TrPlayerController.c_ContentLoader.StartLoadingDeviceContentPackage(DeviceClass);
			PlayLoadingGraphic();
		}
		else
		{
			// We already have our device loaded.
			m_PendingPaperDollInfoDevice.bIsLoading = false;
		}
	}

	if( !(m_FamilyInfoClass == NewFamilyInfoClass && m_TrDeviceClass == DeviceClass) )
	{
		// Interrupt any previously playing custom animation if we are changing class or weapons.
		StopCustomAnimation(0.0);
	}

	if( NewFamilyInfoClass != none && DeviceClass != none )
	{
		m_FamilyInfoClass = NewFamilyInfoClass;
		m_TrDeviceClass = DeviceClass;

		m_CharacterMesh.SetHidden(true);
		m_WeaponMesh.SetHidden(true);
		m_SidekickMesh.SetHidden(true);

		// Character mesh
		m_CharacterMesh.SetSkeletalMesh(GetCharacterSkeletalMesh(NewFamilyInfoClass, TeamNum));

        if (skinId > 0 && m_FamilyInfoClass != none)
        {
			// Begin loading the mesh.
			m_LastSkinIdRequest = skinId;
			m_PendingPaperDollInfoSkin.bIsLoading = true;
			m_TrPlayerController.c_ContentLoader.StartLoadingPlayerSkin(m_FamilyInfoClass.default.ClassId, skinId, false);
			PlayLoadingGraphic();
        }
        else
        {
			m_LastSkinIdRequest = INDEX_NONE;
			m_PendingPaperDollInfoSkin.bIsLoading = false;
			m_PendingPaperDollInfoSkin.bIsStreaming = false;
		}
	
		TryUpdatingPaperDoll();
	}
}

function PlayCustomAnimation()
{
	// In case we called this not via the timer, clear it so we don't play it twice!
	ClearTimer('PlayCustomAnimation');

	if( m_CharacterCustomAnimNode != none )
	{
		m_CharacterCustomAnimNode.PlayCustomAnim('Idle02',1.0,0.2,0.5,false,true);
	}
	if( m_SidekickCustomAnimNode != none )
	{
		m_SidekickCustomAnimNode.PlayCustomAnim('Idle02',1.0,0.2,0.5,false,true);
	}
}

function StopCustomAnimation(float FadeOutTime)
{
	if( m_CharacterCustomAnimNode != none )
	{
		m_CharacterCustomAnimNode.StopCustomAnim(FadeOutTime);
	}
	if( m_SidekickCustomAnimNode != none )
	{
		m_SidekickCustomAnimNode.StopCustomAnim(FadeOutTime);
	}

	ResetCustomAnimTimer();
}

/** Reset the timer for playing a custom animation. */
function ResetCustomAnimTimer()
{
	ClearTimer('PlayCustomAnimation');
	SetTimer(RandRange(m_fMinCustomAnimTime, m_fMaxCustomAnimTime), false, 'PlayCustomAnimation');
}

event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	if( SeqNode.NodeName == 'CustomAnimNodeSeq' )
	{
		// Set a timer for when to play the next custom animation.
		ResetCustomAnimTimer();
	}
}

/** Called from a callback after finishing a preload for a weapon. */
function OnDeviceContentDataClassLoaded(class<TrDeviceContentData> DeviceContentDataClass)
{
	local PaperDollInfo NewPaperDollInfo;
	local class<TrDevice> WeaponClass;
	local int i;

	if( DeviceContentDataClass == none )
	{
		;
		return;
	}

	/*if( m_LastDeviceOnlyRequest != DeviceContentDataClass.default.m_TrDeviceClass )
	{
		// We are no longer interested in this device class since we have requested a new one.
		return;
	}*/

	m_PendingPaperDollInfoDevice.bIsLoading = false;
	m_DeviceContentDataClass = DeviceContentDataClass;

	WeaponClass = m_DeviceContentDataClass.default.m_TrDeviceClass;
	if( WeaponClass != none )
	{
		NewPaperDollInfo = GetDevicePaperDollInfo(WeaponClass);
		NewPaperDollInfo.SkelMesh = m_DeviceContentDataClass.default.m_SkeletalMesh1p;
		NewPaperDollInfo.AnimTreeTemplate = AnimTree'AT_PlayerTree.AnimTree_PaperDollSocket';
		if( IsFullyStreamed(NewPaperDollInfo) )
		{
			// The textures for this paper doll are fully streamed so update the mesh.
			OnWeaponFinishedStreaming(NewPaperDollInfo);
		}
		else
		{
			// The textures for this paper doll are not yet fully streamed, so start streaming.
			// The tick will then periodically check on the status of the streaming and when it's 
			// done, the fully streamed mesh will then finally show up. We have to check like this
			// because there is no callback mechanism for a material's texture streaming.
			m_PendingPaperDollInfoDevice = NewPaperDollInfo;
			m_PendingPaperDollInfoDevice.bIsStreaming = true;
			if( m_PendingPaperDollInfoDevice.SkelMesh != none )
			{
				for( i = 0; i < m_PendingPaperDollInfoDevice.SkelMesh.Materials.Length; i++ )
				{
					m_PendingPaperDollInfoDevice.SkelMesh.Materials[i].SetForceMipLevelsToBeResident(true, true, -1);
				}
			}
			
			PlayLoadingGraphic();
		}
	}
}

function PlayLoadingGraphic()
{
	if( m_TrPlayerController != none )
	{
		m_TrPlayerController.ToggleWorkingGraphic(true);
	}
}
function StopLoadingGraphic()
{
	if( m_TrPlayerController != none )
	{
		m_TrPlayerController.ToggleWorkingGraphic(false);
	}
}

/** Actually updates the weapon mesh once streaming is all done. */
event OnWeaponFinishedStreaming(PaperDollInfo NewPaperDollInfo)
{	
	if( m_bWasLastMeshSwapRequestNonWeapon )
	{
		TryUpdatingPaperDoll();
		return;
	}

	SetMainMesh(NewPaperDollInfo);
	m_FamilyInfoClass = none;
}

/** 
 *  Display the weapon's mesh as the paper doll.
 */
function SetWeaponOnlyMesh(class<TrDevice> WeaponClass)
{
    m_LastFamilyClassRequest = none;
	m_bWasLastMeshSwapRequestNonWeapon = false;

	// Make sure the character is hidden.
	m_CharacterMesh.SetHidden(true);
	m_WeaponMesh.SetHidden(true);
	m_SidekickMesh.SetHidden(true);

    if (m_LastDeviceOnlyRequest == WeaponClass)
    {
        return;
    }

	m_LastDeviceOnlyRequest = WeaponClass;
	
	// Load in the new device.
	m_TrPlayerController.c_ContentLoader.StartLoadingDeviceContentPackage(WeaponClass);
	
	// Hide the old device.
	SkeletalMeshComponent.SetHidden(true);
}

function PaperDollInfo GetDevicePaperDollInfo(class<TrDevice> WeaponClass)
{
	if( WeaponClass != none )
	{
		return WeaponClass.default.m_InGamePaperDollInfo;
	}
}

/** Updates the 'main mesh' of the paper doll. Use this for showing one and only one model. */
function SetMainMesh(PaperDollInfo NewInfo)
{
	local DynamicLightEnvironmentComponent DynamicLE;
	local class<TrDeviceContentData_Perk> PerkContentData;
	local int i;

	// If any loading graphic was playing, make sure it is turned off.
	StopLoadingGraphic();

	// Hide the paper doll.
	if( m_CharacterMesh != none )
	{
		m_CharacterMesh.SetHidden(true);
		m_CharacterMesh.SetLightEnvironment(none);
	}
	if( m_WeaponMesh != none )
	{
		m_WeaponMesh.SetHidden(true);
		m_WeaponMesh.SetLightEnvironment(none);
	}

	if( m_SidekickMesh != none )
	{
		m_SidekickMesh.SetHidden(true);
		m_SidekickMesh.SetLightEnvironment(none);
	}

	if( SkeletalMeshComponent != none )
	{
		// Show the main mesh.
		SkeletalMeshComponent.SetHidden(false);

		// Update the mesh.
		SkeletalMeshComponent.SetSkeletalMesh(NewInfo.SkelMesh);
		SkeletalMeshComponent.SetPhysicsAsset(NewInfo.PhysAsset);
		SkeletalMeshComponent.SetAnimTreeTemplate(NewInfo.AnimTreeTemplate);

		// Reset the materials (perks, for example, have set specific materials for id 1.
		for( i = 0; i < NewInfo.SkelMesh.Materials.Length; i++ )
		{
			SkeletalMeshComponent.SetMaterial(i, NewInfo.SkelMesh.Materials[i]);
		}

		if( SkeletalMeshComponent.AnimSets.Length > 0 )
		{
			SkeletalMeshComponent.AnimSets.Remove(0,SkeletalMeshComponent.AnimSets.Length);
		}
		
		if( NewInfo.AnimSet != none )
		{
			SkeletalMeshComponent.AnimSets.AddItem(NewInfo.AnimSet);
		}

		SkeletalMeshComponent.bSelfShadowOnly = NewInfo.bOnlySelfShadow;

		SkeletalMeshComponent.SetLightEnvironment(LightEnvironment);
		DynamicLE = DynamicLightEnvironmentComponent(LightEnvironment);
		if( DynamicLE != none )
		{
			DynamicLE.ResetEnvironment();
		}

		// Update the material if this weapon is a perk.
		PerkContentData = class<TrDeviceContentData_Perk>(m_DeviceContentDataClass);
		if( PerkContentData != none )
		{
			SkeletalMeshComponent.SetMaterial(1, PerkContentData.default.m_PerkMaterial);
		}

		// Make sure big changes, such as lighting, are updated.
		SkeletalMeshComponent.ForceUpdate(false);
		SkeletalMeshComponent.UpdateAnimations();

		// Set transforms.
		SkeletalMeshComponent.SetTranslation(NewInfo.Translation);
		SkeletalMeshComponent.SetRotation(NewInfo.Rotation);
		SkeletalMeshComponent.SetScale(NewInfo.Scale);

		// Cache the info.
		m_CurrentPaperDollInfo = NewInfo;
	}
}

simulated event Destroyed()
{
	StopLoadingGraphic();
	super.Destroyed();
}

defaultproperties
{
   Begin Object Class=UDKSkeletalMeshComponent Name=CharacterMesh
      ForcedLodModel=1
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDoll:MyLightEnvironment'
      DepthPriorityGroup=SDPG_Foreground
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      Name="CharacterMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_CharacterMesh=CharacterMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=WeaponMesh
      FOV=45.000000
      ForcedLodModel=1
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDoll:MyLightEnvironment'
      DepthPriorityGroup=SDPG_Foreground
      LightingChannels=(Gameplay_1=True)
      Name="WeaponMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_WeaponMesh=WeaponMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=SidekickMesh
      ForcedLodModel=1
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDoll:MyLightEnvironment'
      DepthPriorityGroup=SDPG_Foreground
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      Name="SidekickMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_SidekickMesh=SidekickMesh
   m_fMinCustomAnimTime=5.000000
   m_fMaxCustomAnimTime=10.000000
   m_CurrentPaperDollInfo=(Rotation=(Pitch=0,Yaw=-16384,Roll=0),Scale=1.000000,CharacterLightingContrastFactor=1.500000)
   m_fCheckStreamingFrequency=0.100000
   Begin Object Class=UDKSkeletalMeshComponent Name=MainMesh
      FOV=45.000000
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDoll:MyLightEnvironment'
      DepthPriorityGroup=SDPG_Foreground
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      Name="MainMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   SkeletalMeshComponent=MainMesh
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
   Components(1)=FaceAudioComponent
   Components(2)=MyLightEnvironment
   Components(3)=MainMesh
   Components(4)=WeaponMesh
   Components(5)=CharacterMesh
   Components(6)=SidekickMesh
   bNoDelete=False
   CollisionComponent=None
   Name="Default__TrPaperDoll"
   ObjectArchetype=SkeletalMeshActorMAT'Engine.Default__SkeletalMeshActorMAT'
}
