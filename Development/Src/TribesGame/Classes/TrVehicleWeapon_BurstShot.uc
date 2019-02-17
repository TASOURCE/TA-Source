class TrVehicleWeapon_BurstShot extends TrVehicleWeapon
	HideDropDown;

var int m_nCurrBurstShotCount;
var int m_nBurstShotCount;
var name m_PostFireState;

//
//	Override firing state to use looping fire sound
//
simulated state WeaponBurstShotFiring
{
	simulated function FireAmmunition()
	{
		m_nCurrBurstShotCount++;

		super.FireAmmunition();
	}

	/**
	 * In this weapon, RefireCheckTimer consumes ammo and deals out health/damage.  It's not
	 * concerned with the effects.  They are handled in the tick()
	 */
	simulated function RefireCheckTimer()
	{
		local UTPlayerController PC;

		// If weapon should keep on firing, then do not leave state and fire again.
		if( m_nCurrBurstShotCount < m_nBurstShotCount )
		{
			FireAmmunition();
			
			// trigger a view shake for the local player here, because effects are called every tick
			// but we don't want to shake that often
			PC = UTPlayerController(Instigator.Controller);
			if (PC != None && LocalPlayer(PC.Player) != None && CurrentFireMode < FireCameraAnim.length && FireCameraAnim[CurrentFireMode] != None)
			{
				PC.PlayCameraAnim(FireCameraAnim[CurrentFireMode], (GetZoomedState() > ZST_ZoomingOut) ? PC.GetFOVAngle() / PC.DefaultFOV : 1.0);
			}
			return;
		}

		// Otherwise we're done firing, so go back to active state.
		GotoState(m_PostFireState);

		// if out of ammo, then call weapon empty notification
		if( !HasAnyAmmo() )
		{
			MakeNoise(1.0);
			WeaponEmpty();
		}
	}

	simulated function EndFire(byte FireModeNum)
	{
		Global.EndFire(FireModeNum);
	}

	simulated function bool CanClientRequestReloadNow()
	{
		return false;
	}

    simulated function bool CanFireOffhandNow()
    {
        return false;
    }

	simulated function bool CanViewZoom()
	{
		return m_bCanZoom;
	}

	simulated function BeginState( Name PreviousStateName )
	{
		m_nCurrBurstShotCount = 0;

		// Fire the first shot right away
		RefireCheckTimer();
		TimeWeaponFiring( CurrentFireMode );
	}

	/**
	 * When leaving the state, shut everything down
	 */
	simulated function EndState(Name NextStateName)
	{
		local UTPlayerController PC;

		ClearTimer('RefireCheckTimer');
		ClearFlashLocation();

	    // Stop controller vibration
		PC = UTPlayerController(Instigator.Controller);
	    if( PC != None && LocalPlayer(PC.Player) != None )
	    {
		    // only do rumble if we are a player controller
		    PC.ClientStopForceFeedbackWaveform( WeaponFireWaveForm );
	    }

		super.EndState(NextStateName);
	}

	simulated function bool IsFiring()
	{
		return true;
	}
}

defaultproperties
{
   m_PostFireState="Active"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrVehicleWeapon_BurstShot:ForceFeedbackWaveformShooting1'
   FiringStatesArray(0)="WeaponBurstShotFiring"
   FiringStatesArray(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon:PickupMesh'
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
      Name="PickupMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrVehicleWeapon_BurstShot"
   ObjectArchetype=TrVehicleWeapon'TribesGame.Default__TrVehicleWeapon'
}
