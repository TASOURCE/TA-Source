/**
 * 
 */
class TrDeployable extends TrGameObjective
		config(game)
		native; 

const DEPLOYABLE_STARTING_HEALTH_PCT = 0.10f;   // 10% starting health

var int             m_nMaxDeployablesOut;
var float           m_TimeCreated;
var TrPawn          m_TouchedPlayer;        // The player that touched by the sensor
var float           m_fBuildUpTime;         // how long for deployable to do build up 
var float           m_fRemoteActivationTime;  //lifespan?

var float           m_fTimeToDeploySecs;
var bool            m_bIsDeployed;
var bool            m_bRequireLOS;          //whether requires LOS for firing

var int				m_nFiringArcDegrees;		// firing arc 0 to 360
var	vector			m_PlacementOrientationVector;
var	float			m_fFiringArcCheckValue;
var Controller		m_Controller;

var	bool			m_bUsesArmoredMultiplier;

//-----------------------------------------------------------------------------
// Target collision primitive.
//-----------------------------------------------------------------------------
var(TargetComponent)	CylinderComponent	m_TargetComponent;
var(TargetComponent)	float				m_TargetCollisionTraceDistance;
var(TargetComponent)	bool				m_bOverrideTargetComponentHeight;
var(TargetComponent)	float				m_fOverriddenTargetComponentHeight;

var TrDeployableCollisionProxy          m_CollisionProxy;
var float                               m_fDamageRadius;    //set up proxy based on damage radius, once go into range, start fire
var repnotify float                     r_fNewDetectionRadius;

var float                               m_fAlwaysRelevantDistanceSquared;	// always relevant to other clients if closer than this distance to viewer, and have controller

var class<TrSubDevice>	                m_DeviceClass;  // Class for the m_Weapon.
var TrTurretPawn						m_WeaponHolder; // Authoritative only. Pawn that controls shooting.
var TrSubDevice							m_Weapon;       // Authoritative only. Weapon associated with this deployable.
var repnotify byte                      r_FlashCount;   // Increments when the m_Weapon has fired so that clients can play appropriate effects.
var Pawn                                r_TargetPawn;   // Pawn that this deployable is targeting.

var TrPowerGenerator					m_MyMainGenerator;	
var SoundCue                            m_DeploySound;

/** Used for cacheing net relevancy test */
var float				m_fNetRelevancyTime;
var playerController	m_LastRealViewer;
var actor				m_LastViewer;
var bool	            m_bCachedRelevant;		// network relevancy caching flag

var() array<float>      m_fRelevancyCheckHeights;   // Used for tracing out for relevancy checks.

/** Scales the generator animations. */
var AnimNodeScalePlayRate m_AnimNodeScale;

/** Interp speed for scaling animation. */
var float m_fAnimInterpSpeed;

/** Mesh used for seeing this deployable through a wall or to show the player that this deployable is in proximity.*/
var SkeletalMeshComponent m_XRayMesh;

/** Is this deployable in 'xray' mode? */
var transient bool m_bIsXRay;

/** Can this deployable be spotted? */
var bool m_bCanBeSpottedByVGS;

/** Does this deployable block friendlies? */
var bool m_bBlocksFriendlies;

/** PRI of the owner. */
var repnotify PlayerReplicationInfo r_OwnerPRI;

var Vector m_vDeathCamStartOffset;

/** Icon ID for the HUD */
var int m_nIconStackId;

////////////////////////////////////////////////////////////////////////
native function                 AdjustMeshToGround();
native function float           CalcMeshOffset();
native function bool            IsInLOS(Actor TouchedActor, vector StartLocation, vector EndLocation, optional bool CheckBlockedByBlockers, optional bool CheckBlockedByActors);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (bNetDirty && !bNetOwner && Role == ROLE_Authority)
		r_FlashCount, r_TargetPawn, r_fNewDetectionRadius;
	if (bNetDirty && Role == ROLE_Authority)
		r_OwnerPRI;
}

simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

    super.ApplyServerSettings();

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if (TrGRI == none || TrGRI.r_ServerConfig == none)
		return;

    m_bHurtByFriendlyFire = TrGRI.r_ServerConfig.bFriendlyFireDeployables;
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == m_Mesh && m_Mesh.Animations != none )
    {
		m_AnimNodeScale = AnimNodeScalePlayRate(m_Mesh.Animations.FindAnimNode('AnimScale'));
    }
}

