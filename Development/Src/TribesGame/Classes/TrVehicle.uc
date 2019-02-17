class TrVehicle extends UTVehicle
	abstract
    native;

/** Pawn passenger in this vehicle. */
var	repnotify Pawn Passenger[4];

/** Pawn that will teleport to the driver seat. */
var protected TrPawn  m_PawnToTeleport;

/** The vehicle is locked if spawned but before the driver teleports in (to prevent hijacking). */
var transient protected bool m_bPostSpawnLocked;

/** The vehicle type for this vehicle. */
var EVehicleTypes m_VehicleType;

/** Station that spawned this vehicle. */
var TrVehicleStation m_OwnerStation;

/** How much time before the vehicle is killed from being unoccupied. */
var float m_fTimeToReset;

/** Speed multiplier for boosting the groundspeed and airspeed */
var float m_fBoostMultiplier;

/** Amount of energy that is consumed by boost per second */
var float m_fBoostEnergyPerSec;

/** Amount of energy (percent) that must be regained before boost re-activates */
var float m_fBoostReactivatePct;

/** Whether output gas is needed to apply boost */
var bool m_bBoostRequiresThrust;

/** Whether or not this vehicle will have improved latency support */
var const bool m_bImprovedLagSupport;

/** Is the vehicle invulnerable? */
var repnotify bool r_bIsInvulnerable;

///////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////// PowerPool ///////////////////////////////////////////////////////
var float               m_fCurrentPowerPool;            //Optimization, server/client each keep copy, and server will sync client when needed  
var	repnotify float     r_fCurrentPowerPool;		    //Variable server use to sync client
var	          float     r_fMaxPowerPool;
var			  float     m_fPowerPoolRechargeRate;
var           float     m_fPowerPoolTickRate;

// multiplier for crash damage
var float m_CrashDamageSeverity;

/** flag push speed */
var float m_fFlagPushSpeed;

/** player hit damage assessment */
var float m_fPawnPushSpeed;
var float m_fPawnMaxDamageSpeed;
var float m_fPawnMinDamage;
var float m_fPawnMaxDamage;
var float m_fPawnDamageTickTime;

/** vehicle hit damage assessment */
var class<DamageType> VehicleCollisionDamageType;
var float m_fVehicleMaxDamageSpeed;
var float m_fVehicleMinDamageSpeed;
var float m_fVehicleMinDamage;
var float m_fVehicleMaxDamage;
var float m_fLastVehicleDamageTime;
var float m_fVehicleDamageTickTime;

/** vehicle hit damage assessment */
var class<DamageType> WallCollisionDamageType;
var float m_fWallMaxDamageSpeed;
var float m_fWallMinDamageSpeed;
var float m_fWallMinDamage;
var float m_fWallMaxDamage;
var float m_fLastWallDamageTime;
var float m_fWallDamageTickTime;

// allow flying vehicles to exceed max speed
var int     r_nBaseMaxSpeed;
var float   m_fDivingMaxSpeedMultiplier;

/** For simulated clients to know if the boosters are currently active. */
var repnotify bool r_BoostersEnabled;
var bool m_bLowPowerPool;

/** Says whether level flight is enabled or disabled. */
var bool r_LevelFlightEnabled;

/** Speed boost sound. */
var float m_fBoostFadeInTime;
var float m_fBoostFadeOutTime;
var(Sounds) AudioComponent m_AudioComponentBoostSound;

var float ShowHeaderUntil;    // Show the name tag until this time.

/* the loadout scene */
var()			string		m_sName;					// name of this device
var()			int			m_nIconIndex;

var()			bool		m_bUsesArmoredMultiplier;
var				EMissileLock r_MissileLock;

/** Maps materials to particle dust effects. */
var array<MaterialImpactEffect> m_DustEffects;
var MaterialImpactEffect m_DefaultDustEffect;

/** PSC for the dust effect under the vehicle. */
var() ParticleSystemComponent m_DustPSC;

/** Speed to activate the contrail at. */
var() float m_fContrailSpeed;

//$$ML: Used for tagging this actor on local client as being a potential target for a seeking missile.
var float m_fRemainingPotentialSeekingTargetHUDZoomTime;    // Remaining time to zoom the potential target diamond.
var() rotator m_rPotentialSeekingTargetHUDRotation;         // Current rotation for the rotating diamond.
var float m_fRemainingSeekingTargetHUDZoomTime;             // Remaining time to zoom the target brackets.
var EMissileLock m_MissileLockStatus;                       // What is our current missile lock status?
//$$ML: End.

/** Health bar MIC */
var MaterialInstanceConstant m_HealthBarMIC;
var MaterialInstanceConstant m_DriverHealthBarMIC;
var MaterialInstanceConstant m_Passenger1HealthBarMIC;
var MaterialInstanceConstant m_Passenger2HealthBarMIC;
var MaterialInstanceConstant m_Passenger3HealthBarMIC;
var MaterialInstanceConstant m_Passenger4HealthBarMIC;

/** MIC used for the HUD marker */
var transient MaterialInstanceConstant m_MarkerMIC;

/** Health bar */
var(OverheadIndicator) float m_fVehicleHealthBarPlacementX;
var(OverheadIndicator) float m_fVehicleHealthBarPlacementY;
var(OverheadIndicator) float m_fVehicleHealthBarWidth;
var(OverheadIndicator) float m_fVehicleHealthBarHeight;

var Vector m_vDeathCamStartOffset;

/** Weapon names. */
var localized string m_sWeapon1Name;
var localized string m_sWeapon2Name;

var TrStatsInterface Stats;

/** Client vehicle states. */
var bool m_bClientPhysDirty;
var float m_fClientPhysDeltaTime;
var RigidBodyState m_ClientRBState;

/** Server vehicle states. */
var bool m_bServerCorrectionForce;
var int m_nServerTickCount;

/** Is the vehicle detected by an enemy sensor */
var int m_nDetectedByEnemyScannerCount;
var protected bool r_bDetectedByEnemyScanner;

/** Max speed that a pawn leaving this vehicle can have. */
var float m_fMaxPawnLeaveSpeed;

simulated native function NativePostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir);
native function           ConsumePowerPool(float fAmount);
native function float     GetPowerPoolPercent();
native function	          RegainPowerPool(float fDeltaTime);
native function           SyncClientCurrentPowerPool();

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	// replicated properties
	if (bNetDirty && Role == ROLE_Authority)
		r_MissileLock, r_bDetectedByEnemyScanner, r_bIsInvulnerable;
	if (bNetDirty && bNetOwner && Role == ROLE_Authority)
		r_fCurrentPowerPool, r_fMaxPowerPool;
	if (Role == ROLE_Authority && !bNetOwner)
		r_BoostersEnabled, r_LevelFlightEnabled, r_nBaseMaxSpeed;
	if (bNetDirty && Role == ROLE_Authority)
		Passenger;
}

simulated event ReplicatedEvent(name VarName)
{
	local int i;
	local TrPawn TrPassenger;

    if (VarName == 'r_BoostersEnabled')
    {
		PlayBoosterEffects(r_BoostersEnabled);
		return;
    }
    else if (VarName == 'r_fCurrentPowerPool')
    {
        m_fCurrentPowerPool = r_fCurrentPowerPool;
        return;
    }
	else if (VarName == 'Passenger')
	{
		// Make sure the local code sets the proper pointers and animations.
		for (i = 0; i < 4; i++)
		{
			TrPassenger = TrPawn(Passenger[i]);
			if (PassengerPRI[i] != none && TrPassenger != none)
			{
				TrPassenger.DrivenWeaponPawn.BaseVehicle = self;
				TrPassenger.StartRidingInVehicle(self, i+1);
			}
		}

		return;
	}

	super.ReplicatedEvent(VarName);
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	// Save our max speed.
	r_nBaseMaxSpeed = MaxSpeed;

	// Reset our power pool.
	m_fCurrentPowerPool = r_fMaxPowerPool;
    
    if (Role == ROLE_Authority)
    {
        Stats = TrGame(WorldInfo.Game).Stats;
        if (Stats != none) Stats.AddVehicleSpawn();

		SetDriving(true);
    }

	if (Driver != none)
	{
		UpdateSeatAnimations(TrPawn(Driver), 0);
	}
	if (Passenger[0] != none)
	{
		UpdateSeatAnimations(TrPawn(Passenger[0]), 1);
	}
	if (Passenger[1] != none)
	{
		UpdateSeatAnimations(TrPawn(Passenger[1]), 2);
	}
	if (Passenger[2] != none)
	{
		UpdateSeatAnimations(TrPawn(Passenger[2]), 3);
	}
	if (Passenger[3] != none)
	{
		UpdateSeatAnimations(TrPawn(Passenger[3]), 4);
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	local class<TrVehicleWeapon> GunClass;
	local int i;
	local TrSkelControl_SpinControl SpinControl;

	// Loop through all seats.
	if (SkelComp == Mesh)
	{
		for (i = 0; i < Seats.Length; i++)
		{
			GunClass = class<TrVehicleWeapon>(Seats[i].GunClass);
			if (GunClass == none)
			{
				continue;
			}

			// Stop the weapon spin control.
			if (GunClass.default.m_WeaponSpinControl != '')
			{
				SpinControl = TrSkelControl_SpinControl(SkelComp.FindSkelControl(GunClass.default.m_WeaponSpinControl));
				if (SpinControl != none)
				{
					SpinControl.Spin(false);
				}
			}
		}
	}
}

function SetDetectedByEnemyScanner(bool detected)
{
	r_bDetectedByEnemyScanner = detected;
}

simulated function bool GetDetectedByEnemyScanner()
{
	return r_bDetectedByEnemyScanner;
}

function bool SetScannerDetect(bool detected)
{
	m_nDetectedByEnemyScannerCount += detected ? 1 : -1;

	if (m_nDetectedByEnemyScannerCount<0)
	{
		m_nDetectedByEnemyScannerCount=0;
		;
	}

	detected = (m_nDetectedByEnemyScannerCount>0);

	if (detected != GetDetectedByEnemyScanner())
	{
		SetDetectedByEnemyScanner(detected);
	}

	return true;
}

function PancakeOther(Pawn Other)
{
	if (Other.IsA('TrProjectile'))
	{
		return;
	}

	Other.PlaySound(SoundCue'AUD_PC_BulletImpact.Vehicle_Squish.A_CUE_PC_VehicleSquish');

	Other.TakeDamage(10000, GetCollisionDamageInstigator(), Other.Location, Velocity * Other.Mass, CrushedDamageType,, self);
}


function Controller GetCollisionDamageInstigator()
{
	// No controller, because we are flyin' solo baby!
	if (!IsHumanControlled())
		return none;

	return super.GetCollisionDamageInstigator();
}

//
//  Override so we can get the hit normal and take dammage appropriately from terrain collisions
//
simulated function float GetDamageAmountForCollision(float Speed)
{
	return Lerp(m_fVehicleMinDamage, m_fVehicleMaxDamage, FPctByRange(Min(Speed, m_fVehicleMaxDamageSpeed), m_fVehicleMinDamageSpeed, m_fVehicleMaxDamageSpeed));
}

simulated event RigidBodyCollision( PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent,
								   const out CollisionImpactData Collision, int ContactIndex )
{
	local Controller OtherVehInstigator;
	local TrVehicle OtherVeh;
	local float ImpactThreshold, DamageAmount, Speed;
	local float lastCollisionTime;
	local Vector HitNormal;

	lastCollisionTime = LastCollisionDamageTime;

	// Just handle the regular rigid body collision.
	super.RigidBodyCollision(HitComponent,OtherComponent,Collision,ContactIndex);

	if (OtherComponent == none || OtherComponent.Owner == none || Role != ROLE_Authority || lastCollisionTime == WorldInfo.TimeSeconds)
		return;

	// Is it another vehicle?
	OtherVeh = TrVehicle(OtherComponent.Owner);
	if (OtherVeh != none && !WorldInfo.GRI.OnSameTeam(self, OtherVeh))
	{
		// Determine relative velocity, is there enough speed in the system?
		Speed = VSize(Velocity - OtherVeh.Velocity);
		if (Speed > m_fVehicleMinDamageSpeed)
		{
			// How much damage?
			OtherVehInstigator = OtherVeh.GetCollisionDamageInstigator();

			// Are we in the time span for the other vehicle to take damage from our vehicle?
			if (WorldInfo.TimeSeconds - OtherVeh.m_fLastVehicleDamageTime > OtherVeh.m_fVehicleDamageTickTime)
			{
				OtherVeh.m_fLastVehicleDamageTime = WorldInfo.TimeSeconds;
				OtherVeh.TakeDamage(int(GetDamageAmountForCollision(Speed)), GetCollisionDamageInstigator(), OtherVeh.Location, vect(0,0,0), VehicleCollisionDamageType,, self);
			}

			// Are we in the time span for our vehicle to take damage from another vehicle?
			if (WorldInfo.TimeSeconds - m_fLastVehicleDamageTime > m_fVehicleDamageTickTime)
			{
				m_fLastVehicleDamageTime = WorldInfo.TimeSeconds;
				TakeDamage(int(OtherVeh.GetDamageAmountForCollision(Speed)), OtherVehInstigator, Location, vect(0,0,0), VehicleCollisionDamageType,, OtherVeh);
			}

			PlaySound(SoundCue'AUD_PC_Notifications.Vehicle_Crash.A_CUE_VEH_Impact_CrashDamage');

			LastCollisionDamageTime = WorldInfo.TimeSeconds;
		}
	}

	// Did we hit a wall?
	if ( OtherComponent.Owner.Physics == PHYS_None )
	{
		Speed = VSize(Velocity);

		// Is there enough speed to do damage?
		if (Speed <= m_fWallMinDamageSpeed) return;

		// OK to run over stuff (hit normal points up) and we can't fly
		HitNormal = Normal(Collision.TotalNormalForceVector);
		if (!bCanFly && HitNormal.Z > 0.5) return;

		// OK to side-swipe stuff (hit normal oblique to velocity)
		ImpactThreshold = -(Normal(Velocity) dot HitNormal);
		if (ImpactThreshold < bCanFly ? 0.15 : 0.5) return;

		// Are we in the time span for our vehicle to take wall damage?
		if (WorldInfo.TimeSeconds - m_fLastWallDamageTime <= m_fWallDamageTickTime)
			return;

		// How much damage?
		DamageAmount = Lerp(m_fWallMinDamage, m_fWallMaxDamage, FPctByRange(Min(Speed, m_fWallMaxDamageSpeed), m_fWallMinDamageSpeed, m_fWallMaxDamageSpeed));

		// Apply damage.
		m_fLastWallDamageTime = WorldInfo.TimeSeconds;
		MakeNoise(1.0);
		TakeDamage(DamageAmount, GetCollisionDamageInstigator(), Location, vect(0,0,0), WallCollisionDamageType);
		LastHitBy = None;

		PlaySound(SoundCue'AUD_PC_Notifications.Vehicle_Crash.A_CUE_VEH_Impact_CrashDamage');

		LastCollisionDamageTime = WorldInfo.TimeSeconds;
	}
}

/**
 * RanInto() called for encroaching actors which successfully moved the other actor out of the way
 *
 * @param	Other 		The pawn that was hit
 */
event RanInto(Actor Other)
{
	local class<UDKEmitCameraEffect> CameraEffect;
	local float Speed, DamageAmt;
	local TrPawn TrP;
	local vector Momentum, PushDirection;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	// Determine the direction to push what we ran into.
	PushDirection = -Normal((Velocity * vect(1,1,0)) cross ((Other.Location - Location) * vect(1,1,0)));

	// Determine relative velocity.
	Speed = VSize(Velocity - Other.Velocity);

	// If we are running into a flag, just push it out of the way.
	if (Other.IsA('TrFlagBase'))
	{
		Other.Velocity += m_fFlagPushSpeed * Normal(Velocity cross PushDirection);
		return;
	}

	// Ignore projectiles.
	if (Other.IsA('TrProjectile'))
	{
		return;
	}

	// Try to fetch the other's player controller.
	if (Other.IsA('TrPawn'))
	{
		TrP = TrPawn(Other);
	}

	// Are we at the minimum run-over speed?
	if (Speed > MinRunOverSpeed)
	{
		Momentum = Normal(Velocity) * Speed * 0.25 * Pawn(Other).Mass;
		if (RanOverSound != None)
			PlaySound(RanOverSound);

		// Apply damage to people not on the same team.
		if (!WorldInfo.GRI.OnSameTeam(self, other))
		{
			// How much damage?
			DamageAmt = Lerp(m_fPawnMinDamage, m_fPawnMaxDamage, FPctByRange(Min(Speed, m_fPawnMaxDamageSpeed), MinRunOverSpeed, m_fPawnMaxDamageSpeed));

			// Determine if this pawn should take damage from a vehicle again.
			if (TrP != none)
			{
				if (WorldInfo.TimeSeconds - TrP.m_fLastVehicleDamagerTimeStamp <= m_fPawnDamageTickTime)
				{
					DamageAmt = 0;
				}
				else
				{
					TrP.m_fLastVehicleDamagerTimeStamp = WorldInfo.TimeSeconds;
				}
				
				TrPRI = TrP.GetTribesReplicationInfo();
				if( TrPRI != none )
				{
					VM = TrPRI.GetCurrentValueModifier();
					if( VM != none )
					{
						DamageAmt *= 1.0 - VM.m_fVehicleRunOverDamageProtectionPct;
					}
				}
			}

			// Apply damage.
			if (DamageAmt > 0)
			{
				Other.TakeDamage(int(DamageAmt), Controller, Other.Location, Momentum, RanOverDamageType,, self);

				if (Pawn(Other).Health <= 0)
				{
					Other.PlaySound(SoundCue'AUD_PC_BulletImpact.Vehicle_Squish.A_CUE_PC_VehicleSquish');

					CameraEffect = RanOverDamageType.static.GetDeathCameraEffectInstigator(UTPawn(Other));
					if (CameraEffect != None && UTPlayerController(Controller) != none)
					{
						UTPlayerController(Controller).ClientSpawnCameraEffect(CameraEffect);
					}
				}
			}
		}

		// Apply a push velocity out of the way.
		if (Pawn(Other).Health > 0)
		{
			Other.Velocity += FMin(m_fPawnPushSpeed, Speed) * Normal(Velocity cross PushDirection);
		}
	}
}

simulated function bool StopsProjectile(Projectile P)
{
	local int i;
	local TrPawn TrP;

	if (!super.StopsProjectile(P))
		return false;

	// Ignore projectiles fired from people sitting in the vehicle.
	if (Role == ROLE_Authority)
	{
		for (i = 0; i < Seats.Length; i++)
		{
			if (P.Instigator == Seats[i].StoragePawn)
				return false;
		}
	}
	else
	{
		TrP = TrPawn(P.Instigator);
		if (TrP != none && TrP.DrivenWeaponPawn.BaseVehicle == self)
			return false;
	}

	return true;
}

simulated function SitDriver( UTPawn UTP, int SeatIndex)
{
	Super.SitDriver(UTP, SeatIndex);

	UpdateSeatAnimations(TrPawn(UTP), SeatIndex);
}

simulated function DetachDriver(Pawn P)
{
	local TrPawn TrP;

    Super.DetachDriver(P);

	TrP = TrPawn(P);
	if( TrP != none )
	{
		// Play exit animation.
		/*
		if( TrPawn(P).m_VehicleBlendNode != none )
		{
			TrPawn(P).m_VehicleBlendNode.PlayExitAnim();
		}*/
		TrP.InitDefaultAnims(TrP.GetFamilyInfo());
	}

	ToggleBoosters(false);

	MigrateVehicleSounds(P, false);
}

simulated function bool IsEmpty()
{
	return SeatMask == 0;
}

function SetPawnToTeleport(TrPawn P)
{
    local float multiplier;
	local TrPlayerReplicationInfo TrPRI;
    local TrGameReplicationInfo TrGRI;
	local TrValueModifier VM;

    multiplier = 1.0f;
	Instigator = P;
    m_PawnToTeleport = P;

	// Skills/Perks
	if( P != none )
	{
		TrPRI = P.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				HealthMax = default.HealthMax * (1.0f + VM.m_fVehicleExtraHealthBuffPct);

				r_fMaxPowerPool = default.r_fMaxPowerPool * (1.0f + VM.m_fVehicleExtraEnergyBuffPct);
				m_fCurrentPowerPool = r_fMaxPowerPool;
			}

            TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

            if (TrGRI != none && TrGRI.r_ServerConfig != none)
            {
                multiplier = TrGRI.r_ServerConfig.fVehicleHealthMultiplier;
            }

            HealthMax *= multiplier;
			Health = HealthMax;
			bNetDirty = true;
		}
	}
}

