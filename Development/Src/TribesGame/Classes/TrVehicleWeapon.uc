class TrVehicleWeapon extends UTVehicleWeapon
	native
	HideDropDown;

var int DBWeaponId;                     // Database weapon id
var int m_nReticuleIndex;               // Reticule that we want to use for this weapon.
var int m_nAltReticuleIndex;            // Reticule that we want to use for this device when zoomed.
var int m_ShotsFired;
var int m_nFiringConeWidthDegrees;
var float m_fCachedFiringCone;

/** Accuracy */
var float							m_fDefaultAccuracy;
var float							m_fAccuracyLossOnJump;
var float							m_fAccuracyLossOnWeaponSwitch;
var float							m_fAccuracyLossOnShot;
var float							m_fAccuracyLossMax;
var float							m_fAimingModeAccuracyBonus;
var float							m_fAccuracyCorrectionRate;

var float m_fReloadTimeRemaining;

/** Tracers */
var() EWeaponTracerType m_TracerType;           // Determines which tracer type to use for this weapon
var() bool              m_bSpawnTracers;        // Does this device support tracers?
var() bool              m_bSpawnTracerBeams;    // Does this device support tracer beams?
var() int               m_nTracerInterval;      // How many shots between tracers?
var() float             m_fShowTracerDistance;  // Min distance between fire location and hit location for drawing a tracer.
var() ParticleSystem    m_TracerBeamTemplate;   // Device will spawn this particle system along the fired direction.

var bool                            m_bLowAmmoOn;                   // Indicates that the warning is active.
var int                             m_nLowAmmoWarning;              // Shoot count <= to warning on.
var int								m_nCarriedAmmo;				    // how much ammo am I carrying for this weap? Server will send r_nCarriedAmmoCount to sync the device ammo count periodically
var float							m_fReloadTime;				    // Amount of time for the reload.
var float                           m_fPctTimeBeforeReload;         // [0.0-1.0] Percentage of time to pass before actually changing the ammo count (typically aligned with animation).
var bool							m_bReloadSingles;			    // does weapon reload one shot at a time?
var transient bool                  m_bPendingReload;               // Is there a pending reload (useful for knowing to go to the reload state after the current state is complete).
var SoundCue						m_ReloadAmmoSoundCue;
var SoundCue						m_DryFireSoundCue;
var repnotify   int                 r_nCarriedAmmoCount;		    // updates m_nCarriedAmmo
var bool                            m_bShowAmmoIndicator;           // Should this weapon show the ammo indicator?

/** Is the weapon reloading on the authority? */
var transient bool r_bIsReloading;

/** Must we end zoom on reload? */
var() bool  m_bCanZoom;
var() bool  m_bEndZoomOnReload;
var() name  m_nmZoomMaterialEffectName;	// Zoom overlay name.
var MaterialInstanceConstant m_ZoomOverlayMaterial;

/** Camera shake when this weapon fires. */
var() editinline CameraShake m_FireCameraShake;

/** The name for the weapons spin control (if applicable) */
var() name m_WeaponSpinControl;

native function float           GetAccuracy();
native function float           GetTargetAccuracy();
native function                 RestoreAccuracy(float fTimeStep);

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		r_bIsReloading,r_nCarriedAmmoCount;
}

simulated function InitVehicleGun();

simulated function float CalculateReloadTime()
{
	if (m_fReloadTime == 0.0f)
	{
		return FireInterval[0];
	}
	else
	{
		return m_fReloadTime;
	}
}

simulated function PostBeginPlay()
{
	AmmoCount = MaxAmmoCount;

	if (m_fReloadTime == 0.0f)
	{
		m_fReloadTimeRemaining = -1.0f;
	}
	else
	{
		m_fReloadTimeRemaining = -1.0f;
	}

	m_fCachedFiringCone = cos(m_nFiringConeWidthDegrees * PI/180);
    
    super.PostBeginPlay();
}