simulated event ReplicatedEvent( name VarName )
{
	super.ReplicatedEvent( VarName );

	if( VarName == 'r_FlashCount' )	// r_FlashCount is changed when a weapon is fired.
	{
		PlayFireEffects(m_Weapon, true);
	}
	if (VarName == 'r_fNewDetectionRadius')
	{
		if (m_CollisionProxy != none)
		{
			m_CollisionProxy.SetCollisionSize(r_fNewDetectionRadius, r_fNewDetectionRadius);
			m_CollisionProxy.ForceProximityScan(r_fNewDetectionRadius);
		}
	}
	if (VarName == 'r_OwnerPRI')
	{
		OnPRIReplicated();
	}
}

simulated function OnPRIReplicated()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(GetALocalPlayerController());
	if (TrPC != none)
	{
		TrHUD(TrPC.myHUD).DeployableReplicated(self);
	}
}

simulated event Tick(float DeltaTime)
{
    Super.Tick(DeltaTime);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Deployable animates based on if it is powered or not.
		if( m_AnimNodeScale != none )
		{
			if( r_bIsPowered && m_AnimNodeScale.ScaleByValue < 1.0 )
			{
				m_AnimNodeScale.ScaleByValue = FClamp(FInterpTo(m_AnimNodeScale.ScaleByValue, 1.0, DeltaTime, m_fAnimInterpSpeed), 0.0, 1.0);
			}
			else if( !r_bIsPowered && m_AnimNodeScale.ScaleByValue > 0.0 )
			{
				m_AnimNodeScale.ScaleByValue = FClamp(FInterpTo(m_AnimNodeScale.ScaleByValue, 0.0, DeltaTime, m_fAnimInterpSpeed), 0.0, 1.0);
			}
		}

		if( m_bIsXRay )
		{
			// Attach Xray mesh if it isn't already.
			if( m_XRayMesh != none && !m_XRayMesh.bAttached )
			{
				AttachComponent(m_XRayMesh);
			}
		}
		else
		{
			// Detach Xray mesh if it is still attached.
			if( m_XRayMesh != None && m_XRayMesh.bAttached )
			{
				DetachComponent(m_XRayMesh);
			}
		}
	}
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
	local TrProjectile Projectile;

	Projectile = TrProjectile(DamageCauser);
	if (Projectile != none)
	{
		// Projectile hit a force field? Only damage pawns on the side that the projectile exploded on.
		if( Projectile.ImpactedActor != none && Projectile.ImpactedActor.IsA('TrDeployable_ForceField') && Projectile.ImpactedActor != self )
		{
			if( Normal(Projectile.Velocity) dot Normal(Projectile.Location - Location) < 0.0 )
			{
				return;
			}
		}
		// Projectile can't be blocked by a blocker.
		else if( Projectile.IsBlockedByBlocker(DamageCauser, self,, false, Projectile.m_bIsBullet ? HurtOrigin : vect(0,0,0)) )
		{
			return;
		}
	}

	/*
	 * In Actor::TakeRadiusDamage damage falloff was being calculated.
	 * Instead what we do is just modify the hit location then go on to TakeDamage, where the real calculations are done.
	 */
	TakeDamage
	(
		BaseDamage,
		InstigatedBy,
		HurtOrigin,
		vect(0.0f, 0.0f, 0.0f),
		DamageType,,
		DamageCauser
	);
}