function SetPostSpawnLocked(bool bLocked)
{
    m_bPostSpawnLocked = bLocked;
}

/**
 * sends the LockOn message to all seats in this vehicle with the specified switch
 *
 * @param Switch 	The message switch
 */
simulated function SendLockOnMessage(int Switch)
{
	local int i;
	local Pawn P;

	for (i = 0; i < Seats.length; i++)
	{
		P = Seats[i].SeatPawn;

		if( ( P != none )
			&& ( PlayerController(P.Controller) != None)
			&& P.IsLocallyControlled()
			&& (P.Controller.Pawn == P) // for client side lock warnings
			)
		{
			PlayerController(P.Controller).ReceiveLocalizedMessage(class'TrLockWarningMessage', Switch);
			PlayerController(P.Controller).ClientPlaySound(LockedOnSound);
		}
	}
}

function bool Died(Controller Killer, class<DamageType> DamageType, vector HitLocation)
{
	local int i;
	local TrPawn aPawn;
	local TrPlayerController KillerPC;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	// Eject anyone (with no damage) who has the Ejection Seat perk.
	for (i=0;i<Seats.Length;i++)
	{
		if (Seats[i].SeatPawn != None || Seats[i].StoragePawn != None)
		{
			aPawn = TrPawn(Seats[i].StoragePawn);
			if( aPawn != none )
			{
				TrPRI = aPawn.GetTribesReplicationInfo();
				if( TrPRI != none )
				{
					VM = TrPRI.GetCurrentValueModifier();
					if( VM != none && VM.m_bEjectionSeat )
					{
						// BZ 8719: Make the pawn invulnerable for a short bit.
						// This is because the pawn will pop up in the actor radius check when a projectile explodes.
						// We don't want them to be ejected and die immediately.
						aPawn.GoInvulnerable(0.01f);
						EjectSeat(i);
						RidingPawnLeave(i,true);
					}
				}
			}
		}
	}
    
    KillerPC = TrPlayerController(Killer);

    // Award the killer with a vehicle destruction
    if (KillerPC != none && GetTeamNum() != KillerPC.GetTeamNum())
    {
        if (Stats != none) Stats.AddVehicleDestruction(KillerPC);
        KillerPC.m_AccoladeManager.VehicleDestroyed(self);
    }

	// Apply damage to passengers, and then eject them.
	for (i = 1; i < Seats.Length; i++)
	{
		aPawn = TrPawn(Seats[i].StoragePawn);
		if (aPawn != None && Seats[i].SeatPawn == none)
		{
			RidingPawnLeave(i, true);

			if (Killer == Controller)
			{
				aPawn.TakeDamage(aPawn.HealthMax / 2, aPawn.Controller, LastTakeHitInfo.HitLocation, LastTakeHitInfo.Momentum, DamageType,, self);
			}
			else
			{
				aPawn.TakeDamage(aPawn.HealthMax / 2, Killer, LastTakeHitInfo.HitLocation, LastTakeHitInfo.Momentum, DamageType,, self);
			}
		}
	}

    // Report back to the vehicle station that spawned this vehicle so that it can update its inventory.
    if( m_OwnerStation != None )
    {
        m_OwnerStation.AddVehicleToPackedList(m_VehicleType, -1);
    }

    return Super.Died(Killer, DamageType, HitLocation);
}

function KillControllerForTeamChange(Controller ControllerToKill)
{
	local Controller CurrController;
	local int i;

	// Loop through all seats.
	for (i = 0; i < Seats.Length; i++)
	{
		// Is this the controller we're looking for?
		CurrController = GetControllerForSeatIndex(i);
		if (CurrController == ControllerToKill)
		{
			// Kill them dead.
			if (Seats[i].StoragePawn != none)
			{
				Seats[i].StoragePawn.KilledBy(Seats[i].StoragePawn);
			}
			return;
		}
	}
}

// After a vehicle has been spawned by a vehicle station, this teleports the driver into his seat.
function TeleportDriverToSeat()
{
    // Make sure the pawn is still available to drive the vehicle.
    if( m_PawnToTeleport != None && !(m_PawnToTeleport.IsInState('Dying')) && m_PawnToTeleport.DrivenVehicle == None && m_PawnToTeleport.DrivenWeaponPawn.BaseVehicle == none )
    {
        TryToDrive(m_PawnToTeleport);
    }

	// If we tried to teleport the driver and they were... for instance... sniped by me, let anyone take over the vehicle.
    m_bPostSpawnLocked = false;
    m_PawnToTeleport = None;
}

function bool CanArmorDriveVehicle(class<TrFamilyInfo> FamilyInfo)
{
	local int i;
	local string VehicleClassName;

	VehicleClassName = string(default.class);

	// Check drivable list.
	for (i = 0; i < FamilyInfo.default.VehicleSelectionList.Length; i++)
	{
		if (string(FamilyInfo.default.VehicleSelectionList[i]) == VehicleClassName)
			return true;
	}

	return false;
}

function bool CanArmorEnterVehicle(class<TrFamilyInfo> FamilyInfo)
{
	local int i;
	local string VehicleClassName;

	VehicleClassName = string(default.class);

	// Check passenger list.
	for (i = 0; i < FamilyInfo.default.PassengerSelectionList.Length; i++)
	{
		if (string(FamilyInfo.default.PassengerSelectionList[i]) == VehicleClassName)
			return true;
	}

	return false;
}

/**
 * @returns the first available passenger seat, or -1 if there are none available
 */
//$$BE Added an optional flag for seeing if seat allows flag
function int GetFirstAvailableSeat(optional bool bSeatMustAllowFlag)
{
	local int i;

	for (i = 1; i < Seats.Length; i++)
	{
		if (SeatAvailable(i))
		{
			// Does this seat need to require the flag?
			if (bSeatMustAllowFlag && !Seats[i].ValidFlagSeat)
				continue;

			return i;
		}
	}

	return -1;
}

/**
 * The pawn Driver has tried to take control of this vehicle
 *
 * @param	P		The pawn who wants to drive this vehicle
 */
function bool TryToDrive(Pawn P)
{
	local bool bEnteredVehicle;
	local bool bFreedSeat;
	local bool bHasFlag;
	local TrPawn aPawn;
	local TrPlayerController TrPC;
	local vector X,Y,Z;

	aPawn = TrPawn(P);
	if (aPawn == none)
		return false;

	TrPC = TrPlayerController(aPawn.Controller);

    // Don't allow anyone to drive the vehicle if locked.
    if( m_bPostSpawnLocked && m_PawnToTeleport != P )
    {
		// Notify the player the vehicle is locked.
		if (TrPC != none)
			TrPC.ReceiveLocalizedNagMessage(class'TrVehicleMessage', 1);

        return false;
    }

	// Are we able to be a valid driver or passenger?
	if (!CanArmorDriveVehicle(aPawn.GetCurrCharClassInfo()) && !CanArmorEnterVehicle(aPawn.GetCurrCharClassInfo()))
	{
		// Notify the player they are too fat.
		if (TrPC != none)
			TrPC.ReceiveLocalizedNagMessage(class'TrVehicleMessage', 0);

		return false;
	}

	// Does the vehicle need to be uprighted?
	if ( bMustBeUpright && !bVehicleOnGround && VSize(Velocity) <= 5.0f )
	{
		if ( bCanFlip )
		{
			bIsUprighting = true;
			UprightStartTime = WorldInfo.TimeSeconds;
			GetAxes(Rotation,X,Y,Z);
			bFlipRight = ((P.Location - Location) dot Y) > 0;
		}
		return false;
	}

	if ( !CanEnterVehicle(P) || (Vehicle(P) != None) )
	{
		return false;
	}

	// Do we have the flag?
	if (P.PlayerReplicationInfo.IsA('TrPlayerReplicationInfo'))
		bHasFlag = TrPlayerReplicationInfo(P.PlayerReplicationInfo).bHasFlag;

	// Check vehicle Locking....
	// Must be a non-disabled same team (or no team game) vehicle
	if (!bIsDisabled && (Team == UTVEHICLE_UNSET_TEAM || !bTeamLocked || !WorldInfo.Game.bTeamGame || WorldInfo.GRI.OnSameTeam(self,P)))
	{
		if (bEnteringUnlocks)
		{
			bTeamLocked = false;
			if (ParentFactory != None)
			{
				ParentFactory.VehicleTaken();
			}
		}

		if (!AnySeatAvailable())
		{
			if (WorldInfo.GRI.OnSameTeam(self, P))
			{
				// kick out the first bot in the vehicle to make way for this driver
				bFreedSeat = KickOutBot();
			}

			if (!bFreedSeat)
			{
				// we were unable to kick a bot out
				return false;
			}
		}

		// We have the flag.
		if (bHasFlag)
		{
			// Does the driver seat allow the flag?
			if (Driver == none && Seats[0].ValidFlagSeat)
				bEnteredVehicle = DriverEnter(P);

			// The driver seat doesn't allow the flag, so try the passenger
			if (!bEnteredVehicle)
				bEnteredVehicle = PassengerEnter(P, GetFirstAvailableSeat(true));
		}
		// We don't have the flag.
		else
		{
			// If the driver seat is open, try to drive... if not become a passenger.
			bEnteredVehicle = (Driver == None) ? DriverEnter(P) : PassengerEnter(P, GetFirstAvailableSeat());
		}

		if( bEnteredVehicle )
		{
			SetTexturesToBeResident( TRUE );
		}

		return bEnteredVehicle;
	}

	// Notify the player the vehicle is locked.
	if (TrPC != none)
	{
		TrPC.ReceiveLocalizedNagMessage(class'TrVehicleMessage', 1);
	}

	return false;
}

/**
 * DriverLeft() called by DriverLeave() after the drive has been taken out of the vehicle
 */