//
//  Don't fire unless the bike is pointed in the direction that it is moving.  This stops us from shooting add odd angles off to
//      the sides of the bike during sharp turns.
//
simulated function StartFire(byte FireModeNum)
{
	if (r_bIsReloading)
		return;

	// Only fire the weapon if it is inside it's firing cone.
	if (IsWeaponInFiringCone())
	{
		super.StartFire(FireModeNum);
		return;
	}
}

simulated function bool IsWeaponInFiringCone()
{
	local rotator LookRotation, VehicleRotation;

	if (m_nFiringConeWidthDegrees==0)
	{
		return true;
	}

	LookRotation.Pitch = MyVehicle.DriverViewPitch;
	LookRotation.Yaw = MyVehicle.DriverViewYaw;
	VehicleRotation.Pitch = MyVehicle.Rotation.Pitch;
	VehicleRotation.Yaw = MyVehicle.Rotation.Yaw;

	if (vector(LookRotation) dot vector(VehicleRotation) > m_fCachedFiringCone)
	{
		return true;
	}

	return false;
}

simulated function Projectile ProjectileFire()
{
	local vector		RealStartLoc;
	local TrProjectile SpawnedProjectile;
	local Class<TrProjectile> ProjectileClass;

	IncrementFlashCount();

	if (Role==ROLE_Authority)
	{
		UpdateShotsFired();
		SpawnedProjectile = TrProjectile(Spawn(GetProjectileClass(),,, MyVehicle.GetPhysicalFireStartLoc(self)));

		if (SpawnedProjectile != none)
		{
			SpawnedProjectile.InitProjectile(vector(MyVehicle.GetWeaponAim(self)));
		}
	}

	ProjectileClass = class<TrProjectile>(GetProjectileClass());
	if( ProjectileClass != none )
	{
		if( WorldInfo.NetMode != NM_DedicatedServer && ProjectileClass.default.m_bSimulateAutonomousProjectiles )
		{
			// Spawn a tracer projectile on the client to simulate the movement of the 'real' projectile.
			// The 'real' projecile will never replicate to the owning pawn in this case.
			RealStartLoc = GetPhysicalFireStartLoc();

			SpawnedProjectile = Spawn(class'TrProj_ClientTracer',Instigator,, RealStartLoc);
			SpawnedProjectile.InitProjectile( Vector(GetAdjustedAim( RealStartLoc )), ProjectileClass);
		}
	}
	return SpawnedProjectile;
}

simulated function class<Projectile> GetProjectileClass()
{
	return (CurrentFireMode < WeaponProjectiles.length) ? WeaponProjectiles[CurrentFireMode] : None;
}

event UpdateShotsFired(optional bool Reset)
{
	if (Reset)
		m_ShotsFired = 0;
	else
		m_ShotsFired++;
}

simulated function int GetNumRoundsCurrentlyInClip()
{
	return AmmoCount;
}

/** @return the location + offset from which to spawn effects (primarily tracers) */
simulated function vector GetEffectLocation()
{
	local vector SocketLocation;

	if (GetHand() == HAND_Hidden)
	{
		SocketLocation = Instigator.Location;
	}
	else if (MyVehicle != none && MyVehicle.Mesh != none && EffectSockets[CurrentFireMode] != '')
	{
		if (!MyVehicle.Mesh.GetSocketWorldLocationAndrotation(EffectSockets[CurrentFireMode], SocketLocation))
		{
			SocketLocation = Location;
		}
	}
	else if (Mesh != None)
	{
		SocketLocation = Mesh.Bounds.Origin + (vect(45,0,0) >> Rotation);
	}
	else
	{
		SocketLocation = Location;
	}

 	return SocketLocation;
}

/**
 * Called on a client, this function Attaches the WeaponAttachment
 * to the Mesh.
 */