//  TakeDammage Override so we can reduce damage at a distance and also according to armor level as needed
simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, 
				 class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local Actor	    DamagingActor;
	local float		ColRadius, ColHeight;
	local float		DamageScale, Dist;
	local vector	Dir;
	local TrPlayerReplicationInfo InstigatorTrPRI;
	local TrValueModifier VM;
	local class<TrDevice> DamageWeaponClass;
	local class<TrDmgType_Base> TrDamageType;
	local TrPawn TrPawnInstigator;
	local TR_EQUIP_POINT InstigatorWeaponEquipPoint;
	local TrProjectile TrProj;

	if (DamageType == none)
	{
		;
	}

	TrDamageType = class<TrDmgType_Base>(DamageType);
	if( TrDamageType != none )
	{
		DamageWeaponClass = class<TrDevice>(TrDamageType.default.DamageWeaponClass);
	}


	if (DamageAmount < 0)
	{
		if (EventInstigator != none && EventInstigator.GetTeamNum() == DefenderTeamIndex)
		{
            m_LastDamager = EventInstigator;

			if (Stats != none)
			{
				Stats.UpdateDamage(TrPlayerController(EventInstigator), class<TrDmgType_Base>(DamageType).default.DBWeaponId, DamageAmount, 0, false, false);
			}

			DoRepairs(DamageAmount,EventInstigator,DamageCauser,DamageType, HitInfo);
		}

		return;
	}

	if (DamageCauser == m_WeaponHolder)
	{
		return;
	}

	DamageScale = 1.0;
	DamagingActor = class'TrDmgType_Base'.static.GetActorCausingDamage(EventInstigator,DamageCauser);

	if (DamagingActor!=None)
	{
		GetBoundingCylinder(ColRadius, ColHeight);
		Dir	= Location - DamagingActor.Location;
		TrProj = TrProjectile(DamagingActor);
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
		Dist = FMax(Dist - ColRadius,0.f);

		DamageScale = class'TrDmgType_Base'.static.GetDamageScale(DamageCauser,Dist,TrDamageType);
	}

	if( m_bUsesArmoredMultiplier )
	{
		DamageScale *= TrDamageType.default.m_fDamageMultiplierAgainstArmor;

		if( EventInstigator != none && DamageWeaponClass != none )
		{
			TrPawnInstigator = TrPawn(EventInstigator.Pawn);
			if( TrPawnInstigator != none )
			{
				// Perk/Skill
				InstigatorTrPRI = TrPlayerReplicationInfo(EventInstigator.PlayerReplicationInfo);
				if( InstigatorTrPRI != none )
				{
					VM = InstigatorTrPRI.GetCurrentValueModifier();
					if( VM != none )
					{
						InstigatorWeaponEquipPoint = InstigatorTrPRI.GetEquipPointByWeaponId(DamageWeaponClass.default.DBWeaponId);
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
	else
	{
		DamageScale *= TrDamageType.default.m_fDamageMultiplierAgainstNonArmoredObjectives;
	}

	if( EventInstigator != none)
    {
		DamageAmount *= DamageScale;

		if (Stats != none)
		{
			Stats.UpdateDamage(TrPlayerController(EventInstigator), class<TrDmgType_Base>(DamageType).default.DBWeaponId, DamageAmount, Dist, false, false);
		}

        super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        ;
    }
}

//
//	Events called by our collision proxy
//
function OnPawnDetectedByCollisionProxy(Pawn p);
function OnPawnExitedCollisionProxy(Pawn p);
function OnVehicleDetectedByCollisionProxy(TrVehicle v);
function OnVehicleExitedCollisionProxy(TrVehicle v);

//
// look for backup power if we don't have power now
//
simulated function OnPowerStatusChanged()
{	
	super.OnPowerStatusChanged();

	PulseBackupGenerators();
}

simulated function SetInstigatorController(TrPlayerController InstigatorController)
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	m_Controller = InstigatorController;

	if( Role == ROLE_Authority )
	{
		r_OwnerPRI = InstigatorController.PlayerReplicationInfo;
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		OnPRIReplicated();
	}

	// Skill/perk
	TrPRI = TrPlayerReplicationInfo(r_OwnerPRI);
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none )
		{
			r_MaxHealth += VM.m_fDeployableHealthBuff;
			r_Health += VM.m_fDeployableHealthBuff;
		}
	}

	if (m_WeaponHolder != none && m_WeaponHolder.Controller != none && m_WeaponHolder.Controller.IsA('TrDeployableController'))
		TrDeployableController(m_WeaponHolder.Controller).m_SpawnedFromController = InstigatorController;

	ClearTimer('FinalizeDeployment');
	FinalizeDeployment();
}

simulated function PostBeginPlay()
{
	local TrPawn POwner;
	local float DamageRadius;

    super.PostBeginPlay();

	if( WorldInfo.NetMode != NM_DedicatedServer && default.m_Mesh.AnimTreeTemplate != none )
    {
        // Set the animation tree containing morph targets.
		m_Mesh.SetAnimTreeTemplate(default.m_Mesh.AnimTreeTemplate);
    }

	POwner = TrPawn(Owner);
	if( POwner != none )
	{
		DefenderTeamIndex = POwner.GetTeamNum();
	}

    if (Role == ROLE_Authority)
    {
		if (m_DeviceClass != None)
		{
			m_WeaponHolder = Spawn(class'TrTurretPawn',self, , Location, Rotation,,true);
			m_WeaponHolder.SetBase(self);
			m_WeaponHolder.m_OwnerDeployable = self;
			m_WeaponHolder.SpawnDefaultController();

			m_Weapon = m_WeaponHolder.Spawn(m_DeviceClass, m_WeaponHolder);
            m_Weapon.bAllowFiringWithoutController = true;
            m_Weapon.GiveTo(m_WeaponHolder);
			m_Weapon.r_eEquipAt = EQP_Primary;
            m_Weapon.Instigator = m_WeaponHolder;        //needs to have instigator set up properly for weapon equip
			m_WeaponHolder.InvManager.Instigator = m_WeaponHolder;
			m_WeaponHolder.invManager.ServerSetCurrentWeapon(m_Weapon);
		}

		// setup firing arc - cosine of half the firing angle
		m_fFiringArcCheckValue = cos((m_nFiringArcDegrees/2)*(PI/180));
		m_PlacementOrientationVector = vector(Rotation);

		//spawn collision proxy now
        if (m_fDamageRadius > 0)
        {
			DamageRadius = GetDamageRadius();
            m_CollisionProxy = Spawn(class'TrDeployableCollisionProxy');
            m_CollisionProxy.SetOwner(self);
            m_CollisionProxy.SetBase(self);
            m_CollisionProxy.SetCollisionSize(DamageRadius, DamageRadius);
			m_CollisionProxy.ForceProximityScan(DamageRadius);
			r_fNewDetectionRadius = DamageRadius;
        }

		SetTimer(1,false,'FinalizeDeployment');
    }
}

function float GetDamageRadius()
{
	local TrPawn TrPawnOwner;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float DamageRadius;

	DamageRadius = default.m_fDamageRadius;

	TrPawnOwner = TrPawn(Owner);
	if( TrPawnOwner != none )
	{
		TrPRI = TrPlayerReplicationInfo(TrPawnOwner.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				DamageRadius *= 1.0 + VM.m_fDeployableRangeBuffPct;
			}
		}
	}

	return DamageRadius;
}