function DriverLeft()
{
	local rotator NewRot;
	local TrGame TrG;
	local TrPlayerController TrPC;
	local Pawn OldDriver;

	if (Driver != none)
	{
		OldDriver = Driver;
		NewRot = Rotation;
		NewRot.Roll = 0;
		Driver.SetRotation(NewRot);
		Driver.SetViewRotation(NewRot);
		Driver.ClientSetRotation(NewRot);

		// Notify the missile manager.
		TrG = TrGame(WorldInfo.Game);
		if( TrG != none && TrG.m_SeekingMissileManager != none )
		{
			TrG.m_SeekingMissileManager.PawnLeftVehicle(Driver, self);
		}

		// Let any spectators viewing this vehicle know that the driver left.
		foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
		{
			if( TrPC.InRovingSpectate() && TrPC.ViewTarget == self )
			{
				TrPC.OnViewTargetLeftVehicle(Driver.PlayerReplicationInfo);
			}
		}
	}

    Super.DriverLeft();

    if ( !Occupied() )
    {
        ResetTime = WorldInfo.TimeSeconds + m_fTimeToReset;
    }

	if (Role == ROLE_Authority)
	{
		ToggleBoosters(false);
	}

	// Limit the velocity that the pawn can have when leaving.
	if ( OldDriver != None && VSizeSq(OldDriver.Velocity) > m_fMaxPawnLeaveSpeed * m_fMaxPawnLeaveSpeed )
	{
		OldDriver.Velocity = Normal(OldDriver.Velocity) * m_fMaxPawnLeaveSpeed;
	}
}

/**
 * Called when a passenger leaves the vehicle
 *
 * @param	SeatIndex		Leaving from which seat
 */

function PassengerLeave(int SeatIndex)
{
	local TrGame TrG;

	MigrateVehicleSounds(Seats[SeatIndex].StoragePawn, false);

	// Notify the missile manager.
	TrG = TrGame(WorldInfo.Game);
	if( TrG != none && TrG.m_SeekingMissileManager != none )
	{
		TrG.m_SeekingMissileManager.PawnLeftVehicle(Seats[SeatIndex].StoragePawn, self);
	}

	Super.PassengerLeave(SeatIndex);

    if (!Occupied())
    {
        ResetTime = WorldInfo.TimeSeconds + m_fTimeToReset;
    }
}

/**
 *  Vehicle has been in the middle of nowhere with no driver for a while, so consider resetting it
 */
event CheckReset()
{
    Died(None, class'DamageType', Location);
}

function ResetResetTime()
{
	ResetTime = WorldInfo.TimeSeconds + 10000000.0;
}

// For now, disable momentum damage.
function HandleMomentum( vector Momentum, Vector HitLocation, class<DamageType> DamageType, optional TraceHitInfo HitInfo )
{
	//AddVelocity( Momentum, HitLocation, DamageType, HitInfo );
}

// Network: Autonomous proxy and server.
function ToggleBoosters(bool bEnabled, optional bool ToggleTimer = true)
{
	local bool bDisableEffects;

	// Make sure thrusters can activate.
	bDisableEffects = false;
	if (bEnabled && !CanActivateBoosters())
	{
		bEnabled = false;
	}

	// Boost requires thrust.
	if (m_bBoostRequiresThrust && OutputGas == 0.0f)
	{
		bDisableEffects = true;
	}

	if (!bDisableEffects)
	{
		AirSpeed = bEnabled ? default.AirSpeed * m_fBoostMultiplier : default.AirSpeed;
		GroundSpeed = bEnabled ? default.GroundSpeed * m_fBoostMultiplier : default.GroundSpeed;
		MaxSpeed = bEnabled ? default.MaxSpeed * m_fBoostMultiplier : default.MaxSpeed;
		r_nBaseMaxSpeed = MaxSpeed;
	}

	r_BoostersEnabled = bEnabled && !bDisableEffects;
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		PlayBoosterEffects(bEnabled);
	}

	if (ToggleTimer)
	{
		if (bEnabled)
			SetTimer(m_fPowerPoolTickRate, true, 'ConsumeBoostPowerPool');
		else
			ClearTimer('ConsumeBoostPowerPool');
	}
}

function ConsumeBoostPowerPool()
{
	// If boost is tied to thrust, update booster status accordingly.
	if (m_bBoostRequiresThrust)
	{
		if (r_BoostersEnabled && OutputGas == 0.0f)
		{
			ToggleBoosters(false, false);
		}
		else if (!r_BoostersEnabled && OutputGas != 0.0f)
		{
			ToggleBoosters(true, false);
		}
	}

	// Disable boosters when we have consumed all of our power.
	if (GetPowerPoolPercent() <= 0.0f)
	{
		m_bLowPowerPool = true;
		ToggleBoosters(false, false);
	}
	// Re-enable them when we have some power back.
	else if (GetPowerPoolPercent() >= m_fBoostReactivatePct && m_bLowPowerPool)
	{
		m_bLowPowerPool = false;
		ToggleBoosters(true, false);
	}

	// Consume energy when the boosters are enabled.
	if (r_BoostersEnabled)
	{
		// Use the boost energy.
		ConsumePowerPool(m_fBoostEnergyPerSec * m_fPowerPoolTickRate);
	}

	// Sync the energy to the client.
	SyncClientCurrentPowerPool();
}

simulated function bool CanActivateBoosters()
{
	// No driver.
	if (Driver == none)
	{
		return false;
	}

	// Do we have enough power pool to activate?
	if (GetPowerPoolPercent() < m_fBoostReactivatePct)
	{
		return false;
	}

	return true;
}

event bool ShouldRechargePowerPool()
{
	// If nobody is piloting us, regain power.
	if (!IsHumanControlled())
		return true;

	// If our boosters aren't enabled, allow recharge.
	return !r_BoostersEnabled;
}

reliable server function ServerToggleLevelFlight(bool bEnabled)
{
	r_LevelFlightEnabled = bEnabled;
}

// Plays client-side booster effects.
simulated function BoostSoundFinished(AudioComponent AC)
{
	if (AC != none && r_BoostersEnabled)
	{
		m_AudioComponentBoostSound.FadeIn(m_fBoostFadeInTime, 1.0);
	}
}

simulated function PlayBoosterEffects(bool bEnabled)
{
	if (m_AudioComponentBoostSound != none)
	{
		if (bEnabled)
		{
			if (!m_AudioComponentBoostSound.IsPlaying() && m_AudioComponentBoostSound.FadeOutTargetVolume != 0.0f)
			{
				m_AudioComponentBoostSound.FadeIn(m_fBoostFadeInTime, 1.0);
			}
			else if (m_AudioComponentBoostSound.IsPlaying() && m_AudioComponentBoostSound.FadeOutTargetVolume != 0.0f)
			{
				m_AudioComponentBoostSound.OnAudioFinished = BoostSoundFinished;
				m_AudioComponentBoostSound.FadeOut(0.05, 0.0f);
			}
		}
	}
}

simulated function PlayMissileLockSounds()
{
	local int i;
	local Pawn P;

	for (i = 0; i < Seats.length; i++)
	{
		P = Seats[i].SeatPawn;

		if( ( P != none ) && ( TrPlayerController(P.Controller) != None ) )
		{
			//TrPlayerController(P.Controller).ClientPlayMissileLockSounds(r_MissileLock,false);
		}
	}
}

simulated event Tick(float DeltaTime)
{
	Super.Tick(DeltaTime);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Update potential seeking target time.
		if( m_fRemainingPotentialSeekingTargetHUDZoomTime > 0.f )
		{
			m_fRemainingPotentialSeekingTargetHUDZoomTime -= DeltaTime;
			if( m_fRemainingPotentialSeekingTargetHUDZoomTime <= 0.f )
			{
				m_fRemainingPotentialSeekingTargetHUDZoomTime = 0.f;
			}
		}

		// Update locked seeking target time.
		if( m_fRemainingSeekingTargetHUDZoomTime > 0.f )
		{
			m_fRemainingSeekingTargetHUDZoomTime -= DeltaTime;
			if( m_fRemainingSeekingTargetHUDZoomTime <= 0.f )
			{
				m_fRemainingSeekingTargetHUDZoomTime = 0.f;
			}
		}

 		m_rPotentialSeekingTargetHUDRotation.Yaw += class'TrHUD'.default.m_nPotentialSeekingTargetHUDRotationRate * DeltaTime;
		Normalize(m_rPotentialSeekingTargetHUDRotation);
	}
}