simulated function AttachMuzzleFlash()
{
	local SkeletalMeshComponent SKMesh;

	// Attach the Muzzle Flash
	bMuzzleFlashAttached = true;
	SKMesh = MyVehicle.Mesh;
	if (SKMesh != none)
	{
		if ( (MuzzleFlashPSCTemplate != none) || (MuzzleFlashAltPSCTemplate != none) )
		{
			MuzzleFlashPSC = new(Outer) class'UTParticleSystemComponent';
			MuzzleFlashPSC.bAutoActivate = false;
			MuzzleFlashPSC.SetDepthPriorityGroup(SDPG_PostProcess);
			if (SKMesh.IsA('UDKSkeletalMeshComponent'))
			{
				MuzzleFlashPSC.SetFOV(UDKSkeletalMeshComponent(SKMesh).FOV);
			}
			MuzzleFlashPSC.SetTickGroup(TG_PostUpdateWork);
			SKMesh.AttachComponentToSocket(MuzzleFlashPSC, MuzzleFlashSocket);
		}
	}
}

/**
 * Turns the MuzzleFlashlight off
 */
simulated function MuzzleFlashTimer()
{
	if ( MuzzleFlashLight != None )
	{
		MuzzleFlashLight.SetEnabled(FALSE);
	}

	if (MuzzleFlashPSC != none && (!bMuzzleFlashPSCLoops) )
	{
		MuzzleFlashPSC.DeactivateSystem();
	}
}

/**
 * Causes the muzzle flash to turn on and setup a time to
 * turn it back off again.
 */
simulated function CauseMuzzleFlash()
{
	local ParticleSystem MuzzleTemplate;

	// only enable muzzleflash light if performance is high enough
	// enable muzzleflash on mobile since its one of the few ways to show dynamic lighting on skelmeshes
	if ((!WorldInfo.bDropDetail && !class'Engine'.static.IsSplitScreen()) || WorldInfo.IsConsoleBuild(CONSOLE_Mobile) )
	{
		if ( MuzzleFlashLight == None )
		{
			if( MuzzleFlashSocket != '' )
			{
				if ( MuzzleFlashLightClass != None )
				{
					MuzzleFlashLight = new(Outer) MuzzleFlashLightClass;
					if (MyVehicle.Mesh != None && MyVehicle.Mesh.GetSocketByName(MuzzleFlashSocket) != None)
					{
						MyVehicle.Mesh.AttachComponentToSocket(MuzzleFlashLight, MuzzleFlashSocket);
					}
				}
			}
		}
		else
		{
			MuzzleFlashLight.ResetLight();
		}
	}

	if (!bMuzzleFlashAttached)
		AttachMuzzleFlash();

	if (MuzzleFlashPSC != none)
	{
		if ( !bMuzzleFlashPSCLoops || !MuzzleFlashPSC.bIsActive)
		{
			if (Instigator != None && Instigator.FiringMode == 1 && MuzzleFlashAltPSCTemplate != None)
			{
				MuzzleTemplate = MuzzleFlashAltPSCTemplate;
			}
			else
			{
				MuzzleTemplate = MuzzleFlashPSCTemplate;
			}
			if (MuzzleTemplate != MuzzleFlashPSC.Template)
			{
				MuzzleFlashPSC.SetTemplate(MuzzleTemplate);
			}
			SetMuzzleFlashParams(MuzzleFlashPSC);
			MuzzleFlashPSC.ActivateSystem();
		}
	}

	// Set when to turn it off.
	SetTimer(MuzzleFlashDuration,false,'MuzzleFlashTimer');

}

/**
 * Stops the muzzle flash
 */
simulated function StopMuzzleFlash()
{
	ClearTimer('MuzzleFlashTimer');
	MuzzleFlashTimer();

	if ( MuzzleFlashPSC != none )
	{
		MuzzleFlashPSC.DeactivateSystem();
	}
}