//
//  complete the details of deployment (either on a timer for level-placed or by call from instigator)
//
simulated function FinalizeDeployment()
{
	local TrPowerGenerator O;

	// if the team number is not valid and the instigator is known, set the team number
	if (DefenderTeamIndex == 255 && m_Controller!=None)
	{
		DefenderTeamIndex = m_Controller.GetTeamNum();
	}

	if( ReceivesPowerFromGenerator() )
	{
		// find a generator to power us - if none in the map, assume we are up and running
		ForEach WorldInfo.AllNavigationPoints(class'TrPowerGenerator',O)
		{
			if( (O.DefenderTeamIndex == DefenderTeamIndex) )
			{
				;
				m_MyMainGenerator = O;
				break;
			}
		}

		if (m_MyMainGenerator==None)
		{
			SetPowered(true);
		}
		else
		{
			m_MyMainGenerator.AddToPoweredObjectives(self);
		}
	}

	if (m_Controller==none)
	{
		DeployComplete();
	}
}

simulated function DeployComplete()
{
    GotoState('Active');
    
    if ( m_bIsDeployed )
    {
        return;
    }

    ;
    // ending deploy state causes an additional call to this function to ensure deploy is complete,
    // this flag ensures that it does not get processed twice
    m_bIsDeployed = true;

	// make backup generators aware of us
	PulseBackupGenerators();
}

simulated function bool IsFiring()
{
    if (m_WeaponHolder.Weapon != None)
    {
        return m_WeaponHolder.Weapon.IsFiring();
    }
    return false;
}