simulated function bool Occupied()
{
	local int i;

	if( Role != ROLE_Authority )
	{
		return PassengerPRI[0] != none || PassengerPRI[1] != none || PassengerPRI[2] != none || PassengerPRI[3] != none || PlayerReplicationInfo != none;
	}

	if ( Controller != None )
		return true;

	for ( i=0; i<Seats.Length; i++ )
		if ( !SeatAvailable(i) )
			return true;

	return false;
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local int scanMask;
	local int i;
    local bool hasFlag, bDetectedByEnemyScanner, bVehicleHasFriend;
    local bool friendly;
    local float MaxOffset;
	local vector screenLoc, NameLoc;
	local vector xloc;
    local string showName;
	local UTWeapon Weap;
	local TrHUD HUD;
    local Texture2D VehicleMarker;
	local UTPlayerReplicationInfo UTPRI;
	local TrPlayerReplicationInfo TrPRI;
	local bool bNoColor;
	local LinearColor RenderColor;

	// Seeking missile target.
	local Vector screenLocForMissile;
	local TrPlayerController TrPC;
	local TrDevice_SaberLauncher SaberLauncher;
	local float Opacity, ZoomAmount;
	local Rotator TargetZoomRotator;
	local Texture2D RotatingDiamondTexture;
	local EMissileLock OldMissileLockStatus;

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	// If hud is disabled while spectating, don't draw anything.
	if( PC.IsSpectating() )
	{
		if( !TrPlayerController(PC).m_bShowSpectatorHUD )
		{
			return;
		}
	}

	bDetectedByEnemyScanner = GetDetectedByEnemyScanner();

	if( m_HealthBarMIC == none )
	{
		m_HealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_HealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	if (m_DriverHealthBarMIC == none)
	{
		m_DriverHealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_DriverHealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	if (m_Passenger1HealthBarMIC == none)
	{
		m_Passenger1HealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_Passenger1HealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	if (m_Passenger2HealthBarMIC == none)
	{
		m_Passenger2HealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_Passenger2HealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	if (m_Passenger3HealthBarMIC == none)
	{
		m_Passenger3HealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_Passenger3HealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	if (m_Passenger4HealthBarMIC == none)
	{
		m_Passenger4HealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_Passenger4HealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	if (m_MarkerMIC == none)
	{
		m_MarkerMIC = new(self) class'MaterialInstanceConstant';
		m_MarkerMIC.SetParent(class'TrHUD'.default.MarkerBaseMIC);
	}
	
	TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

	scanMask = SeatMask;
	for (i=0; ScanMask!=0; i++)
	{
		if ((scanMask&1)==1)
		{
			UTPRI = UTPlayerReplicationInfo(GetSeatPRI(i));

			if (UTPRI != None)
			{
				if (UTPRI.bHasFlag)
				{
					hasFlag = true;
					showName = UTPRI.PlayerName;
					break;
				}

				if (showName == "")
				{
					showName = UTPRI.PlayerName;
				}
			}
		}
		scanMask = scanMask>>1;
	}

	screenLoc = Canvas.Project(Location + GetCollisionHeight()*vect(0,0,1));

	// Seeking missile target.
	TrPC = TrPlayerController(GetALocalPlayerController());
	if( TrPC != none && TrPC.Pawn != none )
	{
		OldMissileLockStatus = m_MissileLockStatus;
		m_MissileLockStatus = EMissileLockNone;

		SaberLauncher = TrDevice_SaberLauncher(TrPC.Pawn.Weapon);
		if( SaberLauncher != none )
		{
			// Determine if we need to kick off the interpolation for potential seeking target
			if( OldMissileLockStatus == EMissileLockNone && m_bPotentialSeekingTarget )
			{
				// This actor is a new potential target.
				m_fRemainingPotentialSeekingTargetHUDZoomTime = class'TrHUD'.default.m_fPotentialSeekingTargetHUDZoomTime;
				TrPC.ClientPlaySound(SoundCue'AUD_WEP_SaberLauncher.Tracking.A_CUE_WEP_SaberLauncher_1P_TargetsLocated');
				m_MissileLockStatus = EMissilePotentialTarget;
			}

			// Determine if we need to kick off the interpolation for a locked seeking target.
			if( (OldMissileLockStatus == EMissilePotentialTarget || OldMissileLockStatus == EMissileLockNone) && TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo).m_LockedTarget == self )
			{
				// This actor is a new target, but not locked in yet.
				m_fRemainingSeekingTargetHUDZoomTime = class'TrHUD'.default.m_fSeekingTargetHUDZoomTime;
				TrPC.ClientMySaberLauncherTargetingUpdated(EMissileLocking);
				m_MissileLockStatus = EMissileLocking;
			}

			screenLocForMissile = Canvas.Project(Location);
			screenLocForMissile.Z = VSize(CameraPosition - Location);
			if( TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo).m_LockedTarget == self )
			{
				if( SaberLauncher.r_bTargetLocked )
				{
					HUD.DrawMarker(class'TrHUD'.default.HUDMarkerMissileLocked, screenLocForMissile, Canvas,,,1.0, class'TrHUD'.default.m_fSeekingTargetHUDZoomEnd );
					
					if( OldMissileLockStatus != EMissileLocked )
					{
						// This actor is a new locked in target. NOTE: This is now handled by the authority and not simulated!
						//TrPC.ClientPlayMissileLockSounds(EMissileLocked, true);
					}
				}
				else
				{
					// The target is currently in the process of locking.
					Opacity = Lerp(class'TrHUD'.default.m_fSeekingTargetHUDZoomOpacityStart, class'TrHUD'.default.m_fSeekingTargetHUDZoomOpacityEnd, 1.0 - (m_fRemainingSeekingTargetHUDZoomTime / class'TrHUD'.default.m_fSeekingTargetHUDZoomTime));
					ZoomAmount = Lerp(class'TrHUD'.default.m_fSeekingTargetHUDZoomStart, class'TrHUD'.default.m_fSeekingTargetHUDZoomEnd, 1.0 - (m_fRemainingSeekingTargetHUDZoomTime / class'TrHUD'.default.m_fSeekingTargetHUDZoomTime));
					TargetZoomRotator.Yaw = class'TrHUD'.default.m_fInitialSeekingTargetYaw * (m_fRemainingSeekingTargetHUDZoomTime / class'TrHUD'.default.m_fSeekingTargetHUDZoomTime);
					HUD.DrawRotatedMarker(class'TrHUD'.default.HUDMarkerMissileLocking, screenLocForMissile, TargetZoomRotator,Canvas,,,Opacity,ZoomAmount );
					m_MissileLockStatus = EMissileLocking;
				}
			}
			
			// Show the green rotating element unless we are locked on to this particular actor.
			if( m_bPotentialSeekingTarget )
			{
				if( (SaberLauncher.r_bTargetLocked && TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo).m_LockedTarget == self) )
				{
					// Red, locked on.
					RotatingDiamondTexture = class'TrHUD'.default.HUDMarkerMissileTargetLocked;
					m_MissileLockStatus = EMissileLocked;
				}
				else if( TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo).m_LockedTarget == self )
				{
					// Keep the green diamond spinning while we continue locking on to this target.
					RotatingDiamondTexture = class'TrHUD'.default.HUDMarkerMissileTarget;
				}
				else
				{
					// This actor is just a potential target.
					RotatingDiamondTexture = class'TrHUD'.default.HUDMarkerMissileTarget;
					m_MissileLockStatus = EMissilePotentialTarget;
				}

				Opacity = Lerp(class'TrHUD'.default.m_fPotentialSeekingTargetHUDZoomOpacityStart, class'TrHUD'.default.m_fPotentialSeekingTargetHUDZoomOpacityEnd, 1.0 - (m_fRemainingPotentialSeekingTargetHUDZoomTime / class'TrHUD'.default.m_fPotentialSeekingTargetHUDZoomTime));
				ZoomAmount = Lerp(class'TrHUD'.default.m_fPotentialSeekingTargetHUDZoomStart, class'TrHUD'.default.m_fPotentialSeekingTargetHUDZoomEnd, 1.0 - (m_fRemainingPotentialSeekingTargetHUDZoomTime / class'TrHUD'.default.m_fPotentialSeekingTargetHUDZoomTime));
				HUD.DrawRotatedMarker(RotatingDiamondTexture, screenLocForMissile, m_rPotentialSeekingTargetHUDRotation, Canvas,,,Opacity,ZoomAmount );
			}
		}

		if( (OldMissileLockStatus == EMissileLocking || OldMissileLockStatus == EMissileLocked) 
			&& (m_MissileLockStatus == EMissileLockNone || m_MissileLockStatus == EMissilePotentialTarget) 
			&& TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo).m_LockedTarget == none )
		{
			// There is no longer a valid target.
			//TrPC.ClientMySaberLauncherTargetingUpdated(EMissileLockNone);
		}
	}

	// Make sure not clipped out
	if (screenLoc.X < 0 || screenLoc.X >= Canvas.ClipX || screenLoc.Y < 0 || screenLoc.Y >= Canvas.ClipY)
	{
		return;
	}

    screenLoc.Y -= 48;
	friendly = PC.IsSpectating() ? GetTeamNum() == 1 : WorldInfo.GRI.OnSameTeam(self, PC);

    ScreenLoc.Z = VSize(CameraPosition - Location);
    MaxOffset = (100 / (ScreenLoc.Z * 2));

    //if (!HUD.bShowObjectives) return;

    // periodically make sure really visible using traces
    /*if ( WorldInfo.TimeSeconds - LastPostRenderTraceTime > 0.5 )
    {
        LastPostRenderTraceTime = WorldInfo.TimeSeconds + 0.2*FRand();
        bPostRenderTraceSucceeded = (FastTrace(Location, CameraPosition) || FastTrace(Location+GetCollisionHeight()*vect(0,0,1), CameraPosition));
    }*/
	bPostRenderTraceSucceeded = Mesh != none && Mesh.bRecentlyRendered;

	if( m_HealthBarMIC != none )
	{
		m_HealthBarMIC.SetScalarParameterValue('Scal_Health', float(Health) / float(HealthMax));
		m_HealthBarMIC.SetScalarParameterValue('SCAL_Friendly', friendly ? 1.0 : 0.0);
	}

    if (!friendly)
	{
		if (IsInvisible())
		{
            return;
        }

        if (!bDetectedByEnemyScanner && !bPostRenderTraceSucceeded)
        {
            if (hasFlag)
            {
				VehicleMarker = Class'TrHUD'.default.FlagHeldVehicle;
				m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', VehicleMarker);
				m_MarkerMIC.SetVectorParameterValue('HudItem_Color', class'TrHUD'.default.MarkerColorEnemy);
				if (VehicleMarker != none)
				{
					HUD.DrawMICMarker(m_MarkerMIC, ScreenLoc, Canvas, vect2d(VehicleMarker.SizeX, VehicleMarker.SizeY));
				}
            }

            return;
        }

		// check whether close enough to crosshair
		if (ScreenLoc.Z < class'TrHUD'.default.TeamPlayerInfoMaxDist
		&& (Abs(screenLoc.X - (Canvas.ClipX * 0.5)) < (MaxOffset *0.5) * Canvas.ClipX)
		&& (Abs(screenLoc.Y + GetCollisionHeight() - (Canvas.ClipY * 0.5)) < MaxOffset * Canvas.ClipY))
		{
			// periodically make sure really visible using traces
			if ( FastTrace(Location, CameraPosition,, true)
				|| FastTrace(Location+GetCollisionHeight()*vect(0,0,1), CameraPosition,, true) )
			{
    			if (!UTPlayerController(PC).AlreadyInActionMusic())
                {
				    UTPlayerController(PC).ClientMusicEvent(0);
                }
            }

            HUD.bCrosshairOnFriendly = true;
            ShowHeaderUntil = (WorldInfo.TimeSeconds + 1.0);
        }

		if( TrPRI != none )
		{
			switch( TrPRI.GetArmorType() )
			{
				case ARMOR_Light:
					VehicleMarker = Class'TrHUD'.default.VehicleMarkerLight;
					break;
				case ARMOR_Medium:
					VehicleMarker = Class'TrHUD'.default.VehicleMarkerMedium;
					break;
				case ARMOR_Heavy:
					VehicleMarker = Class'TrHUD'.default.VehicleMarkerHeavy;
					break;
			}
		}
		else
		{
			VehicleMarker = Class'TrHUD'.default.VehicleMarkerNoDriver;
			bNoColor = true;
		}

		if (ShowHeaderUntil > WorldInfo.TimeSeconds)
		{
			// Vehicle.
			NameLoc = screenLoc;
			NameLoc.X += HUD.m_fVehicleNamePlacementX;
			NameLoc.Y += HUD.m_fVehicleNamePlacementY;

			if( Occupied() )
			{
				NameLoc.Y -= 10.f;
			}

			HUD.DrawHealthBar(m_HealthBarMIC,friendly,ScreenLoc,Canvas, m_fVehicleHealthBarPlacementX, (Occupied()) ? m_fVehicleHealthBarPlacementY + 10.0 : m_fVehicleHealthBarPlacementY, m_fVehicleHealthBarWidth, m_fVehicleHealthBarHeight);
			HUD.DrawMarkerText((PlayerReplicationInfo == none || Seats[0].bSeatVisible) ? m_sName : PlayerReplicationInfo.PlayerName, friendly, NameLoc, Canvas);

			bVehicleHasFriend = RenderDriverPassengerMarker(Canvas, friendly, HUD, TrPC);
		}

		if (bNoColor)
		{
			RenderColor = class'TrHUD'.default.MarkerColorNone;
		}
		else if (bVehicleHasFriend)
		{
			RenderColor = class'TrHUD'.default.MarkerColorEnemy_IsFriend;
		}
		else
		{
			RenderColor = class'TrHUD'.default.MarkerColorEnemy;
		}

		m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', VehicleMarker);
		m_MarkerMIC.SetVectorParameterValue('HudItem_Color', RenderColor);
		if (VehicleMarker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, ScreenLoc, Canvas, vect2d(VehicleMarker.SizeX, VehicleMarker.SizeY));
		}

        return;
	}

	// Make sure not behind weapon
	if ( UTPawn(PC.Pawn) != None )
	{
		Weap = UTWeapon(UTPawn(PC.Pawn).Weapon);

		if ( (Weap != None) && Weap.CoversScreenSpace(screenLoc, Canvas) )
		{
			return;
		}
	}

	if (!HUD.bCrosshairOnFriendly
		&& (Abs(screenLoc.X - (Canvas.ClipX * 0.5)) < 0.1 * Canvas.ClipX)
		&& (Abs(screenLoc.Y - (Canvas.ClipY * 0.5)) < 0.1 * Canvas.ClipY))
	{
		// check if top to bottom crosses center of screen
		xloc = Canvas.Project(Location - GetCollisionHeight()*vect(0,0,1));

        // We will show green crosshair even if not visisble.
		if ( xloc.Y >= 0.5*Canvas.ClipY )
		{
			HUD.bCrosshairOnFriendly = true;
		}

        // Only show name if the player is visiable to us.
        if (bPostRenderTraceSucceeded)
        {
            ShowHeaderUntil = (WorldInfo.TimeSeconds + 1.0);
        }
	}

	if( TrPRI != none )
	{
		switch( TrPRI.GetArmorType() )
		{
			case ARMOR_Light:
				VehicleMarker = Class'TrHUD'.default.VehicleMarkerLight;
				break;
			case ARMOR_Medium:
				VehicleMarker = Class'TrHUD'.default.VehicleMarkerMedium;
				break;
			case ARMOR_Heavy:
				VehicleMarker = Class'TrHUD'.default.VehicleMarkerHeavy;
				break;
		}
	}
	else
	{
		VehicleMarker = Class'TrHUD'.default.VehicleMarkerNoDriver;
		bNoColor = true;
	}

	if (ShowHeaderUntil > WorldInfo.TimeSeconds)
	{
		// Driver.
		NameLoc = screenLoc;
		NameLoc.X += HUD.m_fVehicleNamePlacementX;
		NameLoc.Y += HUD.m_fVehicleNamePlacementY;

		if( Occupied() )
		{
			NameLoc.Y -= 10.f;
		}

		HUD.DrawHealthBar(m_HealthBarMIC,friendly,ScreenLoc,Canvas, m_fVehicleHealthBarPlacementX, (Occupied()) ? m_fVehicleHealthBarPlacementY + 10.0 : m_fVehicleHealthBarPlacementY, m_fVehicleHealthBarWidth, m_fVehicleHealthBarHeight);
		HUD.DrawMarkerText((PlayerReplicationInfo == none || Seats[0].bSeatVisible) ? m_sName : PlayerReplicationInfo.PlayerName, friendly, NameLoc, Canvas);

		bVehicleHasFriend = RenderDriverPassengerMarker(Canvas, friendly, HUD, TrPC);
	}

	if (bNoColor)
	{
		RenderColor = class'TrHUD'.default.MarkerColorNone;
	}
	else if (bVehicleHasFriend)
	{
		RenderColor = class'TrHUD'.default.MarkerColorFriendly_IsFriend;
	}
	else
	{
		RenderColor = class'TrHUD'.default.MarkerColorFriendly;
	}
	m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', VehicleMarker);
	m_MarkerMIC.SetVectorParameterValue('HudItem_Color', RenderColor);
	if (VehicleMarker != none)
	{
		HUD.DrawMICMarker(m_MarkerMIC, ScreenLoc, Canvas, vect2d(VehicleMarker.SizeX, VehicleMarker.SizeY));
	}
}

simulated function bool RenderDriverPassengerMarker(Canvas Canvas, bool friendly, TrHUD HUD, TrPlayerController TrPC)
{
	local bool    bHasAsFriend, bMutualFriends, bVehicleHasFriend;
	local float   SeatHealth;
	local int     i;
	local vector  SeatLocation, PassengerScreenLoc, NameLoc;
	local Rotator SeatRotation;
	local MaterialInstanceConstant PassengerHealthBarMIC;
	local TrPlayerReplicationInfo PawnTrPRI;

	// Visible driver.
	if( Driver != none && PlayerReplicationInfo != none && Seats[0].bSeatVisible )
	{
		Mesh.GetSocketWorldLocationAndRotation(Seats[0].CameraTag, SeatLocation, SeatRotation);
		PassengerScreenLoc = Canvas.Project(SeatLocation + GetCollisionHeight()*vect(0,0,1));

		PawnTrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);
		if (PawnTrPRI != none && TrPC.m_bShowHUDFriendColoring)
		{
			bHasAsFriend = PawnTrPRI.c_bIsBuddyToLocalPlayer;
			bMutualFriends = PawnTrPRI.c_bIsMutualBuddiesWithLocalPlayer;
		}

		NameLoc = PassengerScreenLoc;
		NameLoc.X += HUD.m_fNamePlacementX;
		NameLoc.Y += HUD.m_fNamePlacementY;

		SeatHealth = float(Driver.Health) / float(Driver.HealthMax);

		if( m_DriverHealthBarMIC != none )
		{
			m_DriverHealthBarMIC.SetScalarParameterValue('Scal_Health', SeatHealth);
			m_DriverHealthBarMIC.SetScalarParameterValue('SCAL_Friendly', friendly ? 1.0 : 0.0);
		}

		HUD.DrawHealthBar(m_DriverHealthBarMIC,friendly,PassengerScreenLoc,Canvas, HUD.m_fHealthBarPlacementX, HUD.m_fHealthBarPlacementY, HUD.m_fHealthBarWidth, HUD.m_fHealthBarHeight);
		HUD.DrawMarkerText(PlayerReplicationInfo.PlayerName, friendly, NameLoc, Canvas, (friendly && bHasAsFriend) || (!friendly && bMutualFriends));

		bVehicleHasFriend = bVehicleHasFriend || (friendly && bHasAsFriend) || (!friendly && bMutualFriends);
	}

	// Loop through the passengers and render them.
	for (i = 0; i < 4; i++)
	{
		// Which MIC are we using?
		if (i == 0) PassengerHealthBarMIC = m_Passenger1HealthBarMIC;
		if (i == 1) PassengerHealthBarMIC = m_Passenger2HealthBarMIC;
		if (i == 2) PassengerHealthBarMIC = m_Passenger3HealthBarMIC;
		if (i == 3) PassengerHealthBarMIC = m_Passenger4HealthBarMIC;

		if( PassengerPRI[i] != none && !Seats[i+1].bSeatVisible )
		{
			Mesh.GetSocketWorldLocationAndRotation(Seats[i+1].CameraTag, SeatLocation, SeatRotation);
			PassengerScreenLoc = Canvas.Project(SeatLocation + GetCollisionHeight()*vect(0,0,1));

			NameLoc = PassengerScreenLoc;
			NameLoc.X += HUD.m_fNamePlacementX;
			NameLoc.Y += HUD.m_fNamePlacementY;

			SeatHealth = float(Passenger[i].Health) / float(Passenger[i].HealthMax);

			if( PassengerHealthBarMIC != none )
			{
				PassengerHealthBarMIC.SetScalarParameterValue('Scal_Health', SeatHealth);
				PassengerHealthBarMIC.SetScalarParameterValue('SCAL_Friendly', friendly ? 1.0 : 0.0);
			}

			HUD.DrawHealthBar(PassengerHealthBarMIC,friendly,PassengerScreenLoc,Canvas, HUD.m_fHealthBarPlacementX, HUD.m_fHealthBarPlacementY, HUD.m_fHealthBarWidth, HUD.m_fHealthBarHeight);
			HUD.DrawMarkerText(PassengerPRI[i].PlayerName, friendly, NameLoc, Canvas, (friendly && bHasAsFriend) || (!friendly && bMutualFriends));

			bVehicleHasFriend = bVehicleHasFriend || (friendly && bHasAsFriend) || (!friendly && bMutualFriends);
		}
	}

	return bVehicleHasFriend;
}

