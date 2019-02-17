class TrBotPawn extends TrPlayerPawn;

function SetMovementPhysics()
{
	if( Physics == PHYS_Flying )
	{
		// Stay flying unless specifically brought out of it.
		return;
	}

	if( Physics == PHYS_Skiing )
	{
		// Stay skiing unless specifically brought out of it.
		return;
	}
	
	super.SetMovementPhysics();
}

simulated function Tick( float DeltaTime )
{
	local rotator ClampedRotation;
    
	Super.Tick(DeltaTime);

	ClampedRotation.Yaw = Rotation.Yaw;
	SetRotation(ClampedRotation);
}

// Bots don't recharge health pool.
event RechargeHealthPool(float DeltaSeconds);

State Dying
{
	simulated event BeginState(Name PreviousStateName)
	{
		if( Controller != none )
		{
			// Destroy the controller too.
			Controller.Destroy();
		}

		Super.BeginState(PreviousStateName);
	}
}

defaultproperties
{
   Begin Object Class=AudioComponent Name=JetpackAttackSound Archetype=AudioComponent'TribesGame.Default__TrPlayerPawn:JetpackAttackSound'
      Name="JetpackAttackSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerPawn:JetpackAttackSound'
   End Object
   m_AudioComonentJetpackAttack=JetpackAttackSound
   Begin Object Class=AudioComponent Name=SkiLoopSound Archetype=AudioComponent'TribesGame.Default__TrPlayerPawn:SkiLoopSound'
      bShouldRemainActiveIfDropped=True
      Name="SkiLoopSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerPawn:SkiLoopSound'
   End Object
   m_AudioComponentSkiLoop=SkiLoopSound
   Begin Object Class=AudioComponent Name=JetpackLoopSound Archetype=AudioComponent'TribesGame.Default__TrPlayerPawn:JetpackLoopSound'
      bShouldRemainActiveIfDropped=True
      Name="JetpackLoopSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerPawn:JetpackLoopSound'
   End Object
   m_AudioComponentJetpackLoop=JetpackLoopSound
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonBodyMesh'
      FOV=90.000000
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrBotPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Translation=(X=0.000000,Y=0.000000,Z=-52.000000)
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonBodyMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonBodyMesh'
   End Object
   m_FirstPersonBodyMesh=FirstPersonBodyMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyOverlayMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonBodyOverlayMesh'
      bUpdateSkelWhenNotRendered=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      TickGroup=TG_PostAsyncWork
      Name="FirstPersonBodyOverlayMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonBodyOverlayMesh'
   End Object
   m_FirstPersonBodyOverlayMesh=FirstPersonBodyOverlayMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonBodyShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrBotPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonBodyShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonBodyShadowMesh'
   End Object
   m_FirstPersonBodyShadowMesh=FirstPersonBodyShadowMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonWeaponShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonWeaponShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrBotPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      BoundsScale=5.000000
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonWeaponShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonWeaponShadowMesh'
   End Object
   m_FirstPersonWeaponShadowMesh=FirstPersonWeaponShadowMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonFlagShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonFlagShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrBotPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonFlagShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonFlagShadowMesh'
   End Object
   m_FirstPersonFlagShadowMesh=FirstPersonFlagShadowMesh
   Begin Object Class=UTParticleSystemComponent Name=SkiDust Archetype=UTParticleSystemComponent'TribesGame.Default__TrPlayerPawn:SkiDust'
      bAutoActivate=False
      ReplacementPrimitive=None
      AbsoluteTranslation=True
      AbsoluteRotation=True
      Name="SkiDust"
      ObjectArchetype=UTParticleSystemComponent'TribesGame.Default__TrPlayerPawn:SkiDust'
   End Object
   m_GroundSkiPSC=SkiDust
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPlayerPawn:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPlayerPawn:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   FallingDamageWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrBotPawn:ForceFeedbackWaveformFall'
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent Archetype=UTAmbientSoundComponent'TribesGame.Default__TrPlayerPawn:AmbientSoundComponent'
      Name="AmbientSoundComponent"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrPlayerPawn:AmbientSoundComponent'
   End Object
   PawnAmbientSound=AmbientSoundComponent
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent2 Archetype=UTAmbientSoundComponent'TribesGame.Default__TrPlayerPawn:AmbientSoundComponent2'
      Name="AmbientSoundComponent2"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrPlayerPawn:AmbientSoundComponent2'
   End Object
   WeaponAmbientSound=AmbientSoundComponent2
   Begin Object Class=SkeletalMeshComponent Name=OverlayMeshComponent0 Archetype=SkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:OverlayMeshComponent0'
      bShouldIgnoreParentAnimComponent=True
      bUpdateSkelWhenNotRendered=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      bOwnerNoSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      TickGroup=TG_PostAsyncWork
      Name="OverlayMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:OverlayMeshComponent0'
   End Object
   OverlayMesh=OverlayMeshComponent0
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonArms'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceA Archetype=AnimNodeSequence'TribesGame.Default__TrPlayerPawn:FirstPersonArms.MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrPlayerPawn:FirstPersonArms.MeshSequenceA'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'TribesGame.Default__TrBotPawn:FirstPersonArms.MeshSequenceA'
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      AbsoluteRotation=True
      AbsoluteScale=True
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonArms"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonArms'
   End Object
   ArmsMesh(0)=FirstPersonArms
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms2 Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonArms2'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceB Archetype=AnimNodeSequence'TribesGame.Default__TrPlayerPawn:FirstPersonArms2.MeshSequenceB'
         Name="MeshSequenceB"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrPlayerPawn:FirstPersonArms2.MeshSequenceB'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'TribesGame.Default__TrBotPawn:FirstPersonArms2.MeshSequenceB'
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      HiddenGame=True
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      AbsoluteRotation=True
      AbsoluteScale=True
      Scale3D=(X=1.000000,Y=-1.000000,Z=1.000000)
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonArms2"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:FirstPersonArms2'
   End Object
   ArmsMesh(1)=FirstPersonArms2
   ControllerClass=None
   Begin Object Class=SkeletalMeshComponent Name=WPawnSkeletalMeshComponent Archetype=SkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:WPawnSkeletalMeshComponent'
      MinDistFactorForKinematicUpdate=0.200000
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      bCacheAnimSequenceNodes=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrBotPawn:MyLightEnvironment'
      RBChannel=RBCC_Untitled3
      RBDominanceGroup=20
      MotionBlurScale=0.000000
      bOwnerNoSee=True
      bUsesPlayerShadowFadeResolution=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      BlockRigidBody=True
      RBCollideWithChannels=(Untitled3=True)
      Translation=(X=0.000000,Y=0.000000,Z=8.000000)
      Scale=1.075000
      Name="WPawnSkeletalMeshComponent"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrPlayerPawn:WPawnSkeletalMeshComponent'
   End Object
   Mesh=WPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrPlayerPawn:CollisionCylinder'
      CollisionHeight=2.000000
      CollisionRadius=2.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrPlayerPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrPlayerPawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrPlayerPawn:Arrow'
   End Object
   Components(1)=Arrow
   Components(2)=MyLightEnvironment
   Components(3)=WPawnSkeletalMeshComponent
   Components(4)=AmbientSoundComponent
   Components(5)=AmbientSoundComponent2
   Components(6)=SkiDust
   Components(7)=WPawnSkeletalMeshComponent
   Components(8)=JetpackLoopSound
   Components(9)=JetpackAttackSound
   Components(10)=SkiLoopSound
   CollisionComponent=CollisionCylinder
   Name="Default__TrBotPawn"
   ObjectArchetype=TrPlayerPawn'TribesGame.Default__TrPlayerPawn'
}
