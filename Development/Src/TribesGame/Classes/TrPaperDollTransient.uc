class TrPaperDollTransient extends TrPaperDoll;

/** Used for fading the background in. */
var MaterialInstanceConstant m_BackdropMIC;

/** Time to fade the background in. */
var() float m_fBackdropFadeTime;

/** Remaining time to fade. */
var transient float m_fBackdropFadeRemainingTime;

simulated event PostBeginPlay()
{
	local LightingChannelContainer LightingChannels;
	local MeshComponent ComponentIt;

	super.PostBeginPlay();

	FadeInBackdrop();

	// Make sure meshes are in the correct lighting channel.
	LightingChannels.Gameplay_1 = true;
	LightingChannels.bInitialized = true;
	foreach ComponentList(class'MeshComponent',ComponentIt)
	{
		ComponentIt.SetLightingChannels(LightingChannels);
	}
}

/** Initiates a fade on the background. */
function FadeInBackdrop()
{
	if( m_BackdropMesh != none && m_fBackdropFadeTime > 0.0 )
	{
		if( m_BackdropMIC == none )
		{
			m_BackdropMIC = m_BackdropMesh.CreateAndSetMaterialInstanceConstant(0);
		}
		
		if( m_BackdropMIC != none )
		{
			// Start the background transparent.
			m_BackdropMIC.SetScalarParameterValue('FadeParam', 0.0);
			m_fBackdropFadeRemainingTime = m_fBackdropFadeTime;
		}
	}
}

event Tick(float DeltaTime)
{
	local Vector ViewPos;
	local Rotator ViewRot;

	super.Tick(DeltaTime);

	// Fade in the backdrop.
	if( m_fBackdropFadeRemainingTime > 0.0 && m_BackdropMIC != none && m_fBackdropFadeTime > 0.0 )
	{
		m_fBackdropFadeRemainingTime = FMax(m_fBackdropFadeRemainingTime - DeltaTime, 0.0);
		m_BackdropMIC.SetScalarParameterValue('FadeParam', 1.0 - (m_fBackdropFadeRemainingTime / m_fBackdropFadeTime));
	}

	if( m_TrPlayerController != none )
	{
		// Camera view.
		m_TrPlayerController.GetPlayerViewPoint(ViewPos, ViewRot);
		SetPosition(ViewPos, ViewRot);
	}
}

/** Places the paper doll in the world. */
function SetPosition(Vector ViewPos, Rotator ViewRot)
{
	local Vector ViewOffset, AspectOffset, FIViewOffset;
	local Rotator ModelRotation;
	local float AspectRatio, BackdropScale;
	local Vector2D ViewportSize;

	/** Offset from the class. */
	if( m_FamilyInfoClass != none )
	{
		// Armor-specific offset.
		if( ClassIsChildOf(m_FamilyInfoClass, class'TrFamilyInfo_Light') )
		{
			FIViewOffset = m_vOffsetLight;
		}
		else if( ClassIsChildOf(m_FamilyInfoClass, class'TrFamilyInfo_Medium') )
		{
			FIViewOffset = m_vOffsetMedium;
		}
		else
		{
			FIViewOffset = m_vOffsetHeavy;
		}
	}

	if( m_TrPlayerController != none )
	{
		// Get aspect ratio dependent view offset.
		LocalPlayer(m_TrPlayerController.Player).ViewportClient.GetViewportSize(ViewportSize);
		AspectRatio = ViewportSize.X/ViewportSize.Y;
		if( AspectRatio > 1.7 ) // 16x9 (~1.77777)
		{
			AspectOffset = m_vViewOffset16x9;
			BackdropScale = m_fBackdropScale16x9;
		}
		else if( AspectRatio >= 1.5 ) //16x10 (~1.6)
		{
			AspectOffset = m_vViewOffset16x10;
			BackdropScale = m_fBackdropScale16x10;
		}
		else
		{
			AspectOffset = m_vViewOffset4x3;
			BackdropScale = m_fBackdropScale4x3;
		}
		
		// Position the character.
		ViewOffset = (AspectOffset + FIViewOffset) >> ViewRot;
		SetLocation(ViewPos + ViewOffset);
		
		// Rotate the character.
		ModelRotation = ViewRot;
		ModelRotation.Yaw -= 32768; // Face the camera.
		ModelRotation.Pitch *= -1; // Go opposite to the camera pitch.
		ModelRotation.Roll *= -1;
		SetRotation(ModelRotation);

		// Backdrop is in world space because we don't want it to scale when the mesh scales.
		m_BackdropMesh.SetTranslation(ViewPos + ((AspectOffset + m_vBackdropOffset) >> ViewRot));
		m_BackdropMesh.SetRotation(ModelRotation);
		m_BackdropMesh.SetScale(BackdropScale);

		ForceUpdateComponents();
	}
}

