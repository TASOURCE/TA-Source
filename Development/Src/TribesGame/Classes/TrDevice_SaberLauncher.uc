/**
 * 
 */
class TrDevice_SaberLauncher extends TrDevice;

var float	m_fTargetSightTime;
var float	m_fPreLockTime;
var Actor	m_Target;
var bool	r_bTargetLocked;
var float	m_fMinCosineRetainTarget;
var float	m_fRetainTargetMaxAngle;
var float   m_fAcquireTargetMaxAngle;
var float   m_fMinCosineAcquireTarget;
var bool	m_bRestoreAimingHelp;
var float   m_fRestoreAimHelpRadius;

var float   m_fLockRetainSeconds;
var() float   m_fReticuleLockOnDist;
var() float   m_fPotentialTargetLockOnDist;
var() float  m_fGroundCheckDistance;
var() float m_fTimeBeforeVictimKnowsMissileIsTargeting;
var float   m_fLockingTargetTimestamp;
var() bool m_bDebugMode;

// Do not simulate fire effects on the client.
var repnotify byte r_nFired;

var TrPlayerController m_TargetController;

replication
{
	if (bNetOwner && bNetDirty && Role == ROLE_Authority)
		r_bTargetLocked, r_nFired;
}

simulated event ReplicatedEvent(name VarName)
{
    if( VarName == 'r_nFired' )
    {
		// Clients fire ammunition only after the server verifies. Since 
		// we can lose the locked target on the server before the replication happens
		// we cannot simulate the shots client-side like most other weapons.
        Super.FireAmmunition();
    }

	super.ReplicatedEvent(VarName);
}

simulated state Active
{
	simulated event BeginState(name PreviousStateName)
	{
		local int i;

		for (i = 0; i < GetPendingFireLength(); i++)
		{
			ClearPendingFire(i);
		}

		super.BeginState(PreviousStateName);

		if( Role != ROLE_Authority )
		{
			SetTimer(0.25,true,'PerformTargeting');
		}
	}

	simulated event EndState(name NextStateName)
	{
		super.EndState(NextStateName);

		if( Role != ROLE_Authority )
		{
			ClearTimer('PerformTargeting');
		}
	}
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	if (Role==ROLE_Authority)
	{
		m_fMinCosineRetainTarget = cos((m_fRetainTargetMaxAngle/2.0) * (PI / 180));
		m_fMinCosineAcquireTarget = cos((m_fAcquireTargetMaxAngle/2.0) * (PI / 180));
	}
}	

simulated function ResumeTargeting()
{
	if (Role==ROLE_Authority && !IsTimerActive('PerformTargeting'))
	{
		m_bRestoreAimingHelp = PlayerController(Instigator.Controller).bAimingHelp;
		m_fRestoreAimHelpRadius = AimingHelpRadius[0];
		PlayerController(Instigator.Controller).bAimingHelp = true;

		SetTimer(0.25,true,'PerformTargeting');
		SetNewTrackingTarget(None);
	}
}

simulated function SuspendTargeting()
{
	local TrSeekingMissileManager MissileManager;

	ClearTimer('PerformTargeting');

	if (Role==ROLE_Authority)
	{
		MissileManager = GetSeekingMissileManager();
		if (MissileManager != none)
			MissileManager.RemoveSaberLauncher(self);

		PlayerController(Instigator.Controller).bAimingHelp = m_bRestoreAimingHelp;
		AimingHelpRadius[0]=m_fRestoreAimHelpRadius;

		SetNewTrackingTarget(None);
	}
}

simulated function Destroyed()
{
	SuspendTargeting();
	super.Destroyed();
}

//
//	make sure target is close enough to reticle
//
function bool TargetInsideReticle(Actor target, bool initialAcquire)
{
	return IsInsideCone(Vector(Instigator.Controller.Rotation), 
		target, Instigator.Location + Instigator.BaseEyeHeight*vect(0,0,1), initialAcquire ? m_fMinCosineAcquireTarget : m_fMinCosineRetainTarget);
}