/**
 * PlayFireEffects Is the root function that handles all of the effects associated with
 * a weapon.  This function creates the 1st person effects.  It should only be called
 * on a locally controlled player.
 */
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
    // Start muzzle flash effect
    CauseMuzzleFlash();

    // Spawn a tracer.
    if( ShouldFireTracer() )
    {
        SpawnTracerEffect( HitLocation, VSize(HitLocation - Instigator.Location) );
    }

	// Spawn a tracer beam.
    if( ShouldFireTracerBeam() )
    {
        SpawnTracerBeam(GetEffectLocation(), HitLocation);
    }

	ShakeView();
}

/** plays view shake on the owning client only */
simulated function ShakeView()
{
	local TrPlayerController PC;

	super.ShakeView();

	PC = TrPlayerController(Instigator.Controller);
	if( PC != none && LocalPlayer(PC.Player) != none && m_FireCameraShake != none )
	{
		PC.PlayCameraShake(,,m_FireCameraShake);
	}
}

simulated function bool ShouldFireTracer()
{
    return (m_bSpawnTracers) && (WeaponFireTypes[CurrentFireMode] == EWFT_InstantHit);// && (GetNumRoundsCurrentlyInClip() % m_nTracerInterval == 0);
}

simulated function bool ShouldFireTracerBeam()
{
	return (m_bSpawnTracerBeams) && (m_TracerBeamTemplate != none) && (WeaponFireTypes[CurrentFireMode] == EWFT_InstantHit);
}

simulated function SpawnTracerBeam(vector Start, vector End)
{
	local ParticleSystemComponent E;

	E = WorldInfo.MyEmitterPool.SpawnEmitter(m_TracerBeamTemplate, Start);
	E.SetVectorParameter('TracerEnd', End);
    E.SetDepthPriorityGroup(SDPG_World);
	E.SetTickGroup(TG_PostUpdateWork);
}

simulated function TrProj_Tracer SpawnTracerEffect( vector HitLocation, float HitDistance )
{
    local TrProj_Tracer	SpawnedProjectile;
    local vector SpawnLoc;
    local rotator SpawnRot;

    if( HitDistance > m_fShowTracerDistance )
    {
	    SpawnLoc = GetMuzzleLoc();
	    SpawnedProjectile = GetTracer( SpawnLoc, SpawnRot );

	    if ( (SpawnedProjectile != None) && !SpawnedProjectile.bDeleteMe )
	    {
		    SpawnedProjectile.Instigator = Instigator;

		    // init!
		    SpawnedProjectile.InitTracer(SpawnLoc, HitLocation);
	    }
    }

    return SpawnedProjectile;
}

/** Just like WeaponPlaySound(), only it does not replicate. */
simulated function WeaponPlaySoundLocal(SoundCue Sound, optional float NoiseLoudness, optional bool bStopWhenOwnerDestroyed)
{
	if( WorldInfo.NetMode != NM_DedicatedServer && Sound != None && Instigator != None && !bSuppressSounds  )
	{
		Instigator.PlaySound(Sound, true, , bStopWhenOwnerDestroyed);
	}
}

simulated function TrProj_Tracer GetTracer( vector SpawnLocation, rotator SpawnRotation )
{
	return TrGameReplicationInfo(WorldInfo.GRI).m_TrObjectPool.GetTracer( m_TracerType, 0, SpawnLocation, SpawnRotation );
}

simulated function PayAccuracyForShot()
{
	local TrWeaponPawn P;
	P=TrWeaponPawn(Instigator);

	if( P != None )
		P.m_fCurrentAccuracy -= m_fAccuracyLossOnShot;
}

/**
 * Adds any fire spread offset to the passed in rotator
 * @param Aim the base aim direction
 * @return the adjusted aim direction
 */