//#######################################################################################
// State PreInit
// This state is when the deployable is created but not yet initialized
//---------------------------------------------------------------------------------------
auto state Deploy
{
    simulated function BeginState(name PreviousStateName)
	{
        if (m_fTimeToDeploySecs == 0)
        {
            DeployComplete();
        }
        else
        {
            SetTimer(m_fTimeToDeploySecs, false, 'DeployComplete');
        }

		if( m_DeploySound != none )
		{
			PlaySound(m_DeploySound);
		}

		// Only for instant online sounds (backup generator and force field).
        if( m_OnlineSound != None && m_OnlineSound.SoundCue != None && !m_bInstantOnlineSound && m_bAutoPlayOnlineSound )
        {
            m_OnlineSound.Play();
        }
	}


    simulated event StartFire(byte FireModeNum)
    {
        // do not allow firing while deploying
    }

    simulated function bool IsFiring()
    {
        return false;
    }

  
}

//#######################################################################################
// State Active
// Loop any number of idle animations, etc.
//---------------------------------------------------------------------------------------

simulated function UpdateHealthMaterial()
{
	local float healthPct;
	local int i;
	local MaterialInstanceConstant MIC;

	healthPct = GetHealthAmount();

	if (m_Mesh != none)
	{
		for (i = 0; i < m_Mesh.Materials.Length; i++)
		{
			MIC = MaterialInstanceConstant(m_Mesh.Materials[i]);
			if( MIC != none )
			{
				MIC.SetScalarParameterValue('Health', healthPct);
			}
		}
	}
}

simulated function OnHealthChanged(bool wasDamage)
{
	UpdateHealthMaterial();

    if (r_Health <= 0)
    {
		r_Health = 0;
        GotoState('BlownUp');
    }
    else if (r_Health > m_nCriticalHealthThreshold && r_bInDestroyedState && Role == ROLE_Authority)
    {
		if (Role == ROLE_Authority)
		{
			r_bInDestroyedState = false;
			PlayDestroyedEffects();
		}

		m_bIsDeployed = false;
		DeployComplete();
    }

	super.OnHealthChanged(wasDamage);
}

simulated function vector GetWeaponStartTraceLocation(optional Weapon CurrentWeapon)
{
    return Location;
}

simulated function bool StopsProjectile(Projectile P)
{
	local TrTurretPawn turretPawn;

	turretPawn = TrTurretPawn(P.Instigator);

    // Don't block projectiles fired from this deployable.
    return turretPawn == none || turretPawn.m_OwnerDeployable != self;
}

simulated function IncrementFlashCount(Weapon W, byte FireModeNum)
{
	local TrSubDevice TurretWeapon;

	TurretWeapon = TrSubDevice(W);
	if (TurretWeapon != none)
	{
		bForceNetUpdate = TRUE;	// Force replication
        r_FlashCount++;

        if( r_FlashCount == 0 )
	    {
		    r_FlashCount += 2;
	    }
	}
}

simulated function PlayFireEffects(Weapon InWeapon, bool bViaReplication, optional vector HitLocation);

//
//	pulse backup generators so they can update themselves when our status changes
//
function PulseBackupGenerators()
{
	local TrDeployable_BackupGenerator dep;

	if (Role==ROLE_Authority)
	{
		ForEach WorldInfo.AllNavigationPoints(class'TrDeployable_BackupGenerator',dep)
		{
			if( dep.DefenderTeamIndex == DefenderTeamIndex )
			{
				dep.DoPowerUpdate(self);
			}
		}
	}
}

simulated function Destroyed()
{
	Super.Destroyed();

	// tell generators we are gone
	PulseBackupGenerators();
    
	if (m_WeaponHolder!=None)
	{
		m_WeaponHolder.Destroy();
		m_WeaponHolder = None;
	}

	if( m_Weapon != none )
	{
		m_Weapon.Destroy();
		m_Weapon = none;
	}

	if( m_CollisionProxy != none )
	{
		m_CollisionProxy.Destroy();
		m_CollisionProxy = none;
	}
}