function SetSeatStoragePawn(int SeatIndex, Pawn PawnToSit)
{
	local int Mask;

	Seats[SeatIndex].StoragePawn = PawnToSit;

	//$$BE Changed to assignment of PassengerPRI
	if ( (SeatIndex > 0) && (Role == ROLE_Authority) )
	{
		if (PawnToSit == none)
			PassengerPRI[SeatIndex-1] = none;
		else if (PawnToSit.PlayerReplicationInfo != none)
			PassengerPRI[SeatIndex-1] = PawnToSit.PlayerReplicationInfo;
		else
			PassengerPRI[SeatIndex-1] = Seats[SeatIndex].SeatPawn.PlayerReplicationInfo;
	}

	Mask = 1 << SeatIndex;

	if ( PawnToSit != none )
	{
		SeatMask = SeatMask | Mask;
	}
	else
	{
		if ( (SeatMask & Mask) > 0)
		{
			SeatMask = SeatMask ^ Mask;
		}
	}

	if ( (SeatIndex > 0) && (Role == ROLE_Authority) )
	{
		Passenger[SeatIndex-1] = PawnToSit;
	}
    
    // Make sure we disable skiing, just in case the pawn sitting was skiing while entering the vehicle.
	if( PawnToSit != none )
	{
		TrPawn(PawnToSit).m_RidingVehicle = self;

		TrPawn(PawnToSit).SetSkiing(FALSE);
	}
}

/**
 * Retrieves important SVehicle debug information as an array of strings. That can then be dumped or displayed on HUD.
 */
simulated function GetSVehicleDebug( out Array<String> DebugInfo )
{
	super.GetSVehicleDebug(DebugInfo);
	if( Controller != none )
	{
		DebugInfo[DebugInfo.Length] = "----Controller----: ";
		DebugInfo[DebugInfo.Length] = "Rotation: "$Controller.Rotation;
		DebugInfo[DebugInfo.Length] = "----Boost----: ";
		DebugInfo[DebugInfo.Length] = "Current Power Pool: "$m_fCurrentPowerPool;
	}
}

/**
 * Create all of the vehicle weapons
 */
function InitializeSeats()
{
	local int i;

	if (Seats.Length==0)
	{
		destroy();
		return;
	}

	for(i=0;i<Seats.Length;i++)
	{
		// Seat 0 = Driver Seat.  It doesn't get a WeaponPawn

		if (i>0)
		{
			if( !Seats[i].m_bAttachPawnDirectly )
			{
	   			Seats[i].SeatPawn = Spawn(class'TrWeaponPawn');
	   			Seats[i].SeatPawn.SetBase(self);
				Seats[i].Gun = UTVehicleWeapon(Seats[i].SeatPawn.InvManager.CreateInventory(Seats[i].GunClass));
				Seats[i].Gun.SetBase(self);
				Seats[i].SeatPawn.EyeHeight = Seats[i].SeatPawn.BaseEyeheight;
				UTWeaponPawn(Seats[i].SeatPawn).MyVehicleWeapon = UTVehicleWeapon(Seats[i].Gun);
				UTWeaponPawn(Seats[i].SeatPawn).MyVehicle = self;
	   			UTWeaponPawn(Seats[i].SeatPawn).MySeatIndex = i;

	   			if ( Seats[i].ViewPitchMin != 0.0f )
	   			{
					UTWeaponPawn(Seats[i].SeatPawn).ViewPitchMin = Seats[i].ViewPitchMin;
				}
				else
	   			{
					UTWeaponPawn(Seats[i].SeatPawn).ViewPitchMin = ViewPitchMin;
				}


	   			if ( Seats[i].ViewPitchMax != 0.0f )
	   			{
					UTWeaponPawn(Seats[i].SeatPawn).ViewPitchMax = Seats[i].ViewPitchMax;
				}
				else
	   			{
					UTWeaponPawn(Seats[i].SeatPawn).ViewPitchMax = ViewPitchMax;
				}
			}
		}
		else
		{
			Seats[i].SeatPawn = self;
			Seats[i].Gun = UTVehicleWeapon(InvManager.CreateInventory(Seats[i].GunClass));
			Seats[i].Gun.SetBase(self);
		}

		if (Seats[i].SeatPawn != none)
		{
			Seats[i].SeatPawn.DriverDamageMult = Seats[i].DriverDamageMult;
			Seats[i].SeatPawn.bDriverIsVisible = Seats[i].bSeatVisible;
		}

		if (Seats[i].Gun!=none)
		{
			UTVehicleWeapon(Seats[i].Gun).SeatIndex = i;
			UTVehicleWeapon(Seats[i].Gun).MyVehicle = self;
			TrVehicleWeapon(Seats[i].Gun).InitVehicleGun();
		}

		// Cache the names used to access various variables
   	}
}

function bool PassengerEnter(Pawn P, int SeatIndex)
{
	local TrPawn aPawn;
	local bool bSuccess;
	local TrGame TrG;

	aPawn = TrPawn(P);
	if (aPawn == none)
		return false;

	if (!CanArmorEnterVehicle(aPawn.GetCurrCharClassInfo()))
		return false;

	ResetResetTime();

	if( Seats[SeatIndex].m_bAttachPawnDirectly && SeatIndex > 0 )
	{
		aPawn.StartRidingInVehicle(self, SeatIndex);
		bSuccess = true;
	}
	else
	{
		bSuccess = super.PassengerEnter(P, SeatIndex);
	}

	if( bSuccess )
	{
		// Notify the missile manager.
		TrG = TrGame(WorldInfo.Game);
		if( TrG != none && TrG.m_SeekingMissileManager != none )
		{
			TrG.m_SeekingMissileManager.PawnEnteredVehicle(aPawn, self, SeatIndex);
		}
	}

	return bSuccess;
}

simulated function AttachDriver(Pawn P)
{
    Super.AttachDriver(P);

	MigrateVehicleSounds(P, true);
}

simulated function AttachRidingPawn(TrPawn PawnToSit, int SeatIndex)
{
	local TrDeviceAttachment WeaponAttachment;

    SetSeatStoragePawn(SeatIndex, PawnToSit);

	PawnToSit.SetCollision(false, false);
	PawnToSit.bCollideWorld = false;
	PawnToSit.SetBase(none);
	PawnToSit.SetHardAttach(true);
	PawnToSit.SetLocation( Location );
	PawnToSit.SetPhysics( PHYS_None );
	PawnToSit.SetWeaponAttachmentVisibility(true);

	if (Seats[SeatIndex].SeatSocket != '')
	{
		PawnToSit.SetBase( Self, , Mesh, Seats[SeatIndex].SeatSocket);
	}
	else
	{
		PawnToSit.SetBase( Self );
	}
	PawnToSit.SetPhysics( PHYS_None );
	PawnToSit.SetRelativeLocation( Seats[SeatIndex].SeatOffset );
	PawnToSit.SetRelativeRotation( Seats[SeatIndex].SeatRotation );
	
	if( PawnToSit.Mesh != none )
	{
		PawnToSit.Mesh.SetTranslation(Seats[SeatIndex].m_vRidingPassengerMeshOffset);
	}

	UpdateSeatAnimations(PawnToSit, SeatIndex);
	MigrateVehicleSounds(PawnToSit, true);

	WeaponAttachment = TrDeviceAttachment(PawnToSit.CurrentWeaponAttachment);
	if( WeaponAttachment != none )
	{
		WeaponAttachment.InitAnims(PawnToSit);
	}
}

simulated function DetachRidingPawn(TrPawn PawnLeft)
{
	MigrateVehicleSounds(PawnLeft, false);
}

simulated function UpdateSeatAnimations(TrPawn PawnToSit, int SeatIndex)
{
	local AnimSet SeatAnimSet;
	local EArmorType ArmorType;
	local int i;
	local TrPlayerReplicationInfo TrPRI;
	local class<TrSkin> PlayerSkin;
	local VehicleSeatAnimInfo SeatAnimInfo;

	if (!Seats[SeatIndex].bSeatVisible)
	{
		return;
	}

	if (Seats[SeatIndex].m_SeatAnimInfo.Length == 0)
	{
		;
		return;
	}

	// Get the armor type and animation information for the seat.
	ArmorType = PawnToSit.GetArmorType();
	SeatAnimInfo = Seats[SeatIndex].m_SeatAnimInfo[0];
	// Short circuit here, since we default to the 0th element here no need to loop through it.
	for (i = 1; i < Seats[SeatIndex].m_SeatAnimInfo.Length; i++)
	{
		// The armor type needs to match, and if we are faction dependent team numbers need to match.
		if ((!Seats[SeatIndex].m_SeatAnimInfo[i].bIsArmorDependent || Seats[SeatIndex].m_SeatAnimInfo[i].ArmorType == ArmorType) && 
			(!Seats[SeatIndex].m_SeatAnimInfo[i].bIsFactionDependent || Seats[SeatIndex].m_SeatAnimInfo[i].TeamType == PawnToSit.GetTeamNum()))
		{
			SeatAnimInfo = Seats[SeatIndex].m_SeatAnimInfo[i];
		}
	}

	SeatAnimSet = SeatAnimInfo.SeatAnimSet;
	TrPRI = TrPlayerReplicationInfo(PawnToSit.PlayerReplicationInfo);
	if (TrPRI != none && SeatIndex > 0)
	{
		// See if this skin has an animation override.
		PlayerSkin = TrPRI.GetCurrentSkinClass(PawnToSit.GetCurrCharClassInfo());
		if (PlayerSkin.default.VehicleSkins.Length > 0)
		{
			for (i = 0; i < PlayerSkin.default.VehicleSkins.Length; i++)
			{
				// Do the vehicle classes  match?
				if (PlayerSkin.default.VehicleSkins[i].VehicleClass == Class)
				{
					SeatAnimSet = PlayerSkin.default.VehicleSkins[i].SeatAnimSet;
				}
			}
		}
	}

	if (Seats[SeatIndex].bSeatVisible && SeatAnimSet != none)
	{
		// Only apply the anim set if it isn't applied already.
		if (PawnToSit != none && 
			PawnToSit.Mesh != none)
		{
			// Update the seat animations.
			if (SeatAnimInfo.bClearAnimSet)
			{
				PawnToSit.Mesh.AnimSets.Remove(0, PawnToSit.Mesh.AnimSets.Length);
			}
			PawnToSit.Mesh.AnimSets.AddItem(SeatAnimSet);
			PawnToSit.Mesh.SetAnimTreeTemplate(SeatAnimInfo.SeatAnimTree);
			PawnToSit.Mesh.UpdateAnimations();

			if (SeatIndex == 0)
				PawnToSit.Mesh.SetTranslation(vect(0,0,0));

			// Play the enter animation.
			if (PawnToSit.m_VehicleBlendNode != none)
				PawnToSit.m_VehicleBlendNode.PlayEnterAnim();
		}
    }
}

/** ignore 'holdgameobject' calls in vehicles */
simulated event HoldGameObject(UDKCarriedObject GameObj)
{
}

/** handles dealing with any flag the given driver/passenger may be holding */
function HandleEnteringFlag(UTPlayerReplicationInfo EnteringPRI, int SeatIndex)
{
	local UTCarriedObject FlagActor;

	FlagActor = EnteringPRI.GetFlag();

	if (EnteringPRI.bHasFlag)
	{
		// If we can't carry the flag in the vehicle or the seat we (somehow) got into can't carry the flag, drop it.
		if (!bCanCarryFlag || !Seats[SeatIndex].ValidFlagSeat)
		{
			FlagActor.Drop();

			return;
		}

		// Attach the flag to the necessary position for the seat we are at.
		if (Seats[SeatIndex].FlagSocketName == '')
		{
			FlagActor.BaseBoneName = '';
			FlagActor.BaseSkelComponent = None;
			FlagActor.SetBase(self);
		}
		else
		{
			FlagActor.SetBase(self,,Mesh,Seats[SeatIndex].FlagSocketName);
		}
		FlagActor.SetRelativeRotation(Seats[SeatIndex].FlagRotation);
		FlagActor.SetRelativeLocation(Seats[SeatIndex].FlagOffset);
	}
}

function bool RidingPawnLeave(int SeatIndex, bool bForceLeave)
{
	local TrGame TrG;
	local TrPawn RidingPawn;
	local class<TrFamilyInfo> TrFI;
	local float VelocityInheritPct;

	if (Role < ROLE_Authority)
	{
		;
		ScriptTrace();
		return false;
	}

	if( !bForceLeave && !WorldInfo.Game.CanLeaveVehicle(self, Driver) )
	{
		return false;
	}

	// Before we can exit, we need to find a place to put the pawn.
	// Iterate over array of possible exit locations.
	RidingPawn = TrPawn(Seats[SeatIndex].StoragePawn);
	if ( RidingPawn != None )
    {
		// Notify the missile manager.
		TrG = TrGame(WorldInfo.Game);
		if( TrG != none && TrG.m_SeekingMissileManager != none )
		{
			TrG.m_SeekingMissileManager.PawnLeftVehicle(RidingPawn, self);
		}

	    RidingPawn.SetHardAttach(false);
	    RidingPawn.bCollideWorld = true;
	    RidingPawn.SetCollision(true, true);

		if ( !PlaceExitingDriver(RidingPawn) )
	    {
			if ( !bForceLeave )
			{
				// If we could not find a place to put the driver, leave driver inside as before.
			    RidingPawn.SetHardAttach(true);
				RidingPawn.bCollideWorld = false;
				RidingPawn.SetCollision(false, false);
				return false;
			}
			else
			{
				RidingPawn.SetLocation(GetTargetLocation());
			}
	    }

		SetSeatStoragePawn(SeatIndex, none);
		RidingPawn.StopRidingInVehicle();
		
	}

	// Determine the speed that the pawn inherits speed at, default is 100%.
	VelocityInheritPct = 1.0f;
	TrFI = RidingPawn.GetCurrCharClassInfo();
	if (TrFI != none)
	{
		VelocityInheritPct = TrFI.default.m_fVehicleSpeedInheritPercent;
	}

	// Inherit the speed of the vehicle.
	RidingPawn.Velocity = Velocity * VelocityInheritPct + vect(0,0,200);

	// Limit the velocity that the pawn can have when leaving.
	if( m_fMaxPawnLeaveSpeed * m_fMaxPawnLeaveSpeed > VSizeSq(RidingPawn.Velocity) )
	{
		RidingPawn.Velocity = Normal(RidingPawn.Velocity) * m_fMaxPawnLeaveSpeed;
	}

	Seats[SeatIndex].StoragePawn = None;

	if (!Occupied())
	{
		ResetTime = WorldInfo.TimeSeconds + m_fTimeToReset;
	}

	return true;	
}

function bool DriverEnter(Pawn P)
{
	local TrPawn aPawn;
	local bool bSuccess;
	local TrGame TrG;

	aPawn = TrPawn(P);
	if (aPawn == none)
		return false;

	SyncClientCurrentPowerPool();

	// Can we drive?
	if (!CanArmorDriveVehicle(aPawn.GetCurrCharClassInfo()))
	{
		return PassengerEnter(P, GetFirstAvailableSeat());
	}

	ResetResetTime();

	bSuccess = super.DriverEnter(P);

	if( bSuccess )
	{
		// Notify the missile manager.
		TrG = TrGame(WorldInfo.Game);
		if( TrG != none && TrG.m_SeekingMissileManager != none )
		{
			TrG.m_SeekingMissileManager.PawnEnteredVehicle(aPawn, self, 0);
		}
	}

	return bSuccess;
}

simulated function PlayerReplicationInfo GetSeatPRI(int SeatNum)
{
	// TODO: Get this working for riding passengers.

	if ( Role == ROLE_Authority && Seats[SeatNum].SeatPawn != None )
	{
		return Seats[SeatNum].SeatPawn.PlayerReplicationInfo;
	}
	else
	{
		return (SeatNum==0) ? PlayerReplicationInfo : PassengerPRI[SeatNum-1];
	}
}

