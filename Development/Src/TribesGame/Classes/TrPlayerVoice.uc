class TrPlayerVoice extends TrDevice;

struct VGSCommandToVoiceMap
{
	var VGSCommandType Command;
	var SoundCue Sound;
};
var array<VGSCommandToVoiceMap> m_VGSCommandToVoiceMap;

var array<SoundCue> m_VGSSampleMap;

struct VGSContextCommandToVoiceMap
{
	var EVGSContextActor ContextActor;
	var EVGSContextLocation ContextLocation;
	var bool bIsEnemyLocation;
	var SoundCue Sound;
};
var array<VGSContextCommandToVoiceMap> m_VGSContextCommandToVoiceMap;

static function PlaySoundEx(VGSCommandType Command, TrPlayerController TrPC, PlayerReplicationInfo InstigatorPRI)
{
	local int i;
	local SoundCue SoundToPlay;

	if( TrPC != none )
	{
		// Find the sound associated with the command.
		for( i = 0; i < default.m_VGSCommandToVoiceMap.Length; i++ )
		{
			if( default.m_VGSCommandToVoiceMap[i].Command == Command )
			{
				SoundToPlay = default.m_VGSCommandToVoiceMap[i].Sound;
				break;
			}
		}

		TrPC.ClientPlayVGSAudio(SoundToPlay, InstigatorPRI);
	}
}

static function PlaySoundContext( TrPlayerController TrPC, EVGSContextActor ContextActor, EVGSContextLocation ContextLocation, bool bEnemyLocation, PlayerReplicationInfo InstigatorPRI)
{
	local int i;
	local SoundCue SoundToPlay;

	// Make sure that netural locations havne't somehow been flagged as enemy (to help with searching).
	if( ContextLocation == VGSContext_Midfield || ContextLocation == VGSContext_None )
	{
		bEnemyLocation = false;
	}

	if( TrPC != none )
	{
		// Find the sound associated with the command.
		for( i = 0; i < default.m_VGSContextCommandToVoiceMap.Length; i++ )
		{
			if( default.m_VGSContextCommandToVoiceMap[i].ContextActor == ContextActor &&
				default.m_VGSContextCommandToVoiceMap[i].ContextLocation == ContextLocation &&
				bEnemyLocation == default.m_VGSContextCommandToVoiceMap[i].bIsEnemyLocation )
			{
				SoundToPlay = default.m_VGSContextCommandToVoiceMap[i].Sound;
				break;
			}
		}

		TrPC.ClientPlayVGSAudio(SoundToPlay, InstigatorPRI);
	}
}

static function PlayRandomSample(TrPlayerController TrPC)
{
	local int i;

    i = int(RandRange(0, default.m_VGSSampleMap.Length));

    TrPC.ClientPlayVGSAudio(default.m_VGSSampleMap[i], TrPC.PlayerReplicationInfo);
}

defaultproperties
{
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPlayerVoice:FireCameraShake'
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPlayerVoice:ForceFeedbackWaveformShooting1'
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      ReplacementPrimitive=None
      MaxDrawDistance=6000.000000
      CachedMaxDrawDistance=6000.000000
      MotionBlurScale=0.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      bAllowAmbientOcclusion=False
      Scale=1.250000
      Name="PickupMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrPlayerVoice"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