simulated function bool IsActorInLOS(Actor A)
{
	local Vector		StartTrace, EndTrace;

	StartTrace = A.Location;
	EndTrace = Instigator.GetWeaponStartTraceLocation();

	if( (VSizeSq(EndTrace - StartTrace) < (WeaponRange * WeaponRange)) &&
		(FastTrace(EndTrace, StartTrace)) )
	{
		return true;
	}
	return false;
}

simulated function bool ValidateTrackingTarget(Actor target, bool initialAcquire)
{
	local TrPawn TrP;
	local TrVehicle TrV;
	local Vector EndTrace;

	if (target==None)
		return false;

	/** THIS IS FOR TESTING ONLY!!
	if( target.IsA('TrPowerGenerator') )
	{
		return true;
	}
	*/


















	// must be enemy, in line of sight
	if (!IsValidTarget(target,0))
	{
		return false;
	}

	// must not be too far outside the reticle
	/*if (!TargetInsideReticle(target, initialAcquire))
	{
		return false;
	}*/

	// ML: TODO: Rework this mechanic.
	// Laser target? Fuck yea.
	/*if (target.IsA('TrLaserTarget'))
	{
		return true;
	}*/

	if (!IsInLOS(target,vect(0,0,0)))
	{
		return false;
	}

	// Pawn?  must be jetting
	TrP = TrPawn(target);
	if( TrP != none && TrP.Health > 0 )
	{
		if( TrP.IsJammedByFriendOrSelf() || (TrP.r_bIsStealthed && !TrP.IsPulseStealthed()) )
		{
			return false;
		}
		else
		{
			if( TrP.Physics == PHYS_Flying )
			{
				return true;
			}
			else if( TrP.Physics == PHYS_Falling )
			{
				// Only track if the target is above the ground a good amount.
				EndTrace = TrP.Location;
				EndTrace.Z -= m_fGroundCheckDistance;
				if( TrP.FastTrace(EndTrace, TrP.Location) )
				{
					return true;
				}
			}
		}
	}

	// Vehicle?
	TrV = TrVehicle(target);
	if (TrV!=none && !TrV.IsInState('DyingVehicle'))
		return true;

	// nothing else can be targeted
	return false;
}

function SetTargetActorMissileLockState(Actor target, EMissileLock lockValue)
{
	local TrSeekingMissileManager MissileManager;

	MissileManager = GetSeekingMissileManager();

	if( lockValue == EMissileLocking || lockValue == EMissileLocked )
	{
		if( MissileManager != none )
		{
			MissileManager.AddSaberLauncher(self, lockValue);
		}

		m_fLockingTargetTimestamp = WorldInfo.TimeSeconds;
	}
	else
	{
		if( MissileManager != none )
		{
			MissileManager.RemoveSaberLauncher(self);
		}
	}
}

function SetNewTrackingTarget(Actor target)
{
	if (target==m_Target) return;

	//`log("New tracking target is"@target);

	// release old target
	if (m_Target!=None)
	{
		SetTargetActorMissileLockState(m_Target,EMissileLockNone);
	}

	m_Target = target;
	TrPlayerReplicationInfo(Instigator.Controller.PlayerReplicationInfo).m_LockedTarget = m_Target;

	// latch on to new target
	if (m_Target!=none)
	{
		SetTargetActorMissileLockState(m_Target,EMissileLocking);
	}

	m_fTargetSightTime = WorldInfo.TimeSeconds;
	r_bTargetLocked = false;
}

function TargetLockAcquired()
{
	if (!r_bTargetLocked)
	{
		SetTargetActorMissileLockState(m_Target,EMissileLocked);
		r_bTargetLocked=true;
	}

	m_fTargetSightTime = WorldInfo.TimeSeconds;
}

event Tick(float DeltaTime)
{
	local TrPawn TargetPawn;

	super.Tick(DeltaTime);

	TargetPawn = TrPawn(m_Target);

	// Lose the target if it is no longer in the air.
	if( TargetPawn != none )
	{
		if( !ValidateTrackingTarget(m_Target, false) )
		{
			SetNewTrackingTarget(none);
			return;
		}

		if( TargetPawn.Health <= 0.f )
		{
			SetNewTrackingTarget(none);
			return;
		}
	}
}