// Overwrite ServerChangeSeat so that we always must use the TrVersion (which supports riding passengers).
reliable server function ServerChangeSeat(int RequestedSeat);
// Network: Authority.
function SwitchSeat(int RequestedSeat, Controller ControllerRequestingSeatChange)
{
	//`log("Server receieved request to "@RequestedSeat@"From"@ControllerRequestingSeatChange);
	if ( RequestedSeat == -1 )
	{
		DriverLeave(false);
	}
	else
	{
		ChangeSeat(ControllerRequestingSeatChange, RequestedSeat);
	}
}

function bool ChangeSeat(Controller ControllerToMove, int RequestedSeat)
{
	local bool bHasFlag;
	local int OldSeatIndex;
	local Pawn OldPawn;

	// Make sure we are looking to switch to a valid seat
	if ( (RequestedSeat >= Seats.Length) || (RequestedSeat < 0) )
	{
		return false;
	}

	// get the seat index of the pawn looking to move.
	OldSeatIndex = GetSeatIndexForController(ControllerToMove);
	if (OldSeatIndex == -1)
	{
		// Couldn't Find the controller, should never happen
		;
		return false;
	}

	OldPawn = Seats[OldSeatIndex].StoragePawn;

	// Do we have the flag?
	if (OldPawn.PlayerReplicationInfo != none && OldPawn.PlayerReplicationInfo.IsA('TrPlayerReplicationInfo'))
		bHasFlag = TrPlayerReplicationInfo(OldPawn.PlayerReplicationInfo).bHasFlag;

	if (SeatAvailable(RequestedSeat))
	{
		if( Seats[OldSeatIndex].m_bAttachPawnDirectly )
		{
			// Make the riding pawn leave his current seat.
			RidingPawnLeave(OldSeatIndex, true);
		}
		else
		{
			// Leave the current seat and take over the new one
			Seats[OldSeatIndex].SeatPawn.DriverLeave(true);
		}

		// If we have the flag and the seat we want to go to doesn't allow the flag, don't allow the change.
		if (bHasFlag && !Seats[RequestedSeat].ValidFlagSeat)
			return false;

		// Take the new seat.
		if (RequestedSeat == 0)
		{
			DriverEnter(OldPawn);
		}
		else
		{
			PassengerEnter(OldPawn, RequestedSeat);
		}
	}
	return true;
}

//UDKVehicleBase uses this to switch seats, but we need switch weapons to actually work for riding pawns.
simulated function SwitchWeapon(byte NewGroup);

simulated function int GetSeatIndexForController(controller ControllerToMove)
{
	local int i;
	for (i=0;i<Seats.Length;i++)
	{
		if( Seats[i].m_bAttachPawnDirectly && Seats[i].StoragePawn != none && Seats[i].StoragePawn.Controller == ControllerToMove)
		{
			return i;
		}
	}
	return super.GetSeatIndexForController(ControllerToMove);
}

simulated function int GetSeatIndexForStoragePawn(pawn P)
{
	local int i;

	for (i=0;i<Seats.Length;i++)
	{
		if( Seats[i].StoragePawn == P )
		{
			return i;
		}
	}
	return INDEX_None;
}

function bool PlaceExitingDriver(optional Pawn ExitingDriver)
{
	local int OldSeatIndex;
	local vector TryPlace, SeatLocation;
	local Rotator SeatRotation;

	if ( ExitingDriver == None )
		ExitingDriver = Driver;

	if ( ExitingDriver == None )
		return false;

	OldSeatIndex = GetSeatIndexForStoragePawn(ExitingDriver);
	if( !IsZero(Seats[OldSeatIndex].m_vIdealExitLocation) )
	{
		Mesh.GetSocketWorldLocationAndRotation(Seats[OldSeatIndex].SeatSocket, SeatLocation, SeatRotation);
		TryPlace = SeatLocation + Seats[OldSeatIndex].m_vIdealExitLocation;

		if (TryExitPos(ExitingDriver, TryPlace, false))
		{
			return true;
		}
	}

	// If the ideal exit location method failed, use the standard vehicle method.
	return super.PlaceExitingDriver(ExitingDriver);
}


function bool TryExitPos(Pawn ExitingDriver, vector ExitPos, bool bMustFindGround)
{
	local vector Slice, HitLocation, HitNormal, StartLocation, NewActorPos;

	//DrawDebugBox(ExitPos, ExitingDriver.GetCollisionExtent(), 255,255,0, TRUE);

	Slice = ExitingDriver.GetCollisionRadius() * vect(1,1,0);
	Slice.Z = 2;

	// First, do a line check (stops us passing through things on exit).
	StartLocation = GetTargetLocation();
	if( Trace(HitLocation, HitNormal, ExitPos, StartLocation, false, Slice) != None )
	{
		return false;
	}

	NewActorPos = ExitPos + (ExitingDriver.GetCollisionHeight()+ExitingDriver.MaxStepHeight)*vect(0,0,1);

	// Check this wont overlap this vehicle.
	if( PointCheckComponent(Mesh, NewActorPos, ExitingDriver.GetCollisionExtent()) )
	{
		return false;
	}

	// try placing driver on floor
	return ExitingDriver.SetLocation(NewActorPos);
}

/**
 * @Returns true if a seat is not occupied
 */
function bool SeatAvailable(int SeatIndex)
{
	if( Seats[SeatIndex].m_bAttachPawnDirectly )
	{
		if( Seats[SeatIndex].StoragePawn == none )
		{
			return true;
		}
		return false;
	}
	else if( Seats[SeatIndex].SeatPawn == none || Seats[SeatIndex].SeatPawn.Controller == none )
	{
		return true;
	}
	return false;
}

/**
 * @return true if there is a seat
 */
function bool AnySeatAvailable()
{
	local int i;

	for (i = 0;i < Seats.Length; i++)
	{
		if (Seats[i].m_bAttachPawnDirectly && Seats[i].StoragePawn == none)
		{
			return true;
		}
		if (Seats[i].SeatPawn != none && Seats[i].SeatPawn.Controller==none)
		{
			return true;
		}
	}

	return false;
}

/**
 * This function returns the aim for the weapon
 */
function rotator GetWeaponAim(UTVehicleWeapon VWeapon)
{
	local vector SocketLocation, CameraLocation, DesiredAimPoint;
	local rotator CameraRotation, SocketRotation;
	local Controller C;
	local PlayerController PC;

	if ( VWeapon != none )
	{
		C = Seats[VWeapon.SeatIndex].SeatPawn.Controller;

		PC = PlayerController(C);
		if (PC != None)
		{
			PC.GetPlayerViewPoint(CameraLocation, CameraRotation);
			DesiredAimPoint = CameraLocation + Vector(CameraRotation) * VWeapon.GetTraceRange();
		}
		else if (C != None)
		{
			DesiredAimPoint = C.GetFocalPoint();
		}

		if ( Seats[VWeapon.SeatIndex].GunSocket.Length>0 )
		{
			GetBarrelLocationAndRotation(VWeapon.SeatIndex, SocketLocation, SocketRotation);
			if(VWeapon.bIgnoreSocketPitchRotation || ((DesiredAimPoint.Z - Location.Z)<0 && VWeapon.bIgnoreDownwardPitch))
			{
				SocketRotation.Pitch = Rotator(DesiredAimPoint - Location).Pitch;
			}
		}
		else
		{
			SocketLocation = Location;
			SocketRotation = Rotator(DesiredAimPoint - Location);
		}

		return rotator(DesiredAimPoint - SocketLocation);
	}
	return Rotation;
}

simulated function WeaponRotationChanged(int SeatIndex)
{
	local TrPlayerController TrPC;
	local TrWeaponPawn TrWP;
	local TrVehicle TrV;

	// Only update the weapon rotation if we are not controlling the local weapon.
	TrPC = TrPlayerController(GetALocalPlayerController());
	if (TrPC != none)
	{
		TrWP = TrWeaponPawn(TrPC.Pawn);
		if (TrWP != none && TrWP.MyVehicle == self && TrWP.MySeatIndex == SeatIndex)
		{
			return;
		}

		TrV = TrVehicle(TrPC.Pawn);
		if (TrV != none && TrV == self && SeatIndex == 0)
		{
			return;
		}
	}

	super.WeaponRotationChanged(SeatIndex);
}

function bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType)
{
	if (Health <= 0 || Health >= HealthMax || Amount <= 0 || Healer == None)
		return false;

	Amount = Min(Amount * LinkHealMult, HealthMax - Health);
	Health += Amount;

	bForceNetUpdate = TRUE;

	return true;
}

//
//	Call with negative damage amount to provide healing
//
simulated function DoRepairs(int HealAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int i;
	local class<UTDamageType> UTDamage;

	// Make sure somebody actively sitting in the vehicle isn't trying to repair us.
	if( DamageType != class'TribesGame.TrDmgType_RepairDeployable' )
	{
		for (i = 0; i < Seats.Length; i++)
		{
			if (Seats[i].StoragePawn != none && Seats[i].StoragePawn.Controller == EventInstigator)
				return;
		}
	}

	if (EventInstigator.GetTeamNum()==GetTeamNum() && HealAmount<0)
	{
		CheckHitInfo( HitInfo, Mesh, Normal(Momentum), HitLocation );

		LastTakeHitInfo.Damage = HealAmount;
		LastTakeHitInfo.HitLocation = HitLocation;
		LastTakeHitInfo.Momentum = Momentum;
		LastTakeHitInfo.DamageType = DamageType;
		LastTakeHitInfo.HitBone = HitInfo.BoneName;
		UTDamage = class<UTDamageType>(DamageType);
		LastTakeHitTimeout = WorldInfo.TimeSeconds + ( (UTDamage != None) ? UTDamage.static.GetHitEffectDuration(self, HealAmount)
									: class'UTDamageType'.static.GetHitEffectDuration(self, HealAmount) );

		HealDamage(-HealAmount, EventInstigator, DamageType);

		CheckDamageSmoke();

		if (!Occupied())
		{
			// Since this vehicle is being repaired, reset the reset time.
			ResetTime = WorldInfo.TimeSeconds + m_fTimeToReset;
		}
	}
}

function DriverRadiusDamage(float DamageAmount, 
							float DamageRadius, 
							Controller EventInstigator,
							class<DamageType> DamageType, 
							float Momentum, 
							vector HitLocation, 
							Actor DamageCauser, 
							optional float DamageFalloffExponent=1.f)
{
	local bool SeatFullDamage;
	local bool bIsBullet;
	local float SeatDamageAmt;
	local int i;
	local Pawn P;
	local TraceHitInfo HitInfo;
	local vector OutHurtLoc;
	local Vehicle V;
	local TrProjectile TrProj;

	TrProj = TrProjectile(DamageCauser);
	if (TrProj != none)
	{
		bIsBullet = TrProj.m_bIsBullet;
	}

	CheckHitInfo(HitInfo, Mesh, Location - HitLocation, OutHurtLoc);

	for (i = 0; i < Seats.Length; i++)
	{
		SeatFullDamage = HitInfo.BoneName == Seats[i].SeatBone;

		// If we are a bullet and didn't get a direct hit, ignore.
		if (bIsBullet && !SeatFullDamage)
			continue;
		// Dissipate the damage to the seat if we didn't get a direct hit.
		else if (SeatFullDamage)
			SeatDamageAmt = DamageAmount;
		else
			SeatDamageAmt = DamageAmount * Seats[i].DriverDamageMult;

		P = Seats[i].StoragePawn;
		V = Seats[i].SeatPawn;
		if (V != none && V.bDriverIsVisible)
		{
			if (EventInstigator != none && V.Driver != none && V.bAttachDriver && !V.Driver.bCollideActors && !V.Driver.bBlockActors)
			{
				V.Driver.TakeRadiusDamage(EventInstigator, SeatDamageAmt, DamageRadius, DamageType, Momentum, HitLocation, SeatFullDamage, DamageCauser, DamageFalloffExponent);
			}
		}
		else if (Seats[i].m_bAttachPawnDirectly && P != none)
		{
			P.TakeRadiusDamage(EventInstigator, SeatDamageAmt, DamageRadius, DamageType, Momentum, HitLocation, SeatFullDamage, DamageCauser, DamageFalloffExponent);
		}
	}
}

function Suicide()
{
	if (Driver != None)
		Driver.KilledBy(self);
	else
		KilledBy(self);
}

simulated function TakeRadiusDamage
(
	Controller			InstigatedBy,
	float				BaseDamage,
	float				DamageRadius,
	class<DamageType>	DamageType,
	float				Momentum,
	vector				HurtOrigin,
	bool				bFullDamage,
	Actor               DamageCauser,
	optional float      DamageFalloffExponent=1.f
)
{
	local vector HitLocation, Dir, NewDir;
	local float Dist, DamageScale;
	local TraceHitInfo HitInfo;

	if ( Role < ROLE_Authority )
		return;

	// calculate actual hit position on mesh, rather than approximating with cylinder
	HitLocation = Location;
	Dir = Location - HurtOrigin;

	CheckHitInfo( HitInfo, Mesh, Dir, HitLocation );
	NewDir = HitLocation - HurtOrigin;
	Dist = VSize(NewDir);

	if ( bFullDamage )
	{
		DamageScale = 1.f;
	}
	else if ( dist > DamageRadius )
		return;
	else
	{
		DamageScale = FMax(0,1 - Dist/DamageRadius);
		DamageScale = DamageScale ** DamageFalloffExponent;
	}

	RadialImpulseScaling = DamageScale;

	TakeDamage
	(
		BaseDamage,
		InstigatedBy,
		HitLocation,
		(DamageScale * Momentum * Normal(dir)),
		DamageType,
		HitInfo,
		DamageCauser
	);
	RadialImpulseScaling = 1.0;
	if (Health > 0)
	{
		DriverRadiusDamage(BaseDamage, DamageRadius, InstigatedBy, DamageType, Momentum, HurtOrigin, DamageCauser);
	}
}