simulated function rotator AddSpreadWithAccuracy(rotator BaseAim, float fAccuracy)
{
	local vector X, Y, Z;
	local float CurrentSpread, Rand, RandY, RandZ;

    CurrentSpread = (1 - fAccuracy) / 2;

	if (CurrentSpread == 0)
	{
		return BaseAim;
	}
	else
	{
        // Add in any spread.
		GetAxes(BaseAim, X, Y, Z);

        CurrentSpread *= FRand();   // random radius in the circle
        Rand = FRand() * 2 * PI;    // random angle
		RandY = cos(Rand);  // generate a based on the angle (y = horizontal axis, z = vertical axis)
		RandZ = sin(Rand);
		return rotator(X + CurrentSpread * (RandY * Y + RandZ * Z) );
	}
}

simulated function Rotator GetAdjustedAim( vector StartFireLoc )
{
	local rotator R;
    local rotator RS;
    local float acc;

    acc = GetAccuracy();

	R = Instigator.GetAdjustedAimFor( Self, StartFireLoc );

	RS = AddSpreadWithAccuracy(R, acc );

	return RS;
}


/**
 * Adds any fire spread offset to the passed in rotator
 * @param Aim the base aim direction
 * @return the adjusted aim direction
 */
simulated function rotator AddSpread(rotator BaseAim)
{
	return AddSpreadWithAccuracy(BaseAim, GetAccuracy());
}

simulated function FireAmmunition()
{    
    Super.FireAmmunition();

	PayAccuracyForShot();
	UpdateShotsFired();

	if (ShotCost[CurrentFireMode] == 0)
	{
		if (Role == ROLE_Authority)
			WeaponPlaySound(m_ReloadAmmoSoundCue, , true);
		else
			WeaponPlaySoundLocal(m_ReloadAmmoSoundCue, , true);
	}
}

simulated function BeginFire(Byte FireModeNum)
{
	;

	// Check a replicated var rather than relying on states because the client could be in active
	// when the server is still in reloading state.
	if (!r_bIsReloading)
	{
		Super.BeginFire(FireModeNum);
	}
}

simulated function PutDownWeapon()
{
	if (!IsFiring())
	{
		super.PutDownWeapon();
	}
}

//############# AMMO_RELOAD
//
//	override the active state of Weapon so we can implement reloading...
//
simulated state Active
{
	simulated function bool CanViewZoom()
	{
		return m_bCanZoom;
	}

	simulated function BeginFire(byte FireModeNum)
	{
		if( AmmoCount == 0 && m_nCarriedAmmo == 0 )
		{
			WeaponPlaySoundLocal( m_DryFireSoundCue );

			return;
		}

		super.BeginFire(FireModeNum);
	}

    simulated function bool DoAutoReload()
    {
        if( Role == ROLE_Authority )
        {
		    if ((ammoCount==0) && (m_nCarriedAmmo > 0) && (ShotCost[0] > 0))
		    {
			    return true;
		    }
        }

		return false;
    }

	simulated event BeginState(name PreviousStateName)
	{
		local TrPlayerController PC;

		if (DoAutoReload())
		{
			GotoState('DeviceReloading');
		}
		else
		{
			// Check to resume zoom.
			PC = TrPlayerController(Instigator.Controller);
			if( PC != none )
			{
				PC.CheckZoomButton();
			}

			Super.BeginState(PreviousStateName);
		}
	}

    simulated function bool CanFireOffhandNow()
    {
        return TRUE;
    }
}

simulated state WeaponFiring
{
    simulated event BeginState(name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
	}

	simulated function FireAmmunition()
	{
		if (m_fReloadTime == 0.0f)
			m_fReloadTimeRemaining = WorldInfo.TimeSeconds + CalculateReloadTime();

		global.FireAmmunition();
	}

	simulated function bool CanViewZoom()
	{
		return m_bCanZoom;
	}
}

simulated function bool HasReticuleCharge()
{
    return true;
}

simulated function bool CanClientRequestReloadNow()
{
	return (GetNumRoundsCurrentlyInClip() < MaxAmmoCount) && (m_nCarriedAmmo > 0);
}

function RequestReload()
{
    if( Role == ROLE_Authority )
    {
        if( CanClientRequestReloadNow() )
        {
            GotoState('DeviceReloading');
        }
    }
}