simulated function FireAmmunition()
{
	if( Role < ROLE_Authority )
	{
		return;
	}

	if( m_Target == none )
	{
		return;
	}

	Super.FireAmmunition();
	
	r_nFired++;

	// Lose target.
	SetNewTrackingTarget(none);
}

//
//	Called on a timer to continuously update the tracked target
//
simulated function PerformTargeting()
{
	local Actor A, BestTargetActor;
	local Vector ActorDir, ViewDir, POVLoc;
	local Rotator POVRot;
	local float Dist, BestDist;
	local array<Actor> PotentialTargets;
	local bool bIsInLOS;
	local TrSeekingMissileManager MissileManager;

	if( (ammoCount==0) && (m_nCarriedAmmo == 0) )
	{
		// Don't target if we have no ammo.
		if( m_TargetController != none )
		{
			MissileManager = GetSeekingMissileManager();

			if( MissileManager != none )
			{
				MissileManager.RemoveSaberLauncher(self);
			}
		}
		return;
	}

	BestDist = m_fReticuleLockOnDist; // Starting point for how wide we make our targeting cone.

	// Don't target while instigator is in vehicle
	if( Instigator == none || Instigator.Controller == none )
	{
		SuspendTargeting();
		return;
	}

	Instigator.Controller.GetPlayerViewPoint(POVLoc, POVRot);
	ViewDir = Vector(POVRot);

	// If we are already locked onto a target, make sure it is still in LOS.
	if( Role==ROLE_Authority )
	{
		if( (m_Target != none) )
		{
			ActorDir = Normal(m_Target.Location - POVLoc);
			Dist = ViewDir dot ActorDir;
			if( Dist >= BestDist )
			{
				if( IsActorInLOS(m_Target) )
				{
					// Locked target is still valid.
					//return;
				}
				else
				{
					// We no longer have good LOS to locked target.
					SetNewTrackingTarget(None);
				}
			}
			else 
			{
				// We no longer have good LOS to locked target.
				SetNewTrackingTarget(None);
			}
		}
	}

	// Find the valid tracking targets.
	foreach DynamicActors(class'Actor',A)
	{
		if( ValidateTrackingTarget(A, false) )
		{
			ActorDir = Normal(A.Location - POVLoc);
			Dist = ViewDir dot ActorDir;

			bIsInLOS = IsActorInLOS(A);

			if( WorldInfo.NetMode != NM_DedicatedServer && Dist > m_fPotentialTargetLockOnDist && bIsInLOS )
			{
				PotentialTargets.AddItem(A);
			}

			if( Role == ROLE_Authority )
			{
				if( Dist > BestDist )
				{
					if( bIsInLOS )
					{
						BestTargetActor = A;
						BestDist = Dist;
					}
				}
			}
		}
	}

	if( Role == ROLE_Authority )
	{
		if( BestTargetActor != none )
		{
			if( BestTargetActor != m_Target && m_Target == none )
			{
				// We have a new target.
				SetNewTrackingTarget(BestTargetActor);
			}
			else 
			{
				// We continue to have the target as our best choice.
				if (WorldInfo.TimeSeconds - m_fTargetSightTime > m_fPreLockTime)
				{
					TargetLockAcquired();
				}
			}
		}
	}

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		TrPlayerController(Instigator.Controller).UpdatePotentialSeekingTargets(PotentialTargets);
	}
}

simulated function OnSwitchAwayFromWeapon()
{
	SuspendTargeting();
}

simulated function OnSwitchToWeapon()
{
	ResumeTargeting();
}

simulated function HolderEnteredVehicle()
{
	SuspendTargeting();
}

simulated function HolderExitedVehicle()
{
	ResumeTargeting();
}

//
//	OVerride projectile spawning so we can set seek target
//
simulated function Projectile ProjectileFire()
{
	local TrProj_TrackingMissile p;

	if( Role==ROLE_Authority && m_Target != none )
	{
		p = TrProj_TrackingMissile(super.ProjectileFire());

		if (p != none && r_bTargetLocked)
		{
			p.SetSeekTarget(m_Target);
		}
	}

	return p;
}