simulated event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local Actor DamagingActor;
	local float ColRadius, ColHeight, DamageScale, Dist, BestMultiCrewedProtectionPct;
	local int i, NumPassengers;
	local TrPawn TrDriver, TrDamageCauser;
	local vector Dir;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local TR_EQUIP_POINT InstigatorWeaponEquipPoint;
	local class<TrDevice> DamageWeaponClass;
	local class<TrDmgType_Base> TrDamageType;
	local TrDeployableController TrDeployablePC;
	local bool bIsInstantHitDamage;
	local Weapon WeaponDamager;
	local TrProjectile TrProj;
	local vector HitInfoLoc, HitInfoNormal;
	local TrPlayerController DamageCauserTrPlayerController;
	local float VehicleDamageScaling;

	if ( DamageType == None ) return;

	// We are invulnerable.
	if (r_bIsInvulnerable && EventInstigator != Controller) return;

	TrDamageType = class<TrDmgType_Base>(DamageType);
	if( TrDamageType != none )
	{
		DamageWeaponClass = class<TrDevice>(TrDamageType.default.DamageWeaponClass);
	}

	TrProj = TrProjectile(DamageCauser);
	WeaponDamager = Weapon(DamageCauser);
	if (TrProj != none)
	{
		bIsInstantHitDamage = TrProj.m_bIsBullet;
	}
	else if (WeaponDamager != none)
	{
		bIsInstantHitDamage = WeaponDamager.WeaponFireTypes[WeaponDamager.CurrentFireMode] != EWFT_Projectile;
	}


	//`log(self@"Vehicle TAKE DAMAGE "@GetTeamNum()@EventInstigator.GetTeamNum());

	DamageScale = 1.0;
	DamagingActor = class'TrDmgType_Base'.static.GetActorCausingDamage(EventInstigator,DamageCauser);
	TrDeployablePC = TrDeployableController(EventInstigator);
	if (DamagingActor != none)
	{
		GetBoundingCylinder(ColRadius, ColHeight);
		Dir	= Location - DamagingActor.Location;
		if (TrProj != none)
		{
			if (TrProj.m_bIsBullet)
			{
				Dir = TrProj.r_vSpawnLocation - HitLocation;
			}
			else
			{
				Dir = Location - HitLocation;
			}
		}
		Dist = VSize(Dir);
		Dir	= Normal(Dir);
		Dist = FMax(Dist - ColRadius,0.f);

		DamageScale = class'TrDmgType_Base'.static.GetDamageScale(DamageCauser,Dist,TrDamageType);
	}

	if( EventInstigator != none && Damage > 0 )
	{
		TrDamageCauser = TrPawn(EventInstigator.Pawn);

		if( TrDamageCauser != none )
		{
			// Perk/Skill
			if( TrDeployablePC != none && TrDeployablePC.m_SpawnedFromController != none )
			{
				// A player's deployable has damaged this vehicle.
				TrPRI = TrPlayerReplicationInfo(TrDeployablePC.m_SpawnedFromController.PlayerReplicationInfo);

				if( TrPRI != none )
				{
					VM = TrPRI.GetCurrentValueModifier();
					if( VM != none )
					{
						DamageScale *= 1.0 + VM.m_fDeployedTurretArmorPenetrationBuffPct;
					}
				}
			}
			else
			{
				// A player is has damaged this vehicle.
				TrPRI = TrPlayerReplicationInfo(EventInstigator.PlayerReplicationInfo);

				if( TrPRI != none && DamageWeaponClass != none )
				{
					VM = TrPRI.GetCurrentValueModifier();
					if( VM != none )
					{
						InstigatorWeaponEquipPoint = TrPRI.GetEquipPointByWeaponId(DamageWeaponClass.default.DBWeaponId);
						if( InstigatorWeaponEquipPoint == EQP_Primary )
						{
							DamageScale *= 1.0 + VM.m_fPrimaryWeaponArmorPenetrationBuffPct;
						}
						else if( InstigatorWeaponEquipPoint == EQP_Secondary )
						{
							DamageScale *= 1.0 + VM.m_fSecondaryWeaponArmorPenetrationBuffPct;
						}
						else if( InstigatorWeaponEquipPoint == EQP_Belt )
						{
							DamageScale *= 1.0 + VM.m_fOffhandArmorPenetrationBuffPct;
						}
					}
				}
			}
		}
	}

	if (DamageScale <= 0)
	{
		// Find the controller for the player instigator.
		DamageCauserTrPlayerController = TrPlayerController(EventInstigator);
		if( DamageCauserTrPlayerController == none )
		{
			if( TrDeployablePC != none )
			{
				DamageCauserTrPlayerController = TrDeployablePC.m_SpawnedFromController;
			}
		}
	
		if( DamageCauserTrPlayerController != none )
		{
			DamageCauserTrPlayerController.ClientShowOverheadNumber(DamageScale * Damage, Location, Location.Z);
			DamageCauserTrPlayerController.FlashShooterHitReticule(DamageScale * Damage, bIsInstantHitDamage, GetTeamNum());
		}
		return;
	}

	// Loop through all passenger seats, lowering vehicle damage if they have a lower vehicle damage perk.
	if (Damage > 0)
	{
		// Check to see if we are eligible to receive a multi-crewed protection bonus.
		for (i = 0; i < Seats.Length; i++)
		{
			TrPRI = TrPlayerReplicationInfo(GetSeatPRI(i));
			if( TrPRI != none )
			{
				NumPassengers++;
				VM = TrPRI.GetCurrentValueModifier();
				if( VM != none && VM.m_fMultiCrewedVehicleDamageProtectionPct > BestMultiCrewedProtectionPct )
				{
					BestMultiCrewedProtectionPct = VM.m_fMultiCrewedVehicleDamageProtectionPct;
				}
			}
		}

		if( NumPassengers > 1 && BestMultiCrewedProtectionPct != 0.0 )
		{
			// Apply the protection from the strongest passenger.
			DamageScale *= 1.0 - BestMultiCrewedProtectionPct;
		}
	}

	Damage *= DamageScale;

	// Track statistics, accolades, awards
	if (Role == ROLE_Authority && EventInstigator != none )
	{
        LastHitInfo.Distance = 0;
		LastHitInfo.Type = DamageType;
		LastHitInfo.Causer = DamageCauser;
		LastHitInfo.Amount = Damage;

		// Recalculate distance from actual player if needed
		if (EventInstigator.Pawn != none && EventInstigator.Pawn != self)
		{
			Dir	= Location - EventInstigator.Pawn.Location;
			LastHitInfo.Distance = VSize(Dir);
		}
	}

	// healing?
	if (Damage < 0)
	{
        if (Stats != none && TrDamageType != none) Stats.UpdateDamage(TrPlayerController(EventInstigator), TrDamageType.default.DBWeaponId, Damage, LastHitInfo.Distance, false, true);
		DoRepairs(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

		return;
	}

	// Somehow we are trying to damage a teammate.
	if( !WorldInfo.GRI.r_bFriendlyFire && DamagingActor != none && DamagingActor.GetTeamNum() == GetTeamNum() && EventInstigator != Controller )
	{
		return;
	}

	if (EventInstigator != none)
	{
		// Find the controller for the player instigator.
		DamageCauserTrPlayerController = TrPlayerController(EventInstigator);
		if( DamageCauserTrPlayerController == none )
		{
			if( TrDeployablePC != none )
			{
				DamageCauserTrPlayerController = TrDeployablePC.m_SpawnedFromController;
			}
		}

		if( Role == ROLE_Authority )
		{
			if( DamageCauserTrPlayerController != none )
			{
				VehicleDamageScaling = DamageType.static.VehicleDamageScalingFor(self);
				DamageCauserTrPlayerController.ServerShowOverheadNumber(Damage * VehicleDamageScaling, class<TrDmgType_Base>(DamageType).static.ModifyOverheadNumberLocation(Location), Location.Z);
				DamageCauserTrPlayerController.FlashShooterHitReticule(Damage * VehicleDamageScaling, bIsInstantHitDamage, GetTeamNum());
			}
		}
	}

	super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

	// Apply damage as instant-hit as long as it's not a projectile.
	if (bIsInstantHitDamage)
	{
		if (HitInfo.BoneName == '' && DamageCauser != none)
		{
			Dir = Normal(DamageCauser.Velocity);
			DamageCauser.Trace(HitInfoLoc, HitInfoNormal, HitLocation + Dir * 16.0, HitLocation - Dir * 16.0, true, , HitInfo, TRACEFLAG_Bullet);
		}

		// Damage all visible seats.
		for (i = 0; i < Seats.length; i++)
		{
			if (!Seats[i].bSeatVisible)
				continue;

			// Do we have someone in the seat, and did we hit their bone?
			TrDriver = TrPawn(Seats[i].StoragePawn);
			if (TrDriver != none && Seats[i].SeatBone == HitInfo.BoneName)
			{
				TrDriver.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
			}
		}
	}

	if (Stats != none && TrDamageType != none)
	{
		if (Health <= 0) Stats.UpdateDamage(TrPlayerController(EventInstigator), TrDamageType.default.DBWeaponId, Damage, LastHitInfo.Distance, true, true);
		else Stats.UpdateDamage(TrPlayerController(EventInstigator), TrDamageType.default.DBWeaponId, Damage, LastHitInfo.Distance, false, true);
	}
}

simulated function CheckDamageSmoke()
{
	local float HealthPct;

	super.CheckDamageSmoke();

	// Update health related particles.
	HealthPct = float(Health) / float(HealthMax);
	if( HealthPct < 0.666 && HealthPct > 0.333 )
	{
		VehicleEvent('DamageEffectsMediumStart');
		VehicleEvent('DamageEffectsHeavyEnd');
	}
	else if( HealthPct <= 0.333 )
	{
		VehicleEvent('DamageEffectsMediumEnd');
		VehicleEvent('DamageEffectsHeavyStart');
	}
	else if ( HealthPct >= 0.666 )
	{
		VehicleEvent('DamageEffectsMediumEnd');
		VehicleEvent('DamageEffectsHeavyEnd');
	}
}

simulated function BlowupVehicle()
{
	VehicleEvent('DamageEffectsMediumEnd');
	VehicleEvent('DamageEffectsHeavyEnd');

	super.BlowupVehicle();
}

simulated function VehicleWeaponFireEffects(vector HitLocation, int SeatIndex)
{
	local TrVehicleWeapon aWeapon;

	aWeapon = TrVehicleWeapon(Seats[SeatIndex].Gun);
	if (aWeapon != none)
	{
		aWeapon.PlayFireEffects(0, HitLocation);
	}
	else
	{
		ThirdPersonFireEffects(HitLocation, SeatIndex);

		super.VehicleWeaponFireEffects(HitLocation, SeatIndex);
	}
}

simulated function VehicleWeaponStoppedFiring(bool bViaReplication, int SeatIndex)
{
	local class<TrVehicleWeapon> GunClass;
	local TrSkelControl_SpinControl SpinControl;

	super.VehicleWeaponStoppedFiring(bViaReplication, SeatIndex);

	GunClass = class<TrVehicleWeapon>(Seats[SeatIndex].GunClass);
	if (GunClass == none)
	{
		return;
	}

	// Stop the weapon spin control.
	if (GunClass.default.m_WeaponSpinControl != '')
	{
		SpinControl = TrSkelControl_SpinControl(Mesh.FindSkelControl(GunClass.default.m_WeaponSpinControl));
		if (SpinControl != none)
		{
			SpinControl.Spin(false);
		}
	}
}

simulated function ThirdPersonFireEffects(vector HitLocation, int SeatIndex)
{
	local class<TrVehicleWeapon> GunClass;
	local float HitDistance;
	local TrSkelControl_SpinControl SpinControl;
	local vector EffectLocation;

	GunClass = class<TrVehicleWeapon>(Seats[SeatIndex].GunClass);
	if (GunClass == none)
	{
		return;
	}

	EffectLocation = GetEffectLocation(SeatIndex);
	HitDistance = VSize(HitLocation - Instigator.Location);

    // Spawn a tracer.
    if( GunClass.default.m_bSpawnTracers && 
    	GunClass.default.WeaponFireTypes[0] == EWFT_InstantHit )
    {
        SpawnTracerEffect(GunClass.default.m_TracerType, EffectLocation, HitLocation, HitDistance);
    }

	// Spawn a tracer beam.
    if( GunClass.default.m_bSpawnTracerBeams && 
    	GunClass.default.m_TracerBeamTemplate != none && 
    	GunClass.default.WeaponFireTypes[0] == EWFT_InstantHit && 
    	HitDistance > GunClass.default.m_fShowTracerDistance )
    {
        SpawnTracerBeam(EffectLocation, HitLocation, GunClass.default.m_TracerBeamTemplate);
    }

	// Start the weapon spin control.
	if (GunClass.default.m_WeaponSpinControl != '')
	{
		SpinControl = TrSkelControl_SpinControl(Mesh.FindSkelControl(GunClass.default.m_WeaponSpinControl));
		if (SpinControl != none)
		{
			SpinControl.Spin(true);
		}
	}
}

simulated function SpawnTracerBeam(vector Start, vector End, ParticleSystem TracerBeamTemplate)
{
	local ParticleSystemComponent E;

	E = WorldInfo.MyEmitterPool.SpawnEmitter(TracerBeamTemplate, Start);
	E.SetVectorParameter('TracerEnd', End);
    E.SetDepthPriorityGroup(SDPG_World);
	E.SetTickGroup(TG_PostUpdateWork);
}

simulated function TrProj_Tracer SpawnTracerEffect(EWeaponTracerType TracerType, vector EffectLocation, vector HitLocation, float HitDistance)
{
    local TrProj_Tracer	SpawnedProjectile;
    local vector SpawnLoc;
    local rotator SpawnRot;

    SpawnLoc = EffectLocation;
    SpawnedProjectile = TrGameReplicationInfo(WorldInfo.GRI).m_TrObjectPool.GetTracer(TracerType, 0, SpawnLoc, SpawnRot);

    if ( (SpawnedProjectile != None) && !SpawnedProjectile.bDeleteMe )
    {
	    SpawnedProjectile.Instigator = Instigator;

	    // init!
	    SpawnedProjectile.InitTracer(SpawnLoc, HitLocation);
    }

    return SpawnedProjectile;
}

simulated function ProcessViewRotation(float DeltaTime, out rotator out_ViewRotation, out rotator out_DeltaRot)
{
	ProcessViewRotationBasedOnSeat(0, DeltaTime, out_ViewRotation, out_DeltaRot);
}

simulated function ProcessViewRotationBasedOnSeat(int SeatIndex, float DeltaTime, out rotator out_ViewRotation, out rotator out_DeltaRot)
{
	super.ProcessViewRotation(DeltaTime, out_ViewRotation, out_DeltaRot);
}

//TODO: Should we show useable icons????
simulated function bool ShouldShowUseable(PlayerController PC, float Dist)
{
	return false;
}

simulated function SetDriving(bool bNewDriving)
{
	// Ignore attempts to turn off physics on this vehicle if it isn't dead.
	if( Health > 0 && bNewDriving == false )
	{
		return;
	}
	else
	{
		Super.SetDriving(bNewDriving);
	}
}

/**
 * An interface for causing various events on the vehicle from native code.
 */
simulated event PlayVehicleEvent(name EventTag)
{
	VehicleEvent(EventTag);
}

/**
 * An interface for causing various events on the vehicle.
 */
simulated function VehicleEvent(name EventTag)
{
	// Cause/kill any effects
	TriggerVehicleEffect(EventTag);

	// Play any animations
	PlayVehicleAnimation(EventTag);

	// Play sounds on the client
	PlayClientVehicleSound(EventTag);
}

/**
 * Trigger or untrigger a vehicle sound
 *
 * @param	EventTag	The tag that describes the effect
 *
 */
reliable simulated client function PlayClientVehicleSound(name SoundTag)
{
	local bool isPlayerLocal;
	local int i;

	isPlayerLocal = IsLocalOnVehicle();

	for (i=0; i < VehicleSounds.Length; i++)
	{
		if (VehicleSounds[i].SoundEndTag == SoundTag)
		{
			if (VehicleSounds[i].SoundRef != none)
			{
				VehicleSounds[i].SoundRef.FadeOut(0.1, 0.0f);
				VehicleSounds[i].SoundRef = none;
			}
		}
		if (VehicleSounds[i].SoundStartTag == SoundTag)
		{
			if (VehicleSounds[i].SoundRef == none)
			{
				VehicleSounds[i].SoundRef = CreateAudioComponent(VehicleSounds[i].SoundTemplate, false, true);
			}
			if (VehicleSounds[i].SoundRef != none && (!VehicleSounds[i].SoundRef.bWasPlaying || VehicleSounds[i].SoundRef.bFinished))
			{
				// Disable spatialization for clients.
				if (isPlayerLocal)
					VehicleSounds[i].SoundRef.bAllowSpatialization = false;

				VehicleSounds[i].SoundRef.FadeIn(0.1, 1.0f);
			}
		}
	}
}