simulated function OnClientReloaded()
{
    GotoState('DeviceReloading');
}

//
//	Reload state creates a timer that fires to reload the weapon
//
simulated state DeviceReloading
{
	ignores RequestReload;

	simulated function BeginState(name PreviousStateName)
	{
		local TrPlayerController PC;

		if( m_bEndZoomOnReload && Instigator != None )
		{
			PC = TrPlayerController(Instigator.Controller);
			if( PC != None )
			{
				PC.TrEndZoom();
			}
		}

		BeginAReload();

		m_fReloadTimeRemaining = WorldInfo.TimeSeconds + CalculateReloadTime();
	}
	
	simulated function EndState(name NextStateName)
	{
		local TrPlayerController PC;

		ClearTimer('Reload');
        ClearTimer('ClientFinishedReload');
        ClearTimer('OnReloadComplete');

		// Resume zooming if button is held down.
		PC = TrPlayerController(Instigator.Controller);
		if( PC != none )
		{
			PC.CheckZoomButton();
		}

		if( Role == ROLE_Authority )
		{
			r_bIsReloading = false;
			bNetDirty = true;
		}
	}

    simulated function BeginAReload()
    {
        local float TimeBeforeReload;

        if( Role == ROLE_Authority )
        {
            if( CalcAmountToLoad() > 0 )
            {
                // Play reload anim locally too.
                PlayReloadAnim();

                TimeBeforeReload = m_fReloadTime * m_fPctTimeBeforeReload;
                if( TimeBeforeReload > 0.f )
                {
                    SetTimer(TimeBeforeReload, false, 'Reload');
                }
                else
                {
                    Reload();
                }

				// Authority is reloading, so don't let clients even attempt to fire if the server
				// isn't ready. Or else the client can become out of sync and 'dry fire'
				r_bIsReloading = true;
				bNetDirty = true;
            }
        }
        else
        {
            // We've authoritatively been told to reload, so skip conditionals for ammo, etc.
            PlayReloadAnim();
            if( m_fReloadTime > 0.f )
            {
                SetTimer(m_fReloadTime, false, 'ClientFinishedReload');
            }
            else
            {
                ClientFinishedReload();
            }
        }
    }

    /** If told to reload again when still reloading, begin the reload sequence again. */
    simulated function OnClientReloaded()
    {
        BeginAReload();
    }   

    simulated function PlayReloadAnim()
    {
		local TrPlayerPawn aPlayerPawn;
		local TrWeaponPawn aWeapPawn;

		if (Role == ROLE_Authority)
		{
			aPlayerPawn = TrPlayerPawn(MyVehicle.Seats[SeatIndex].StoragePawn);
			if (aPlayerPawn != none)
			{
				// Tell clients to play a reload anim.
				aPlayerPawn.r_nFlashReloadPrimaryWeapon++;
			}

			aWeapPawn = TrWeaponPawn(MyVehicle.Seats[SeatIndex].SeatPawn);
			if (aPlayerPawn == none && aWeapPawn != none)
			{
				// Tell clients to play a reload anim.
				aWeapPawn.r_nFlashReload++;
			}

			WeaponPlaySound(m_ReloadAmmoSoundCue);
		}
		else
		{
			WeaponPlaySoundLocal(m_ReloadAmmoSoundCue);
		}

        /*if( m_DeviceAnimNode != None )
        {
            m_DeviceAnimNode.PlayReload(m_fReloadTime, GetNumRoundsCurrentlyInClip());
        }
		else if( TrPlayerPawn(Instigator) != none && TrDeviceAttachment(TrPlayerPawn(Instigator).CurrentWeaponAttachment) != None)
		{
			TrDeviceAttachment(TrPlayerPawn(Instigator).CurrentWeaponAttachment).PlayReload();
		}*/
    }

    function int CalcAmountToLoad()
    {
        local int AmmoToLoad;

        // Assume will deplete all inventory
	    AmmoToLoad = m_nCarriedAmmo;
	    
	    // Don't load more than will fit in the magazine
	    if (AmmoToLoad + AmmoCount > MaxAmmoCount)
	    {
	        AmmoToLoad = MaxAmmoCount - AmmoCount;
	    }
	    
	    // If we reload in singles, just load one
	    if (m_bReloadSingles && AmmoToLoad > 1)
	    {
			AmmoToLoad = 1;
	    }

        return AmmoToLoad;
    }

    function Reload()
    {
        local int ammoLoaded;
        local float TimeAfterReload;

        if (Role==ROLE_Authority)
        {
            ammoLoaded = CalcAmountToLoad();
	        if (ammoLoaded!=0)
	        {
			    // decrement inventory
			    m_nCarriedAmmo -= ammoLoaded;

			    // replicate this update.
                UpdateReplicatedCarriedAmmo();

			    // increment magazine content
			    AddAmmo(ammoLoaded);
            }
            
            // Reload is done, see what to do next.
            TimeAfterReload = m_fReloadTime * (1.f - m_fPctTimeBeforeReload);
            if( TimeAfterReload > 0.f )
            {
                SetTimer(TimeAfterReload, false, 'OnReloadComplete');
            }
            else
            {
                OnReloadComplete();
            }
        }
    }

	simulated function bool CanViewZoom()
	{
		return !m_bEndZoomOnReload && m_bCanZoom;
	}
}