defaultproperties
{
   m_fBackdropFadeTime=0.180000
   Begin Object Class=PointLightComponent Name=Light1
      Radius=1000.000000
      FalloffExponent=0.000100
      Translation=(X=250.000000,Y=-300.000000,Z=500.000000)
      Brightness=6.000000
      CastShadows=False
      LightingChannels=(BSP=False,Static=False,Dynamic=False,CompositeDynamic=False,Gameplay_1=True)
      Name="Light1"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   m_Lights(0)=Light1
   m_vViewOffset4x3=(X=350.000000,Y=-20.000000,Z=-54.500000)
   m_vViewOffset16x9=(X=450.000000,Y=-14.000000,Z=-51.000000)
   m_vViewOffset16x10=(X=425.000000,Y=-15.000000,Z=-52.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=CharacterMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:CharacterMesh'
      ForcedLodModel=1
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDollTransient:MyLightEnvironment'
      DepthPriorityGroup=SDPG_Foreground
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      Name="CharacterMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:CharacterMesh'
   End Object
   m_CharacterMesh=CharacterMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=WeaponMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:WeaponMesh'
      FOV=45.000000
      ForcedLodModel=1
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDollTransient:MyLightEnvironment'
      DepthPriorityGroup=SDPG_Foreground
      LightingChannels=(Gameplay_1=True)
      Name="WeaponMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:WeaponMesh'
   End Object
   m_WeaponMesh=WeaponMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=SidekickMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:SidekickMesh'
      ForcedLodModel=1
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDollTransient:MyLightEnvironment'
      DepthPriorityGroup=SDPG_Foreground
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      Name="SidekickMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:SidekickMesh'
   End Object
   m_SidekickMesh=SidekickMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=BackdropMesh
      FOV=40.000000
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      AbsoluteTranslation=True
      AbsoluteRotation=True
      Scale=1.400000
      Name="BackdropMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_BackdropMesh=BackdropMesh
   m_fBackdropScale4x3=5.000000
   m_fBackdropScale16x9=5.000000
   m_fBackdropScale16x10=5.000000
   m_vBackdropOffset=(X=300.000000,Y=20.000000,Z=50.000000)
   m_vOffsetLight=(X=-110.000000,Y=35.000000,Z=0.000000)
   m_vOffsetMedium=(X=-110.000000,Y=35.000000,Z=0.000000)
   m_vOffsetHeavy=(X=-100.000000,Y=35.000000,Z=-5.000000)
   Begin Object Class=UDKSkeletalMeshComponent Name=MainMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:MainMesh'
      FOV=45.000000
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDollTransient:MyLightEnvironment'
      DepthPriorityGroup=SDPG_Foreground
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      Name="MainMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPaperDoll:MainMesh'
   End Object
   SkeletalMeshComponent=MainMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPaperDoll:MyLightEnvironment'
      bCastShadows=False
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
   Components(7)=Light1
   Components(8)=BackdropMesh
   TickGroup=TG_PostUpdateWork
   Name="Default__TrPaperDollTransient"
   ObjectArchetype=TrPaperDoll'TribesGame.Default__TrPaperDoll'
}