//#######################################################################################
// State Destroyed
//---------------------------------------------------------------------------------------
simulated state Blownup
{
	simulated function BeginState(Name PreviousStateName)
	{
        super.BeginState(PreviousStateName);
	
        ;

		if (Role == ROLE_Authority)
		{
			r_bInDestroyedState = true;
			r_TargetPawn = none;
			PlayDestroyedEffects();
		}
 
		if (m_WeaponHolder != None)
		{
			m_WeaponHolder.StopFire(0);
		}

		if( !m_bIsRepairableAfterDeath )
		{
			// Destroy the collision proxy if it can not be revived.
			if( m_CollisionProxy != none )
			{
				m_CollisionProxy.Destroy();
				m_CollisionProxy = none;
			}
		}
	}

    simulated function OnHealthChanged(bool wasDamage)
    {
		UpdateHealthMaterial();

		// We've reached the repair health threshold, so re-deploy.
        if (r_Health >= r_nRepairHealthThreshold && m_bIsRepairableAfterDeath)
		{
			if (Role == ROLE_Authority)
			{
				r_bInDestroyedState = false;
				PlayDestroyedEffects();
			}

			m_bIsDeployed = false;
			DeployComplete();
		}
    }

Begin:
    //`Log("*** TrDeployable::State Active"@self);
}

simulated function bool ReceivesPowerFromGenerator()
{
	local TrGameReplicationInfo TrGRI;

	// Are we supposed to be powered by the generator?
	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
		return TrGRI.r_ServerConfig.bPoweredDeployables && super.ReceivesPowerFromGenerator();
	}

	return super.ReceivesPowerFromGenerator();
}

simulated function bool GetPossessiveInstigatorName(out string PlayerName)
{
	if( r_OwnerPRI != none )
	{
		PlayerName = r_OwnerPRI.PlayerName;
		if( Right(PlayerName,1) ~= "s" )
		{
			PlayerName = PlayerName$"'";
		}
		else
		{
			PlayerName = PlayerName$"'s";
		}
		return true;
	}
	return false;
}

simulated function bool CalcOtherWatchingCam( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV, TrPlayerController WatcherController )
{
	local vector CamStart, HitLocation, HitNormal, CamDirX, CamDirY, CamDirZ, CurrentCamOffset;

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

/** Apply the effects of an upgrade. Authority only. */
event OnUpgradePerformed(name VarName)
{
	if( VarName == 'r_fNewDetectionRadius')
	{
		if (m_CollisionProxy != none)
		{
			m_CollisionProxy.SetCollisionSize(r_fNewDetectionRadius, r_fNewDetectionRadius);
			m_CollisionProxy.ForceProximityScan(r_fNewDetectionRadius);
		}
	}
	Super.OnUpgradePerformed(VarName);
}

defaultproperties
{
   m_fTimeToDeploySecs=3.000000
   m_bRequireLOS=True
   m_bCanBeSpottedByVGS=True
   m_nFiringArcDegrees=360
   m_fAlwaysRelevantDistanceSquared=2560000.000000
   m_fRelevancyCheckHeights(0)=35.000000
   m_fAnimInterpSpeed=2.000000
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   m_XRayMesh=XRayMesh
   m_vDeathCamStartOffset=(X=0.000000,Y=0.000000,Z=50.000000)
   m_nIconStackId=-1
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrGameObjective:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrGameObjective:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable:ObjectiveMesh.AnimNodeSeq0'
      bHasPhysicsAssetInstance=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable:MyLightEnvironment'
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=96
   m_bReceivesPowerFromGenerator=True
   m_bForceShowHUD=True
   m_bIsRepairableAfterDeath=False
   m_bShowObjectivesForcesMarker=False
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   m_fLifeAfterDeathSecs=1.000000
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   m_fInstigatorNamePlacementY=-55.000000
   m_fMarker2DDistance=0.500000
   DefenderTeamIndex=255
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Components(5)=ShieldMesh
   Components(6)=OnlineSound
   Components(7)=CriticalSound
   Components(8)=ShieldHitSound
   Components(9)=PowerDownSound
   Components(10)=DestroyedSound
   bNoDelete=False
   bReplicateInstigator=True
   bNetInitialRotation=True
   bBlockActors=False
   NetPriority=1.400000
   CollisionComponent=ObjectiveMesh
   Name="Default__TrDeployable"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}