simulated function MigrateVehicleSounds(Pawn P, bool bIsRiding)
{
	local bool isPlayerLocal;
	local int i;

	isPlayerLocal = IsLocalOnVehicle(P);

	// Jump to 1P or 3P if the player is actually local.
	if (P != none)
	{
		for (i = 0; i < VehicleSounds.Length; i++)
		{
			// Disable spatialization if we are riding in the vehicle and we are local.
			if (VehicleSounds[i].SoundRef != none)
				VehicleSounds[i].SoundRef.bAllowSpatialization = !(bIsRiding && isPlayerLocal);
		}
	}
}

simulated function StopVehicleSounds()
{
	local int i;

	Super.StopVehicleSounds();
	
	// Stop playing the sound effects.
	for (i = 0; i < VehicleSounds.Length; i++)
	{
		if (VehicleSounds[i].SoundRef != none)
			VehicleSounds[i].SoundRef.FadeOut(0.1, 1.0f);

		VehicleSounds[i].SoundRef = none;
	}
}

simulated function bool CalcOtherWatchingCam( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV, TrPlayerController WatcherController )
{
	local vector CamStart, HitLocation, HitNormal, CamDirX, CamDirY, CamDirZ, CurrentCamOffset;
	local Rotator R;

	Mesh.GetSocketWorldLocationAndRotation(Seats[0].CameraTag,out_CamLoc,R);

	// Location.
	CamStart = Location + m_vDeathCamStartOffset;
	CurrentCamOffset = WatcherController.m_vDeathCamOffset;
		
	// Rotation.
	GetAxes(out_CamRot, CamDirX, CamDirY, CamDirZ);

	// Scale
	CamDirX *= WatcherController.m_fDeathCameraCurrentScale;

	// UT code sets LastCameraTimeStamp to 1.0s on initialization to force a refresh of the camera calculation. Don't 
	// interpolate when DeltaTime is 1.0s or else it will snap to the inner scale.
	if( WatcherController.m_fDeathCameraCurrentScale != WatcherController.m_fDeathCameraInnerScale && fDeltaTime != 1.0 ) 
	{
		// Zoom in to the inner scale.
		WatcherController.m_fDeathCameraCurrentScale = FInterpTo(WatcherController.m_fDeathCameraCurrentScale, WatcherController.m_fDeathCameraInnerScale, fDeltaTime, WatcherController.m_fDeathCameraInterpSpeed);
	}

	out_CamLoc = (CamStart - CamDirX*CurrentCamOffset.X + CurrentCamOffset.Y*CamDirY + CurrentCamOffset.Z*CamDirZ);
		
	if (Trace(HitLocation, HitNormal, out_CamLoc, CamStart, false, vect(12,12,12)) != None)
	{
		out_CamLoc = HitLocation;
		return false;
	}
	return true;
}

simulated function vector GetCameraFocus(int SeatIndex)
{
	local vector CamStart, HitLocation, HitNormal;
	local actor HitActor;
	local TrPlayerController TrPC;
	local name CameraTagName;
	local vector CameraBaseOffset;

	TrPC = TrPlayerController(GetControllerForSeatIndex(SeatIndex));
	if (TrPC != none && TrPC.GetZoomedState() != ZST_NotZoomed)
	{
		CameraTagName = Seats[SeatIndex].CameraZoomTag;
		CameraBaseOffset = Seats[SeatIndex].CameraZoomBaseOffset;
	}
	else
	{
		CameraTagName = Seats[SeatIndex].CameraTag;
		CameraBaseOffset = Seats[SeatIndex].CameraBaseOffset;
	}

	//  calculate camera focus
	if ( !bDeadVehicle && CameraTagName != '' )
	{
		Mesh.GetSocketWorldLocationAndRotation(CameraTagName, CamStart);

		// Do a line check from actor location to this socket. If we hit the world, use that location instead.
		HitActor = Trace(HitLocation, HitNormal, CamStart, Location, FALSE, vect(12,12,12));
		if( HitActor != None )
		{
			CamStart = HitLocation;
		}
	}
	else
	{
		CamStart = Location;
	}
	CamStart += (CameraBaseOffset >> Rotation);

	//DrawDebugSphere(CamStart, 8, 10, 0, 255, 0, FALSE);
	//DrawDebugSphere(Location, 8, 10, 255, 255, 0, FALSE);

	return CamStart;
}

simulated function string GetSpectatorName()
{
	return m_sName;
}

simulated state DyingVehicle
{
	ignores Bump, HitWall, HeadVolumeChange, PhysicsVolumeChange, Falling, BreathTimer, FellOutOfWorld;

	simulated function PlayWeaponSwitch(Weapon OldWeapon, Weapon NewWeapon) {}
	simulated function PlayNextAnimation() {}
	singular event BaseChange() {}
	event Landed(vector HitNormal, Actor FloorActor) {}

	function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation);

	simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir) {}

	simulated function BlowupVehicle() {}

	simulated function CheckDamageSmoke();

	/** spawn an explosion effect and damage nearby actors */
	simulated function DoVehicleExplosion(bool bDoingSecondaryExplosion)
	{
		local ParticleSystem Template;
		local SkelControlListHead LH;
		local SkelControlBase NextSkelControl;
		local UTSkelControl_Damage DamSkelControl;
		local vector BoneLocation;

		if ( WorldInfo.NetMode != NM_DedicatedServer )
		{
			// determine which explosion to use
			Template = class'UTEmitter'.static.GetTemplateForDistance(BigExplosionTemplates, Location, WorldInfo);

			PlayVehicleExplosionEffect( Template, true );

			if (ExplosionSound != None)
			{
				PlaySound(ExplosionSound, true);
			}

			// this will break only pieces that are marked for OnDeath
			if( Mesh != none && AnimTree(Mesh.Animations) != none)
			{
				// look at the first SkelControler for each bone
				foreach AnimTree(Mesh.Animations).SkelControlLists(LH)
				{
					// then look down the list of the nodes that may exist
					NextSkelControl = LH.ControlHead;
					while (NextSkelControl != None)
					{
						DamSkelControl = UTSkelControl_Damage(NextSkelControl);
						if( DamSkelControl != none)
						{
							if( DamSkelControl.bOnDeathUseForSecondaryExplosion == bDoingSecondaryExplosion )
							{
								BoneLocation = Mesh.GetBoneLocation(LH.BoneName);
								DamSkelControl.BreakApartOnDeath(BoneLocation, true);
							}
						}

						NextSkelControl = NextSkelControl.NextControl;
					}
				}
			}
		}

		HurtRadius(ExplosionDamage, ExplosionRadius, class'TrDmgType_VehicleExplosion', ExplosionMomentum, Location,, GetCollisionDamageInstigator());
		AddVelocity((ExplosionMomentum / Mass) * vect(0,0,1), Location, class'TrDmgType_VehicleExplosion');
	}

	/** This will spawn the actual explosion particle system.  It could be a fiery death or just dust when the vehicle hits the ground **/
	simulated function PlayVehicleExplosionEffect( ParticleSystem TheExplosionTemplate, bool bSpawnLight )
	{
		local UDKExplosionLight L;

		if (TheExplosionTemplate != None)
		{
			DeathExplosion = Spawn(class'UTEmitter', self);
			if (BigExplosionSocket != 'None')
			{
				DeathExplosion.SetBase(self,, Mesh, BigExplosionSocket);
			}
			DeathExplosion.SetTemplate(TheExplosionTemplate, true);
			DeathExplosion.ParticleSystemComponent.SetFloatParameter('Velocity', VSize(Velocity) / GroundSpeed);

			if (bSpawnLight && ExplosionLightClass != None && !WorldInfo.bDropDetail && ShouldSpawnExplosionLight(Location, vect(0,0,1)))
			{
				L = new(DeathExplosion) ExplosionLightClass;
				DeathExplosion.AttachComponent(L);
			}
		}
	}

	simulated function SecondaryVehicleExplosion();

	simulated function PerformSecondaryVehicleExplosion();

	simulated event RigidBodyCollision( PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent, const out CollisionImpactData Collision, int ContactIndex )
	{
		Super.RigidBodyCollision(HitComponent, OtherComponent, Collision, ContactIndex);
	}


	simulated event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser);

	/**
	*	Calculate camera view point, when viewing this pawn.
	*
	* @param	fDeltaTime	delta time seconds since last update
	* @param	out_CamLoc	Camera Location
	* @param	out_CamRot	Camera Rotation
	* @param	out_FOV		Field of View
	*
	* @return	true if Pawn should provide the camera point of view.
	*/
	simulated function VehicleCalcCamera(float fDeltaTime, int SeatIndex, out vector out_CamLoc, out rotator out_CamRot, out vector CamStart, optional bool bPivotOnly)
	{
 		Global.VehicleCalcCamera(fDeltaTime, SeatIndex, out_CamLoc, out_CamRot, CamStart, bPivotOnly);
		bStopDeathCamera = bStopDeathCamera || (out_CamLoc.Z < WorldInfo.KillZ);
		if ( bStopDeathCamera && (OldCameraPosition != vect(0,0,0)) )
		{
			// Don't allow camera to go below killz, by re-using old camera position once dead vehicle falls below killz
		   	out_CamLoc = OldCameraPosition;
			out_CamRot = rotator(CamStart - out_CamLoc);
		}
		OldCameraPosition = out_CamLoc;
	}

	simulated function BeginState(name PreviousStateName)
	{
		local int i;

		// Disable collision.
		Mesh.SetNotifyRigidBodyCollision(false);
		Mesh.SetActorCollision(false, false);
		Mesh.SetHidden(true);

		StopVehicleSounds();

		// make sure smoke/fire are on
		DamageSmokeThreshold = 0.0; //VehicleEvent('DamageSmoke');
		CheckDamageSmoke();
		// fully destroy all morph targets
		for (i = 0; i < DamageMorphTargets.length; i++)
		{
			DamageMorphTargets[i].Health = 0;
			if(DamageMorphTargets[i].MorphNode != none)
			{
				DamageMorphTargets[i].MorphNode.SetNodeWeight(1.0);
			}
		}

		UpdateDamageMaterial();
		ClientHealth = Min(ClientHealth, 0);

		LastCollisionSoundTime = WorldInfo.TimeSeconds;
		DoVehicleExplosion(false);

		for(i=0; i<DamageSkelControls.length; i++)
		{
			DamageSkelControls[i].HealthPerc = 0.f;
		}

		if (WorldInfo.NetMode != NM_DedicatedServer)
		{
			PerformDeathEffects();
		}
		SetBurnOut();

		if (Controller != None)
		{
			if (Controller.bIsPlayer)
			{
				DetachFromController();
			}
			else
			{
				Controller.Destroy();
			}
		}

		for (i = 0; i < Attached.length; i++)
		{
			if (Attached[i] != None)
			{
				Attached[i].PawnBaseDied();
			}
		}
	}

	simulated function PerformDeathEffects();
}

function PlayHorn()
{
    HornIndex = 0;
    if (HornSounds.Length > 1)
    {
        if (Rand(1000)==0)
        {
            HornIndex = 1;
        }
    }

    Super.PlayHorn();
}

// Authority only!
function GoInvulnerable(optional float InvulnerableTime)
{
	if( Role == ROLE_Authority )
	{
		ClearTimer('ClearInvulnerability');
		r_bIsInvulnerable = true;

		if( InvulnerableTime > 0 )
		{
			SetTimer(InvulnerableTime, false, 'ClearInvulnerability');
		}
	}
}

function ClearInvulnerability()
{
	if (Role == ROLE_Authority)
	{
		ClearTimer('ClearInvulnerability');
		r_bIsInvulnerable = false;
	}
}

defaultproperties
{
   m_bImprovedLagSupport=True
   m_fTimeToReset=60.000000
   m_fBoostMultiplier=1.000000
   m_fBoostEnergyPerSec=20.000000
   m_fBoostReactivatePct=0.150000
   m_fPowerPoolRechargeRate=13.000000
   m_fPowerPoolTickRate=0.100000
   m_CrashDamageSeverity=200.000000
   m_fFlagPushSpeed=70.000000
   m_fPawnPushSpeed=140.000000
   m_fPawnMaxDamageSpeed=2100.000000
   m_fPawnMinDamage=100.000000
   m_fPawnMaxDamage=800.000000
   m_fPawnDamageTickTime=2.000000
   VehicleCollisionDamageType=Class'TribesGame.TrDmgType_Collision'
   m_fVehicleMaxDamageSpeed=2100.000000
   m_fVehicleMinDamageSpeed=500.000000
   m_fVehicleMinDamage=100.000000
   m_fVehicleMaxDamage=2500.000000
   m_fVehicleDamageTickTime=0.100000
   WallCollisionDamageType=Class'TribesGame.TrDmgType_Collision'
   m_fWallMaxDamageSpeed=2100.000000
   m_fWallMinDamageSpeed=1000.000000
   m_fWallMinDamage=100.000000
   m_fWallMaxDamage=400.000000
   m_fWallDamageTickTime=0.100000
   r_nBaseMaxSpeed=-1
   m_fDivingMaxSpeedMultiplier=1.000000
   m_fBoostFadeInTime=0.100000
   m_fBoostFadeOutTime=0.100000
   m_DefaultDustEffect=(DurationOfDecal=24.000000,DecalDissolveParamName="DissolveAmount")
   m_fContrailSpeed=500.000000
   m_fVehicleHealthBarPlacementY=18.000000
   m_fVehicleHealthBarWidth=75.000000
   m_fVehicleHealthBarHeight=10.000000
   m_vDeathCamStartOffset=(X=0.000000,Y=0.000000,Z=50.000000)
   m_fMaxPawnLeaveSpeed=2800.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTVehicle:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTVehicle:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   RanOverDamageType=Class'TribesGame.TrDmgType_RanOver'
   CollisionDamageMult=0.000000
   MinRunOverSpeed=800.000000
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'UTGame.Default__UTVehicle:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'UTGame.Default__UTVehicle:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'TribesGame.Default__TrVehicle:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'UTGame.Default__UTVehicle:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'UTGame.Default__UTVehicle:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'TribesGame.Default__TrVehicle:MyStayUprightConstraintInstance'
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'UTGame.Default__UTVehicle:SVehicleMesh'
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle:MyLightEnvironment'
      RBChannel=RBCC_Vehicle
      MotionBlurScale=0.000000
      bAllowAmbientOcclusion=False
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      bNotifyRigidBodyCollision=True
      RBCollideWithChannels=(Default=True,Vehicle=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      ScriptRigidBodyCollisionThreshold=250.000000
      Name="SVehicleMesh"
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTVehicle:SVehicleMesh'
   End Object
   Mesh=SVehicleMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTVehicle:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTVehicle:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   Components(2)=MyLightEnvironment
   CollisionComponent=SVehicleMesh
   Name="Default__TrVehicle"
   ObjectArchetype=UTVehicle'UTGame.Default__UTVehicle'
}