/** Client has finished a reload. */
simulated function ClientFinishedReload()
{
    GotoState('Active');
}

/** Authority has completed a reload. */
function OnReloadComplete()
{
    // Reload is complete.
    if( GetNumRoundsCurrentlyInClip() >= maxAmmoCount || m_nCarriedAmmo==0)
    {
        GotoState('Active');
    }
    else
    {
        // We still have rounds to reload (such as a shotgun). Keep on reloading.
        BeginAReload();
    }
}

simulated function float CalculateReloadPercentRemaining()
{
	local float Divisor, ReloadTime;

	// We have reached our reload time.
	if (m_fReloadTimeRemaining < 0.0f)
		return 1.0f;

	// Calculate the remaining time.
	ReloadTime = m_fReloadTimeRemaining - WorldInfo.TimeSeconds;

	// Calculate the divisor and inverse the reload time.
	Divisor = CalculateReloadTime();
	ReloadTime = Abs(Divisor - ReloadTime);

	// Have we reached the end of the reload? If so, short circuit next time.
	if (ReloadTime > Divisor)
		m_fReloadTimeRemaining = -1.0f;

	return FClamp(ReloadTime / Divisor, 0.0f, 1.0f);
}

simulated function BeginAReload();

// ######## END AMMO_RELOAD

function int AddCarriedAmmo(int Amount)
{
    m_nCarriedAmmo = Clamp(m_nCarriedAmmo + Amount,0,default.m_nCarriedAmmo);
    UpdateReplicatedCarriedAmmo();
    return m_nCarriedAmmo;
}

function UpdateReplicatedCarriedAmmo()
{
    if (Role==ROLE_Authority)
    {
        r_nCarriedAmmoCount = m_nCarriedAmmo;
        bNetDirty = true;
    }
}

simulated function bool CanViewZoom()
{
	return false;
}

/** Called when zooming starts
 * @param PC - cast of Instigator.Controller for convenience
 */