reliable server function ServerTryNewPossibleTarget()
{
	/*local Actor NewPossibleTarget;
	local Vector POVLoc, ViewDir, HitLocation, HitNormal;
	local Rotator POVRot;

	Instigator.Controller.GetPlayerViewPoint(POVLoc, POVRot);
	ViewDir = Vector(POVRot);
	NewPossibleTarget = Trace(HitLocation, HitNormal, POVLoc + (ViewDir * WeaponRange), POVLoc, true,,,TRACEFLAG_Bullet);

	if( m_Target != none && NewPossibleTarget != m_Target && IsValidTarget(NewPossibleTarget) )
	{
		SetNewTrackingTarget(NewPossibleTarget);
	}*/
}

simulated function BeginFire(byte FireModeNum)
{
	if (r_bTargetLocked)
	{
		super.BeginFire(FireModeNum);
	}
}

simulated function StartFire(byte FireModeNum)
{
	local TrPlayerController TrPC;

	if (r_bTargetLocked)
	{
		Super.StartFire(0);
	}
	else 
	{
		// Experiment.
		//ServerTryNewPossibleTarget();
		PlaySound(m_DryFireSoundCue);

		// Message the player that they cannot fire the weapon unless they have a target locked.
		TrPC = TrPlayerController(Instigator.Controller);
		if( TrPC != none )
		{
			TrPC.ReceiveLocalizedMessage(class'TrWarningMessage', 1);
		}
	}
}

/** Authoritative. Returns a pointer to the seeking missile manager. */
function TrSeekingMissileManager GetSeekingMissileManager()
{
	local TrGame TrG;

	TrG = TrGame(WorldInfo.Game);
	if( TrG != none && TrG.m_SeekingMissileManager != none )
	{
		return TrG.m_SeekingMissileManager;
	}

	return none;
}

defaultproperties
{
   m_fPreLockTime=3.000000
   m_fRetainTargetMaxAngle=35.000000
   m_fAcquireTargetMaxAngle=35.000000
   m_fLockRetainSeconds=3.000000
   m_fReticuleLockOnDist=0.985000
   m_fPotentialTargetLockOnDist=0.900000
   m_fGroundCheckDistance=100.000000
   m_fTimeBeforeVictimKnowsMissileIsTargeting=1.400000
   DBWeaponId=7398
   DBXPActivityId=159
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bIsKickbackAdditive=True
   m_bAllowFireWhileZoomed=True
   m_bEndZoomOnReload=False
   m_fAccuracyLossOnShot=0.500000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=8
   m_nCarriedAmmo=8
   m_nMaxCarriedAmmo=8
   m_fReloadTime=3.000000
   m_fKickbackBlendOutTime=5.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SaberLauncher:FireCameraShake'
   m_TinyWeaponsOffset=(X=10.000000,Y=0.000000,Z=-4.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=6.000000,Z=55.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=1.400000)
   m_InGamePaperDollInfo=(Scale=1.450000)
   InfoPanelDescription="The Saber fires a tracking missile that will only lock onto vehicles or Humans who are in the air. It takes 3 seconds to lock onto a target, and cannot be fired without a lock."
   InfoPanelDamage=9
   InfoPanelRadius=2
   InfoPanelFireRate=1
   InfoPanelClipSize=-2
   UpgradeDescription(0)="+2 AMMO"
   UpgradeDescription(1)="+15% DAMAGE\nVERSUS\nARMORED"
   UpgradeDescription(2)="+2 AMMO"
   Upgrades(0)=(IconId=4,DatabaseItemId=8107,Modifications=((ModType=37,Value=2.000000)))
   Upgrades(1)=(IconId=5,DatabaseItemId=8108,Modifications=((ModType=73,Value=0.150000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8109,Modifications=((ModType=37,Value=2.000000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_SaberLauncher_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SaberLauncher:ForceFeedbackShootingLarge'
   AttachmentClass=Class'TribesGame.TrAttachment_SaberLauncher'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=5.000000,Y=-2.000000,Z=-8.000000)
   SmallWeaponsOffset=(X=12.000000,Y=-4.000000,Z=3.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=-300,Yaw=0,Roll=0)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_TrackingMissile'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.500000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=10.000000,Z=-7.000000)
   WeaponRange=30000.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      FOV=60.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Saber Launcher"
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
   Name="Default__TrDevice_SaberLauncher"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
