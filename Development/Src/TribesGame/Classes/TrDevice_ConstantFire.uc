/**
 * 
 */
class TrDevice_ConstantFire extends TrDevice
	native;

var(Sounds) AudioComponent m_AudioComponentWeaponLoop;
var(Sounds) bool m_bSoundLinkedWithState;
var protected float WeaponFireFadeTime;
var(Sounds) SoundCue m_FireTail;
var name m_PostFireState;
var bool m_bHasLoopingFireAnim;
var bool m_bIsCurrentlyFiring;

simulated event ReplicatedEvent(name VarName)
{   
    if(VarName == 'r_bIsReloading')
    {
		if (r_bIsReloading && m_bSoundLinkedWithState && m_AudioComponentWeaponLoop.IsPlaying() && m_AudioComponentWeaponLoop.FadeOutTargetVolume != 0.0f)
		{
			m_AudioComponentWeaponLoop.FadeOut(WeaponFireFadeTime, 0.0f);
		}

		// Client wants to fire, so let him try.
		if( m_bWantsToFire )
		{
			StartFire(0);
		}

		// The client has finished reloading, so see if they should resume zoom on end.
		ResumeZoomOnReloadEnd();
    }
    super.ReplicatedEvent(VarName);
}

/** called when constant fire has ended */
simulated function OnEndConstantFire()
{
	// The fire animation is expected to be a looping animation, so we manually go idle.
	if( m_DeviceAnimNode != None && m_DeviceAnimNode.ActiveChildIndex == 2 )
    {
        m_DeviceAnimNode.PlayIdle();
    }
}

/** called when constant fire has started */
simulated function OnStartConstantFire();

/** called when constant fire has ticked */
simulated function OnTickConstantFire();

simulated function EndFire(byte FireModeNum)
{
	super.EndFire(FireModeNum);

	m_bIsCurrentlyFiring = false;
}

simulated function StartFire(byte FireModeNum)
{
	if( FireModeNum == 0 && !m_bIsPassive && (!r_bIsReloading || (m_bCanEarlyAbortReload && r_bIsReloading)) )
	{
		Super.StartFire(FireModeNum);
	}
	else
	{
		m_bWantsToFire = true;
	}
}

// Firing state for constant firing weapons, i.e. laser targeter.
simulated state WeaponConstantFiring extends WeaponFiring
{
	simulated function RefireCheckTimer()
	{
		local UTPlayerController PC;

		// We are still requesting to fire, so keep at it.
		// If weapon should keep on firing, then do not leave state and fire again.
		if( ShouldRefire() )
		{
			FireAmmunition();

			OnTickConstantFire();

			// trigger a view shake for the local player here, because effects are called every tick
			// but we don't want to shake that often
			PC = UTPlayerController(Instigator.Controller);
			if (PC != None && LocalPlayer(PC.Player) != None && CurrentFireMode < FireCameraAnim.length && FireCameraAnim[CurrentFireMode] != None)
			{
				PC.PlayCameraAnim(FireCameraAnim[CurrentFireMode], (GetZoomedState() > ZST_ZoomingOut) ? PC.GetFOVAngle() / PC.DefaultFOV : 1.0);
			}
			return;
		}

		// We're done firing, return to the 'Active' state.
		GotoState(m_PostFireState);

		// if out of ammo, then call weapon empty notification
		if( !HasAnyAmmo() )
		{
			if( WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.NetMode == NM_Standalone )
			{
				WeaponPlaySound(m_DryFireSoundCue);
			}

			// Play dryfire animation (the sound should be embedded into the anim sequence).
			if( m_DeviceAnimNode != None )
			{
				m_DeviceAnimNode.PlayDryFire();
			}
		}
	}

	simulated function EndFire(byte FireModeNum)
	{
		global.EndFire(FireModeNum);
	}

	simulated function BeginState( Name PreviousStateName )
	{
		// Fire the first shot right away
		RefireCheckTimer();
		TimeWeaponFiring( CurrentFireMode );

		OnStartConstantFire();

		// Play the constant fire sound.
		if (m_bSoundLinkedWithState && !m_AudioComponentWeaponLoop.IsPlaying() && m_AudioComponentWeaponLoop.FadeOutTargetVolume != 0.0f)
		{
			m_AudioComponentWeaponLoop.FadeIn(WeaponFireFadeTime, 1.0f);
		}
	}

	simulated function EndState(Name NextStateName)
	{
		local UTPlayerController PC;

		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			if (m_bSoundLinkedWithState && m_AudioComponentWeaponLoop.IsPlaying() && m_AudioComponentWeaponLoop.FadeOutTargetVolume != 0.0f)
			{
				m_AudioComponentWeaponLoop.FadeOut(WeaponFireFadeTime, 0.0f);
			}

			if( m_FireTail != none )
			{
				WeaponPlaySound(m_FireTail);
			}
		}

		ClearTimer('RefireCheckTimer');
		ClearFlashLocation();
		OnEndConstantFire();

	    // Stop controller vibration
		PC = UTPlayerController(Instigator.Controller);
	    if( PC != None && LocalPlayer(PC.Player) != None )
	    {
		    // only do rumble if we are a player controller
		    PC.ClientStopForceFeedbackWaveform( WeaponFireWaveForm );
	    }

		super.EndState(NextStateName);
	}

	simulated function bool CanFireOffhandNow()
	{
		return true;
	}

	simulated function bool IsFiring()
	{
		return true;
	}

	simulated function bool CanViewZoom()
	{
		return m_bAllowFireWhileZoomed;
	}
}

simulated function PlayFireAnimation(byte FireModeNum)
{
	// If the weapon is already playing a fire animation and it is looping, don't restart it.
	if( m_bHasLoopingFireAnim && m_DeviceAnimNode != None && m_DeviceAnimNode.ActiveChildIndex == 2 )
	{
		return;
	}
	
	super.PlayFireAnimation(FireModeNum);
}

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTAmbientSoundComponent'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_bSoundLinkedWithState=True
   m_bHasLoopingFireAnim=True
   WeaponFireFadeTime=0.050000
   m_PostFireState="Active"
   DBWeaponTypeId=2
   m_nCarriedAmmo=1
   m_nMaxCarriedAmmo=1
   m_fReloadTime=0.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ConstantFire:FireCameraShake'
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_ConstantFire:ForceFeedbackWaveformShooting1'
   FiringStatesArray(0)="WeaponConstantFiring"
   FiringStatesArray(1)=()
   FireInterval(0)=0.100000
   FireInterval(1)=()
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
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_ConstantFire"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