simulated function StartZoom(UTPlayerController PC)
{
	local TrPlayerController TrPC;
	local vector2D ViewportSize;

	TrPC = TrPlayerController(PC);
	if( TrPC != none )
	{
		if( TrPC.m_ZoomedEffect == none && m_nmZoomMaterialEffectName != '' )
		{
			if( TrPC.Player != none )
			{
				TrPC.m_ZoomedEffect = MaterialEffect(LocalPlayer(TrPC.Player).PlayerPostProcess.FindPostProcessEffect(m_nmZoomMaterialEffectName));
			}
		}
	}

	if( TrPC.m_ZoomedEffect != none )
	{
		TrPC.m_ZoomedEffect.Material = m_ZoomOverlayMaterial;

		if( m_ZoomOverlayMaterial != none )
		{
			LocalPlayer(PC.Player).ViewportClient.GetViewportSize(ViewportSize);	
			m_ZoomOverlayMaterial.SetScalarParameterValue('AspectOffset',ViewportSize.X/ViewportSize.Y);
		}

		TrPC.m_ZoomedEffect.bShowInGame = true;
	}
}

/** Called when zooming ends
 * @param PC - cast of Instigator.Controller for convenience
 */
simulated function EndZoom(UTPlayerController PC, optional bool bReturningTo3P)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(PC);

	// Calling this on the server was causing the offhand weapons to become invisible on clients.
	// It may be because bHidden is replicated and was being incorrectly set and sent to client (BZ: 8701)
	if( TrPC != none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( !bReturningTo3P )
		{
			SetHidden(false);
		}

		if( TrPC.m_ZoomedEffect != none )
		{
			TrPC.m_ZoomedEffect.bShowInGame = false;
		}
	}
}

simulated function SetAltReticule()
{
	local TrHUD TrH;
	local TrPlayerController TrPC;
	local GfxTrHud HudMovie;
	local GFxTrReticules Reticules;

	if (m_nAltReticuleIndex < 0)
		return;

    m_nReticuleIndex = m_nAltReticuleIndex;

	TrPC = TrPlayerController(Pawn(Owner).Controller);
	if( TrPC != none )
	{
		TrH = TrHUD(TrPC.myHUD);
		if( TrH != none )
		{
			HudMovie = GfxTrHud(TrH.HudMovie);
			if( HudMovie != none )
			{
				Reticules = HudMovie.Reticules;
				if( Reticules != none )
				{
					Reticules.UpdateReticule(Instigator, true);
				}
			}
		}
	}
}

simulated function ResetAltReticule()
{
	local TrHUD TrH;
	local TrPlayerController TrPC;
	local GfxTrHud HudMovie;
	local GFxTrReticules Reticules;

	if (m_nAltReticuleIndex < 0)
		return;

    m_nReticuleIndex = default.m_nReticuleIndex;

	TrPC = TrPlayerController(Pawn(Owner).Controller);
	if( TrPC != none )
	{
		TrH = TrHUD(TrPC.myHUD);
		if( TrH != none )
		{
			HudMovie = GfxTrHud(TrH.HudMovie);
			if( HudMovie != none )
			{
				Reticules = HudMovie.Reticules;
				if( Reticules != none )
				{
					Reticules.UpdateReticule(Instigator, true);
				}
			}
		}
	}
}

defaultproperties
{
   DBWeaponId=102000
   m_nAltReticuleIndex=-1
   m_fDefaultAccuracy=1.000000
   m_fAccuracyLossOnJump=0.300000
   m_fAccuracyLossOnWeaponSwitch=0.100000
   m_fAccuracyLossOnShot=0.100000
   m_fAccuracyLossMax=0.300000
   m_fAccuracyCorrectionRate=0.050000
   m_bSpawnTracers=True
   m_bShowAmmoIndicator=True
   m_bEndZoomOnReload=True
   m_nTracerInterval=1
   m_fShowTracerDistance=512.000000
   m_fPctTimeBeforeReload=0.900000
   m_nmZoomMaterialEffectName="ZoomOverlay"
   bIgnoreSocketPitchRotation=True
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrVehicleWeapon:ForceFeedbackWaveformShooting1'
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'UTGame.Default__UTVehicleWeapon:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UTGame.Default__UTVehicleWeapon:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'UTGame.Default__UTVehicleWeapon:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTVehicleWeapon:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrVehicleWeapon"
   ObjectArchetype=UTVehicleWeapon'UTGame.Default__UTVehicleWeapon'
}
