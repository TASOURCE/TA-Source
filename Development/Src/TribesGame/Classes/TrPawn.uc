/**
 * 
 */
class TrPawn extends UTPawn
	config(Game)
    dependson(TrObject)
    native;

const MAX_SCANNER_SEE_FLAG              =  2;
const MAX_SCANNER_DISPLAY_FLAG          =  3;
const MAX_MULTISHOT_LOCATIONS			=  8;

var int                 r_nFactionId;

var name                m_nmMakeVisible;

var bool                m_bInitialized;
var bool                m_bRefreshInventoryWasRespawn;
var actor               r_LockedTarget;

var vector              r_FlashNormal;

// Stealth System
var repnotify bool      r_bIsStealthed;                         // Is the pawn stealthed?
var repnotify EMissileLock r_MissileLock;                       // pawn missile lock state
var transient bool		m_bStealthVisible;                      // Set this to change the visibility of stealth.
var() float             m_fEnableStealthVisibilityInterpSpeed;  // Configured speed on becoming invisible.
var() float             m_fDisableStealthVisibilityInterpSpeed; // Configured speed on becoming visible
var() float             m_fMinStealthVisibilityParamValue;      // When the pawn is fully stealthed, what is the minimum visibility?
var() Material          m_StealthMaterial;                      // Material used for stealth
var   MaterialInstanceConstant m_StealthMIC;                    // MIC currently applied for stealthing.
var   float             m_fPulseStealthVisibleTimestamp;        // Controls when we want to pulse in the visibility for stealth (e.g. shooting, taking damage).
var() float             m_fPulseStealthVisibleTime;             // How long to leave a pulse visible before fading out again.
var() float             m_fPulseStealthFadeInInterpSpeed;       // How fast to fade in a stealth pulse.
var   float             r_fPulseStealthSpeedThreshold;          // How fast can the Pawn be going before the wind forces the pack to pulse.
var   float             m_fPulseStealthIgnoreTimeStamp;         // Controls when we want to allow pulse stealth requests again.
var   float             m_fPulseStealthIgnoreTime;              // How long to ignore a pulse stealth request.
var   repnotify byte    r_nPulseStealth;                        // Used for the server to send down a pulse stealth request to the client.

// Rage
var repnotify bool      r_bIsRaged;                             // Is the rage perk activated?

/** For non-owning pawns to know any multiplier on the reload. */
var float               r_fFasterWeaponSwitchMultiplier;

var repnotify bool      r_bIsShielded;
var float				m_fShieldMultiple;					// how much energy does a damage point do while shields are up?
var repnotify byte      r_nBlinked;

var repnotify bool	    r_bIsHealthRecharging;          // Is health currently recharging?

// Verification.
var transient float s_fVE;

// Variables for fading in and out the icons of players moving out of LOS
var float				m_fTimeLastSeenByLocalPlayer;
var float				m_fTimeLastUnseenByLocalPlayer;

var float				m_fTimeLastTargetByLocalPlayer;
var float				m_fTimeLastUntargetByLocalPlayer;
///////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////// PowerPool ///////////////////////////////////////////////////////
var float               m_fCurrentPowerPool;            //Optimization, server/client each keep copy, and server will sync client when needed  
var	repnotify float     r_fCurrentPowerPool;		    //Variable server use to sync client
var	        float       r_fMaxPowerPool;			    //Buffable
var			float       r_fPowerPoolRechargeRate;	    //Buffable

/////////////////////////////////////// Health Regen ////////////////////////
var			float		m_fSecondsBeforeAutoHeal;		// Buffable
var         float       m_fTickedRegenDecimal;          // Extra decimals that get cut off on the tick in rounding

var			float		m_fHeadShotFudge;				// multiple of actual head size to use for determining size of headshot target
var			float		m_fHeadShotDamageMultiple;		// multiple of damage to apply when headshot

var			float		m_fStoppingDistance;			// how long have we been careening out of control trying to stop?
var			float		m_fMaxStoppingDistance;
var			float		m_fMaxJetpackThrustSpeed;		// top speed the jetpack can propel you to
var()       float       m_fAccelRateAtMaxThrustSpeed;       
var         float       m_fMaxJettingSpeed;             // Max speed acheiveable via jetpacking alone.
var         float       m_fTerminalJettingSpeed;        // Absolute speed cap for jetting.
var         float       m_fMaxSpeedDecelerationRate;    // Rate to decelerate back to max speed.
var()       float       m_fPreserveVelocityThresholdMax;   
var()       float       m_fPreserveVelocityThresholdMin;   
var()       float       m_fPreserveVelocityZNormalThreshold;
var()       float       m_fMaxSpeedWithFlag;            // Max speed of the pawn with the flag.
var()       float       m_fDecelerationRateWithFlag;    // Rate of deceleration when over the speed limit.

////////////////Sensor support////////////////////////////////////
var repnotify int       r_nSensorAlertLevel;            // support different sensor tagged
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Pawn HUD Render
var TR_HUD_INFO         m_HudInfo;
var float               ShowHeaderUntil;    // Show the player name tag until this time.

var bool                r_bInFireLock;
var bool                bInFireLockClient;
var bool                r_bInDeployMode;
var bool                bInDeployModeClient;

var array<TrEffect>             m_AppliedEffects;    //list of managed TrEffect that have lifetime
var array<TrEffectForm>         m_AppliedEffectForms;    //list of managed TrEffect that have lifetime

var repnotify TRTakeEffectInfo  r_LastTakeEffectInfo;

var repnotify bool  r_bIsSkiing;	            // Is the pawn skiing?
var transient bool  m_bIsPlayingSkiEffects;     // Are the skiing effects actively playing?
var transient bool  m_bIsPlayingSkiEffectsSounds;     // Are the skiing effects sounds actively playing?

var float		m_fPeakSkiControlSpeed;			// center of bell curve where strafe control is highest
var float		m_fSkiControlSigmaSquare;		// width of strafe control bell curve
var float		m_fMaxSkiControlPct;			// maximum level of strafe influene on ski direction
var float		m_fSkiSlopeGravityBoost;		// linear multiplier for acceleration due to gravity while skiing
var float       m_fMaxSkiSpeed;                 // Max speed acheiveable via skiing alone.
var float       m_fTerminalSkiSpeed;	        // Absolute speed cap for skiing.

var float		m_fCurrentAccuracy;				// current weapon firing accuracy - use GetAccuracy() to access
var repnotify   bool r_bAimingMode;             // whether pawn is currently in Aiming mode, which affects pawn movement speed, accuracy, and deviceform idle animation

enum PhysicsType
{
	PhysType_SpeedCap,
	PhysType_AccelCap,
	PhysType_NoCap,
};
var(MaxAccel) PhysicsType PhysType;

/** Accel cap */
var(MaxAccel) float m_fAirAccelCapSpeedThreshold;
var(MaxAccel) float m_fAirAccelSpeed;
var(MaxAccel) float m_fSkiAccelCapSpeedThreshold;
var(MaxAccel) float m_fSkiAccelPct;

var repnotify bool  r_bIsJetting;
var bool        m_bIsJetEffectsPlaying;

struct native AssistInfo
{
	var TrPlayerController m_Damager;
	var int     m_AccumulatedDamage;
	var float	m_fDamagerTime;
};
var float		m_AssistDamagePercentQualifier;

var float       m_fLastVehicleDamagerTimeStamp;
var float		m_fLastDamagerTimeStamp;
var array<AssistInfo>	m_KillAssisters;

var float		m_fFallVelocityTransfer;		// how much to slow down when hitting a surface from flight to ski

var TrAnimNodeAimOffset m_AimOffsetNode;
var TrAnimNodeAimOffset m_1pBodyAimOffsetNode;
var TrAnimNodeBlendByVehicle m_VehicleBlendNode;
var TrAnimNodeBlendByRidingPassenger m_RidingPassengerBlendNode;
var MorphNodeWeight m_OverlayMorphNode;

var float		m_fFriendlyShowDistanceThreshold;
var float		m_fEnemyShowDistanceThreshold;
var float		m_fShowObjectThreshold;

var repnotify vector r_avMultiShotLocation[MAX_MULTISHOT_LOCATIONS];

// This is defined here, rather in TrPlayerPawn, because it modulates per-tick when skiing.
var(Sounds) AudioComponent m_AudioComponentSkiLoop;
var(Sounds) AudioComponent m_AudioComponentShieldPackLoop;
var(Sounds) AudioComponent m_AudioComponentStealthPackLoop;
var(Sounds) AudioComponent m_AudioComponentJammerPackLoop;
var(Sounds) AudioComponent m_AudioComponentSpeedSound;
var(Sounds) AudioComponent m_AudioComponentJetpackLoop;
var(Sounds) AudioComponent m_AudioComponentHealthRechargeLoop;
var(Sounds) AudioComponent m_AudioComponentRageLoop;

/** Speed from previous tick. */
var float m_OldSpeed;

var array<EffectFormOverwrite>  m_EffectFormOverwrite;
var Material                    r_ReplicatedWeaponAttachmentMat;

//// JAMMING

var TrPawnCollisionProxy                m_JammingCollisionProxy;			// proxy for players to jam - active only while jamming
var float						        m_fJamEffectRadius;			
var array<TrPawn>				        m_JammedFriends;					// friends we are currently jamming
var array<TrPawn>			            m_JammedEnemies;					// enemies we are currently jamming
var int							        m_JammingFriendTeam;				// keep track of which team is called friend relative to jamming variables
var repnotify bool                      r_bIsJamming;	                    // Is this pawn's jammer pack enabled?
var repnotify TrPlayerReplicationInfo   r_FriendJammingPRI;                 // PRI of a friend that you are joining a jam with, i.e., he is using the jammer pack and you are in the effect radius.
var array<TrPlayerReplicationInfo>      m_FriendJammingList;                // Authority only! List of friends who have their jammer packs enabled near you. Server will pick the first one and set r_FriendJammingPRI so clients know who is jamming.
var repnotify int                       r_nEnemyJamCount;	                // number of enemy jammers currently on this pawn
var repnotify int                       r_nFriendlyDropJammerCount;               
var repnotify int                       r_nEnemyDropJammerCount;                
var array<TrDeployable_DropJammer>      m_FriendlyDropJammerList;           // Authority only! List of nearby friendly Drop Jammers. Server will pick the first one and set r_FriendlyDropJammer so clients know which is jamming.
var array<TrDeployable_DropJammer>      m_EnemyDropJammerList;              // Authority only! List of nearby enemy Drop Jammers. Server will pick the first one and set r_EnemyDropJammer so clients know which is jamming.


var float m_fMaxJetpackBoostGroundspeed;				// max ground speed that still allows you to get a boost when you launch in the jetpack
var float m_fForwardJettingPct;                         // When moving forward and jetting, pct of the forward that actually gets applied to acceleration.

// --Overlay skin.--
// ShieldPack
var Material                    m_ShieldPackOverlayMaterial;             // Content authored material.
var MaterialInstanceConstant    m_ShieldPackOverlayMIC;                  // Specific material instance for this actor.
var() float                     m_fOverlayMaterialActivateSpeed;        // Time to ramp up material.
var() float                     m_fOverlayMaterialDeactivateSpeed;      // Time to ramp down material.
var() float                     m_fShieldPackMaterialHitRampDownSpeed;   // Time to ramp down hit effect on material.
// Regen
var Material                    m_RegenOverlayMaterial;                 // Content authored material.
var MaterialInstanceConstant    m_RegenOverlayMIC;                      // Generic regen material instance.
var Material                    m_RegenPackOverlayMaterial;             // Content authored material.
var MaterialInstanceConstant    m_RegenPackPackOverlayMIC;	            // Regen pack material instance.
// Jammer Pack
var Material                    m_JammerPackOverlayMaterial;
var MaterialInstanceConstant    m_JammerPackOverlayMIC;
// Rage
var Material                    m_RageOverlayMaterial;
var MaterialInstanceConstant    m_RageOverlayMIC;
// Invulnerable
var Material                    m_InvulnerableOverlayMaterial;
var MaterialInstanceConstant    m_InvulnerableOverlayMIC;

/** Body mesh seen by players in 1p perspective. */
var() UDKSkeletalMeshComponent m_FirstPersonBodyMesh;
var() UDKSkeletalMeshComponent m_FirstPersonBodyOverlayMesh;

/** Body shadow mesh seen by players in 1p perspective. */
var() UDKSkeletalMeshComponent m_FirstPersonBodyShadowMesh;

/** Weapon shadow mesh seen by players in 1p perspective. */
var() UDKSkeletalMeshComponent m_FirstPersonWeaponShadowMesh;

/** Weapon shadow mesh seen by players in 1p perspective. */
var() UDKSkeletalMeshComponent m_FirstPersonFlagShadowMesh;

/** Ski ground effect. */
struct native FootstepParticleInfo
{
	var name MaterialType;
	var ParticleSystem FootParticle;
};
var array<FootstepParticleInfo> m_SkiParticles;
var float                       m_fGroundSkiEffectDist;
var ParticleSystemComponent     m_GroundSkiPSC;

/** How much to bring the head/camera forward in the view (to offset the legs). */
var float m_fPawnViewForwardAmount;

var bool  m_bLoadoutReset;

// List of places where sticky projectiles (like sticky grenades, arx buster) can stick
struct native StickyGrenadeSocketInfo
{
	var name                        SocketName;
	var TrProjectile                Projectile;
	var UDKSkeletalMeshComponent    FirstPersonMesh;
	var vector                      ViewOffset;
};
var() array<StickyGrenadeSocketInfo>  m_StickyGrenadeSocketList;
var transient bool                  m_bUpdateStickyGrenades;    // An optimization. Should be false if there are no grenades currently stuck on the pawn.

var repnotify bool r_bIsInvulnerable;

/** Used in cases where we do not replicate the rotation of a pawn. */
var() byte r_RemoteViewYaw;

/** Is the pawn currently in a Conduit? */
var transient bool m_bIsInConduit;

//$$ML: Used for tagging this actor on local client as being a potential target for a seeking missile.
var float m_fRemainingPotentialSeekingTargetHUDZoomTime;    // Remaining time to zoom the potential target diamond.
var() rotator m_rPotentialSeekingTargetHUDRotation;         // Current rotation for the rotating diamond.
var float m_fRemainingSeekingTargetHUDZoomTime;             // Remaining time to zoom the target brackets.
var EMissileLock m_MissileLockStatus;                       // What is our current missile lock status?
//$$ML: End.

var float m_bJustLandedSpeedSq;         // If set from the previous tick, check to see if there is a rapid change in velocity to deal damage.
var() float m_fSplatDamageFromLandMin;  // Min fall damage from splatting.
var() float m_fSplatDamageFromLandMax;  // Max fall damage from splatting.
var() float m_fSplatDamageFromWallMin;  // Min wall damage from splatting.
var() float m_fSplatDamageFromWallMax;  // Max wall damage from splatting.
var() float m_fSplatSpeedMin;           // Min speed that pawn needs to go before splatting.
var() float m_fSplatSpeedMax;           // Max speed that deals max damage for splatting.
var bool m_bSplattedAgainstWall;        // Did the last splat happen from hitting a wall?

var() float m_fClotheslineDamageMin; // Min damage a pawn receives from a clothesline.
var() float m_fClotheslineDamageMax; // Max damage a pawn receives from a clothesline
var() float m_fClotheslineSpeedDifferenceMin; // Min speed difference between victim and damage dealer for a clothesline to happen.
var() float m_fClotheslineSpeedDifferenceMax; // Max damage occurs with clotheslines at or above this speed.
var transient float m_fLastTakeClotheslineDamageTimestamp;

// MJD: Used for server side hit validation
const VELOCITY_HISTORY_SIZE = 3;
var array <vector> m_aPreviousVelocities;
var array <vector> m_aPreviousLocations;
var array <float> m_aPreviousTickTimes;

/** Holds the class of the in-hand weapon when an auto-fire device was fired. */
var	UTWeaponAttachment m_InHandWeaponAttachmentFromAutoFire;

/** Replicates whiteout grenades. */
var repnotify byte r_nWhiteOut;

/** Health bar MIC */
var MaterialInstanceConstant m_HealthBarMIC;

/** MIC used for the HUD marker */
var transient MaterialInstanceConstant m_MarkerMIC;

/** Vehicle pointer for riding pawns to get the correct HUD */
var TrVehicle m_RidingVehicle;

/** Used for the hold game object check timer */
var UDKCarriedObject m_GameObjCheckTimer;

// has this pawn been detected by a scanner?
var int m_nDetectedByEnemyScannerCount;
var protected bool r_bDetectedByEnemyScanner;

/** Timestamp for last inventory station visit. */
var transient float m_fLastInventoryStationVisitTime;

/** How long to lock out from using an inventory station after a successful visit. */
var float m_fInventoryStationLockoutTime;

var TrStatsInterface Stats;

var transient SkeletalMesh m_GibMesh;

var(SmoothRotation)	bool m_bUseSmoothNetReceiveRotation; // Use smooth rotation?
var(SmoothRotation) rotator m_PreviousNetReceiveRotation;	// Contains the last known rotation before we update a simulated pawn's rotation
var(SmoothRotation)	rotator m_TargetNetReceiveRotation;		// Contains the current rotation of the pawn, as seen on the server. The idea is to interpolate to this target rotation for smooth rotation.
var(SmoothRotation) float m_RotationInterpRate;			// The interpolation rate when smoothly rotating.
var(SmoothRotation) int m_nNetRotationCount;            // What change are we on?
var(SmoothRotation) int m_nSmoothedRemoteViewPitch;
var int m_nPreviousReceivedRemoteViewPitch;
var int m_nTargetRemoteViewPitch;
var float m_PitchInterpRate;
var int m_nNetViewPitchCount; 

/** If non-null, we are currently using a fallback skin and will need to switch to this skin at an appropriate time. */
var transient protected class<TrPlayerSkin3PData> c_Pending3PSkin;
var transient protected class<TrPlayerSkin1PData> c_Pending1PSkin;

/** How far the pawn has to be away from the local player to swap to a pending skin. */
var float m_fSwapSkinDistSq;

var() float m_TerrainWalkableFloorZ;

/** AlienFX */
var FXOverlay LastFXOverlay;

/** Used for unifying deceleration calculations when walking. */
enum WalkingDeceleration
{
	WalkingDeceleration_None,
	WalkingDeceleration_A,
	WalkingDeceleration_B,
	WalkingDeceleration_C,
	WalkingDeceleration_D,
	WalkingDeceleration_E
};

replication
{
	// replicated properties
	if (bNetDirty && Role == ROLE_Authority)
		r_nFactionId, r_LastTakeEffectInfo, r_bIsJamming, r_FriendJammingPRI, r_nEnemyJamCount, r_MissileLock, r_bIsSkiing, r_nSensorAlertLevel, r_ReplicatedWeaponAttachmentMat, r_avMultiShotLocation, r_bIsHealthRecharging, 
			r_bIsShielded, r_FlashNormal, r_nFriendlyDropJammerCount, r_nEnemyDropJammerCount, r_bIsStealthed, r_bAimingMode, r_nWhiteOut, r_bDetectedByEnemyScanner, r_nBlinked, r_fPulseStealthSpeedThreshold, r_nPulseStealth;
    if (bNetDirty && bNetOwner && Role == ROLE_Authority)
		r_fPowerPoolRechargeRate, r_fMaxPowerPool, r_fCurrentPowerPool, r_LockedTarget, r_bIsInvulnerable, r_bIsRaged;
    if (bNetDirty && !bNetOwner && Role == ROLE_Authority)
        r_bIsJetting, r_RemoteViewYaw;
}

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

native function                     CheckGrabSpeed();
native function int                 CalculatePawnSpeed();
native function float               NativeGetCollisionHeight();
native function float               NativeGetCollisionRadius();
native function                     SyncClientCurrentPowerPool();
native function                     ConsumePowerPool(float fAmount);
native function                     RegainPowerPool(float fDeltaTime);
native function float               GetPowerPoolPercent();
native function                     GetCurrentDeviceAccuracyInfo(out float fAccuracy, out float fAmountCurrentlyOffOfTargetAccuray);
simulated native function           SetOverlayMaterial(MaterialInterface NewOverlay);
reliable native server function bool ServerUpdateLockedTarget(actor Locked);
simulated native function           NativePostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir);

/**
 * @param RequestedBy - the Actor requesting the target location
 * @param bRequestAlternateLoc (optional) - return a secondary target location if there are multiple
 * @return the optimal location to fire weapons at this actor
 */
native simulated function vector GetTargetLocation(optional actor RequestedBy, optional bool bRequestAlternateLoc) const;
////////////////////////////////////////////////////////////////////////////////////////

simulated function SetFlashNormal(vector FlashNormal)
{
	r_FlashNormal=FlashNormal;
	bNetDirty=TRUE;
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
  
    // Ensure we get the correct inventory once we have crated the manager
	if (Role == ROLE_Authority)
	{
        Stats = TrGame(WorldInfo.Game).Stats;
		RefreshInventory(true);
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == Mesh )
    {
        m_AimOffsetNode = TrAnimNodeAimOffset(Mesh.FindAnimNode('AimOffset'));
        m_VehicleBlendNode = TrAnimNodeBlendByVehicle(Mesh.FindAnimNode('VehicleBlendNode'));
		FullBodyAnimSlot = AnimNodeSlot(Mesh.FindAnimNode('FullBodySlot'));
		m_RidingPassengerBlendNode = TrAnimNodeBlendByRidingPassenger(Mesh.FindAnimNode('PassengerBlend'));
    }
	else if( SkelComp == m_FirstPersonBodyMesh && IsLocallyControlled() && IsHumanControlled() )
	{
		m_1pBodyAimOffsetNode = TrAnimNodeAimOffset(m_FirstPersonBodyMesh.FindAnimNode('AimOffset'));
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

		// If the Pawn is stealthed and their speed is over the speed threshold, pulse them.
		if (r_bIsStealthed && r_fPulseStealthSpeedThreshold > 0.0f && VSizeSq(Velocity) > r_fPulseStealthSpeedThreshold * r_fPulseStealthSpeedThreshold)
		{
			PulseStealth(true);
		}

 		m_rPotentialSeekingTargetHUDRotation.Yaw += class'TrHUD'.default.m_nPotentialSeekingTargetHUDRotationRate * DeltaTime;
		Normalize(m_rPotentialSeekingTargetHUDRotation);
	}
}

function float GetCurrentPowerPool()
{
    return (m_fCurrentPowerPool);
}

function float GetMaxPowerPool()
{
    return (r_fMaxPowerPool);
}

function int GetCurrentCredits()
{
    return TrPlayerController(Controller).GetCurrentCredits();
}

//
//	override so we can force the loadout menu to appear
//
simulated function ClientReStart()
{
	Super.ClientRestart();
}

function int CurrentDeployedCount(class <TrDevice> deviceClass)
{
	local TrGameReplicationInfo GRI;
	local int deployedCount;
	local TrDeployable dep;

	deployedCount=0;

    GRI = TrGameReplicationInfo(WorldInfo.GRI);
    if(GRI!=None)
    {
		foreach GRI.m_Deployables(dep)
		{
			if (dep.m_Controller==Controller && InStr(string(dep),string(deviceClass.default.m_WeaponDeployables[0]))==0)
			{
				deployedCount++;
			}
		}
    }	

	return deployedCount;
}

//
//	
//
simulated function ExitDeployMode()
{
	r_bInDeployMode = false;
	bInDeployModeClient = false;

	// DeployableDesignTest Removed this for deployable design experiment.
	/*
	if (invManager!=None) 
		TrInventoryManager(invManager).DiscardEquippedDeployable();
	*/
}

/** Accessor for getting the family info for this pawn in 'Tr' format. */
simulated function class<TrFamilyInfo> GetCurrCharClassInfo()
{
    return class<TrFamilyInfo>(CurrCharClassInfo);
}

/** Accessor to make sure we always get a valid UTPRI */
simulated function TrPlayerReplicationInfo GetTribesReplicationInfo()
{
	local TrPlayerReplicationInfo TrPRI;

	TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);
	if (TrPRI == None)
	{
		if (DrivenVehicle != None)
		{
			TrPRI = TrPlayerReplicationInfo(DrivenVehicle.PlayerReplicationInfo);
		}
	}

	return TrPRI;
}

simulated function TrHUD GetTrHud()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(Controller);
	if( TrPC != none )
	{
		return TrHUD(TrPC.myHUD);
	}
	return none;
}

simulated event EArmorType GetArmorType()
{
	local TrPlayerReplicationInfo TrPRI;

	TrPRI = GetTribesReplicationInfo();
	if (TrPRI != none)
		return TrPRI.GetArmorType();

	return ARMOR_Medium;
}

simulated event ReplicatedEvent(name VarName)
{
	local int i;

    if (VarName == 'r_fCurrentPowerPool')
    {
        m_fCurrentPowerPool = r_fCurrentPowerPool;
        return;
    }
	else if( VarName == 'r_bIsHealthRecharging' )
	{
		ClientPlayHealthRegenEffect();
	}
    else if (VarName == 'r_nFactionId')
    {
        //SetMeshFromInfo();
        return;
    }
    else if( VarName == 'r_bIsJetting' )
    {
        if( r_bIsJetting && !r_bIsStealthed )
        {
            PlayJetpackEffects();
        }
        else
        {
            StopJetpackEffects();
        }
		return;
    }
	else if (VarName == 'r_avMultiShotLocation')
	{
		// push each of the multiple flash locations through as if individual flashes were being replicated
		for (i=0; i<MAX_MULTISHOT_LOCATIONS; i++)
		{
			if (!IsZero(r_avMultiShotLocation[i]))
			{
				FlashLocation = r_avMultiShotLocation[i];
				super.ReplicatedEvent('FlashLocation');
			}
			else
			{
				break;
			}
		}
		return;
	}
    else if( VarName == 'r_bIsShielded' )
    {
        PlayShieldPackEffect();
    }
	else if( VarName == 'r_nBlinked' )
	{
		if (GetALocalPlayerController() != Controller)
		{
			PlayBlinkPackEffect();
		}
	}
	else if( VarName == 'r_bIsStealthed' )
	{
		PlayStealthPackEffect();
	}
	else if (VarName == 'r_bIsRaged')
	{
		PlayRageEffect();
	}
	else if (VarName == 'r_bIsInvulnerable')
	{
		PlayInvulnerabilityEffect();
	}
	else if( VarName == 'r_bIsJamming' )
	{
		PlayJammerPackEffect();
	}
	else if( VarName == 'r_FriendJammingPRI' )
	{
		PlayJammingByFriendEffect();
	}
	else if( VarName == 'r_nFriendlyDropJammerCount' )
	{
		PlayJammingByFriendlyDropJammerEffect();
	}
	else if( VarName == 'r_nEnemyDropJammerCount' )
	{
		PlayJammingByEnemyDropJammerEffect();
	}
	else if( VarName == 'r_nEnemyJamCount' )
	{
		PlayEnemyJammerPackEffect(true);
	}
	else if( VarName == 'r_nWhiteOut' )
	{
		PlayWhiteoutEffect();
	}
	else if (VarName == 'DrivenWeaponPawn')
	{
		if (DrivenWeaponPawn.BaseVehicle != LastDrivenWeaponPawn.BaseVehicle || DrivenWeaponPawn.SeatIndex != LastDrivenWeaponPawn.SeatIndex)
		{
			if (TrVehicle(DrivenWeaponPawn.BaseVehicle) != None && TrVehicle(DrivenWeaponPawn.BaseVehicle).Seats[DrivenWeaponPawn.SeatIndex].m_bAttachPawnDirectly )
			{
				// Pawn is riding.
				StartRidingInVehicle(TrVehicle(DrivenWeaponPawn.BaseVehicle), DrivenWeaponPawn.SeatIndex);

				LastDrivenWeaponPawn = DrivenWeaponPawn;

				// We do not want this replication notify to trigger on parent if we triggered here, so return.
				return;
			}
			else
			{
				// Pawn is no longer riding.
				if( DrivenVehicle == none ) // If swapped seats to a driving position, don't call StopRidingInVehicle.
				{
					StopRidingInVehicle();
				}
			}
		}
		LastDrivenWeaponPawn = DrivenWeaponPawn;
	}
	else if( VarName == 'r_bIsSkiing' )
	{
		SetSkiing(r_bIsSkiing);
	}
	else if( VarName == 'r_nPulseStealth' )
	{
		PulseStealth(true);
	}
		
	super.ReplicatedEvent(VarName);
}

//
//	Multiple instant hits happening in one tick... save all hit location values and replicate them out to clients that don't simulate
//
function ReplicateMultiFlashLocation( int shotNumber, vector HitLocation )
{
	if (shotNumber<MAX_MULTISHOT_LOCATIONS)
		r_avMultiShotLocation[shotNumber]=HitLocation;
}

//
//	Equip this point with what the user wants, if they can afford it
//
function EquipBestPossibleDevice(TR_EQUIP_POINT eqpPoint)
{
	local TrDevice		          TrWeap;
	local class<TrDevice>         WeaponClass;
	local TrPlayerController      TrPC;
	local TrPlayerReplicationInfo TrPRI;
    local class<TrFamilyInfo>     FamilyInfo;
	local TrValueModifier         VM;

	TrPRI = GetTribesReplicationInfo();
	if (TrPRI == none)
		return;

	TrPC = TrPlayerController(Controller);
	if (TrPC == none)
		return;

    FamilyInfo = GetCurrCharClassInfo();

    if (FamilyInfo == none)
    {
        ;
        return;
    }

    WeaponClass = TrPRI.GetEquipDevice(FamilyInfo, eqpPoint);

	if (WeaponClass != none)
	{
		if (invManager != none)
		{
			TrWeap = TrDevice(CreateInventory(WeaponClass, true));
			if (TrWeap != none)
			{
				TrWeap.r_eEquipAt = eqpPoint;
				bNetDirty = true;

				// Destroy our owned deployables or mines if they've changed.
				if (eqpPoint == EQP_Pack)
				{
					TrPC.DestroyAllOwnedDeployables(TrWeap.Class);
				}
				else if (eqpPoint == EQP_Belt)
				{
					TrPC.DestroyAllOwnedMines(TrWeap.Class);
				}

				// Skills/perks
				VM = TrPRI.GetCurrentValueModifier();
				if( VM != none )
				{
					if( eqpPoint == EQP_Belt )
					{
						TrWeap.BuffMaxCarriedAmmo(VM.m_nExtraOffhandAmmo + VM.m_nExtraGrenadesFromPickupBuff);
						TrWeap.AddCarriedAmmo(VM.m_nExtraOffhandAmmo);
					}
					else if( eqpPoint == EQP_Primary )
					{
						TrWeap.BuffMaxCarriedAmmo(VM.m_nExtraPrimaryAmmo);
						TrWeap.AddCarriedAmmo(VM.m_nExtraPrimaryAmmo);
					}
					else if( eqpPoint == EQP_Secondary )
					{
						TrWeap.BuffMaxCarriedAmmo(VM.m_nExtraSecondaryAmmo);
						TrWeap.AddCarriedAmmo(VM.m_nExtraSecondaryAmmo);
					}
				}
			}
		}
    }
}

simulated function InitDefaultAnims(class<UTFamilyInfo> Info)
{
	local class<TrFamilyInfo> FamilyInfo;
	local TrDeviceAttachment WeaponAttachment;

	FamilyInfo = class<TrFamilyInfo>(Info);
	if (FamilyInfo == none)
	{
		return;
	}

	if (DrivenVehicle != none)
	{
		TrVehicle(DrivenVehicle).UpdateSeatAnimations(self, 0);
	}
	else if (DrivenWeaponPawn.BaseVehicle != none)
	{
		TrVehicle(DrivenWeaponPawn.BaseVehicle).UpdateSeatAnimations(self, DrivenWeaponPawn.SeatIndex);
	}
	else
	{
		Mesh.AnimSets.Remove(0, Mesh.AnimSets.Length);
		Mesh.AnimSets = FamilyInfo.default.AnimSets;
		Mesh.SetAnimTreeTemplate(FamilyInfo.default.m_3pAnimTreeTemplate);
		Mesh.UpdateAnimations();
	}

	if (OverlayMesh != none)
	{
		/*OverlayMesh.MorphSets.Remove(0, OverlayMesh.MorphSets.Length);
		OverlayMesh.MorphSets.Add(1);
		OverlayMesh.MorphSets[0] = FamilyInfo.default.m_OverlayMorphTarget;*/
		OverlayMesh.SetAnimTreeTemplate(OverlayMesh.AnimTreeTemplate);
		OverlayMesh.UpdateAnimations();

		// Fetch the morph node.
		//m_OverlayMorphNode = MorphNodeWeight(OverlayMesh.FindMorphNode('Overlay'));
	}

	WeaponAttachment = TrDeviceAttachment(CurrentWeaponAttachment);
	if( WeaponAttachment != none )
	{
		WeaponAttachment.InitAnims(self);
	}
}

/** Set various basic properties for this UTPawn based on the character class metadata */
simulated function SetCharacterClassFromInfo(class<UTFamilyInfo> Info, optional bool bForce=false)
{
	local int i;
	local TrPlayerController PC;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerReplicationInfo TrPRI;
	local TrGameReplicationInfo TrGRI;
	local float SpeedMultiplier;
	local TrDevice CurrentWeapon;
	local SkeletalMesh New3PSkelMesh, NewBodySkelMesh;
    local class<TrSkin> skinClass;

    if (Info == none) return;

	TrPRI = GetTribesReplicationInfo();
	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
    
    if (Info != CurrCharClassInfo || bForce)
    {
        FamilyInfo = class<TrFamilyInfo>(Info);
        
        PC = TrPlayerController(Controller);

		if( Role == ROLE_Authority )
		{
			if( PC != none && PC.m_OldPossessedFamilyInfo != Info )
			{			
				// Destroy any turrets that we had in an older class.
				PC.DestroyAllOwnedDeployables();
				PC.DestroyAllOwnedMines();

				PC.m_OldPossessedFamilyInfo = FamilyInfo;
			}
		}
        else if (PC != none)
        {
			SpeedMultiplier = 1.0;
			if( TrGRI != none )
			{
				SpeedMultiplier = TrGRI.GetGlobalSpeedCapMultiplier();
			}

            PC.ConfigureSkiSpeedSteps(FamilyInfo.default.m_fFIMaxSkiSpeed * SpeedMultiplier);
        }

        // Set Family Info
		CurrCharClassInfo = FamilyInfo;

		// Make sure our skills are up to date.
		if (TrPRI != none)
		{
			TrPRI.UpdateValueModifier();
		}

        // 3p mesh
		if( TrPRI != none )
		{
			skinClass = TrPRI.GetCurrentSkinClass(FamilyInfo);
		}

		if( IsLocallyControlled() )
		{
			if (skinClass != none)
			{
				TrPRI.UpdateCachedSkin();
                TrPRI.Update1PMesh(FamilyInfo);
                
                m_GibMesh = TrPRI.GetGibMesh(FamilyInfo);
				New3PSkelMesh = TrPRI.Get3PSkin();
				NewBodySkelMesh = TrPRI.GetBodyMesh();
			}
		}
		else
		{
			if( TrPRI != none )
			{
				// For simulated pawns, our local version of their PRI is responsible for loading 
				// any skins they may have equipped. If they have a skin and if it is loaded, Get3PSkin() 
				// will return the loaded mesh, otherwise the pawn will be notified through the PRI 
				// when the skin arrives through SetPendingSkin().
                m_GibMesh = TrPRI.GetGibMesh(FamilyInfo);
				New3PSkelMesh = TrPRI.Get3PSkin();
			}
		}

		if( New3PSkelMesh == none )
		{
			// Fallback or no class-skin found.
			New3PSkelMesh = FamilyInfo.default.CharacterMesh;
		}

		if( NewBodySkelMesh == none )
		{
			NewBodySkelMesh = FamilyInfo.default.m_FirstPersonBodyMesh;
		}

		Mesh.SetSkeletalMesh(New3PSkelMesh);

		if( skinClass != none )
		{
			Mesh.TranslucencySortPriority = skinClass.default.TranslucencySortPriority;
		}

		if (OverlayMesh != None)
			OverlayMesh.SetSkeletalMesh(New3PSkelMesh);
		InitDefaultAnims(FamilyInfo);
        Mesh.SetPhysicsAsset(FamilyInfo.default.PhysAsset, true);
		ResetCharPhysState();
        Mesh.SetMaterial(0, Mesh.SkeletalMesh.Materials[0]);
        Mesh.CreateAndSetMaterialInstanceConstant(0);

        //Overlay mesh for effects
        InitializeOverlayMaterials();

        ClearSkiParticleEffects();
        ClearJetpackParticleEffects();

		if( IsLocallyControlled() && IsHumanControlled() )
		{
			if( m_FirstPersonBodyMesh != none )
			{
				// Visible body mesh.
				if( !m_FirstPersonBodyMesh.bAttached )
				{
					AttachComponent(m_FirstPersonBodyMesh);
				}

				m_FirstPersonBodyMesh.AnimSets = Info.default.AnimSets;
				m_FirstPersonBodyMesh.SetSkeletalMesh(NewBodySkelMesh);
				if( skinClass != none )
				{
					m_FirstPersonBodyMesh.TranslucencySortPriority = skinClass.default.TranslucencySortPriority;
				}

				// Set up overlay mesh.
				m_FirstPersonBodyOverlayMesh.SetParentAnimComponent(m_FirstPersonBodyMesh);
				m_FirstPersonBodyOverlayMesh.SetSkeletalMesh(NewBodySkelMesh);

				// Body shadow mesh.
				if( m_FirstPersonBodyShadowMesh != none )
				{
					if( !m_FirstPersonBodyShadowMesh.bAttached )
					{
						AttachComponent(m_FirstPersonBodyShadowMesh);
					}
					m_FirstPersonBodyShadowMesh.SetSkeletalMesh(New3PSkelMesh);
					m_FirstPersonBodyShadowMesh.SetParentAnimComponent(m_FirstPersonBodyMesh);
				}
			}

			// Make sure the hands mesh for the weapon are correct (if the inventory manager got to the client
			// before the class did, the hands may have been an older suit version).
			CurrentWeapon = TrDevice(Weapon);
			if( CurrentWeapon != none )
			{
				CurrentWeapon.CentralUpdateHandsMesh(FamilyInfo);
			}
		}

        SoundGroupClass = FamilyInfo.default.SoundGroupClass;

	    DefaultMeshScale = FamilyInfo.Default.DefaultMeshScale;
	    Mesh.SetScale(DefaultMeshScale);
        SetCollisionSize(FamilyInfo.Default.m_fCollisionRadius, FamilyInfo.Default.m_fCollisionHeight);
	    BaseTranslationOffset = FamilyInfo.Default.BaseTranslationOffset;

		SetValuesFromCurrentFamilyInfo();
	}

	if (TrPRI != None)
	{
		if ( (TrPRI.Team != None) && !IsHumanControlled() || !IsLocallyControlled()  )
		{
			LightEnvironment.LightDesaturation = 1.0;
		}
        
		if (WorldInfo.NetMode != NM_DedicatedServer)
		{
			// refresh weapon attachment
			if (CurrentWeaponAttachmentClass != None)
			{
				// recreate weapon attachment in case the socket on the new mesh is in a different place
				if (CurrentWeaponAttachment != None)
				{
					CurrentWeaponAttachment.DetachFrom(Mesh);
					CurrentWeaponAttachment.Destroy();
					CurrentWeaponAttachment = None;
				}
				WeaponAttachmentChanged();
			}
			// refresh overlay
			if (OverlayMaterialInstance != None)
			{
				SetOverlayMaterial(OverlayMaterialInstance);
			}
		}

		// Make sure physics is in the correct state.
		// Rebuild array of bodies to not apply joint drive to.
		NoDriveBodies.length = 0;
		for( i=0; i<Mesh.PhysicsAsset.BodySetup.Length; i++)
		{
			if(Mesh.PhysicsAsset.BodySetup[i].bAlwaysFullAnimWeight)
			{
				NoDriveBodies.AddItem(Mesh.PhysicsAsset.BodySetup[i].BoneName);
			}
		}

		// Reset physics state.
		bIsHoverboardAnimPawn = FALSE;
		ResetCharPhysState();
	}

	// Hold the flag if we have it.
	if (m_GameObjCheckTimer != none)
	{
		HoldGameObject(m_GameObjCheckTimer);
	}

	if (!bReceivedValidTeam)
	{
		SetTeamColor();
		bReceivedValidTeam = (GetTeam() != None);
	}

    // Reset power pool.
    m_fCurrentPowerPool = r_fMaxPowerPool;
    SyncClientCurrentPowerPool();

	// Update max speed with flag settings.
	if( TrGRI != none && TrGRI.r_ServerConfig != none )
	{
		if( ClassIsChildOf(CurrCharClassInfo, class'TrFamilyInfo_Light') )
		{
			m_fMaxSpeedWithFlag = TrGRI.r_ServerConfig.MaxSpeedWithFlagLight / 0.072;
		}
		else if( ClassIsChildOf(CurrCharClassInfo, class'TrFamilyInfo_Medium') )
		{
			m_fMaxSpeedWithFlag = TrGRI.r_ServerConfig.MaxSpeedWithFlagMedium / 0.072;
		}
		else
		{
			m_fMaxSpeedWithFlag = TrGRI.r_ServerConfig.MaxSpeedWithFlagHeavy / 0.072;
		}
		m_fDecelerationRateWithFlag = TrGRI.r_ServerConfig.DecelerationRateWithFlag / 0.072;
	}
	else
	{
		if( ClassIsChildOf(CurrCharClassInfo, class'TrFamilyInfo_Light') )
		{
			m_fMaxSpeedWithFlag = class'TrServerSettingsInfo'.default.MaxSpeedWithFlagLight / 0.072;
		}
		else if( ClassIsChildOf(CurrCharClassInfo, class'TrFamilyInfo_Medium') )
		{
			m_fMaxSpeedWithFlag = class'TrServerSettingsInfo'.default.MaxSpeedWithFlagMedium / 0.072;
		}
		else
		{
			m_fMaxSpeedWithFlag = class'TrServerSettingsInfo'.default.MaxSpeedWithFlagHeavy / 0.072;
		}
		
		m_fDecelerationRateWithFlag = class'TrServerSettingsInfo'.default.DecelerationRateWithFlag / 0.072;
	}
}

// This function is a wrapper for making sure we're on our latest pending class
// and refreshing our inventory.
simulated function ActivatePendingClass(optional bool bIsRespawn = false, optional bool bCallin = false)
{
	local TrPlayerReplicationInfo PRI;
    local TrGameReplicationInfo TrGRI;

	PRI = GetTribesReplicationInfo();

	if (PRI != none)
	{
        TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

        if (TrGRI == none || TrGRI.r_ServerConfig == none || !(bCallin && TrGRI.r_ServerConfig.bSupplyDropAmmoOnly))
        {
            PRI.SwapToPendingCharClass(bIsRespawn);
        }

	    RefreshInventory(bIsRespawn, bCallin);
	}
}

simulated function RefreshInventoryTimer()
{
	RefreshInventory(m_bRefreshInventoryWasRespawn);
}

simulated function SetValuesFromCurrentFamilyInfo()
{
	local class<TrFamilyInfo> FamilyInfo;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local TrGameReplicationInfo TrGRI;
	local float SpeedCapMultiplier, AccelerationMultiplier, AirSpeedMultiplier, MaxJetpackThrustSpeedMultiplier;

	FamilyInfo = GetCurrCharClassInfo();

	// Get the default values.
	if( FamilyInfo != none )
	{
		SpeedCapMultiplier = 1.0;
		AccelerationMultiplier = 1.0;
		AirSpeedMultiplier = 1.0;
		MaxJetpackThrustSpeedMultiplier = 1.0;
		TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
		if( TrGRI != none )
		{
			SpeedCapMultiplier = TrGRI.GetGlobalSpeedCapMultiplier();
			AccelerationMultiplier = TrGRI.GetGlobalAccelerationMultiplier();
			AirSpeedMultiplier = TrGRI.GetGlobalAirSpeedMultiplier();
			MaxJetpackThrustSpeedMultiplier = TrGRI.GetGlobalMaxJetpackThrustSpeedMultiplier();
		}

		GroundSpeed = FamilyInfo.default.m_fMaxGroundSpeed;
		Mass = FamilyInfo.default.m_fMass;
		m_fMaxJettingSpeed = FamilyInfo.default.m_fFIMaxJettingSpeed * SpeedCapMultiplier;
		m_fTerminalJettingSpeed = FamilyInfo.default.m_fFITerminalJettingSpeed * SpeedCapMultiplier;
		m_fMaxSkiSpeed = FamilyInfo.default.m_fFIMaxSkiSpeed * SpeedCapMultiplier;
		m_fTerminalSkiSpeed = FamilyInfo.default.m_fFITerminalSkiSpeed * SpeedCapMultiplier;
		m_fMaxSpeedDecelerationRate = FamilyInfo.default.m_fFIMaxSpeedDecelerationRate;
		AirControl = FamilyInfo.default.m_fFIAirControl;
		AirSpeed = FamilyInfo.default.m_fFIAirSpeed * AirSpeedMultiplier;
		m_fPeakSkiControlSpeed = FamilyInfo.default.m_fFIPeakSkiControlSpeed;
		m_fSkiControlSigmaSquare = FamilyInfo.default.m_fFISkiControlSigmaSquare;
		m_fMaxSkiControlPct = FamilyInfo.default.m_fFIMaxSkiControlPct;
		m_fSkiSlopeGravityBoost = FamilyInfo.default.m_fFISkiSlopeGravityBoost * AccelerationMultiplier;
		m_fMaxJetpackBoostGroundspeed = FamilyInfo.default.m_fFIMaxJetpackBoostGroundspeed;
		m_fMaxStoppingDistance = FamilyInfo.default.m_fFIMaxStoppingDistance;
		m_fFallVelocityTransfer = FamilyInfo.default.m_fFIFallVelocityTransfer;
		m_fMaxJetpackThrustSpeed = FamilyInfo.default.m_fFIMaxJetpackThrustSpeed * MaxJetpackThrustSpeedMultiplier;
		m_fAccelRateAtMaxThrustSpeed = FamilyInfo.default.m_fFIAccelRateAtMaxThrustSpeed * AccelerationMultiplier;
		m_fForwardJettingPct = FamilyInfo.default.m_fFIForwardJettingPct;
		JumpZ = FamilyInfo.default.m_FIJumpZ;
		m_fAirAccelCapSpeedThreshold = FamilyInfo.default.m_fFIAirAccelCapSpeedThreshold;
		m_fAirAccelSpeed = FamilyInfo.default.m_fFIAirAccelSpeed;
		m_fSkiAccelCapSpeedThreshold = FamilyInfo.default.m_fFISkiAccelCapSpeedThreshold;
		m_fSkiAccelPct = FamilyInfo.default.m_fFISkiAccelPct;
		if( WorldInfo.GRI != none )
		{
			PhysType = TrGameReplicationInfo(WorldInfo.GRI).r_PhysType;
		}
	}

	// Apply perks/skills.
	TrPRI = GetTribesReplicationInfo();
	if( TrPRI != none )
	{
        //TrPRI.VerifyAndLoadCharacter(FamilyInfo);
        TrPRI.UpdateValueModifier();

		VM = TrPRI.GetCurrentValueModifier();

		if( VM != none )
		{
			m_fMaxJettingSpeed += VM.m_fMaxJettingSpeedBuff;
			m_fTerminalJettingSpeed += VM.m_fTerminalJettingSpeedBuff;
			m_fMaxSkiSpeed += VM.m_fMaxSkiSpeedBuff;
			m_fTerminalSkiSpeed += VM.m_fTerminalSkiSpeedBuff;
			m_fPeakSkiControlSpeed += VM.m_fPeakSkiControlSpeedBuff;
			m_fSkiControlSigmaSquare += VM.m_fSkiControlSigmaSquareBuff;
			m_fMaxSkiControlPct *= 1.0 + VM.m_fMaxSkiControlBuffPct;
			GroundSpeed *= 1.0 + VM.m_fGroundSpeedPctBuff;
			m_fMaxStoppingDistance *= 1.0 + VM.m_fMaxStoppingDistancePctBuff;
			Mass *= 1.0 + VM.m_fMassPctBuff;
		}
	}
}

/** Refreshes the player's inventory based on selected loadout */
simulated function RefreshInventory(bool bIsRespawn, optional bool bCallin = false)
{
	local int NewMaxPower;
	local int NewMaxHealth;
    local int Perk1IconId;
    local int Perk2IconId;
	local TrHUD TrH;
	local TrValueModifier VM;
	local TrDevice_AmmoPack dev;
	local TrPlayerController TrPC;
	local TrGameReplicationInfo TrGRI;
	local TrPlayerReplicationInfo TrPRI;
    local class<TrFamilyInfo> FamilyInfo;

	TrPC = TrPlayerController(Controller);

	if (WorldInfo.NetMode != NM_DedicatedServer && GetTrHud() != none)
	{
		TrH = GetTrHud();
		if (TrH != none)
			TrH.ClearPromptPanel();
	}

	if (Role != ROLE_Authority) return;

    // reset default buffable values
    FamilyInfo = GetCurrCharClassInfo();

    // Wait a bit to try and refresh inventory.
    if (invManager == none || FamilyInfo == none)
    {
	    m_bRefreshInventoryWasRespawn = bIsRespawn;
	    SetTimer(0.03f, true, 'RefreshInventoryTimer');
	    return;
    }

    ClearTimer('RefreshInventoryTimer');

    // Record the time used on our current inventory before we swap for new stuff
    if (TrPC != none && !bIsRespawn)
    {
        TrPC.AddTimePlayed();
        TrPC.m_BeginPlayedTime = WorldInfo.TimeSeconds;
    }

    invManager.DiscardInventory();

    // Headshot data
    HeadBone = FamilyInfo.default.m_nmHeadBone;
    HeadHeight = FamilyInfo.default.m_fHeadHeightOffset;
    HeadRadius = FamilyInfo.default.m_fHeadRadius;

    SetValuesFromCurrentFamilyInfo();

    NewMaxPower = FamilyInfo.default.r_fMaxPowerPool;
    NewMaxHealth = FamilyInfo.default.m_nMaxHealthPool;
    r_fPowerPoolRechargeRate = FamilyInfo.default.m_fPowerPoolRechargeRate;
    m_fSecondsBeforeAutoHeal = FamilyInfo.default.m_fSecondsBeforeAutoHeal;

    // Reset splat.
    m_fSplatDamageFromLandMin = default.m_fSplatDamageFromLandMin;
    m_fSplatDamageFromLandMax = default.m_fSplatDamageFromLandMax;
    m_fSplatDamageFromWallMin = default.m_fSplatDamageFromWallMin;
    m_fSplatDamageFromWallMax = default.m_fSplatDamageFromWallMax;

    // Apply perks/skills.
    TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);
    if( TrPRI != none )
    {
	    VM = TrPRI.GetCurrentValueModifier();
	    if( VM != none )
	    {
		    NewMaxPower += VM.m_fExtraEnergyBuff;
		    NewMaxHealth += VM.m_fHealthBuff;
		    r_fPowerPoolRechargeRate *= 1.0 + VM.m_fEnergyRegenRateBuffPct;
		    m_fSecondsBeforeAutoHeal *= 1.0 - VM.m_fTimeToRegenHealthBuffPct;
		    m_fSplatDamageFromLandMin *= 1.0 - VM.m_fSplatDamageBuffPct;
		    m_fSplatDamageFromLandMax *= 1.0 - VM.m_fSplatDamageBuffPct;
		    m_fSplatDamageFromWallMin *= 1.0 - VM.m_fSplatDamageBuffPct;
		    m_fSplatDamageFromWallMax *= 1.0 - VM.m_fSplatDamageBuffPct;
		    m_fPulseStealthVisibleTime *= 1.0 - VM.m_fStealthPackPulseTimeBuffPct;

		    if( VM.m_bHasDetermination && bIsRespawn && TrPC != none )
		    {
			    NewMaxHealth += TrPC.GetCurrentDetermination();
		    }
	    }
    }

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none && TrGRI.r_ServerConfig != none)
    {
        NewMaxPower *= TrGRI.r_ServerConfig.fEnergyMultiplier;
    }

    SetMaxPowerPool(NewMaxPower);
    SetMaxHealthPool(NewMaxHealth);

    // Health not updating when switching classes during a respawn
    if (bIsRespawn) Health = HealthMax;

	bNetDirty=true;
    
	// ORDER of these is important for credit consumption - don't put in a loop unless all devices are priced at 0
	EquipBestPossibleDevice(EQP_Primary);
	EquipBestPossibleDevice(EQP_Pack);
	EquipBestPossibleDevice(EQP_Belt);
	EquipBestPossibleDevice(EQP_Secondary);
	EquipBestPossibleDevice(EQP_LaserTarget);
	EquipBestPossibleDevice(EQP_Melee);

	// see if we get extra ammo
	dev = TrDevice_AmmoPack(TrInventoryManager(invManager).GetDeviceByEquipPoint(EQP_Pack));
	
	if (dev!=None)
	{
		dev.ApplyAmmoBuff();
	}

    // Tell the client to update the HUD with our updated class name (could be the same, do it anyway)
    if (TrPC != none)
    {
        Perk1IconId = 0;
        Perk2IconId = 0;

		/*if (TrPRI.r_ActivePerksAndSkills.Perk1Class != none)
		{
            Perk1IconId = TrPRI.r_ActivePerksAndSkills.Perk1Class.default.IconId;
        }

		if (TrPRI.r_ActivePerksAndSkills.Perk2Class != none)
		{
            Perk2IconId = TrPRI.r_ActivePerksAndSkills.Perk2Class.default.IconId;
        }*/
            
        TrPC.ClientSetPlayerClassObjects(FamilyInfo.default.FriendlyName, Perk1IconId, Perk2IconId);
    }
}

simulated function ActivateSelectedDeployable()
{
	EquipBestPossibleDevice(EQP_Deployable);
	TrPlayerController(Controller).ActivateDevice(EQP_Deployable);
}


//Remove the managed effect by effect class type
simulated function RemoveEffectByClass(class<TrEffect> efClass)
{
    local int i;

    for(i = 0; i<m_AppliedEffects.Length; i++)
    {
        if (m_AppliedEffects[i].class == efClass)
        {
        	m_AppliedEffects[i].Remove(self);
        }
    }
}

//Server side keep track for applied effect forms that needs to replicated
simulated function ProcessEffectForm(class<TrEffectForm> efClass, optional bool bRemove)
{
    local Material newMat;
    //local Material newBodyMat;
    //local Material newWeaponMat;
    //local Material newAttachmentMat;

    local TrEffectForm efForm;
    local int i, nLength;
    local int nIndex;
    local EffectFormPriority nPriority;
    local bool bFoundHigher;
    local bool bRemoveApplied;


    if (!efClass.default.m_bIsManaged)
    {
        return;
    }
    
    newMat = efClass.default.m_BodyMat;

    if (newMat == None )
    {
        return;
    }

    if (!bRemove)
    {
        efForm = new efClass;
        
        nPriority = efForm.m_ePriority;
        nLength = m_AppliedEffectForms.Length;

        for (i=0; i < nLength; i++)
        {
            if (m_AppliedEffectForms[i].m_ePriority > nPriority)
            {
                bFoundHigher = true;
                break;
            }
        }

        if (!bFoundHigher)
        {
            for (i = 0; i< nLength; i++)
            {
                m_AppliedEffectForms[i].m_bApplied = false;
            }
            ;
            //newBodyMat = m_AppliedEffectForms[i].GetMatApplyToPawn(self.class);
            SetSkin(newMat);
            efForm.m_bApplied = true;
        }
        m_AppliedEffectForms.AddItem(efForm);
        
    }
    else
    {
        //remove the current one, let's find whether needs to apply previous one
        for (i=0; i<m_AppliedEffectForms.Length; i++)
        {
            if (m_AppliedEffectForms[i].class == efClass)
            {
                bRemoveApplied = m_AppliedEffectForms[i].m_bApplied;
                m_AppliedEffectForms.Remove(i, 1);
                break;
            }
        }
        nLength = m_AppliedEffectForms.Length;
        if (nLength == 0)
        {
            SetSkin(None);      //go back to default skin
        }
        else
        {
            if (bRemoveApplied)
            {
                nPriority = -1;
                //find current highest priority one to apply
                for (i = 0; i < nLength; i++)
                {
                    if (m_AppliedEffectForms[i].m_ePriority > nPriority)
                    {
                        nPriority = m_AppliedEffectForms[i].m_ePriority;
                        nIndex = i;
                    }
                }

                SetSkin(m_AppliedEffectForms[nIndex].m_BodyMat);
                m_AppliedEffectForms[nIndex].m_bApplied = true;
            }
        }
        
    }

}

// We are using the armor to reflect our power pool.
function int GetShieldStrength()
{
	return (GetPowerPoolPercent() * 100);
}

function AdjustAmmoPool(float change)
{
	if (Role==ROLE_Authority)
	{
		r_fMaxPowerPool += change;
		m_fCurrentPowerPool = r_fMaxPowerPool;
		SyncClientCurrentPowerPool();
		bNetDirty=true;
	}
}

function AdjustMaxPowerPool(float change)
{
	if (Role==ROLE_Authority)
	{
		r_fMaxPowerPool += change;
		m_fCurrentPowerPool = r_fMaxPowerPool;
		SyncClientCurrentPowerPool();
		bNetDirty=true;
	}
}

function SetMaxPowerPool(int value)
{
	AdjustMaxPowerPool(value-r_fMaxPowerPool);
}

function SetMaxHealthPool(int value)
{
	if (Role == ROLE_Authority)
	{
        HealthMax=Value;
		Health = Min(Health, HealthMax);
        bNetDirty=true;

        ClientUpdateHUDHealth(Health, HealthMax);
	}
}

reliable client function ClientUpdateHUDHealth(int NewHealth, int NewHealthMax)
{
	local TrHUD TrH;
	
    HealthMax = NewHealthMax;
    Health = NewHealth;

	TrH = GetTrHud();
	if (TrH != none && TrH.HudMovie != none)
		GfxTrHud(TrH.HudMovie).ForceHealthUpdate(Health, HealthMax);
}

event bool ShouldRechargePowerPool()
{
    local TrDevice dev;
    local TrPlayerController PC;
    local int eqp;

	// BZ 7699: If you are piloting a vehicle, recharge energy.
	if (DrivenVehicle != none)
	{
		return true;
	}

    // Do not recharge if the ski button is pressed.
    PC = TrPlayerController(Controller);
    if (PC == None)
    {
        return false;
    }

    if (IsInState('Dying') )
    {
        return false;
    }
	// If we are jetting and not in a conduit, don't allow power pool charging.
    else if( PC.m_bPressingJetpack && !m_bIsInConduit )
    {
        return false;
    }

    for(eqp = EQP_Melee; eqp < EQP_MAX; eqp++)
    {
        dev = pc.GetDeviceByEquipPoint(TR_EQUIP_POINT(eqp));
        if( dev != None && dev.UsesPower() && dev.IsFiring())
        {
            return false;
        }
    }

    return true;
}

function ForceHealthRegen()
{
	m_fLastDamagerTimeStamp = 0.0;
}

event RechargeHealthPool(float DeltaSeconds)
{
	local float fRecharge, RechargeRateMultiplier;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
    local TrPlayerController TrPC;

	if (Role!=ROLE_Authority) return;

	if( GetCurrCharClassInfo() == none )
	{
		return;
	}

	if (Health >= HealthMax)
	{
        if (r_bIsHealthRecharging)
        {
            TrPC = TrPlayerController(self.Owner);

            if (TrPC != none)
            {
				if (TrPC.AlienFX != none && TrPC.EnableAlienFX)
				{
					TrPC.AlienFX.SetHealth(100);
				}
            
				if (TrPC.Stats != none)
				{
					TrPC.Stats.RegeneratedToFull(TrPC);
				}
            }

            r_bIsHealthRecharging = false;
		    bNetDirty = true;
        }

		return;
    }

    // Do not regenerate health if you are a flag carrier.
	TrPRI = GetTribesReplicationInfo();
    if (TrPRI != None && TrPRI.bHasFlag )
    {
        r_bIsHealthRecharging = false;
		bNetDirty = true;
        return;
    }


	if (WorldInfo.TimeSeconds - m_fLastDamagerTimeStamp > m_fSecondsBeforeAutoHeal)
	{
		RechargeRateMultiplier = 1.0;

		// Get skill/perk influence.
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				RechargeRateMultiplier += VM.m_fHealthRegenRateBuffPct; 
			}
		}

		fRecharge = Health + GetCurrCharClassInfo().default.m_fHealthPoolRechargeRate * RechargeRateMultiplier * DeltaSeconds * HealthMax;

        m_fTickedRegenDecimal += fRecharge - float(Health);       

        fRecharge += m_fTickedRegenDecimal;
        
		if (fRecharge>HealthMax)
		{
			fRecharge = HealthMax;
            m_fTickedRegenDecimal = 0;
		}
        else
        {
            m_fTickedRegenDecimal -= abs(int(m_fTickedRegenDecimal));
        }

		Health = fRecharge;

        r_bIsHealthRecharging = true;
		bNetDirty = true;

		// Clear out any assists when regen begins.
		m_KillAssisters.Remove(0, m_KillAssisters.Length);

		// Play the regen effect on clients.
		ClientPlayHealthRegenEffect();
	}
    else
    {
        r_bIsHealthRecharging = false;
		bNetDirty = true;
    }
}



/** Returns the current amount of acceleration allowed while jetpacking. */
simulated function vector GetJetpackAirControl(const vector InAcceleration, const vector ZAxis)
{
    local class<TrFamilyInfo> FI;
    local float Pct, Range, FinalPct;
	
    FI = GetCurrCharClassInfo();
    
    Pct = Clamp((VSize(Velocity) - FI.default.m_vAirControlReductionRange.X) / (FI.default.m_vAirControlReductionRange.Y - FI.default.m_vAirControlReductionRange.X), 0.f, 1.f);
    Range = FI.default.m_vAirControlMultiplier.Y - FI.default.m_vAirControlMultiplier.X;
    FinalPct = ((Range * Pct) + FI.default.m_vAirControlMultiplier.X);

    return (InAcceleration * AirControl * FinalPct) + (FI.default.m_fFlightAcceleration * ZAxis);
}

simulated event UpdateSkiEffects();

simulated event PlayJetpackEffects();
simulated event UpdateJetpackEffects();
simulated event StopJetpackEffects();

//ML: TODO: Support these sounds. They are causing logspam.
function PlayLandingSound();
function PlayJumpingSound();

simulated function RememberLastDamager(Controller Damager, int DamageAmount, Actor DamagingActor)
{
	local bool bSameTeam;
    local TrPawn TrP;
    local TrTurretPawn TrTP;
    local TrPlayerController TrDamager;
	local TrPlayerController OwnerController;
	local int i;

	if (Owner != none && Owner.IsA('TrVehicle'))
	{
		OwnerController = TrPlayerController(TrVehicle(Owner).Controller);
	}
	else
	{
		OwnerController = TrPlayerController(Owner);
	}

    // Kill Cam Info
    if (OwnerController != none && Damager != none && Damager.Pawn != none)
    {
        TrP = TrPawn(Damager.Pawn);
    
        if (TrP != none)
        {
            TrTP = TrTurretPawn(TrP);

            // If it was a player, else it was a turret/deployable
            if (TrTP != none && TrTP.m_OwnerDeployable != none)
            {
                OwnerController.ClientSetLastDamagerInfo((float(TrTP.m_OwnerDeployable.r_Health) / float(TrTP.m_OwnerDeployable.r_MaxHealth) * 100), TrTP.m_OwnerDeployable.r_nUpgradeLevel);
            }
            else
            {
                OwnerController.ClientSetLastDamagerInfo(TrP.GetHealthPct(), 0);
            }
        }
    }

	// Remember the actual actor that damaged us.
	if( OwnerController != none )
	{
		OwnerController.m_LastDamagedBy = DamagingActor;
	}

	// If we damaged ourselves, apply a timestamp.
	if (Damager == none || Damager == OwnerController)
	{
		if( DamageAmount > 0 )
		{
			m_fLastDamagerTimeStamp = WorldInfo.TimeSeconds;
		}
		return;
	}

	// Ignore timestamp for people on the same team (unless friendly fire).
	if( OwnerController != none && Damager.GetTeamNum() == OwnerController.GetTeamNum())
	{
		bSameTeam = true;
	}

	if (!bSameTeam || WorldInfo.GRI.r_bFriendlyFire)
	{
		TrDamager = TrPlayerController(Damager);

		if( DamageAmount > 0 )
		{
			m_fLastDamagerTimeStamp = WorldInfo.TimeSeconds;
		}

		// Only give damage assist and cash for damage if on opposing teams.
		if (!bSameTeam)
		{
			if (TrDamager != none)
			{
				TrDamager.CashForDamage(DamageAmount);
			}

			for (i = 0; i < m_KillAssisters.Length; i++)
			{
				if (m_KillAssisters[i].m_Damager == TrDamager)
				{
					if (m_KillAssisters[i].m_fDamagerTime < (WorldInfo.TimeSeconds - m_fSecondsBeforeAutoHeal))
					{
						// Reset my damage done since he had time to heal
						m_KillAssisters[i].m_AccumulatedDamage = DamageAmount;
					}
					else
					{
						m_KillAssisters[i].m_AccumulatedDamage += DamageAmount;
					}

					m_KillAssisters[i].m_fDamagerTime = WorldInfo.TimeSeconds;

					return;
				}
			}

			// Add new assist record since we didn't have one previously
			m_KillAssisters.AddItem(CreateAssistRecord(Damager, DamageAmount));
		}
	}
}

function AssistInfo CreateAssistRecord(Controller Damager, int DamageAmount)
{
	local AssistInfo ret;

	ret.m_Damager = TrPlayerController(Damager);
	ret.m_fDamagerTime = WorldInfo.TimeSeconds;
	ret.m_AccumulatedDamage = DamageAmount;

	return ret;
}

function TrPlayerController GetLastDamager()
{
	local int i, BestIndex;
	local float MostRecentTimestamp;

	BestIndex = INDEX_NONE;
	for( i=0; i<m_KillAssisters.Length; i++ )
	{
		if( m_KillAssisters[i].m_fDamagerTime > MostRecentTimestamp )
		{
			MostRecentTimestamp = m_KillAssisters[i].m_fDamagerTime;
			BestIndex = i;
		}
	}

	return BestIndex == INDEX_NONE ? none : m_KillAssisters[BestIndex].m_Damager;
}

function ProcessKillAssists(Controller Killer)
{
	local AssistInfo assister;
	foreach m_KillAssisters(assister)
	{
		if (assister.m_Damager == none)
			continue;

		if (assister.m_Damager != TrPlayerController(Killer) &&
			assister.m_AccumulatedDamage > HealthMax*m_AssistDamagePercentQualifier &&
			assister.m_fDamagerTime > (WorldInfo.TimeSeconds - m_fSecondsBeforeAutoHeal))
		{
            if (Stats != none) Stats.AddAssist(assister.m_Damager);
            TrPlayerReplicationInfo(assister.m_Damager.PlayerReplicationInfo).m_nAssists++;
			assister.m_Damager.m_AccoladeManager.GiveAssist();
		}
	}
}

// Authority only.
function float GetUnshieldedDamage(float inputDamage)
{
	local float temp, ShieldAbsorb;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	ShieldAbsorb = m_fShieldMultiple;

	TrPRI = GetTribesReplicationInfo();
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none )
		{
			ShieldAbsorb -= VM.m_fShieldPackEffectivenessBuff;
		}
	}

	if (!r_bIsShielded) return inputDamage;

	if (m_fCurrentPowerPool >= (inputDamage * ShieldAbsorb) )
	{
		ConsumePowerPool(inputDamage * ShieldAbsorb);
		SyncClientCurrentPowerPool();
		return 0;
	}
	else
	{
		temp = inputDamage - m_fCurrentPowerPool/ShieldAbsorb;
		ConsumePowerPool(m_fCurrentPowerPool);
		SyncClientCurrentPowerPool();
		return temp;
	}
}

simulated function TrPawn GetPawnCausingDamage(Controller EventInstigator, Actor DamageCauser)
{
	local TrPawn p;
	local TrProjectile proj;

	p=None;

	if (EventInstigator!=None && EventInstigator.Pawn!=None)
		p = TrPawn(EventInstigator.Pawn);

	if (p==None && TrDevice(DamageCauser)!=None)
	{
		p = TrPawn(TrDevice(DamageCauser).Owner);
	}

	if (p==None && TrProjectile(DamageCauser)!=None)
	{
		proj = TrProjectile(DamageCauser);
		p = TrPawn(proj.Instigator);
	}

	return p;
}

simulated function float GetDamageScale(Actor DamageCauser, float Dist, class<TrDmgType_Base> DmgType, optional Controller EventInstigator, optional TrValueModifier VM, optional out float DamageScaleWithoutNewPlayerAssist)
{
	local float DamageScale;
	local TrPlayerController TrPC, DamageCauserPC;
	local TrProjectile proj;

	proj = TrProjectile(DamageCauser);

	// Calculate damage scale.
	DamageScale=1.0;
	DamageScale = class'TrDmgType_Base'.static.GetDamageScale(DamageCauser, Dist, DmgType);

	// Skill/Perk for reduced melee damage.
	if( VM != none && ClassIsChildOf(DmgType, class'TrDmgType_Melee') )
	{
		DamageScale *= 1.0 - VM.m_fReceiveMeleeDamageBuffPct;
	}

	// Damage self perk/skill
	if( VM != none && EventInstigator == Controller )
	{
		DamageScale *= 1.0 - VM.m_fSelfDamagePct;
	}

	DamageScaleWithoutNewPlayerAssist = DamageScale;

	// Apply New Player Assist damage. Make sure this is done last so that DamageScaleWithoutNewPlayerAssist is accurate.
	TrPC = TrPlayerController(Controller);
	if( TrPC != none )
	{
		// Apply any New Player Assist 'Take Damage' reduction.
		DamageScale = DamageScale / TrPC.GetNewPlayerAssistToApply();
	}

	// Apply any New Player Assist from the damage causer
	if( DamageCauser != none && Role == ROLE_Authority )
	{
		if( DamageCauser.IsA('TrDevice') )
		{
			DamageCauserPC = TrPlayerController(TrDevice(DamageCauser).Instigator.Controller);
		}
		else if( proj != none && proj.InstigatorController != none )
		{
			if( proj.InstigatorController.IsA('TrDeployableController') )
			{
				if( TrDeployableController(proj.InstigatorController) != none )
				{
					DamageCauserPC = TrDeployableController(proj.InstigatorController).m_SpawnedFromController;
				}
			}
			else
			{
				DamageCauserPC = TrPlayerController(proj.InstigatorController);
			}
		}
		else if( DamageCauser.IsA('PlayerPawn') )
		{
			DamageCauserPC = TrPlayerController(TrPlayerPawn(DamageCauser).Controller);
		}
		else if( DamageCauser.IsA('TrDeployable') )
		{
			DamageCauserPC = TrPlayerController(TrDeployable(DamageCauser).m_Controller);
		}

		if( DamageCauserPC != none )
		{
			DamageScale = DamageScale * DamageCauserPC.GetNewPlayerAssistToApply();
		}
	}

	;

	return DamageScale;
}

//
//	Call with negative damage amount to provide healing
//
simulated function DoRepairs(int HealAmount, Controller EventInstigator, Actor DamageCauser, class<DamageType> DamageType)
{
	if (EventInstigator.GetTeamNum()==GetTeamNum() && HealAmount<0)
	{
		HealDamage(-HealAmount, EventInstigator, DamageType);
	}
}

//
//  Return turret owner for damage instigated by turrets
//
simulated function Controller CheckTribesTurretInstigator(Controller EventInstigator, Actor DamageCauser)
{
	if (EventInstigator==none && DamageCauser != None && DamageCauser.IsA('TrProjectile'))
	{
		return TrProjectile(DamageCauser).InstigatorController;
	}

	return EventInstigator;
}

//  TakeDammage Override so we can reduce damage at a distance
//	Given that a weapon can do damage at up to WeaponRange distance, the following defines how the damage
//  changes as the instigator of the damage is more and more remote:
//		below m_fMaxDamageRangePct of WeaponRange, damage is not reduced.
//		between m_fMaxDamageRangePct and m_fMinDamageRangePct of WeaponRange, damage falls linearly to m_fMinDamagePct
//		beyond m_fMinDamageRangePct of WeaponRange, damage is m_fMinDamagePct
//		beyond WeaponRange, there is great rejoicing
event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, 
				 class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local Actor  	DamagingActor;
	local float		ColRadius, ColHeight;
	local float		DamageScale, Dist, ScaledDamage, EnergyDrainAmount, DamageWithoutNewPlayerAssist;
	local vector	Dir;
	local Pawn      DamagingPawn;
    


    local TrGame    TrG;
	local class<TrDmgType_Base> TrDamageType;
	local TrPlayerReplicationInfo TrPRI, DamagingPawnTrPRI;
	local TrValueModifier VM, DamagingPawnVM;
	local TrProjectile TrProj;
	local float     DamageScaleWithoutNewPlayerAssist;
	local TrPlayerController TrEventInstigator;
	local bool      bIsEventInstigatorDeployableController, bIgnoreSecondaryEffectsOnSelf;
	local bool bClearRage;

	TrDamageType = class<TrDmgType_Base>(DamageType);

	TrPRI = GetTribesReplicationInfo();
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if (VM != none)
		{
			bIgnoreSecondaryEffectsOnSelf = VM.m_bIgnoreGrenadeSecondaryOnSelf;
		}
	}

	DamageScale = 1.0;
	DamagingActor = class'TrDmgType_Base'.static.GetActorCausingDamage(EventInstigator,DamageCauser);
	TrProj = TrProjectile(DamagingActor);
	if (DamagingActor!=None)
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

		DamageScale = GetDamageScale(DamageCauser, Dist, TrDamageType, EventInstigator, VM, DamageScaleWithoutNewPlayerAssist);
	}

    TrG = TrGame(WorldInfo.Game);

	if (DamageScale > 0)
	{
		ScaledDamage = DamageScale * DamageAmount;
		DamageWithoutNewPlayerAssist = DamageScaleWithoutNewPlayerAssist * DamageAmount;
		
		// Track statistics, accolades, awards
		if (Role == ROLE_Authority && EventInstigator != none )
		{
            LastHitInfo.Distance = 0;
   			LastHitInfo.Type = DamageType;
			LastHitInfo.Causer = DamageCauser;
			LastHitInfo.Amount = ScaledDamage;

			// Recalculate distance from actual player if needed
			if (EventInstigator.Pawn != none && EventInstigator.Pawn != self)
			{
				Dir	= Location - EventInstigator.Pawn.Location;
				LastHitInfo.Distance = VSize(Dir);
			}
		}

		DamagingPawn = Pawn(DamagingActor);
		if( DamagingPawn == none && DamagingActor != none )
		{
			DamagingPawn = DamagingActor.Instigator;
		}

		// Drain energy.
		if( TrDamageType != none )
		{
			if( TrDamageType.default.m_EnergyDrainAmount > 0 && DamagingPawn != none && ((DamagingPawn == self && !bIgnoreSecondaryEffectsOnSelf) || !(DamagingPawn.IsSameTeam(self))) )
			{
				EnergyDrainAmount = TrDamageType.default.m_EnergyDrainAmount;

				DamagingPawnTrPRI = TrPlayerReplicationInfo(DamagingPawn.PlayerReplicationInfo);
				if( DamagingPawnTrPRI != none )
				{
					DamagingPawnVM = DamagingPawnTrPRI.GetCurrentValueModifier();
					if( DamagingPawnVM != none )
					{
						EnergyDrainAmount *= 1.0 + DamagingPawnVM.m_fEnergyDrainPctBuff;
					}
				}

				ConsumePowerPool(EnergyDrainAmount);
				SyncClientCurrentPowerPool();
			}
		}

		// healing?
		if (ScaledDamage<0)
		{
			DoRepairs(DamageAmount,EventInstigator,DamageCauser,DamageType);
            if (Stats != none) Stats.UpdateDamage(TrPlayerController(EventInstigator), class<TrDmgType_Base>(LastHitInfo.Type).default.DBWeaponId, ScaledDamage, LastHitInfo.Distance, false, false);
			return;
		}

		// Somehow we are trying to damage a teammate.
		if (!WorldInfo.GRI.r_bFriendlyFire && DamagingActor != none && DamagingActor.GetTeamNum() == GetTeamNum() && 
			(DamagingPawn == none || DamagingPawn.Controller != Controller))
			return;

		if( EventInstigator != none )
		{
			TrEventInstigator = TrPlayerController(EventInstigator);

			if( TrEventInstigator == none )
			{                
				// Try getting an instigator from a turret.
				if( TrDeployableController(EventInstigator) != none )
				{
					TrEventInstigator = TrDeployableController(EventInstigator).m_SpawnedFromController;
					bIsEventInstigatorDeployableController = true;
				}
			}
            else if (Role == ROLE_Authority && EventInstigator != Controller && TrEventInstigator.GetTeamNum() == GetTeamNum())
            {
                TrEventInstigator.FriendlyFireDamage += ScaledDamage;
                TrEventInstigator.CheckFriendlyFireDamage();
            }

			if( TrEventInstigator != none && TrEventInstigator != Controller )
			{
				// Play effects for hitting someone.
				TrEventInstigator.ServerShowOverheadNumber(DamageWithoutNewPlayerAssist, TrDamageType.static.ModifyOverheadNumberLocation(Location), Location.Z);

				if( !bIsEventInstigatorDeployableController )
				{
					TrEventInstigator.FlashShooterHitReticule(DamageWithoutNewPlayerAssist, false, GetTeamNum());
				}
			}
		}

		// shields take damage from energy instead of health
		ScaledDamage = GetUnshieldedDamage(ScaledDamage);

		RememberLastDamager(EventInstigator, ScaledDamage, DamagingActor);

        













		EventInstigator = CheckTribesTurretInstigator(EventInstigator,DamageCauser);


		// Potential Energy perk
		TrProj = TrProjectile(DamagingActor);
		if( VM != none && 
			((VM.m_bPotentialEnergy && TrProj != none && !TrProj.m_bIsBullet) ||  
			 (VM.m_bPotentialEnergyFallDamage && TrDamageType == class'TrDmgType_Fell'))
		  )
		{
			ConsumePowerPool(VM.m_fPotentialEnergyDamageTransferPct * ScaledDamage * -1);
			SyncClientCurrentPowerPool();
		}

		if( r_bIsRaged && EventInstigator.Pawn == Self )
		{
			// If the pawn has damaged himself while raged, don't damage the pawn, but clear the rage.
			bClearRage = true;
			ScaledDamage = 0.f;
		}

		Super.TakeDamage
		(
			ScaledDamage,
			EventInstigator,
			HitLocation,
			Momentum,
			DamageType,
			HitInfo,
			DamageCauser
		);

		if (Role == ROLE_Authority && Health <= 0 && !IsInState('Dying'))
		{
			;
			Died(DamagingPawn.Controller, DamageType, HitLocation);
		}

        if (TrG != none && EventInstigator != none && Stats != none)
        {
			if (Health <= 0) Stats.UpdateDamage(TrPlayerController(EventInstigator), class<TrDmgType_Base>(LastHitInfo.Type).default.DBWeaponId, ScaledDamage, LastHitInfo.Distance, true, false);
			else Stats.UpdateDamage(TrPlayerController(EventInstigator), class<TrDmgType_Base>(LastHitInfo.Type).default.DBWeaponId, ScaledDamage, LastHitInfo.Distance, false, false);
        }

		if( bClearRage )
		{
			ClearTimer('ClearRagePerk');
			ClearRagePerk();
		}
	}
}

simulated function PlayWhiteoutEffect()
{
	local TrPlayerController TrPC;
	local TrHUD TrH;
	local float InterpSpeed;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	InterpSpeed = class'TrDmgType_WhiteOut'.default.m_fWhiteoutInterpSpeed;

	TrPC = TrPlayerController(Controller);
	if( TrPC != none )
	{
		TrH = TrHUD(TrPC.myHUD);
		if( TrH != none )
		{
			TrPRI = GetTribesReplicationInfo();
			if( TrPRI != none )
			{
				VM = TrPRI.GetCurrentValueModifier();
				if( VM != none )
				{
					// Skill/Perk to influence whiteout speed.
					InterpSpeed *= 1.0 + VM.m_fWhiteOutInterpSpeedPctBuff;
				}

				TrH.Whiteout(InterpSpeed,class'TrDmgType_WhiteOut'.default.m_fWhiteoutTargetValue);
			}
		}
	}
}

//
//	Override so we can change the handling for damage at a distance
//
simulated function TakeRadiusDamage
(
	Controller			EventInstigator,
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
	local TrPawn    damagePawn;
	local TrTurretPawn turretPawn;
	local float		ColRadius, ColHeight, DamageScale, Dist, fMomentumTransferPct;
	local vector	Dir, LocationAdjustedToClaymoreZ;
	local TrProjectile Projectile;
	local TrPlayerController TrPC;
	local TrPlayerReplicationInfo TrPRI;
	local Vector AdditionalMomentum;
	local class<TrFamilyInfo> VictimFamilyInfo;
	local TrValueModifier VM;
	local class<TrDmgType_Base> TrDmgType;
	local bool bIgnoreSecondaryEffectsOnSelf, bStickyHands;
	local TrDevice_Pack StealthPack;
	
	damagePawn = GetPawnCausingDamage(EventInstigator,DamageCauser);
	Projectile = TrProjectile(DamageCauser);
	VictimFamilyInfo = GetCurrCharClassInfo();

	TrDmgType = class<TrDmgType_Base>(DamageType);

    LastHitInfo.bDirectHit = false;

	TrPC = TrPlayerController(Controller);

	if( Projectile != none )
	{
        if (Role == ROLE_Authority && Projectile.ImpactedActor == self)
        {
            LastHitInfo.bDirectHit = true;
        }

		// Projectile hit a force field? Only damage pawns on the side that the projectile exploded on.
		if( Projectile.ImpactedActor != none && Projectile.ImpactedActor.IsA('TrDeployable_ForceField') )
		{
			if( Normal(Projectile.Velocity) dot Normal(Projectile.Location - Location) < 0.0 )
			{
				return;
			}
		}
		else if( Projectile.IsA('TrProj_Claymore') )
		{
			// Don't damage if outside of the claymore's detection angle.
			LocationAdjustedToClaymoreZ = Location;
			LocationAdjustedToClaymoreZ.Z = Projectile.Location.Z;

			if( Normal(LocationAdjustedToClaymoreZ - Projectile.Location) dot Vector(Projectile.Rotation) < TrProj_Claymore(Projectile).m_fScalarAngle )
			{
				return;
			}
		}
		else if( Projectile.IsBlockedByBlocker(DamageCauser, self,, false, Projectile.m_bIsBullet ? HurtOrigin : vect(0,0,0)) )
		{
			return;
		}

		// stop friendly fire from turrets
		turretPawn = TrTurretPawn(damagePawn);
		if (turretPawn!=none && turretPawn.m_OwnerDeployable.GetTeamNum()==GetTeamNum())
		{
			return;
		}
	}

	DamageScale = 1.0;

	GetBoundingCylinder(ColRadius, ColHeight);

	Dir	= Location - HurtOrigin;
	Dist = VSize(Dir);
	Dir	= Normal(Dir);

	if ( !bFullDamage )
	{
		DamageScale = GetDamageScale(DamageCauser,Dist,TrDmgType);
	}

	TrPRI = GetTribesReplicationInfo();
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if (VM != none)
		{
			bIgnoreSecondaryEffectsOnSelf = VM.m_bIgnoreGrenadeSecondaryOnSelf;
			bStickyHands = VM.m_bStickyHands;
		}
	}

	// Whiteout if the instigator is this pawn or if the instigator is an enemy.
	if( EventInstigator != none && (EventInstigator == Controller || EventInstigator.GetTeamNum() != GetTeamNum()) && DamageType == class'TrDmgType_WhiteOut' )
	{
		if( TrPC != none )
		{
			// Determine if we need to play the whiteout effect based on if we are looking at the grenade explosion
			//if( Dir dot vector(Rotation) < 0.0 && (EventInstigator != Controller || !bIgnoreSecondaryEffectsOnSelf) )
			// Scott requested to remove the LOS check.
			if( (EventInstigator != Controller || !bIgnoreSecondaryEffectsOnSelf) )
			{
				PlayWhiteoutEffect();
				r_nWhiteOut++;
			}
		}
	}

	// If we damaged ourself with the ninja smoke, activate stealth.
	if (EventInstigator != none && EventInstigator == Controller && DamageType == class'TrDmgType_NinjaSmoke')
	{
		TrPC = TrPlayerController(Controller);
		if (TrPC != none)
		{
			StealthPack = TrDevice_Pack(TrPC.GetDeviceByEquipPoint(EQP_Pack));
			if (StealthPack != none)
			{
				StealthPack.ForceActivate();
			}
		}

		LastTakeHitInfo.Damage = 1;
		LastTakeHitInfo.HitLocation = HurtOrigin;
		LastTakeHitInfo.Momentum = vect(0,0,0);
		LastTakeHitInfo.DamageType = DamageType;
		LastTakeHitInfo.HitBone = '';
		LastTakeHitInfo.m_bDamagedSelf = true;
		LastTakeHitTimeout = WorldInfo.TimeSeconds + 0.5;

		PlayTakeHitEffects();

		return;
	}

	if (DamageScale > 0.f)
	{
		// Add any additional momentum, such as boosting yourself.
		if( Projectile != none && Projectile.Instigator == self )
		{
			AdditionalMomentum.Z = Projectile.m_fInstigatorExtraZMomentum * DamageScale;
		}

		// Dampen the momentum.
		fMomentumTransferPct = 1.0;
		if( VictimFamilyInfo != none && VictimFamilyInfo.default.m_bMomentumDampingEnabled )
		{
			if( CalculatePawnSpeed() > VictimFamilyInfo.default.m_fMomentumDampingSpeed )
			{
				fMomentumTransferPct = VictimFamilyInfo.default.m_fMomentumDampingPct;
			}
		}

		TakeDamage(
			BaseDamage,
			CheckTribesTurretInstigator(EventInstigator, DamageCauser),
			HurtOrigin,
			((DamageScale * Momentum * Dir + AdditionalMomentum)*fMomentumTransferPct),
			DamageType,
			,
			DamageCauser);

		// BZ 8125: Impact nitron will no longer force the player to drop the flag when they are invulnerable.
		// BZ 8257: Impact nitron only affects people on the opposing team.
		// BZ 8438: Moved this code block after taking damage so that in rabbit you won't change teams before damage gets applied.
		if (Role == ROLE_Authority && 
			ClassIsChildOf(DamageType, class'TrDmgType_ConcussionGrenade') && 
			!r_bIsInvulnerable && 
			(EventInstigator.GetTeamNum() != GetTeamNum() || EventInstigator == Controller))
		{
			TrPRI = GetTribesReplicationInfo();

			// Do we have the flag, and are we not tight fisted?
			if (TrPRI != none && 
				TrPRI.bHasFlag && 
				!bStickyHands)
			{
				TrPC = TrPlayerController(Controller);
				if (TrPC != none)
				{
					TrPC.FumbledFlag();
				}
				DropFlag();

		        TrPC = TrPlayerController(EventInstigator);
		        if( TrPC != none )
		        {
                    TrPC.ModifyCredits(50, false);
		        }
			}
		}
	}
}

/** Did the pawn 'recently' grab a flag? */
function bool RecentlyGrabbedFlag()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(Controller);
	return ( (TrPC != none) && ((WorldInfo.TimeSeconds - TrPC.m_fLastFlagGrabTimestamp) < 1.5) );
}

/** Get the base distance to draw another pawn's caret. */
simulated function float GetShowDistanceThreshold(bool bIsEnemy)
{
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

	if( TrGRI != none && TrGRI.GameClass == class'TrGame_TRTeamRabbit' )
	{
		// For team rabbit, show markers at a greater distance.
		return 500000.0;
	}

	if( bIsEnemy )
	{
		return m_fEnemyShowDistanceThreshold;
	}
	else
	{
		return m_fFriendlyShowDistanceThreshold;
	}
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
    local int hp;
    local bool hasFlag, friendly, bDetectedByEnemyScanner, bOffScreen, bHasAsFriend, bMutualFriends;
    local float MaxOffset, Scale, AddedHealthBarWidth, MarkerOpacity, projectedHeight;
	local vector screenLoc, screenLocFeet, PawnLocation, PawnFeetLocation, NameLoc;
	local UTWeapon Weap;
	local TrHUD HUD;
    local Texture2D PawnMarker;
	local UTPlayerReplicationInfo UTPRI;
	local TrGameReplicationInfo TrGRI;
	local TrValueModifier VM;
	local TrPlayerReplicationInfo TrPRI, PawnTrPRI;
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

	if( m_HealthBarMIC == none )
	{
		m_HealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_HealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	if (m_markerMIC == none)
	{
		m_MarkerMIC = new(self) class'MaterialInstanceConstant';
		m_MarkerMIC.SetParent(class'TrHUD'.default.MarkerBaseMIC);
	}

	HUD = TrHUD(PC.MyHUD);
    
	PawnLocation = Location;
	if( Mesh != none && !Mesh.HiddenGame && Mesh.MatchRefBone('Pelvis') != INDEX_NONE )
	{
		// Ideally, use the pawn's pelvis so the carat stays up with the pawn's rendered mesh.
		PawnLocation = Mesh.GetBoneLocation('Pelvis', 0);
	}

	bOffScreen = class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, 
			PawnLocation + GetCollisionHeight()*vect(0,0,1), screenLoc);

	if (bOffScreen)
	{
		screenLoc.Y -= 6;
	}

	PawnFeetLocation = PawnLocation;
	PawnFeetLocation.Z -= GetCollisionHeight();
	screenLocFeet = Canvas.Project(PawnFeetLocation);
	projectedHeight = abs(ScreenLoc.Y-screenLocFeet.Y);

	UTPRI = UTPlayerReplicationInfo(PlayerReplicationInfo);
    hasFlag = (UTPRI != None && UTPRI.bHasFlag);

	friendly = PC.IsSpectating() ? GetTeamNum() == 1 : WorldInfo.GRI.OnSameTeam(self, PC);

	bDetectedByEnemyScanner = GetDetectedByEnemyScanner();

	// Seeking missile target.
	TrPC = TrPlayerController(GetALocalPlayerController());
	if( TrPC != none && TrPC.Pawn != none )
	{
		OldMissileLockStatus = m_MissileLockStatus;
		m_MissileLockStatus = EMissileLockNone;

		SaberLauncher = TrDevice_SaberLauncher(TrPC.Pawn.Weapon);
		if( SaberLauncher != none && !(SaberLauncher.ammoCount==0 && SaberLauncher.m_nCarriedAmmo == 0) )
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

	// only show off screen if flag carrier or enemy detected by scanner
	if (bOffScreen && !hasFlag && (friendly || !bDetectedByEnemyScanner))
		return;

	PawnTrPRI = GetTribesReplicationInfo();
	if( PawnTrPRI != none && TrPC != none && TrPC.m_bShowHUDFriendColoring == true )
	{
		bHasAsFriend = PawnTrPRI.c_bIsBuddyToLocalPlayer;
        bMutualFriends = PawnTrPRI.c_bIsMutualBuddiesWithLocalPlayer;
	}

	bPostRenderTraceSucceeded = Mesh != none && Mesh.bRecentlyRendered;

	if( PawnTrPRI != none && PawnTrPRI.r_bIsLastManStanding )
	{
		// Always render the caret for a pawn that is the last man standing.
		bPostRenderTraceSucceeded = true;
	}

	// adjust depth according to FOV
    ScreenLoc.Z = VSize(CameraPosition - PawnLocation);
	ScreenLoc.X += HUD.m_fCaratPlacementX;
	ScreenLoc.Y += HUD.m_fCaratPlacementY;

	if (TrPlayerController(PC).GetZoomedState() == ZST_NotZoomed)
	{
		// Player is not zoomed in.
		MaxOffset = (bHasAsFriend && friendly) ? 1.0 : (100 / (ScreenLoc.Z * 2));
	}
	else
	{
		MaxOffset = (bHasAsFriend && friendly) ? 1.0 : HUD.m_fMarker2DDistance;
	}

    if (!friendly)
	{
		MarkerOpacity = 1.0;

		// under some conditions, hide our HUD marker
		if (!hasFlag)
		{
			if (IsJammedByFriendOrSelf())
			{
				return;
			}

			if (r_bIsStealthed && !m_bStealthVisible)
			{
				return;
			}

			if( HUD != none && HUD.m_fCurrentWhiteoutValue > 0.2 )
			{
				return;
			}
		}
		
		// check whether close enough to crosshair
		if (ScreenLoc.Z < class'TrHUD'.default.TeamPlayerInfoMaxDist
		&& (Abs(screenLoc.X - (Canvas.ClipX * 0.5)) < (MaxOffset *0.5) * Canvas.ClipX)
		&& (Abs(screenLoc.Y + projectedHeight - (Canvas.ClipY * 0.5)) < MaxOffset * Canvas.ClipY))
		{
            HUD.bCrosshairOnFriendly = true;
            ShowHeaderUntil = (WorldInfo.TimeSeconds + 1.0);
        }

		if( !hasFlag )
		{
			if( bDetectedByEnemyScanner && !bPostRenderTraceSucceeded )
			{
				// Generic marker for a pawn who is scanned by a sensor but not on screen.
				PawnMarker = class'TrHUD'.default.DeployableSensor;
				
				if( WorldInfo != none )
				{
					TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
					if( TrGRI != none )
					{
						MarkerOpacity = FMin(1.0,TrGRI.m_fCurrentSensorBlipOpacity);

						// Note: This PRI is from the controller that is viewing this pawn, not this pawn's PRI!
						TrPRI = TrPlayerReplicationInfo(PC.PlayerReplicationInfo);
						if( TrPRI != none )
						{
							VM = TrPRI.GetCurrentValueModifier();
							if( VM != none && VM.m_bRadarLink )
							{
								// Since Radar Link perk is active, always show caret at full stength
								MarkerOpacity = 1.0;
								
								// Since Radar Link perk is active, show the class-specific marker.
								switch( GetArmorType() )
								{
									case ARMOR_Light:
										PawnMarker = Class'TrHUD'.default.MarkerLight;
										break;
									case ARMOR_Medium:
										PawnMarker = Class'TrHUD'.default.MarkerMedium;
										break;
									case ARMOR_Heavy:
										PawnMarker = Class'TrHUD'.default.MarkerHeavy;
										break;
								}
							}
						}
					}
				}

				if( MarkerOpacity == 0.0 )
				{
					// Don't bother drawing if we have no opacity.
					return;
				}
			}
			else if( !bPostRenderTraceSucceeded )
			{
				return;
			}
			else
			{
				switch( GetArmorType() )
				{
					case ARMOR_Light:
						AddedHealthBarWidth = -15.0;
						PawnMarker = Class'TrHUD'.default.MarkerLight;
						break;
					case ARMOR_Medium:
						AddedHealthBarWidth = -15.0;
						PawnMarker = Class'TrHUD'.default.MarkerMedium;
						break;
					case ARMOR_Heavy:
						AddedHealthBarWidth = 20.0;
						PawnMarker = Class'TrHUD'.default.MarkerHeavy;
						break;
				}
			}
		}
		else
		{
			// Pawn has the flag, always render their caret.
			switch( GetArmorType() )
			{
				case ARMOR_Light:
					PawnMarker = Class'TrHUD'.default.FlagHeldLight;
					break;
				case ARMOR_Medium:
					PawnMarker = Class'TrHUD'.default.FlagHeldMedium;
					break;
				case ARMOR_Heavy:
					PawnMarker = Class'TrHUD'.default.FlagHeldHeavy;
					break;
			}
		}

		RenderColor = bMutualFriends ? class'TrHUD'.default.MarkerColorEnemy_IsFriend : class'TrHUD'.default.MarkerColorEnemy;

		m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', PawnMarker);
		m_MarkerMIC.SetVectorParameterValue('HudItem_Color', RenderColor);

        if( (ShowHeaderUntil > WorldInfo.TimeSeconds && (bPostRenderTraceSucceeded || hasFlag)) || (PC.IsSpectating() && Mesh != none && Mesh.bRecentlyRendered) )
        {
            hp = GetHealthPct();
            
			// Use the m_fFriendlyShowDistanceThreshold here even though we are showing an enemy so that our scaling is consistent.
			Scale = FClamp(((screenLoc.Z * 0.6 * -1.0) / (m_fFriendlyShowDistanceThreshold / 2.0)) + 1.0, 0.0, 1.0);
			if (PawnMarker != none)
			{
				HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(PawnMarker.SizeX, PawnMarker.SizeY), , , FClamp(Scale, 0.4, 1.0));
			}
			NameLoc = screenLoc;
			NameLoc.X += HUD.m_fNamePlacementX;
			NameLoc.Y += HUD.m_fNamePlacementY;

			if( hasFlag )
			{
				// The flag icon is tall so move the name up a bit.
				NameLoc.Y -= 15.0;
			}
    	    HUD.DrawMarkerText(GetScreenName(), false, NameLoc, Canvas, bMutualFriends);

			m_HealthBarMIC.SetScalarParameterValue('Scal_Health',hp/100.0);
			m_HealthBarMIC.SetScalarParameterValue('SCAL_Friendly',0.0);
			HUD.DrawHealthBar(m_HealthBarMIC,false,ScreenLoc,Canvas, HUD.m_fHealthBarPlacementX, HUD.m_fHealthBarPlacementY + (hasFlag ? 15.0 : 0.0), HUD.m_fHealthBarWidth + AddedHealthBarWidth, HUD.m_fHealthBarHeight);
        }
        else if (hasFlag)
        {
			if (PawnMarker != none)
			{
				HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(PawnMarker.SizeX, PawnMarker.SizeY));
			}
        }
		else if (ScreenLoc.Z < GetShowDistanceThreshold(true) || bDetectedByEnemyScanner)
		{
			// Use the m_fFriendlyShowDistanceThreshold here even though we are showing an enemy so that our scaling is consistent.
			Scale = FClamp(((screenLoc.Z * 0.6 * -1.0) / (m_fFriendlyShowDistanceThreshold / 2.0)) + 1.0, 0.0, 1.0);
            
			if (PawnMarker != none)
			{
				RenderColor.A *= MarkerOpacity;
				m_MarkerMIC.SetVectorParameterValue('HudItem_Color', RenderColor);
				HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(PawnMarker.SizeX, PawnMarker.SizeY), , , FClamp(Scale, 0.4, 1.0));
			}
		}

        return;
	}

	// Make sure not behind weapon
	if ( !bOffScreen && UTPawn(PC.Pawn) != None )
	{
		Weap = UTWeapon(UTPawn(PC.Pawn).Weapon);

		if ( (Weap != None) && Weap.CoversScreenSpace(screenLoc, Canvas) )
		{
			return;
		}
	}

	switch( GetArmorType() )
	{
		case ARMOR_Light:
			AddedHealthBarWidth = -15.0;
			if( hasFlag )
			{
				PawnMarker = Class'TrHUD'.default.FlagHeldLight;
			}
			else
			{
				PawnMarker = Class'TrHUD'.default.MarkerLight;
			}
			break;
		case ARMOR_Medium:
			if( hasFlag )
			{
				PawnMarker = Class'TrHUD'.default.FlagHeldMedium;
			}
			else
			{
				PawnMarker = Class'TrHUD'.default.MarkerMedium;
			}
			break;
		case ARMOR_Heavy:
			if( hasFlag )
			{
				PawnMarker = Class'TrHUD'.default.FlagHeldHeavy;
			}
			else
			{
				PawnMarker = Class'TrHUD'.default.MarkerHeavy;
			}
			AddedHealthBarWidth = 20.0;
			break;
	}

	RenderColor = bHasAsFriend ? class'TrHUD'.default.MarkerColorFriendly_IsFriend : class'TrHUD'.default.MarkerColorFriendly;

	m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', PawnMarker);
	m_MarkerMIC.SetVectorParameterValue('HudItem_Color', RenderColor);

	// check whether close enough to crosshair
	if (ScreenLoc.Z < class'TrHUD'.default.TeamPlayerInfoMaxDist
	&& (Abs(screenLoc.X - (Canvas.ClipX * 0.5)) < (MaxOffset *0.5) * Canvas.ClipX)
	&& (Abs(screenLoc.Y + projectedHeight - (Canvas.ClipY * 0.5)) < MaxOffset * Canvas.ClipY))
	{
        HUD.bCrosshairOnFriendly = true;
        ShowHeaderUntil = (WorldInfo.TimeSeconds + 1.0);
    }

    if( (ShowHeaderUntil > WorldInfo.TimeSeconds) || (PC.IsSpectating() && Mesh != none && Mesh.bRecentlyRendered) )
    {
        hp = GetHealthPct();

		Scale = FClamp(((screenLoc.Z * 0.6 * -1.0) / (m_fFriendlyShowDistanceThreshold / 2.0)) + 1.0, 0.0, 1.0);
		if (PawnMarker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(PawnMarker.SizeX, PawnMarker.SizeY), , , FClamp(Scale, 0.4, 1.0));
		}
		NameLoc = screenLoc;
		NameLoc.X += HUD.m_fNamePlacementX;
		NameLoc.Y += HUD.m_fNamePlacementY;

        if (hasFlag)
        {
			// The flag icon is tall so move the name up a bit.
			NameLoc.Y -= 15.0;
        }
		HUD.DrawMarkerText(GetScreenName(), true, NameLoc, Canvas, bHasAsFriend);

		m_HealthBarMIC.SetScalarParameterValue('Scal_Health',hp/100.0);
		m_HealthBarMIC.SetScalarParameterValue('SCAL_Friendly',1.0);
		HUD.DrawHealthBar(m_HealthBarMIC,true,ScreenLoc,Canvas, HUD.m_fHealthBarPlacementX, HUD.m_fHealthBarPlacementY + (hasFlag ? 15.0 : 0.0), HUD.m_fHealthBarWidth + AddedHealthBarWidth, HUD.m_fHealthBarHeight);
    }
    else if (hasFlag)
    {
		if (PawnMarker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(PawnMarker.SizeX, PawnMarker.SizeY));
		}
    }
	else if (ScreenLoc.Z < GetShowDistanceThreshold(false) || HUD.bShowObjectives)
	{
		Scale = FClamp(((screenLoc.Z * 0.6 * -1.0) / (m_fFriendlyShowDistanceThreshold / 2.0)) + 1.0, 0.0, 1.0);

		if (PawnMarker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(PawnMarker.SizeX, PawnMarker.SizeY), , , FClamp(Scale, 0.4, 1.0));
		}
	}
}

simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	local int i,j;
	local PrimitiveComponent P;
	local string s;
	local float xl,yl;
	local TrGameReplicationInfo TrGRI;
	local int k;

	if (HUD.ShouldDisplayDebug('flag'))
	{
		TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
		if (TrGRI != none)
		{
			for (k = 0; k < 2; k++)
			{
				if (TrGRI.m_Flags[k] != none)
				{
					TrGRI.m_Flags[k].DisplayDebug(HUD, out_YL, out_YPos);
				}
			}
		}
	}

	super.DisplayDebug(HUD, out_YL, out_YPos);

    if( HUD.ShouldDisplayDebug('Speed') )
    {
        Hud.Canvas.DrawText("Speed:"@VSize(Velocity));
        out_YPos += out_YL;
        Hud.Canvas.SetPos(4, out_YPos);
        Hud.Canvas.DrawText("Velocity:"@Velocity);
        out_YPos += out_YL;
        Hud.Canvas.SetPos(4, out_YPos);
        Hud.Canvas.DrawText("Power Pool:"@m_fCurrentPowerPool);
        out_YPos += out_YL;
        Hud.Canvas.SetPos(4, out_YPos);
    }

	// Show debug info for foosteps.
	if (HUD.ShouldDisplayDebug('footsteps'))
	{
	}

    if (HUD.ShouldDisplayDebug('PawnComponent'))
    {
	    Hud.Canvas.SetDrawColor(255,255,128,255);

	    for (i = 0; i <Mesh.Attachments.Length;i++)
	    {
	        HUD.Canvas.SetPos(4,out_YPos);

	        s = ""$Mesh.Attachments[i].Component;
		    Hud.Canvas.Strlen(s,xl,yl);
		    j = len(s);
		    while (xl > (Hud.Canvas.ClipX*0.5) && j>10)
		    {
			    j--;
			    s = Right(S,j);
			    Hud.Canvas.StrLen(s,xl,yl);
		    }

		    HUD.Canvas.DrawText("Attachment"@i@" = "@Mesh.Attachments[i].BoneName@s);
	        out_YPos += out_YL;

	        P = PrimitiveComponent(Mesh.Attachments[i].Component);
	        if (P!=None)
	        {
			    HUD.Canvas.SetPos(24,out_YPos);
			    HUD.Canvas.DrawText("Component = "@P.Owner@P.HiddenGame@P.bOnlyOwnerSee@P.bOwnerNoSee);
			    out_YPos += out_YL;

			    s = ""$P;
			    Hud.Canvas.Strlen(s,xl,yl);
			    j = len(s);
			    while (xl > (Hud.Canvas.ClipX*0.5) && j>10)
			    {
				    j--;
				    s = Right(S,j);
				    Hud.Canvas.StrLen(s,xl,yl);
			    }

			    HUD.Canvas.SetPos(24,out_YPos);
			    HUD.Canvas.DrawText("Component = "@s);
			    out_YPos += out_YL;
		    }
	    }

	    out_YPos += out_YL*2;
	    HUD.Canvas.SetPos(24,out_YPos);
	    HUD.Canvas.DrawText("Driven Vehicle = "@DrivenVehicle);
	    out_YPos += out_YL;
    }
}


//
//	Override Landed - don't call super as it does much of the same stuff but differently
//
event Landed(vector HitNormal, actor FloorActor)
{
	local vector Impulse;
	local TrPlayerController TrPC;

	// call parent's base, not parent as we are overriding behavior
	Super(UDKPawn).Landed(HitNormal, FloorActor);

	// adds impulses to vehicles and dynamicSMActors (e.g. KActors)
	Impulse.Z = Velocity.Z * 4.0f; // 4.0f works well for landing on a Scorpion
	if (UTVehicle(FloorActor) != None)
	{
		UTVehicle(FloorActor).Mesh.AddImpulse(Impulse, Location);
	}
	else if (DynamicSMActor(FloorActor) != None)
	{
		DynamicSMActor(FloorActor).StaticMeshComponent.AddImpulse(Impulse, Location);
	}

	if ( Velocity.Z < -200 )
	{
		OldZ = Location.Z;
		bJustLanded = bUpdateEyeHeight && (Controller != None) && Controller.LandingShake();
	}

	// project the incoming velocity along the slope of the floor
	Velocity = (HitNormal cross (Velocity cross HitNormal)) * m_fFallVelocityTransfer;

	if (UTInventoryManager(InvManager) != None)
	{
		UTInventoryManager(InvManager).OwnerEvent('Landed');
	}

	TrPC = TrPlayerController(Controller);
	if( TrPC != none )
	{
		// Clear out any ejection from a vehicle.
		TrPC.m_bEjectedFromVehicle = false;
	}

	SetBaseEyeheight();
}

simulated function TakeFallingDamage()
{
	m_bJustLandedSpeedSq = VSizeSq(Velocity);
}

unreliable client function PlayHardLandingEffect(vector HitLocation);

unreliable client function PlaySonicPunchEffect();

event TakeFallDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum)
{
	PlayHardLandingEffect(HitLocation);

	TakeDamage(DamageAmount, Eventinstigator, HitLocation, Momentum, class'TrDmgType_Fell');
}

///////////////// Credits /////////////

function ProcessCreditEvent(TrCreditEventType eventType, bool bProxyEvent)
{
	TrPlayerController(Controller).ProcessCreditEvent(eventType,bProxyEvent);
}

/**
 * Called when FlashLocation has been updated.
 * Trigger appropritate events based on FlashLocation's value.
 * == (0,0,0) means Weapon Stopped firing
 * != (0,0,0) means Weapon just fired
 *
 * Network: ALL
 */
simulated function FlashLocationUpdated(Weapon InWeapon, Vector InFlashLocation, bool bViaReplication)
{
	// Ignore flash location updates when we are on the client and locally controlled because we have already
	// simulated the shot.
	if (bViaReplication && Instigator != None && Instigator.IsLocallyControlled())
	{
		return;
	}

	//`log( WorldInfo.TimeSeconds @ GetFuncName() @ "FlashLocation:" @ FlashLocation @ "bViaReplication:" @ bViaReplication );
	if( !IsZero(InFlashLocation) )
	{
		WeaponFired(InWeapon, bViaReplication, InFlashLocation);
	}
	else
	{
		WeaponStoppedFiring(InWeapon, bViaReplication);
	}
}

simulated function WeaponFired(Weapon InWeapon, bool bViaReplication, optional vector HitLocation)
{
	if( InWeapon != none && bViaReplication && WorldInfo.NetMode == NM_Client )
	{  
		// Ignore calls via replication on the client that owns the weapon because the client
		// has already done this logic when they fired the weapon locally.
		return;
	}

	if( r_bIsInvulnerable )
	{
		// If we are invulnerable, turn it off.
		ClearInvulnerability();
	}

	// AutoFireDevices will call PlayFireEffects() during it's buildup.
	if (InWeapon != none && InWeapon.IsA('TrDevice_AutoFire'))
	{
        if (CurrentWeaponAttachment != None)
	    {
            // Play the impact effects for this autofire device.
		    if ( HitLocation != Vect(0,0,0) && (WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_Standalone || bViaReplication) )
		    {
			    CurrentWeaponAttachment.PlayImpactEffects(HitLocation);
		    }
	    }
	}
	else
	{
		// Don't pulse on ninja smoke firing.
		if (CurrentWeaponAttachmentClass != class'TrAttachment_NinjaSmoke')
		{
			PulseStealth(true);
		}

		if (CurrentWeaponAttachment != None)
		{
			if ( !IsFirstPerson() )
			{
				CurrentWeaponAttachment.ThirdPersonFireEffects(HitLocation);
			}
			else
			{
				CurrentWeaponAttachment.FirstPersonFireEffects(Weapon, HitLocation);
				if ( class'Engine'.static.IsSplitScreen() && CurrentWeaponAttachment.EffectIsRelevant(CurrentWeaponAttachment.Location,false,CurrentWeaponAttachment.MaxFireEffectDistance) )
				{
					// third person muzzle flash
					CurrentWeaponAttachment.CauseMuzzleFlash();
				}
			}

			if ( HitLocation != Vect(0,0,0) )
			{
				CurrentWeaponAttachment.PlayImpactEffects(HitLocation);
			}
		}
	}
}

// Disable dodge for Tribes.
function bool Dodge(eDoubleClickDir DoubleClickMove);
function bool PerformDodge(eDoubleClickDir DoubleClickMove, vector Dir, vector Cross);

// Disable telefragging in Tribes.
function gibbedBy(actor Other);
event EncroachedBy( actor Other );

// No gibs.
simulated function bool ShouldGib(class<UTDamageType> UTDamageType);

// No IK.
simulated function SetHandIKEnabled(bool bEnabled);

/** Plays a camera shake based on LastTakeHitInfo. */
simulated function PlayDamageCameraShake()
{
	local TrPlayerController PC;
	local class<TrDmgType_Base> TrDamage;
	local name CameraShakeName;
	local float CameraShakeScale;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		PC = TrPlayerController(Controller);
		if( PC != none )
		{
			TrDamage = class<TrDmgType_Base>(LastTakeHitInfo.DamageType);
			if( TrDamage != none )
			{
				TrDamage.static.GetCameraShake(LastTakeHitInfo.Damage, CameraShakeName, CameraShakeScale);
				if( CameraShakeName != '' )
				{
					PC.PlayCameraShake(CameraShakeName, CameraShakeScale);
				}
			}
		}
	}
}

simulated function bool IsLastHitFromNinjaSmoke()
{
	return LastTakeHitInfo.DamageType == class'TrDmgType_NinjaSmoke' && LastTakeHitInfo.m_bDamagedSelf;
}

simulated function PlayTakeHitEffects()
{
	local TrPlayerController PC;
	local class<TrDmgType_Base> TrDamage;
	local AudioDevice Audio;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier TrVM;

	// Don't call super, it does a lot of stuff we don't need.
	//Super.PlayTakeHitEffects();

	PlayDamageCameraShake();

	// Go stealth immediately if they damaged themselves with ninja smoke.
	if (IsLastHitFromNinjaSmoke())
	{
		m_fPulseStealthIgnoreTimeStamp = WorldInfo.TimeSeconds;
		m_fPulseStealthIgnoreTime = 0.0f;

		// Fetch the amount of time to ignore pulse stealth for.
		TrPRI = GetTribesReplicationInfo();
		if (TrPRI != none)
		{
			TrVM = TrPRI.GetCurrentValueModifier();
			if (TrVM != none)
			{
				m_fPulseStealthIgnoreTime = TrVM.m_fIgnorePulseTime;
			}
		}

		m_fPulseStealthVisibleTimestamp = 0.0f;
	}
	else
	{
		PulseStealth();
	}

	PC = TrPlayerController(Controller);
	if( PC != none )
	{
		// Pulse the shield HUD effect if shielded.
		if( r_bIsShielded )
		{
			PC.PulseShield();
		}
		
		// Ringing sound.
		TrDamage = class<TrDmgType_Base>(LastTakeHitInfo.DamageType);
		if( TrDamage != none )
		{
			if( TrDamage.default.m_RingingSound != none )
			{
				PlaySound(TrDamage.default.m_RingingSound, true);
			}


			// Set the sound mode.
			if( TrDamage.default.m_nmTakeHitSoundMode != '' )
			{
				Audio = class'Engine'.static.GetAudioDevice();

				if (Audio != None)
				{
					Audio.SetSoundMode(TrDamage.default.m_nmTakeHitSoundMode);
				}
			}
		}
	}
}

// Taken from Pawn and UTPawn functions of the same name, just swapped out to our new damage type.
simulated event FellOutOfWorld(class<DamageType> dmgType)
{
	if (Role == ROLE_Authority)
	{
		Health = -1;
		Died( None, class'TrDmgType_FellOutOfWorld', Location );
		if ( dmgType == None )
		{
			SetPhysics(PHYS_None);
			SetHidden(True);
			LifeSpan = FMin(LifeSpan, 1.0);
		}
	}

	bStopDeathCamera = true;
}

function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
    local TrTurretPawn TPKiller;
	local TrPlayerController OldPawnController, KillerController;
	local TrVehicle TrV;

    ClientUpdateHUDHealth(0, HealthMax);

	TrV = TrVehicle(DrivenWeaponPawn.BaseVehicle);
	if (TrV != none)
	{
		TrV.RidingPawnLeave(DrivenWeaponPawn.SeatIndex, true);
	}

	OldPawnController = TrPlayerController(Controller);
	KillerController = TrPlayerController(Killer);
	if( OldPawnController != none )
	{
        // Set the time played on this class for experience gain
        OldPawnController.AddTimePlayed();

		if( KillerController == OldPawnController )
		{
			// If we killed self, count it as a suicide.
			OldPawnController.m_bLastDeathWasUserSuicide = true;
		}
		else
		{
			// We have died, so flush any determination for respawn.
			OldPawnController.FlushAccumulatedDetermination();
		}
	}

    if (Role == ROLE_Authority)
    {
        if ((OldPawnController != none && KillerController != none) &&
            (OldPawnController != KillerController) &&
            OldPawnController.GetTeamNum() == KillerController.GetTeamNum())
        {
            KillerController.FriendlyFireKills++;
            KillerController.CheckFriendlyFireKills();
        }

        if (Killer != none)
        {
            TPKiller = TrTurretPawn(Killer.Pawn);

            if (TPKiller != none && TPKiller.m_OwnerDeployable != none)
            {
                TPKiller.m_OwnerDeployable.AwardKillAssists();
            }
        }
    }

	// The user fell out of the world.
	if (damageType == class'TrDmgType_FellOutOfWorld')
	{
		LastHitInfo.Amount = Health;
		LastHitInfo.bDirectHit = false;
		LastHitInfo.Causer = self;
		LastHitInfo.Distance = 0;
		LastHitInfo.Type = class'TrDmgType_FellOutOfWorld';
	}

	return Super.Died(Killer, DamageType, HitLocation);
}

simulated function StopLocalEffectsAndSounds()
{
	StopJetpackEffects();

	if( m_AudioComponentSpeedSound != none )
	{
		m_AudioComponentSpeedSound.Stop();
		m_AudioComponentSpeedSound = none;
	}

	if (m_AudioComponentHealthRechargeLoop != none)
	{
		m_AudioComponentHealthRechargeLoop.Stop();
		m_AudioComponentHealthRechargeLoop = none;
	}

	if (m_AudioComponentJammerPackLoop != none)
	{
		m_AudioComponentJammerPackLoop.Stop();
		m_AudioComponentJammerPackLoop = none;
	}

	if (m_AudioComponentJetpackLoop != none)
	{
		m_AudioComponentJetpackLoop.Stop();
		m_AudioComponentJetpackLoop = none;
	}

	if (m_AudioComponentRageLoop != none)
	{
		m_AudioComponentRageLoop.Stop();
		m_AudioComponentRageLoop = none;
	}

	if (m_AudioComponentShieldPackLoop != none)
	{
		m_AudioComponentShieldPackLoop.Stop();
		m_AudioComponentShieldPackLoop = none;
	}

	if (m_AudioComponentSkiLoop != none)
	{
		m_AudioComponentSkiLoop.Stop();
		m_AudioComponentSkiLoop = none;
	}

	if (m_AudioComponentStealthPackLoop != none)
	{
		m_AudioComponentStealthPackLoop.Stop();
		m_AudioComponentStealthPackLoop = none;
	}
}

simulated function SetOverlayMeshHidden(bool bNewHidden)
{
	if( OverlayMesh != none )
	{
		OverlayMesh.SetHidden(bNewHidden);
		OverlayMesh.SetOwnerNoSee(bNewHidden);
	}
}

simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
    local vector ApplyImpulse, ShotDir;
    local TraceHitInfo HitInfo;
	local bool bGib, bMotors;
	local class<TrDmgType_Base> TrDamageType;
	local int i;
	local TrCollisionProxy CollisionProxy;

    bCanTeleport = false;
	bReplicateMovement = false;
	bTearOff = true;
	bPlayedDeath = true;
	bForcedFeignDeath = false;

    // make sure I don't have an active weaponattachment
	CurrentWeaponAttachmentClass = None;
	WeaponAttachmentChanged();

	HitDamageType = DamageType; // these are replicated to other clients
	TakeHitLocation = HitLoc;

	if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
		GotoState('Dying');
		return;
	}

	// Hide overlay meshes
	if( OverlayMesh != none )
	{
		OverlayMesh.SetHidden(true);
	}
	if( m_FirstPersonBodyOverlayMesh != none )
	{
		m_FirstPersonBodyOverlayMesh.SetHidden(true);
	}

	TrDamageType = class<TrDmgType_Base>(DamageType);

	PlayDamageCameraShake();

	foreach TouchingActors(class'TrCollisionProxy', CollisionProxy)
	{
		CollisionProxy.UnTouch(self);
	}

	StopLocalEffectsAndSounds();

	if( Mesh != none )
	{
		// Swap mesh for gibs
		bGib = TrDamageType != none && TrDamageType.default.m_bCausesGib;
		if( bGib )
		{
            if (m_GibMesh != none)
            {
			    Mesh.SetSkeletalMesh(m_GibMesh);
            }
            else
            {
			    Mesh.SetSkeletalMesh(GetCurrCharClassInfo().default.m_GibMesh);
		    }

		    Mesh.SetPhysicsAsset(GetCurrCharClassInfo().default.m_GibPhysicsAsset);
		}

		CollisionComponent = Mesh;
		Mesh.MinDistFactorForKinematicUpdate = 0.f;

		// If we had stopped updating kinematic bodies on this character due to distance from camera, force an update of bones now.
		if( Mesh.bNotUpdatingKinematicDueToDistance )
		{
			Mesh.ForceSkelUpdate();
			Mesh.UpdateRBBonesFromSpaceBases(TRUE, TRUE);
		}
		Mesh.PhysicsWeight = 1.0;
		SetPhysics(PHYS_RigidBody);
		Mesh.PhysicsAssetInstance.SetAllBodiesFixed(FALSE);
		SetPawnRBChannels(TRUE);

		CheckHitInfo( HitInfo, Mesh, Normal(TearOffMomentum), TakeHitLocation );

		if( bGib )
		{
			Mesh.AddRadialImpulse(HitLoc, TrDamageType.default.m_fGibRadius, TrDamageType.default.m_fGibStrength, TrDamageType.default.m_GibFalloff);

			// Loop through all sockets on the gibmesh and spawn a gib particle on it.
			for (i = 0; i < Mesh.SkeletalMesh.Sockets.Length; i++)
			{
				WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(GetCurrCharClassInfo().default.m_GibMeshParticleTemplate, Mesh, Mesh.SkeletalMesh.Sockets[i].SocketName, true,,);
			}
		}
		else
		{
			// Motors
			bMotors = TrDamageType != none && TrDamageType.default.m_bEnableMotors;
			if( bMotors )
			{
				// Turn on angular motors on skeleton.
				Mesh.bUpdateJointsFromAnimation = TRUE;
				Mesh.PhysicsAssetInstance.SetNamedMotorsAngularPositionDrive(false, false, NoDriveBodies, Mesh, true);
				Mesh.PhysicsAssetInstance.SetAngularDriveScale(1.0f, 1.0f, 0.0f);

				// Play the death animation.
				if( FullBodyAnimSlot != none )
				{
					FullBodyAnimSlot.PlayCustomAnim(TrDamageType.static.GetRandomDeathAnimName(), 1.0, 0.05, -1.0, true, true);
				}

				// We want to track when we hit the ground.
				Mesh.SetNotifyRigidBodyCollision(true);
			}

			if( TearOffMomentum != vect(0,0,0) )
			{
				ShotDir = normal(TearOffMomentum);
				ApplyImpulse = ShotDir * DamageType.default.KDamageImpulse;

				// If not moving downwards - give extra upward kick
				if ( Velocity.Z > -10 )
				{
					ApplyImpulse += Vect(0,0,1)*DamageType.default.KDeathUpKick;
				}
				Mesh.AddImpulse(ApplyImpulse,,, true);
			}
		}
	}

    GotoState('Dying');
}

simulated function float GetHealthPct()
{
    local float HP;

    HP = (float(Health) / float(HealthMax)) * 100.f;

    // Stop players from showing 0 health when floating between 0 and 1.
    if (HP < 1.0 && HP > 0.0) return 1;

    return HP;
}

simulated function NotifyTeamChanged()
{
    local TrPlayerReplicationInfo PRI;
	local TrPlayerController TrPC;

    PRI = GetTribesReplicationInfo();

    if( TrGame_TRRabbit(WorldInfo.Game) != None )
    {
        // Do not refresh the character class from family info!
		OnChangeJammingTeam();
    }

	TrPC = TrPlayerController(Controller);
	if( TrPC != none )
	{
		TrPC.DestroyAllOwnedDeployables();
	}

	if (PRI != none)
	{
		// NotifyTeamChanged called on spawn for each player, so use this time to give
		// this new pawn the armor/weapons needed. The server will attempt to switch
		// classes if the user has selected one different that his current class, while
		// the client will load his previous class. If the server decides to change this
		// pawn's class, the PRI will have updated and replication will force the client
		// to run SetCharClassFromInfo(..) and update with the new gear. 
		if (!m_bLoadoutReset)
		{
			if (Role == ROLE_Authority && !PRI.bBot)
			{
				 ActivatePendingClass();
			}
			else
			{
				SetCharacterClassFromInfo(GetFamilyInfo());
			}
		}
	}
}

/** Updates any team blocker materials to the appropriate team. */
simulated function UpdateTeamBlockerMaterials()
{
	local TrTeamBlockerStaticMeshActor TrTB;

	if( WorldInfo.NetMode != NM_DedicatedServer && IsLocallyControlled() && IsHumanControlled() )
	{
		foreach DynamicActors(class'TrTeamBlockerStaticMeshActor', TrTB)
		{
			TrTB.UpdateMaterialForPawn(self);
		}
	}
}

// Only called on authority!
function PossessedBy(Controller C, bool bVehicleTransition)
{
    local TrPlayerReplicationInfo PRI;

	// Skip UTPawn, it calls NotifyTeamChanged.
    Super(Pawn).PossessedBy(C, bVehicleTransition);

	PRI = GetTribesReplicationInfo();
    
	// When we are possessed by a PC (only) on spawn, reset our class
	if (PRI != none && !m_bLoadoutReset) 
	{
		m_bLoadoutReset = true;

		// Players now get their selected loadout on spawn without having to go to an inv station first
        // If we are spawning a bot, just give him the standard class
		if (PRI.bBot) SetCharacterClassFromInfo(GetFamilyInfo());
		else ActivatePendingClass(true);
	}
}

simulated event ResetSkin()
{
    SetSkin(None);
}

/**
 * SetSkin is used to apply a single material to the entire model, including any applicable attachments.
 * NOTE: Attachments (ie: the weapons) need to handle resetting their default skin if NewMaterinal = NONE
 *
 * @Param	NewMaterial		The material to apply
 * Overwrite UE version to handle material harvesting
 */

simulated function SetSkin(Material NewMaterial)
{
    
	local int i;

	// Replicate the Material to remote clients
	ReplicatedBodyMaterial = NewMaterial;
    
	if (VerifyBodyMaterialInstance())		// Make sure we have setup the BodyMaterialInstances array
	{
		// Propagate it to the 3rd person weapon attachment
		if (CurrentWeaponAttachment != None)
		{
			CurrentWeaponAttachment.SetSkin(NewMaterial);
		}

		// Propagate it to the 1st person weapon
		if (UTWeapon(Weapon) != None)
		{
			UTWeapon(Weapon).SetSkin(NewMaterial);
		}

		// Set the skin
		if (NewMaterial == None)
		{
			for (i = 0; i < Mesh.SkeletalMesh.Materials.length; i++)
			{
				Mesh.SetMaterial(i, BodyMaterialInstances[i]);
			}
		}
		else
		{
			for (i = 0; i < Mesh.SkeletalMesh.Materials.length; i++)
			{
				Mesh.SetMaterial(i, NewMaterial);
			}
		}

		SetArmsSkin(NewMaterial);
	}
}


simulated function bool CheckHeadShot(const out ImpactInfo Impact)
{
	return IsLocationOnHead(Impact,m_fHeadShotFudge);
}

//$$BE Removing unneeded exec commands.












/** Prepares the various overlay materials that may happen during gameplay. */
simulated function InitializeOverlayMaterials()
{
    local Texture NormalMap;

    // Shield pack.
	if (m_ShieldPackOverlayMIC == none)
	{
		m_ShieldPackOverlayMIC = new(Outer) class'MaterialInstanceConstant';
		m_ShieldPackOverlayMIC.SetParent(m_ShieldPackOverlayMaterial);
	}

	// General regen.
	if (m_RegenOverlayMIC == none)
	{
		m_RegenOverlayMIC = new(Outer) class'MaterialInstanceConstant';
		m_RegenOverlayMIC.SetParent(m_RegenOverlayMaterial);
	}

	// Regen pack.
	if (m_RegenPackPackOverlayMIC == none)
	{
		m_RegenPackPackOverlayMIC = new(Outer) class'MaterialInstanceConstant';
		m_RegenPackPackOverlayMIC.SetParent(m_RegenPackOverlayMaterial);
	}

	// Jammer pack.
	if (m_JammerPackOverlayMIC == none)
	{
		m_JammerPackOverlayMIC = new(Outer) class'MaterialInstanceConstant';
		m_JammerPackOverlayMIC.SetParent(m_JammerPackOverlayMaterial);
	}

	// Rage
	if (m_RageOverlayMIC == none)
	{
		m_RageOverlayMIC = new(Outer) class'MaterialInstanceConstant';
		m_RageOverlayMIC.SetParent(m_RageOverlayMaterial);
	}

	// Invulnerable
	if (m_InvulnerableOverlayMIC == none)
	{
		m_InvulnerableOverlayMIC = new(Outer) class'MaterialInstanceConstant';
		m_InvulnerableOverlayMIC.SetParent(m_InvulnerableOverlayMaterial);
	}

    // Harvest the normal map from the mesh.
    if( Mesh != None && Mesh.GetNumElements() > 0 )
    {
        MaterialInstanceConstant(Mesh.GetMaterial(0)).GetTextureParameterValue('Normal', NormalMap);
        if( NormalMap != None )
        {
            m_ShieldPackOverlayMIC.SetTextureParameterValue('Normal', NormalMap);
			m_RegenOverlayMIC.SetTextureParameterValue('Normal', NormalMap);
			m_RegenPackPackOverlayMIC.SetTextureParameterValue('Normal', NormalMap);
			m_JammerPackOverlayMIC.SetTextureParameterValue('Normal', NormalMap);
			m_RageOverlayMIC.SetTextureParameterValue('Normal', NormalMap);
			m_InvulnerableOverlayMIC.SetTextureParameterValue('Normal', NormalMap);
        }
    }

    // Initialize the parameters in case the pawn is already shielded.
    if( r_bIsShielded )
    {
        m_ShieldPackOverlayMIC.SetScalarParameterValue('Visibility', 1.0);
        m_ShieldPackOverlayMIC.SetScalarParameterValue('Startup', 0.0);
    }
    else
    {
        m_ShieldPackOverlayMIC.SetScalarParameterValue('Visibility', 0.0);
        m_ShieldPackOverlayMIC.SetScalarParameterValue('Startup', 1.0);
    }

	if( r_bIsHealthRecharging )
	{
		m_RegenOverlayMIC.SetScalarParameterValue('Visibility', 1.0);
		m_RegenOverlayMIC.SetScalarParameterValue('Startup', 0.0);
		m_RegenPackPackOverlayMIC.SetScalarParameterValue('Visibility', 1.0);
		m_RegenPackPackOverlayMIC.SetScalarParameterValue('Startup', 0.0);	
	}
	else
	{
		m_RegenOverlayMIC.SetScalarParameterValue('Visibility', 0.0);
		m_RegenOverlayMIC.SetScalarParameterValue('Startup', 1.0);
		m_RegenPackPackOverlayMIC.SetScalarParameterValue('Visibility', 0.0);
		m_RegenPackPackOverlayMIC.SetScalarParameterValue('Startup', 1.0);
	}

	if( IsJammedByFriendOrSelf() )
	{
		m_JammerPackOverlayMIC.SetScalarParameterValue('Visibility', 0.0);
		m_JammerPackOverlayMIC.SetScalarParameterValue('Startup', 1.0);
	}

	if (r_bIsRaged)
	{
		m_RageOverlayMIC.SetScalarParameterValue('Visibility', 1.0);
		m_RageOverlayMIC.SetScalarParameterValue('Startup', 0.0);
	}
	else
	{
		m_RageOverlayMIC.SetScalarParameterValue('Visibility', 0.0);
		m_RageOverlayMIC.SetScalarParameterValue('Startup', 1.0);
	}

	if (r_bIsInvulnerable)
	{
		m_InvulnerableOverlayMIC.SetScalarParameterValue('Visibility', 1.0);
		m_InvulnerableOverlayMIC.SetScalarParameterValue('Startup', 0.0);
	}
	else
	{
		m_InvulnerableOverlayMIC.SetScalarParameterValue('Visibility', 0.0);
		m_InvulnerableOverlayMIC.SetScalarParameterValue('Startup', 1.0);
	}
}

simulated function ClientPlayHealthRegenEffect()
{
	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

	// Play the regen overlay (this will be turned off on its own by ATrPawn::UpdateOverlayMaterial()).
	// Do not play if we are shielded, since shielded wins.
	if( !r_bIsShielded && !r_bIsStealthed && !IsJammedByFriendOrSelf() && !r_bIsRaged )
	{
		if (InvManager == none || !InvManager.IsA('TrInventoryManager') || TrDevice_RegenPack(TrInventoryManager(InvManager).GetDeviceByEquipPoint(EQP_Pack)) == none)
		{
			SetOverlayMaterial(m_RegenOverlayMIC);
		}
		else
		{
			SetOverlayMaterial(m_RegenPackPackOverlayMIC);
		}

		if (r_bIsHealthRecharging && !IsLocallyControlled() && m_AudioComponentHealthRechargeLoop == none)
		{
			m_AudioComponentHealthRechargeLoop = CreateAudioComponent(class<TrPawnSoundGroup>(SoundGroupClass).default.m_RechargeHealthSound3p, true, true);
			if (m_AudioComponentHealthRechargeLoop != none)
			{
				m_AudioComponentHealthRechargeLoop.bAutoDestroy=true;
				m_AudioComponentHealthRechargeLoop.bAllowSpatialization=true;
			}
		}
	}

	if (!r_bIsHealthRecharging && m_AudioComponentHealthRechargeLoop != none)
	{
		m_AudioComponentHealthRechargeLoop.FadeOut(0.1f, 0.0f);
		m_AudioComponentHealthRechargeLoop = none;
	}
}

/** Authority only, sets the shield active. */
function SetShieldPackActive(bool bActive)
{
	if( Role == ROLE_Authority )
	{
		r_bIsShielded = bActive;

		PlayShieldPackEffect();
	}
}

simulated function PlayShieldPackEffect()
{
    local SoundCue LoopingCue;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( r_bIsShielded )
	{
		// Play the shield overlay (this will be turned off on its own by ATrPawn::UpdateOverlayMaterial()).
		SetOverlayMaterial(m_ShieldPackOverlayMIC);

		// Activate shield sound and play the shield loop
		class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayShieldPackActivateSound(self);
		LoopingCue = (IsLocallyControlled() && IsHumanControlled()) ? class<TrPawnSoundGroup>(SoundGroupClass).default.m_ShieldPackLoopSound1p : class<TrPawnSoundGroup>(SoundGroupClass).default.m_ShieldPackLoopSound3p;
		m_AudioComponentShieldPackLoop = CreateAudioComponent(LoopingCue, true, true); 
		m_AudioComponentShieldPackLoop.bAutoDestroy=true;
	}
	else
	{
		// Play deactivate sound.
		class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayShieldPackDeactivateSound(self);
		m_AudioComponentShieldPackLoop.FadeOut(0.1, 0.0);
		m_AudioComponentShieldPackLoop = None;
	}
}

/** Authority only, sets the stealth pack active. */
function SetStealthPackActive(bool bActive)
{
	r_bIsStealthed = bActive;

	if( Role == ROLE_Authority )
	{
		PlayStealthPackEffect();
	}
}

simulated function PlayStealthPackEffect()
{
	local SoundCue LoopingCue;
	local AudioDevice Audio;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( r_bIsStealthed )
	{
		AlienFXOverlay(FXO_STEALTH);
	
		// If being jammed by an enemy, leave stealth pulsed.
		if( (r_nEnemyJamCount > 0 || r_nEnemyDropJammerCount > 0) )
		{
			PulseStealth(true);
		}

		// Activate stealth sound and play the stealth loop
		class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayStealthPackActivateSound(self);
		if( IsLocallyControlled() && IsHumanControlled() )
		{
			LoopingCue = class<TrPawnSoundGroup>(SoundGroupClass).default.m_StealthPackLoopSound1p;
			m_AudioComponentStealthPackLoop = CreateAudioComponent(LoopingCue, true, true); 
			m_AudioComponentStealthPackLoop.bAutoDestroy=true;

			// Set the sound mode for stealthing.
			Audio = class'Engine'.static.GetAudioDevice();

			if (Audio != None)
			{
				Audio.SetSoundMode('TR_Stealth');
			}
		}
	}
	else
    {
		AlienFXOverlay(FXO_NONE);
		
        // Play deactivate sound.
        class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayStealthPackDeactivateSound(self);

		// Pulse the stealth when they de-cloak.
		PulseStealth();

		if (r_bIsShielded)
		{
			SetOverlayMaterial(m_ShieldPackOverlayMIC);
		}
		else if (IsJammedByFriendOrSelf())
		{
			SetOverlayMaterial(m_JammerPackOverlayMIC);
		}

		if( IsLocallyControlled() && IsHumanControlled() )
		{
			m_AudioComponentStealthPackLoop.FadeOut(0.1, 0.0);
			m_AudioComponentStealthPackLoop = None;

			// Set the sound mode for stealthing.
			Audio = class'Engine'.static.GetAudioDevice();

			if (Audio != None)
			{
				Audio.SetSoundMode('default');
			}
		}
    }
}

/*
simulated event float GetPulseStealthTime()
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float PulseTime;

	PulseTime = default.m_fPulseStealthVisibleTime;

	TrPRI = GetTribesReplicationInfo();
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none )
		{
			PulseTime *= 1.0 - VM.m_fStealthPackPulseTimeBuffPct;
		}
	}

	return PulseTime;
}*/

/** Will make the stealth effect appear more visible. */
simulated function PulseStealth(optional bool bOverrideIgnore)
{
	// We are ignoring pulse stealth.
	if (!bOverrideIgnore && (WorldInfo.TimeSeconds - m_fPulseStealthIgnoreTimeStamp) < m_fPulseStealthVisibleTime)
	{
		return;
	}

	m_fPulseStealthVisibleTimestamp = WorldInfo.TimeSeconds;
}

simulated function bool IsPulseStealthed()
{
	return (((WorldInfo.TimeSeconds - m_fPulseStealthVisibleTimestamp) <  m_fPulseStealthVisibleTime) && r_bIsStealthed);
}

/** Authority only, sets rage active */
function SetRagePerkActive()
{
    local class<TrFamilyInfo> FamilyInfo;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier TrVM;

	// Fetch the family info.
	FamilyInfo = GetCurrCharClassInfo();

	// Activate rage, if it's a active perk.
	TrPRI = GetTribesReplicationInfo();
	if (TrPRI != none && FamilyInfo != none)
	{
		TrVM = TrPRI.GetCurrentValueModifier();
		if (TrVM != none && TrVM.m_bRage)
		{
			// Activate rage, and change the energy recharge rate.
			r_bIsRaged = true;
			ConsumePowerPool(-1.0 * TrVM.m_fRageEnergyRegenBuff);
			SyncClientCurrentPowerPool();
			PlayRageEffect();

			// Give them health for ragin'.
			GiveHealth(float(HealthMax) * TrVM.m_fRageHealthRestorationPct, HealthMax);

			// Update the pawn's mass.
			Mass = FamilyInfo.default.m_fMass;
			Mass *= 1.0 + TrVM.m_fMassPctBuff + TrVM.m_fRageMassPctBuff;

			SetTimer(TrVM.m_fRageLength, false, 'ClearRagePerk');
		}
	}
}

function ClearRagePerk()
{
    local class<TrFamilyInfo> FamilyInfo;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier TrVM;

	// Fetch the family info.
	FamilyInfo = GetCurrCharClassInfo();

	// Restore to the original recharge rate.
	TrPRI = GetTribesReplicationInfo();
	if (TrPRI != none && FamilyInfo != none)
	{
		TrVM = TrPRI.GetCurrentValueModifier();
		if (TrVM != none)
		{
			// Reset the energy regen rate.
			r_fPowerPoolRechargeRate = FamilyInfo.default.m_fPowerPoolRechargeRate;
			r_fPowerPoolRechargeRate *= 1.0 + TrVM.m_fEnergyRegenRateBuffPct;

			// Reset the pawn's mass.
			Mass = FamilyInfo.default.m_fMass;
			Mass *= 1.0 + TrVM.m_fMassPctBuff;
		}
	}

	r_bIsRaged = false;
}

/*
exec function Rage(bool bEnabled)
{
	GetTribesReplicationInfo().GetCurrentValueModifier().m_bRage = bEnabled;
	bEnabled ? SetRagePerkActive() : ClearRagePerk();
}
*/

simulated function PlayRageEffect()
{
	local bool bIs3P;
	local SoundCue LoopingCue;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( r_bIsRaged )
	{
		class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayRageActivateSound(self);
		if( IsLocallyControlled() && IsHumanControlled() )
		{
			LoopingCue = class<TrPawnSoundGroup>(SoundGroupClass).default.m_RageLoopSound1p;
		}
		else
		{
			bIs3P = true;
			LoopingCue = class<TrPawnSoundGroup>(SoundGroupClass).default.m_RageLoopSound3p;
		}

		m_AudioComponentRageLoop = CreateAudioComponent(LoopingCue, true, true); 
		if( m_AudioComponentRageLoop != none )
		{
			m_AudioComponentRageLoop.bAllowSpatialization=bIs3P;
			m_AudioComponentRageLoop.bAutoDestroy=true;
		}

		// Play the rage overlay (this will be turned off on its own by ATrPawn::UpdateOverlayMaterial()).
		SetOverlayMaterial(m_RageOverlayMIC);
	}
	else
	{
		if( m_AudioComponentRageLoop != none )
		{
			// Play deactivate sound.
			class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayRageDeactivateSound(self);
			m_AudioComponentRageLoop.FadeOut(0.1, 0.0);
			m_AudioComponentRageLoop = None;
		}
	}
}

simulated function PlayInvulnerabilityEffect()
{
	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( r_bIsInvulnerable )
	{
		SetOverlayMaterial(m_InvulnerableOverlayMIC);
	}
}

simulated function StartRidingInVehicle(TrVehicle V, int SeatIndex)
{
	local class<TrFamilyInfo> TrFI;
	local UTWeapon UTWeap;
	local TrPlayerController C;
	
	UTWeap = UTWeapon(Weapon);
	if (UTWeap != None)
	{
		StopWeaponFiring();
		UTWeap.HolderEnteredVehicle();
	}

	// Set the riding passenger mesh scale.
	TrFI = GetCurrCharClassInfo();
	if (TrFI != none)
	{
		Mesh.SetScale(TrFI.default.m_fPassengerMeshScale);
	}

	// Use the DrivenWeaponPawn to store info about the vehicle we're riding in.
	DrivenWeaponPawn.BaseVehicle = V;
	DrivenWeaponPawn.SeatIndex = SeatIndex;
	DrivenWeaponPawn.PRI = PlayerReplicationInfo;
	if (Role == ROLE_Authority)
	{
		bNetDirty = true;
	}

	Velocity = vect(0,0,0);
	Acceleration = vect(0,0,0);

    m_RidingVehicle = V;
	V.AttachRidingPawn(self, SeatIndex);
	SetWeaponAmbientSound(None);

	C = TrPlayerController(Controller);
	if( C != None )
	{
		if (!C.IsChildState(C.GetStateName(), 'PlayerRidingInVehicle'))
		{
			C.GotoState( 'PlayerRidingInVehicle' );
		}

		// Stop zooming when we get in a vehicle.
		C.TrEndZoom();
	}

	// Stop jetpack effects.
	StopJetpackEffects();

	SetTickGroup(TG_PostAsyncWork);

	if( C != none && !C.bBehindView )
	{
		SetFirstPersonBodyVisibility(true);
	}
}

simulated function StopRidingInVehicle()
{
	local TrPlayerController C;
	local TrVehicle TrV;
	local UTWeapon UTWeap;

	UTWeap = UTWeapon(Weapon);
	if (UTWeap != None)
	{
		StopWeaponFiring();
		UTWeap.HolderExitedVehicle();
	}

	C = TrPlayerController(Controller);

	if( C != None )
	{
		C.GotoState( LandMovementState );
	}

	// Restore the mesh scale to what it was previously.
	Mesh.SetScale(DefaultMeshScale);

	TrV = TrVehicle(LastDrivenWeaponPawn.BaseVehicle);
	if (TrV == none)
	{
		TrV = m_RidingVehicle;
	}
	if (TrV != none)
	{
		TrV.DetachRidingPawn(self);
	}
	
	m_RidingVehicle = none;

	// Restore the animations
	m_RidingPassengerBlendNode = none;

	SetTickGroup(TG_PreAsyncWork);

	DrivenWeaponPawn.BaseVehicle = none;
	DrivenWeaponPawn.SeatIndex = INDEX_NONE;
	DrivenWeaponPawn.PRI = none;
	if (Role == ROLE_Authority)
	{
		bNetDirty = true;
	}

	InitDefaultAnims(GetFamilyInfo());

	// Unhide the mesh only if we aren't a behind view and we aren't zoomed.
	if(C != none && !C.bBehindView && C.m_ZoomState == ZST_NotZoomed )
	{
		SetFirstPersonBodyVisibility(false);
	}
}

simulated event StartDriving(Vehicle V)
{
	local TrPlayerController TrPC;

	// End zooming when we get into a vehicle.
	TrPC = TrPlayerController(Controller);
	if (TrPC == none)
	{
		TrPC = TrPlayerController(V.Controller);
	}
	if (TrPC != none)
	{
		TrPC.TrEndZoom();
	}

	// Stop jetpack effects.
	StopJetpackEffects();

    m_RidingVehicle = TrVehicle(V);

	super.StartDriving(V);
}

simulated event StopDriving(Vehicle V)
{
	local TrHUD TrH;
	local class<TrFamilyInfo> TrFI;
	local float VelocityInheritPct;
	local UTWeapon UTWeap;

	UTWeap = UTWeapon(Weapon);
	if (UTWeap != None)
	{
		StopWeaponFiring();
		UTWeap.HolderExitedVehicle();
	}

	if (Role==ROLE_Authority)
	{
		// Determine the speed that the pawn inherits speed at, default is 100%.
		VelocityInheritPct = 1.0f;
		TrFI = GetCurrCharClassInfo();
		if (TrFI != none)
		{
			VelocityInheritPct = TrFI.default.m_fVehicleSpeedInheritPercent;
		}

		Velocity = V.Velocity * VelocityInheritPct + vect(0,0,200);
	}

	m_RidingVehicle = none;

	if (WorldInfo.NetMode!=NM_DedicatedServer)
	{
		TrH = GetTrHud();
		if( TrH != none )
		{
			TrH.ClearPromptPanel();
		}
	}

	super.StopDriving(V);
}

event OnRanOver(SVehicle Vehicle, PrimitiveComponent RunOverComponent, int WheelIndex)
{
	local class<UDKEmitCameraEffect> CameraEffect;
	local TrVehicle TrV;

	if (Role == ROLE_Authority)
	{
		TrV = TrVehicle(Vehicle);
		if (TrV != None)
		{
			TakeDamage(10000, TrV.Controller, Location, vect(0,0,0), TrV.RanOverDamageType,, Vehicle);

			if (Health <= 0)
			{
				PlaySound(SoundCue'AUD_PC_BulletImpact.Vehicle_Squish.A_CUE_PC_VehicleSquish');

				CameraEffect = TrV.RanOverDamageType.static.GetDeathCameraEffectInstigator(self);
				if (CameraEffect != None && UTPlayerController(TrV.Controller) != none)
				{
					UTPlayerController(TrV.Controller).ClientSpawnCameraEffect(CameraEffect);
				}
			}
		}
	}
}

////////// JAMMING //////////

//
//	effect manager calling to tell us that this pawn is jamming
//
function EnableJamming()
{
	local float JammingRadius;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	// setup a proxy to monitor our surroundings
	if (Role==ROLE_Authority)
	{
		// Radius can be buffed by skill/perk.
		JammingRadius = m_fJamEffectRadius;

		TrPRI = GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				JammingRadius *= 1.0 + VM.m_fJammerPackRadiusPctBuff;
			}
		}

	    //spawn collision proxy for jamming effects
		if (m_fJamEffectRadius > 0)
		{
			m_JammingFriendTeam = GetTeamNum();
			m_JammingCollisionProxy = Spawn(class'TrPawnCollisionProxy');
			m_JammingCollisionProxy.SetOwner(self);
			m_JammingCollisionProxy.SetBase(self);
			m_JammingCollisionProxy.SetCollisionSize(JammingRadius, JammingRadius);
			m_JammingCollisionProxy.ForceProximityScan(JammingRadius);
		}

		r_bIsJamming = true;
		PlayJammerPackEffect();
	}
}

//
//	effect manager calling to tell us that this pawn has stopped jamming
//
function DisableJamming()
{
	if (Role==ROLE_Authority)
	{
		if (m_JammingCollisionProxy!=None)
		{
			m_JammingCollisionProxy.Destroy();
			m_JammingCollisionProxy = None;
			DisableJammingOtherPawns();
		}

		r_bIsJamming = false;
		PlayJammerPackEffect();
	}
}

//
//	release all the jamming caused by this pawn
//
function DisableJammingOtherPawns()
{
	while(m_JammedFriends.Length>0)
	{
		if (m_JammedFriends[0]!=None)
			m_JammedFriends[0].ExitFriendJammingRadius(self);

		m_JammedFriends.Remove(0,1);
	}

	while(m_JammedEnemies.Length>0)
	{
		if (m_JammedEnemies[0]!=None)
			m_JammedEnemies[0].ExitEnemyJammingRadius();

		m_JammedEnemies.Remove(0,1);
	}
}

//	
//	enter/exit a jammed area. Authority only.
//
function EnteredFriendJammingRadius(TrPawn JammingFriend)
{	
	local TrPlayerReplicationInfo JammingFriendPRI;
	local TrPlayerController TrPC;

	JammingFriendPRI = TrPlayerReplicationInfo(JammingFriend.PlayerReplicationInfo);

	// Add the jamming friend to the list.
	if( JammingFriendPRI != none && m_FriendJammingList.Find(JammingFriendPRI) == -1 )
	{
		m_FriendJammingList.AddItem(JammingFriendPRI);
	}

	// If no other friends are currently jamming, let's jam with this one.
	if( r_FriendJammingPRI == none )
	{
		r_FriendJammingPRI = JammingFriendPRI;
		PlayJammingByFriendEffect();
	}

	// Broadcast a message to the player that is using the jammer pack that he is now influencing this pawn.
	TrPC = TrPlayerController(JammingFriend.Controller);
	if( TrPC != none )
	{
		TrPC.ReceiveLocalizedMessage(class'TrJammerMessage', 1, PlayerReplicationInfo);
	}
}

function ExitFriendJammingRadius(TrPawn JammingFriend)
{
	local TrPlayerReplicationInfo JammingFriendPRI;

	JammingFriendPRI = TrPlayerReplicationInfo(JammingFriend.PlayerReplicationInfo);

	if( JammingFriendPRI != none )
	{
		m_FriendJammingList.RemoveItem(JammingFriendPRI);
	}
	
	if( r_FriendJammingPRI == JammingFriendPRI && m_FriendJammingList.Length > 0 )
	{
		// If the JammingFriend was the one we were getting our jam from, pick up a jam from someone else.
		r_FriendJammingPRI = m_FriendJammingList[0];
	}
	else
	{
		// No more friends jamming.
		r_FriendJammingPRI = none;
		PlayJammingByFriendEffect();
	}
}

function EnteredEnemyJammingRadius()
{
	r_nEnemyJamCount++;
    PlayEnemyJammerPackEffect(true);
}

function ExitEnemyJammingRadius()
{
	r_nEnemyJamCount--;
	if (r_nEnemyJamCount<0) r_nEnemyJamCount=0;
    PlayEnemyJammerPackEffect(false);
}

simulated function bool IsJammedByFriendOrSelf()
{
	return r_FriendJammingPRI != none || r_bIsJamming || r_nFriendlyDropJammerCount > 0;
}

simulated function bool IsJammedByEnemy()
{
	return r_nEnemyJamCount > 0 || r_nEnemyDropJammerCount > 0;
}

simulated function PlayJammerPackEffect()
{
	local SoundCue LoopingCue;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( r_bIsJamming )
	{
		class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayJammerPackActivateSound(self);
		if( IsLocallyControlled() && IsHumanControlled() )
		{
			LoopingCue = class<TrPawnSoundGroup>(SoundGroupClass).default.m_JammerPackLoopSound1p;
			m_AudioComponentJammerPackLoop = CreateAudioComponent(LoopingCue, true, true); 
			if( m_AudioComponentJammerPackLoop != none )
			{
				m_AudioComponentJammerPackLoop.bAllowSpatialization=false;
				m_AudioComponentJammerPackLoop.bAutoDestroy=true;
			}
		}

		// Play the jammer overlay (this will be turned off on its own by ATrPawn::UpdateOverlayMaterial()).
		SetOverlayMaterial(m_JammerPackOverlayMIC);
	}
	else
	{
		if( m_AudioComponentJammerPackLoop != none )
		{
			// Play deactivate sound.
			class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayJammerPackDeactivateSound(self);
			m_AudioComponentJammerPackLoop.FadeOut(0.1, 0.0);
			m_AudioComponentJammerPackLoop = None;
		}
	}
}

simulated function PlayJammingByFriendEffect()
{
	local SoundCue LoopingCue;
	local TrPlayerController PC;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( !r_bIsJamming ) // Do not play JammingByFriend effects if we are doing our own jam.
	{
		if( r_FriendJammingPRI != none )
		{
			// Play the jammer overlay (this will be turned off on its own by ATrPawn::UpdateOverlayMaterial()).
			SetOverlayMaterial(m_JammerPackOverlayMIC);

			if (IsLocallyControlled() && IsHumanControlled())
			{
				PC = TrPlayerController(Controller);
				if( PC != none )
				{
					PC.ReceiveLocalizedMessage(class'TrJammerMessage', 0, r_FriendJammingPRI);
				}

				// If we aren't alredy playing a jam loop (we could be if another friend was jamming), play it now.
				if( m_AudioComponentJammerPackLoop == none )
				{
					LoopingCue = class<TrPawnSoundGroup>(SoundGroupClass).default.m_JammerPackLoopSound1p;
					m_AudioComponentJammerPackLoop = CreateAudioComponent(LoopingCue, true, true); 
					if( m_AudioComponentJammerPackLoop != none )
					{
						m_AudioComponentJammerPackLoop.bAutoDestroy=true;
					}
				}
			}
		}
		else
		{
			// No friends jamming anymore.
			if( m_AudioComponentJammerPackLoop != none )
			{
				m_AudioComponentJammerPackLoop.FadeOut(0.1, 0.0);
				m_AudioComponentJammerPackLoop = None;
			}
		}
	}
}

simulated function PlayEnemyJammerPackEffect(bool enteredJammingRadius)
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local TrPlayerController PC;

	if( IsJammedByEnemy() )
	{
		PC = TrPlayerController(Controller);
		if( r_bIsStealthed && PC != none )
		{
			PC.ReceiveLocalizedMessage(class'TrJammerMessage', 4);
		}

		// Pulse stealth and leave it pulsed by setting the visible time high.
		PulseStealth(true);
		m_fPulseStealthVisibleTime = 100000.f;
	}
	else
	{
		// Restore the visible time if no longer being jammed by the enemy.
		m_fPulseStealthVisibleTime = default.m_fPulseStealthVisibleTime;

		TrPRI = GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				m_fPulseStealthVisibleTime *= 1.0 - VM.m_fStealthPackPulseTimeBuffPct;
			}
		}
	}
}

//
//	collision has detected a pawn in the jamming proxuy
//
function OnPawnDetectedByCollisionProxy(Pawn p)
{
	local TrPawn aPawn;

	aPawn = TrPawn(p);
	if (aPawn == none)
		return;

	if (aPawn.GetTeamNum()==GetTeamNum())
	{
		if (m_JammedFriends.Find(aPawn)==-1)
		{
			aPawn.EnteredFriendJammingRadius(self);
			m_JammedFriends.AddItem(aPawn);
		}
	}
	else
	{
		if (m_JammedEnemies.Find(aPawn)==-1)
		{
			aPawn.EnteredEnemyJammingRadius();
			m_JammedEnemies.AddItem(aPawn);
		}
	}
}

function OnPawnExitedCollisionProxy(Pawn p)
{
	local TrPawn aPawn;

	aPawn = TrPawn(p);
	if (aPawn == none)
		return;

	if (aPawn.GetTeamNum()==GetTeamNum())
	{
		if (m_JammedFriends.Find(aPawn)!=-1)
		{
			//`log("releasing jam on my friend"@p);
			aPawn.ExitFriendJammingRadius(self);
			m_JammedFriends.RemoveItem(aPawn);
		}
	}
	else
	{
		if (m_JammedEnemies.Find(aPawn)!=-1)
		{
			//`log("releasing jam on my enemy"@p);
			aPawn.ExitEnemyJammingRadius();
			m_JammedEnemies.RemoveItem(aPawn);
		}
	}
}

/** Called when a pawn enters the collision of a drop jammer. */
function OnEnteredDropJammer(TrDeployable_DropJammer DropJammer)
{
	if( DropJammer.IsEnemy(self) )
	{
		// Drop Jammer is enemy.
		if( m_EnemyDropJammerList.Find(DropJammer) == -1 )
		{
			m_EnemyDropJammerList.AddItem(DropJammer);
			UpdateEnemyDropJammer();
		}
	}
	else
	{
		// Drop Jammer is friendly.
		if( m_FriendlyDropJammerList.Find(DropJammer) == -1 )
		{
			m_FriendlyDropJammerList.AddItem(DropJammer);
			UpdateFriendlyDropJammer();
		}
	}
}

/** Called when a pawn exits the collision of a drop jammer. */
function OnExitedDropJammer(TrDeployable_DropJammer DropJammer)
{
	if( DropJammer.IsEnemy(self) )
	{
		// Drop Jammer is enemy.
		if( m_EnemyDropJammerList.Find(DropJammer) != -1 )
		{
			m_EnemyDropJammerList.RemoveItem(DropJammer);
			UpdateEnemyDropJammer();
		}
	}
	else
	{
		// Drop Jammer is friendly.
		if( m_FriendlyDropJammerList.Find(DropJammer) != -1 )
		{
			m_FriendlyDropJammerList.RemoveItem(DropJammer);
			UpdateFriendlyDropJammer();
		}
	}
}

function UpdateEnemyDropJammer()
{
	r_nEnemyDropJammerCount = m_EnemyDropJammerList.Length;
	PlayJammingByEnemyDropJammerEffect();
}

function UpdateFriendlyDropJammer()
{
	r_nFriendlyDropJammerCount = m_FriendlyDropJammerList.Length;
	PlayJammingByFriendlyDropJammerEffect();
}

simulated function PlayJammingByEnemyDropJammerEffect()
{
	local PlayerController PC;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	if( IsJammedByEnemy() )
	{
		PC = TrPlayerController(Controller);
		if( r_bIsStealthed && PC != none )
		{
			PC.ReceiveLocalizedMessage(class'TrJammerMessage', 2);
		}

		// Pulse stealth and leave it pulsed by setting the visible time high.
		PulseStealth(true);
		m_fPulseStealthVisibleTime = 100000.f;
	}
	else
	{
		// Restore the visible time if no longer being jammed by the enemy.
		m_fPulseStealthVisibleTime = default.m_fPulseStealthVisibleTime;

		TrPRI = GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				m_fPulseStealthVisibleTime *= 1.0 - VM.m_fStealthPackPulseTimeBuffPct;
			}
		}
	}
}

simulated function PlayJammingByFriendlyDropJammerEffect()
{
	local PlayerController PC;
	local SoundCue LoopingCue;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if (IsJammedByFriendOrSelf())
	{
		// Play the jammer overlay (this will be turned off on its own by ATrPawn::UpdateOverlayMaterial()).
		SetOverlayMaterial(m_JammerPackOverlayMIC);

		if (IsLocallyControlled() && IsHumanControlled())
		{
			// If we aren't alredy playing a jam loop (we could be if another friend was jamming), play it now.
			if( m_AudioComponentJammerPackLoop == none )
			{
				LoopingCue = class<TrPawnSoundGroup>(SoundGroupClass).default.m_JammerPackLoopSound1p;
				m_AudioComponentJammerPackLoop = CreateAudioComponent(LoopingCue, true, true); 
				if( m_AudioComponentJammerPackLoop != none )
				{
					m_AudioComponentJammerPackLoop.bAutoDestroy=true;
				}
			}

			PC = TrPlayerController(Controller);
			if( PC != none )
			{
				PC.ReceiveLocalizedMessage(class'TrJammerMessage', 3);
			}
		}
	}
	else
	{
		// No friends jamming anymore.
		if( m_AudioComponentJammerPackLoop != none )
		{
			m_AudioComponentJammerPackLoop.FadeOut(0.1, 0.0);
			m_AudioComponentJammerPackLoop = None;
		}
	}
}

//
//	Swap over who is friend and who is enemy for jamming purposes when the team number changes
//
function OnChangeJammingTeam()
{
	local int i;
	local array<TrPawn> temp;

	if (m_JammingFriendTeam==GetTeamNum()) return;

	m_JammingFriendTeam = GetTeamNum();

	temp = m_JammedFriends;

	for (i=0; i<m_JammedFriends.Length; i++)
	{
		if (m_JammedFriends[i]!=None)
		{
			m_JammedFriends[i].EnteredEnemyJammingRadius();
		}
	}

	for (i=0; i<m_JammedEnemies.Length; i++)
	{
		if (m_JammedEnemies[i]!=None)
		{
			m_JammedEnemies[i].ExitEnemyJammingRadius();
		}
	}

	m_JammedFriends = m_JammedEnemies;
	m_JammedEnemies = temp;
}

////  END Jamming

/* GetPawnViewLocation()
Called by PlayerController to determine camera position in first person view.  Returns
the location at which to place the camera
*/
simulated function Vector GetPawnViewLocation()
{
	local Rotator BaseRotation;
	local vector PawnViewLocation, X, Y, Z;
	
	if ( bUpdateEyeHeight )
		PawnViewLocation = Location + EyeHeight * vect(0,0,1) + WalkBob;
	else
		PawnViewLocation = Location + BaseEyeHeight * vect(0,0,1);

	BaseRotation = Rotation;
	if (DrivenWeaponPawn.BaseVehicle != none && DrivenWeaponPawn.BaseVehicle.Seats[DrivenWeaponPawn.SeatIndex].m_bAttachPawnDirectly)
	{
		BaseRotation = GetViewRotation();
	}

	GetAxes(BaseRotation,X,Y,Z);

	PawnViewLocation += X * m_fPawnViewForwardAmount;

	return PawnViewLocation;
}

//
//	release any resources associated with active jamming
//
simulated event Destroyed()
{
	if (Role==ROLE_Authority)
	{
		DisableJamming();

		// A destroyed pawn that still has the flag drops it.
		DropFlag();
	}

	Super.Destroyed();
}

/** sets whether or not the owner of this pawn can see it */
simulated function SetMeshVisibility(bool bVisible)
{
	local TrPlayerController TrPC;

	Super.SetMeshVisibility(bVisible);

	// If we are trying to show the first person mesh and we are zoomed in, abort.
	TrPC = TrPlayerController(Controller);
	if (TrPC != none && !bVisible && TrPC.m_ZoomState != ZST_NotZoomed)
	{
		SetWeaponVisibility(false);
		return;
	}

	SetFirstPersonBodyVisibility(bVisible);
}

simulated function SetFirstPersonBodyVisibility(bool bHide)
{
	local TrPlayerController TrPC;

	// Hide the first-person mesh if we are a vehicle passenger.
	if (DrivenWeaponPawn.BaseVehicle != none && DrivenWeaponPawn.SeatIndex > 0)
	{
		bHide = true;

		if (!Mesh.bUpdateSkelWhenNotRendered || !Mesh.bCastHiddenShadow)
		{
			Mesh.bUpdateSkelWhenNotRendered = true;
			Mesh.bCastHiddenShadow = true;
			Mesh.ForceUpdate(false);
		}
	}
	else if (Mesh.bUpdateSkelWhenNotRendered != default.Mesh.bUpdateSkelWhenNotRendered || 
			 Mesh.bCastHiddenShadow != default.Mesh.bCastHiddenShadow)
	{
		Mesh.bUpdateSkelWhenNotRendered = default.Mesh.bUpdateSkelWhenNotRendered;
		Mesh.bCastHiddenShadow = default.Mesh.bCastHiddenShadow;
		Mesh.ForceUpdate(false);
	}

	// Hide the first-person mesh if we are zoomed.
	TrPC = TrPlayerController(Controller);
	if (TrPC != none && TrPC.m_ZoomState != ZST_NotZoomed)
	{
		bHide = true;
	}

	if( m_FirstPersonBodyMesh != None )
	{
		m_FirstPersonBodyMesh.SetOwnerNoSee(bHide);
	}
	if( m_FirstPersonBodyOverlayMesh != none)
	{
		m_FirstPersonBodyOverlayMesh.SetOwnerNoSee(bHide);
	}
	if (m_FirstPersonBodyShadowMesh != none)
	{
		m_FirstPersonBodyShadowMesh.SetOwnerNoSee(bHide);
		m_FirstPersonBodyShadowMesh.CastShadow = !bHide;
		m_FirstPersonBodyShadowMesh.bCastHiddenShadow = !bHide;
		m_FirstPersonBodyShadowMesh.ForceUpdate(false);
	}
	if( m_FirstPersonWeaponShadowMesh != none )
	{
		m_FirstPersonWeaponShadowMesh.SetOwnerNoSee(bHide);
		m_FirstPersonWeaponShadowMesh.CastShadow = !bHide;
		m_FirstPersonWeaponShadowMesh.bCastHiddenShadow = !bHide;
		m_FirstPersonWeaponShadowMesh.ForceUpdate(false);
	}
	if( m_FirstPersonFlagShadowMesh != none )
	{
		m_FirstPersonFlagShadowMesh.SetOwnerNoSee(bHide);
		m_FirstPersonFlagShadowMesh.CastShadow = !bHide;
		m_FirstPersonFlagShadowMesh.bCastHiddenShadow = !bHide;
		m_FirstPersonFlagShadowMesh.ForceUpdate(false);
	}
}

/**
 * Called when there is a need to change the weapon attachment (either via
 * replication or locally if controlled.
 */
simulated function WeaponAttachmentChanged()
{
	if( (CurrentWeaponAttachment == None || CurrentWeaponAttachment.Class != CurrentWeaponAttachmentClass ) &&
		(Mesh != none) &&
		(Mesh.SkeletalMesh != None) )
	{
		// Detach/Destroy the current attachment if we have one
		if( (CurrentWeaponAttachment!=None) )
		{
			// Unless we are changing to an autofire device, detach the old device.
			if(CurrentWeaponAttachmentClass == none || !(ClassIsChildOf(CurrentWeaponAttachmentClass.default.WeaponClass, class'TrDevice_AutoFire')) )
			{
				if( m_InHandWeaponAttachmentFromAutoFire != none )
				{
					m_InHandWeaponAttachmentFromAutoFire.DetachFrom(Mesh);
					m_InHandWeaponAttachmentFromAutoFire.Destroy();
					m_InHandWeaponAttachmentFromAutoFire = none;
				}

				CurrentWeaponAttachment.DetachFrom(Mesh);
				CurrentWeaponAttachment.Destroy();
			}
			else
			{
				// We are changing to an autofire device. Store the weapon attachment that we are switching from.
				m_InHandWeaponAttachmentFromAutoFire = CurrentWeaponAttachment;
				m_InHandWeaponAttachmentFromAutoFire.ChangeVisibility(false);
			}
		}

		// Create the new Attachment.
		if (CurrentWeaponAttachmentClass!=None)
		{
			CurrentWeaponAttachment = Spawn(CurrentWeaponAttachmentClass,self);
			CurrentWeaponAttachment.Instigator = self;
		}
		else
			CurrentWeaponAttachment = none;

		// If all is good, attach it to the Pawn's Mesh.
		if (CurrentWeaponAttachment != None)
		{
			CurrentWeaponAttachment.AttachTo(self);
			CurrentWeaponAttachment.SetSkin(ReplicatedBodyMaterial);
			CurrentWeaponAttachment.ChangeVisibility(bWeaponAttachmentVisible);

			//$$ML: Added so sounds will follow with player and spatialize.
			CurrentWeaponAttachment.SetBase(self);
		}
	}
}

// No crouching. This is sometimes called by PlayerController.LongClientAdjustPosition() and causes bad things to happen!
simulated function ForceCrouch();

simulated function int FindClosestStickyGrenadeSocketIndex(Vector ProjectileLocation, bool bOnlyFindAvailableSlots)
{
	local float BestDistance, Distance;
	local int i, BestIndex;
	local Vector SocketLocation;
	local Rotator SocketRotation;

	BestIndex = INDEX_NONE;

	if( Mesh != None )
	{
		BestDistance = 10000000.0;
		for( i = 0; i < m_StickyGrenadeSocketList.Length; i++ )
		{
			if( !bOnlyFindAvailableSlots || (bOnlyFindAvailableSlots && m_StickyGrenadeSocketList[i].Projectile == none) )
			{
				if( Mesh.GetSocketWorldLocationAndRotation(m_StickyGrenadeSocketList[i].SocketName, SocketLocation, SocketRotation) )
				{
					Distance = VSize(SocketLocation - ProjectileLocation);
					if( Distance < BestDistance )
					{
						Distance = BestDistance;
						BestIndex = i;
					}
				}
			}
		}
	}

	return BestIndex;
}

simulated function StickGrenadeToPawn(TrProjectile Projectile)
{
	local int SocketIndex;

	SocketIndex = FindClosestStickyGrenadeSocketIndex(Projectile.Location, true);

	if( SocketIndex != INDEX_NONE )
	{
		Projectile.SetBase(none);
		Projectile.SetHardAttach(true);
		Projectile.SetLocation(Location);
		Projectile.SetPhysics(PHYS_None);
		Projectile.SetBase( self, , Mesh, m_StickyGrenadeSocketList[SocketIndex].SocketName);
		m_StickyGrenadeSocketList[SocketIndex].Projectile = Projectile;
		m_bUpdateStickyGrenades = true;
		if( Projectile.m_ProjMesh != None )
		{
			Projectile.m_ProjMesh.SetRotation(Rot(0,0,16384));
		}

		// Hide the stuck projectile if target is in first person.
		if( IsFirstPerson() && (IsLocallyControlled() && IsHumanControlled()) )
		{
			Projectile.m_ProjMesh.SetHidden(true);
			
			// BZ 7451: Sticky grenade visible in death camera after being attached to a first-person view. We aren't using this anyway.
			/*m_StickyGrenadeSocketList[SocketIndex].FirstPersonMesh = new class'UDKSkeletalMeshComponent';
			m_StickyGrenadeSocketList[SocketIndex].FirstPersonMesh.SetSkeletalMesh(SkeletalMesh'WEP_Sticky_Grenade_3p.Models.SKL_WEP_StickyGrenade_3p');
			m_StickyGrenadeSocketList[SocketIndex].FirstPersonMesh.SetDepthPriorityGroup(SDPG_Foreground);
			m_StickyGrenadeSocketList[SocketIndex].FirstPersonMesh.SetOnlyOwnerSee(true);
			m_StickyGrenadeSocketList[SocketIndex].FirstPersonMesh.CastShadow = false;
			m_StickyGrenadeSocketList[SocketIndex].FirstPersonMesh.bAllowAmbientOcclusion = false;
			AttachComponent(m_StickyGrenadeSocketList[SocketIndex].FirstPersonMesh);*/
		}
	}
	else
	{
		Projectile.SetBase(self);
	}
}

/** Called update anything related to sticky projectiles requiring per-tick logic. */
simulated event UpdateStickyGrenades(float DeltaSeconds)
{
	// TODO: Make sticky grenades show up in 1p view.
	m_bUpdateStickyGrenades = false;
	/*
	local int i;

	m_bUpdateStickyGrenades = false;
	for( i = 0; i < m_StickyGrenadeSocketList.Length; i++ )
	{
		if( m_StickyGrenadeSocketList[i].Projectile != none )
		{
			// Found a projectile. Update its first person mesh.
			if( m_StickyGrenadeSocketList[i].FirstPersonMesh != none )
			{
				m_StickyGrenadeSocketList[i].ViewOffset = m_StickyGrenadeSocketList[i].ViewOffset >> Controller.Rotation;
				m_StickyGrenadeSocketList[i].FirstPersonMesh.SetTranslation(m_StickyGrenadeSocketList[i].ViewOffset);
				m_bUpdateStickyGrenades = true;

			}			
		}
		else
		{
			// There is no projectile attached to this socket. Clear out any reference to the first person mesh.
			if( m_StickyGrenadeSocketList[i].FirstPersonMesh != none )
			{
				m_StickyGrenadeSocketList[i].FirstPersonMesh.DetachFromAny();
				m_StickyGrenadeSocketList[i].FirstPersonMesh = none;
			}
		}
	}
*/
}

// Network: Called on authority from player controller, called on simulated clients through repnotify.
simulated function SetSkiing(bool bEnabled, optional bool bJump)
{
	local TrPlayerController TrPC;
    local TrGameReplicationInfo TrGRI;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none && !TrGRI.r_bSkiEnabled)
    {
        return;
    }

	if( Role == ROLE_Authority || Role == ROLE_AutonomousProxy )
	{
		if( bEnabled == r_bIsSkiing )
		{
			// If there is no change to the skiing variable don't attempt to play effects.
			// Assume that simulated clients will always need to play effects since this is only
			// called through a repnotify.
			return;
		}

		r_bIsSkiing = bEnabled;
	}

	TrPC = TrPlayerController(Controller);
	if( TrPC != none && (Physics == PHYS_Walking || Physics == PHYS_Skiing) && bJump )
	{
		TrPC.bPressedJump = true;
	}
}

simulated event PlaySkiEffects();
simulated event StopSkiEffects();

simulated event PlaySkiEffectsSound()
{
	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( m_AudioComponentSkiLoop != none )
	{
		if( IsLocallyControlled() && IsHumanControlled() )
		{
			m_AudioComponentSkiLoop.bAllowSpatialization = false;
		}

		m_AudioComponentSkiLoop.FadeIn(0.25, 1.0);
	}

	m_bIsPlayingSkiEffectsSounds = true;
}

simulated event StopSkiEffectsSound()
{
	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( m_AudioComponentSkiLoop != none )
	{
		m_AudioComponentSkiLoop.FadeOut(0.22, 0.0);
	}

	m_bIsPlayingSkiEffectsSounds = false;
}

simulated function FaceRotation(rotator NewRotation, float DeltaTime)
{
	if ( Physics == PHYS_Ladder )
	{
		NewRotation = OnLadder.Walldir;
	}
	else if ( (Physics == PHYS_Walking) || (Physics == PHYS_Falling) || (Physics == PHYS_Skiing) || (Physics == PHYS_Flying) )
	{
		NewRotation.Pitch = 0;
	}
	NewRotation.Roll = Rotation.Roll;
	SetRotation(NewRotation);
}

function PlayDyingSound()
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		SoundGroupClass.Static.PlayDyingSound(self);
	}
}

/**
* Attach GameObject to mesh.
* @param GameObj : Game object to hold
*/
simulated event HoldGameObject(UDKCarriedObject GameObj)
{
	local UTCarriedObject UTGameObj;
	local TrPlayerController TrPC;
	local TrFlagCTF TouchingFlag;

	UTGameObj = UTCarriedObject(GameObj);

	// Find out if we need to use the check timer.
	if (Mesh.MatchRefBone(UTGameObj.GameObjBone3P) == INDEX_NONE)
	{
		m_GameObjCheckTimer = UTGameObj;
		return;
	}

	m_GameObjCheckTimer = none;

	// BZ 8798: Make sure a player receiving the flag and standing on the flag stand handles events properly.
	foreach TouchingActors(class'TrFlagCTF', TouchingFlag)
	{
		// We are touching ourself, ignore.
		if (TouchingFlag == GameObj)
		{
			continue;
		}

		// Notify the other flag we are touching it.
		TouchingFlag.Touch(self, none, Location, vect(0,0,1));

		return;
	}

	// Set the physics to none before setting base. Setting physics to none resets base.
	GameObj.SetPhysics(PHYS_None);

	UTGameObj.SetHardAttach(UTGameObj.default.bHardAttach);
	UTGameObj.bIgnoreBaseRotation = UTGameObj.default.bIgnoreBaseRotation;

	if (IsFirstPerson() && IsLocallyControlled() )
	{
		UTGameObj.SetBase(self);
		UTGameObj.SetRelativeRotation(UTGameObj.GameObjRot1P);
		UTGameObj.SetRelativeLocation(UTGameObj.GameObjOffset1P);
		UTGameObj.SkelMesh.CastShadow = false;
	}
	else
	{
		if ( UTGameObj.GameObjBone3P != '' )
		{
			UTGameObj.SetBase(self,,Mesh,UTGameObj.GameObjBone3P);
		}
		else
		{
			UTGameObj.SetBase(self);
		}
		UTGameObj.SetRelativeRotation(UTGameObj.GameObjRot3P);
		UTGameObj.SetRelativeLocation(UTGameObj.GameObjOffset3P);
	}

	if( m_FirstPersonFlagShadowMesh != none && IsLocallyControlled() )
	{
		m_FirstPersonFlagShadowMesh.SetSkeletalMesh(UTGameObj.SkelMesh.SkeletalMesh);
		m_FirstPersonFlagShadowMesh.SetPhysicsAsset(UTGameObj.SkelMesh.PhysicsAsset);
		if( !m_FirstPersonFlagShadowMesh.bAttached )
		{
			m_FirstPersonBodyMesh.AttachComponent(m_FirstPersonFlagShadowMesh, UTGameObj.GameObjBone3P, UTGameObj.GameObjOffset3P, UTGameObj.GameObjRot3P);
		}
	}

	if( UTGameObj.IsA('TrFlagBase') )
	{
		PulseStealth(true);
	}

	TrPC = TrPlayerController(Controller);
	if( TrPC != none && TrPC.m_HelpTextManager != none )
	{
		if( UTGameObj.IsA('TrFlagCTF') )
		{
			TrPC.m_HelpTextManager.RequestHelpText(HelpText_HoldingEnemyFlagDescription);
			TrPC.m_HelpTextManager.RemoveHelpText(HelpText_HoldingEnemyFlagDescription, 4.0);
		}
		else if( UTGameObj.IsA('TrFlagRabbit') )
		{
			TrPC.m_HelpTextManager.RequestHelpText(HelpText_HoldingRabbitFlagDescription);
			TrPC.m_HelpTextManager.RemoveHelpText(HelpText_HoldingRabbitFlagDescription, 4.0);
		}
	}
}

function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	// Take no damage if invulnerable.
	if( r_bIsInvulnerable && InstigatedBy != Controller )
	{
		InDamage = 0;

		if( class<TrGame_TrArena>(WorldInfo.GRI.GameClass) != none )
		{
			// In Arena, don't take momentum if invulnerable.
			Momentum = vect(0,0,0);
		}
	}

	super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
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

		PlayInvulnerabilityEffect();
	}
}

function ClearInvulnerability()
{
	ClearTimer('ClearInvulnerability');
	r_bIsInvulnerable = false;
}

function SetMovementPhysics()
{
	// If riding in a vehicle, ignore any request to set movement physics. This
	// function, called from Pawn::TakeDamage() was causing riding passengers to 
	// drop off vehicles when damaged.
	if( TrVehicle(DrivenWeaponPawn.BaseVehicle) != None )
	{
		return;
	}
	Super.SetMovementPhysics();
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	if( SeqNode.NodeTotalWeight > 0.0 && SeqNode.NodeName == 'RidingPassengerFire' && m_RidingPassengerBlendNode != none )
	{
		m_RidingPassengerBlendNode.PlayIdle();
	}
}

//Override UT's implementation since it causes logspam about sounds we don't play.
function PlayTeleportEffect(bool bOut, bool bSound)
{
	Super(Pawn).PlayTeleportEffect(bOut, false);
}

/** TurnOff()
Freeze pawn - stop sounds, animations, physics, weapon firing
*/
simulated function TurnOff()
{
	if (Role == ROLE_Authority)
	{
		RemoteRole = ROLE_SimulatedProxy;
	}
	if (WorldInfo.NetMode != NM_DedicatedServer && Mesh != None)
	{
		Mesh.bPauseAnims = true;
		if (Physics == PHYS_RigidBody)
		{
			Mesh.PhysicsWeight = 1.0;
			Mesh.bUpdateKinematicBonesFromAnimation = false;
		}
	}
	bNoWeaponFiring = true;
	bIgnoreForces = true;
	if (Weapon != None)
	{
		Weapon.StopFire(Weapon.CurrentFireMode);
	}

	PawnAmbientSound.Stop();
	ClearTimer('FeignDeathDelayTimer');
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

simulated function class<UTFamilyInfo> GetFamilyInfo()
{
    local TrPlayerReplicationInfo PRI;
    PRI = GetTribesReplicationInfo();

    if (PRI != none && !PRI.bBot) return PRI.CharClassInfo;
    else return CurrCharClassInfo;
}

function LockedOutFromFlagPickupTimer();

function LockFromFlagPickup(optional float TimeToLock = 2.0f)
{
	SetTimer(TimeToLock, false, 'LockedOutFromFlagPickupTimer');
}

simulated function Blink(Vector Impulse, float MinZ, float PctEffectiveness)
{
	local Vector POVLoc, TransformedImpulse;
	local Rotator POVRot;

	if( Controller == none )
	{
		return;
	}

	if( Physics != PHYS_Falling && Physics != PHYS_Flying )
	{
		SetPhysics(PHYS_Falling);
	}

	Controller.GetPlayerViewPoint(POVLoc, POVRot);

	// Transform from local to world space.
	TransformedImpulse = Impulse >> POVRot;

	// Always make sure we have upward impulse.
	if( TransformedImpulse.Z <= MinZ )
	{
		TransformedImpulse.Z = MinZ;
	}

	Velocity += TransformedImpulse * PctEffectiveness;

	if( Role == ROLE_Authority )
	{
		r_nBlinked++;
	}
	PlayBlinkPackEffect();
}

simulated function PlayBlinkPackEffect()
{
	local ParticleSystemComponent E;
	local Vector StartLocation;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	class<TrPawnSoundGroup>(SoundGroupClass).Static.PlayBlinkPackSound(self);

	// Spawn the particle effect.
	StartLocation = Location;
	StartLocation.Z -= GetCollisionHeight();
	E = WorldInfo.MyEmitterPool.SpawnEmitter(ParticleSystem'FX_Packs.Jumper.P_Jump', StartLocation);
	E.SetDepthPriorityGroup(SDPG_World);
	E.SetTickGroup(TG_PostUpdateWork);
}

function bool DoJump( bool bUpdating )
{
	if (bJumpCapable && !bIsCrouched && !bWantsToCrouch && (Physics == PHYS_Walking || Physics == PHYS_Skiing))
	{
		if( Velocity.Z < JumpZ )
		{
			Velocity.Z = JumpZ;
		}
		if (Base != None && !Base.bWorldGeometry && Base.Velocity.Z > 0.f)
		{
			Velocity.Z += Base.Velocity.Z;
		}
		SetPhysics(PHYS_Falling);
		return true;
	}
	return false;
}

// Called from ::ProcessHitWall when a pawn runs into us.
event bool CheckClotheslineDamage(Pawn PawnHittingMe)
{
	local TrPawn TrPawnHittingMe;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local int DamageAmount;
	local float SpeedDiffSq, Pct;

	TrPawnHittingMe = TrPawn(PawnHittingMe);
	if( TrPawnHittingMe != none && TrPawnHittingMe.GetTeamNum() != GetTeamNum() )
	{

		// Don't take clothesline damage more than once per second.
		if( WorldInfo.TimeSeconds - TrPawnHittingMe.m_fLastTakeClotheslineDamageTimestamp < 1.0 )
		{
			return false;
		}

		TrPRI = GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none && VM.m_bClothesline )
			{
				SpeedDiffSq = VSizeSq(TrPawnHittingMe.Velocity - Velocity);
				if( SpeedDiffSq > m_fClotheslineSpeedDifferenceMin * m_fClotheslineSpeedDifferenceMin &&
					VSizeSq(TrPawnHittingMe.Velocity) > VSizeSq(Velocity) )
				{
					// Damage the pawn hitting me.
					Pct = FClamp((SpeedDiffSq - (m_fClotheslineSpeedDifferenceMin*m_fClotheslineSpeedDifferenceMin)) / ((m_fClotheslineSpeedDifferenceMax*m_fClotheslineSpeedDifferenceMax) - (m_fClotheslineSpeedDifferenceMin*m_fClotheslineSpeedDifferenceMin)), 0.0, 1.0);
					DamageAmount = (Pct * (m_fClotheslineDamageMax - m_fClotheslineDamageMin)) + m_fClotheslineDamageMin;
					TrPawnHittingMe.TakeDamage(DamageAmount, Controller, Location, vect(0,0,0), class'TrDmgType_Clothesline');
					TrPawnHittingMe.m_fLastTakeClotheslineDamageTimestamp = WorldInfo.TimeSeconds;

					if (TrPawnHittingMe.Health <= 0)
					{
						PlaySound(SoundCue'AUD_PC_BulletImpact.Vehicle_Squish.A_CUE_PC_VehicleSquish');
					}

					return true;
				}
			}
		}
	}
	return false;
}

state Dying
{
ignores PlayFootStepSound;
	// Do nothing if we are dying and taking damage.
	simulated event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
	{
	}
}

simulated function string GetSpectatorName()
{
	return (PlayerReplicationInfo != none ? PlayerReplicationInfo.PlayerName : "");
}

function CrushedBy(Pawn OtherPawn)
{
	// No more goomba kills.
}

singular event StuckOnPawn(Pawn OtherPawn)
{
	local vector MoveDir;
	local float MoveDist;

	// Move the pawns away from each other. Use the heavy collision radius plus a fudge factor to guarantee the
	// pawns get separated.
	MoveDir = vector(Rotation);
	MoveDir.Z = 0;
	MoveDir = Normal(MoveDir);
	MoveDist = class'TrFamilyInfo_Heavy'.default.m_fCollisionRadius + 2.0;

	Move(MoveDir * MoveDist);

	if( OtherPawn != none )
	{
		OtherPawn.Move(MoveDir * -1.0 * MoveDist);
	}
}

simulated function bool IsFirstPerson()
{
	local PlayerController PC;

	ForEach LocalPlayerControllers(class'PlayerController', PC)
	{
		if ( (PC.ViewTarget == self) && PC.UsingFirstPersonCamera() )
			return true;
	}
	return false;
}

/** A skin has finished loading. */
simulated function SetPending3PSkin(class<TrPlayerSkin3PData> NewPendingSkin)
{
	c_Pending3PSkin = NewPendingSkin;
	CheckApplyPending3PSkin();
}

/** If the game conditions are right, swap our current skin for the pending 3P skin. */
simulated function CheckApplyPending3PSkin()
{
    local int skinId;
	local SkeletalMesh New3PSkelMesh;
	local TrPlayerReplicationInfo TrPRI;
	local bool bSafeToApplyPendingSkin, bContinueTimer;
	local PlayerController LocalPC;
	local vector ViewLocation, ViewToPawn;
	local rotator ViewRotation;
    local class<TrSkin> skinClass;
	
    bContinueTimer = false;
	bSafeToApplyPendingSkin = true;
	TrPRI = GetTribesReplicationInfo();

	if( c_Pending3PSkin == none )
	{
		// We don't have a pending skin.
		bSafeToApplyPendingSkin = false;
	}

    if (TrPRI != none)
    {
        skinClass = TrPRI.GetCurrentSkinClass(GetCurrCharClassInfo());
    }

    if (skinClass != none)
    {
        if (TrPRI.GetTeamNum() != 255 && skinClass.default.Skins.Length > 1) skinId = skinClass.default.Skins[TrPRI.GetTeamNum()].SkinId;
        else skinId = skinClass.default.Skins[0].SkinId;
    }

	if( skinId != c_Pending3PSkin.default.m_nSkinId )
	{
		// Our pending skin doesn't match the skin we really want. Hopefully another skin
		// is being preloaded and will come in soon!
		bSafeToApplyPendingSkin = false;
	}

	if( Mesh == none )
	{
		// If we don't have a mesh then don't bother setting a skin.
		bSafeToApplyPendingSkin = false;
	}
	else
	{
		LocalPC = GetALocalPlayerController();
		if( LocalPC != none && LocalPC.Pawn != self)
		{
			LocalPC.GetPlayerViewPoint(ViewLocation, ViewRotation);
			ViewToPawn = Location - ViewLocation;
			if( (Normal(ViewToPawn) dot Vector(ViewRotation) > 0.0) && (VSizeSq(ViewToPawn) <  m_fSwapSkinDistSq) )
			{
				// Don't swap while visible to the local player.
				bSafeToApplyPendingSkin = false;
				bContinueTimer = true;
			}
		}
	}

	if( !bSafeToApplyPendingSkin )
	{
		if( bContinueTimer )
		{
			// Try again soon.
			SetTimer(0.5, false, 'CheckApplyPending3PSkin');
		}

		return;
	}

	New3PSkelMesh = c_Pending3PSkin.default.m_SkeletalMesh3p;
	if( New3PSkelMesh != none )
	{
		// Swap the fallback mesh for the preloaded one.
		Mesh.SetSkeletalMesh(New3PSkelMesh);
		
		Mesh.SetMaterial(0, Mesh.SkeletalMesh.Materials[0]);
        Mesh.CreateAndSetMaterialInstanceConstant(0);

        m_GibMesh = c_Pending3PSkin.default.m_GibMesh;

		if( OverlayMesh != none )
		{
			OverlayMesh.SetSkeletalMesh(New3PSkelMesh);
			InitializeOverlayMaterials();
		}
	}

	if( TrPRI != none )
	{
		// Keep a pointer to this content on the local copy of this pawn's PRI so that
		// his data won't be GCed.
		TrPRI.SetCached3PSkin(c_Pending3PSkin);
	}

	c_Pending3PSkin = none;
}

// Don't allow players to throw their weapon.
function ThrowActiveWeapon(optional bool bDestroyWeap);

function ThrowWeaponOnDeath()
{
	local Weapon		CurrentItem;
	local DroppedPickup Pickup;
	local rotator	    POVRot;
	local vector	    POVLoc, TossVel;
	local Vector	    X,Y,Z;

	// Limit the toss velocity.
	GetActorEyesViewPoint(POVLoc, POVRot);
	TossVel = Vector(POVRot);
	TossVel = TossVel * ((Velocity Dot TossVel) + 500) + Vect(0,0,200);
	if (VSizeSq(TossVel) > 500.0f)
	{
		TossVel = Normal(TossVel) * 500.0f;
	}

	GetAxes(Rotation, X, Y, Z);

	// Figure out what the current weapon is.
	CurrentItem = Weapon;
	if (CurrentItem == none && TrInventoryManager(InvManager) != none)
	{
		CurrentItem = TrInventoryManager(InvManager).PreviousWeapon;
	}

	// Spawn the pickup.
	Pickup = Spawn(class'TrDroppedPickup', , , Location);
	if (Pickup != none)
	{
		Pickup.SetPhysics(PHYS_Falling);
		Pickup.Velocity = TossVel;
		Pickup.Instigator = self;

		// Set the details.
		if (CurrentItem != none)
		{
			Pickup.Inventory = CurrentItem;
			Pickup.InventoryClass = CurrentItem.Class;
			Pickup.SetPickupMesh(CurrentItem.DroppedPickupMesh);
			Pickup.SetPickupParticles(CurrentItem.DroppedPickupParticles);
		}
	}
}

/*
event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
{
	local TrCaHCapturePoint CapturePoint;
	
	super.Bump(Other, OtherComp, HitNormal);

	CapturePoint = TrCaHCapturePoint(Other);
	if( CapturePoint != none )
	{
		CapturePoint.OnPawnTouched(self);
	}
}
*/

simulated function SkeletalMesh GetHandsMesh(class<TrFamilyInfo> FamilyInfo)
{
    local SkeletalMesh HandsMesh;
    local TrPlayerReplicationInfo TrPRI;

    TrPRI = GetTribesReplicationInfo();

    HandsMesh = TrPRI.GetHandsMesh();

    if (HandsMesh == none)
    {
        return FamilyInfo.default.m_FirstPersonHandsMesh;
    }

    return HandsMesh;
}

simulated function ClearSkiParticleEffects();
simulated function ClearJetpackParticleEffects();

event AlienFXOverlay(FXOverlay Type)
{
	local TrPlayerController TrPC;
	
	if (LastFXOverlay == Type)
	{
		return;
	}
	
	LastFXOverlay = Type;
	
	TrPC = TrPlayerController(Owner);
	
	if (TrPC != none && TrPC.AlienFX != none)
	{
		if (TrPC.EnableAlienFX)
		{
			TrPC.AlienFX.Overlay(Type);
		}
	}
}

defaultproperties
{
   PhysType=PhysType_AccelCap
   m_fEnableStealthVisibilityInterpSpeed=8.000000
   m_fDisableStealthVisibilityInterpSpeed=5.000000
   m_fPulseStealthVisibleTime=2.500000
   m_fPulseStealthFadeInInterpSpeed=16.000000
   m_fShieldMultiple=0.160000
   m_fHeadShotFudge=1.000000
   m_fHeadShotDamageMultiple=1.000000
   m_fMaxStoppingDistance=500.000000
   m_fMaxJetpackThrustSpeed=750.000000
   m_fAccelRateAtMaxThrustSpeed=16.000000
   m_fPreserveVelocityThresholdMax=0.600000
   m_fPreserveVelocityThresholdMin=-0.980000
   m_fPreserveVelocityZNormalThreshold=0.200000
   m_fPeakSkiControlSpeed=1400.000000
   m_fSkiControlSigmaSquare=100000.000000
   m_fMaxSkiControlPct=0.650000
   m_fSkiSlopeGravityBoost=2.000000
   m_fAirAccelCapSpeedThreshold=2000.000000
   m_fAirAccelSpeed=325.000000
   m_fSkiAccelCapSpeedThreshold=1700.000000
   m_fSkiAccelPct=0.400000
   m_AssistDamagePercentQualifier=0.250000
   m_fFallVelocityTransfer=1.000000
   m_fFriendlyShowDistanceThreshold=20000.000000
   m_fEnemyShowDistanceThreshold=10000.000000
   m_fShowObjectThreshold=7000.000000
   m_fJamEffectRadius=700.000000
   m_fMaxJetpackBoostGroundspeed=1600.000000
   m_fForwardJettingPct=0.400000
   m_fOverlayMaterialActivateSpeed=2.000000
   m_fOverlayMaterialDeactivateSpeed=24.000000
   m_fShieldPackMaterialHitRampDownSpeed=8.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyMesh
      FOV=90.000000
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Translation=(X=0.000000,Y=0.000000,Z=-52.000000)
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonBodyMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_FirstPersonBodyMesh=FirstPersonBodyMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyOverlayMesh
      bUpdateSkelWhenNotRendered=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      TickGroup=TG_PostAsyncWork
      Name="FirstPersonBodyOverlayMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_FirstPersonBodyOverlayMesh=FirstPersonBodyOverlayMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyShadowMesh
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonBodyShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_FirstPersonBodyShadowMesh=FirstPersonBodyShadowMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonWeaponShadowMesh
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      BoundsScale=5.000000
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonWeaponShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_FirstPersonWeaponShadowMesh=FirstPersonWeaponShadowMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonFlagShadowMesh
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonFlagShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_FirstPersonFlagShadowMesh=FirstPersonFlagShadowMesh
   m_fGroundSkiEffectDist=256.000000
   Begin Object Class=UTParticleSystemComponent Name=SkiDust
      bAutoActivate=False
      ReplacementPrimitive=None
      AbsoluteTranslation=True
      AbsoluteRotation=True
      Name="SkiDust"
      ObjectArchetype=UTParticleSystemComponent'UTGame.Default__UTParticleSystemComponent'
   End Object
   m_GroundSkiPSC=SkiDust
   m_fPawnViewForwardAmount=9.000000
   m_StickyGrenadeSocketList(0)=(SocketName="StickyGrenadeButt")
   m_StickyGrenadeSocketList(1)=(SocketName="StickyGrenadeHead")
   m_StickyGrenadeSocketList(2)=(SocketName="StickyGrenadeLeftThigh")
   m_StickyGrenadeSocketList(3)=(SocketName="StickyGrenadeRightThigh")
   m_StickyGrenadeSocketList(4)=(SocketName="StickyGrenadeUpperBack")
   m_StickyGrenadeSocketList(5)=(SocketName="StickyGrenadeUpperBackRight")
   m_StickyGrenadeSocketList(6)=(SocketName="StickyGrenadeUpperFront")
   m_fSplatDamageFromLandMin=50.000000
   m_fSplatDamageFromLandMax=400.000000
   m_fSplatDamageFromWallMin=50.000000
   m_fSplatDamageFromWallMax=400.000000
   m_fSplatSpeedMin=1700.000000
   m_fSplatSpeedMax=2500.000000
   m_fClotheslineDamageMin=200.000000
   m_fClotheslineDamageMax=1000.000000
   m_fClotheslineSpeedDifferenceMin=1000.000000
   m_fClotheslineSpeedDifferenceMax=3000.000000
   m_fInventoryStationLockoutTime=15.000000
   m_RotationInterpRate=15.000000
   m_PitchInterpRate=15.000000
   m_fSwapSkinDistSq=2000000.000000
   m_TerrainWalkableFloorZ=0.100000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPawn:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPawn:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   SoundGroupClass=Class'TribesGame.TrPawnSoundGroup'
   FallingDamageWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPawn:ForceFeedbackWaveformFall'
   WeaponSocket="CSO_RHand_01"
   HeadHeight=5.250000
   HeadBone="Head"
   CamOffset=(X=20.000000,Y=0.000000,Z=50.000000)
   m_ClientSideWeaponPawnClass=Class'TribesGame.TrClientSideWeaponPawn'
   bEnableFootPlacement=False
   bPostRenderOtherTeam=True
   CustomGravityScaling=0.800000
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent Archetype=UTAmbientSoundComponent'UTGame.Default__UTPawn:AmbientSoundComponent'
      Name="AmbientSoundComponent"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTPawn:AmbientSoundComponent'
   End Object
   PawnAmbientSound=AmbientSoundComponent
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent2 Archetype=UTAmbientSoundComponent'UTGame.Default__UTPawn:AmbientSoundComponent2'
      Name="AmbientSoundComponent2"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTPawn:AmbientSoundComponent2'
   End Object
   WeaponAmbientSound=AmbientSoundComponent2
   Begin Object Class=SkeletalMeshComponent Name=OverlayMeshComponent0 Archetype=SkeletalMeshComponent'UTGame.Default__UTPawn:OverlayMeshComponent0'
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
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTPawn:OverlayMeshComponent0'
   End Object
   OverlayMesh=OverlayMeshComponent0
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms Archetype=UDKSkeletalMeshComponent'UTGame.Default__UTPawn:FirstPersonArms'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceA Archetype=AnimNodeSequence'UTGame.Default__UTPawn:MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=AnimNodeSequence'UTGame.Default__UTPawn:MeshSequenceA'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms.MeshSequenceA'
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
      ObjectArchetype=UDKSkeletalMeshComponent'UTGame.Default__UTPawn:FirstPersonArms'
   End Object
   ArmsMesh(0)=FirstPersonArms
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms2 Archetype=UDKSkeletalMeshComponent'UTGame.Default__UTPawn:FirstPersonArms2'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceB Archetype=AnimNodeSequence'UTGame.Default__UTPawn:MeshSequenceB'
         Name="MeshSequenceB"
         ObjectArchetype=AnimNodeSequence'UTGame.Default__UTPawn:MeshSequenceB'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms2.MeshSequenceB'
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
      ObjectArchetype=UDKSkeletalMeshComponent'UTGame.Default__UTPawn:FirstPersonArms2'
   End Object
   ArmsMesh(1)=FirstPersonArms2
   WalkableFloorZ=0.550000
   bCanCrouch=False
   bReplicateHealthToAll=True
   bNeedsBaseTickedFirst=True
   CrouchHeight=0.000000
   CrouchRadius=0.000000
   GroundSpeed=390.000000
   AirSpeed=550.000000
   AirControl=0.200000
   Health=1200
   Begin Object Class=SkeletalMeshComponent Name=WPawnSkeletalMeshComponent Archetype=SkeletalMeshComponent'UTGame.Default__UTPawn:WPawnSkeletalMeshComponent'
      MinDistFactorForKinematicUpdate=0.200000
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      bCacheAnimSequenceNodes=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
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
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTPawn:WPawnSkeletalMeshComponent'
   End Object
   Mesh=WPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTPawn:CollisionCylinder'
      CollisionHeight=2.000000
      CollisionRadius=2.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   ViewPitchMin=-16383.000000
   ViewPitchMax=16383.000000
   InventoryManagerClass=Class'TribesGame.TrInventoryManager'
   Components(0)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'UTGame.Default__UTPawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'UTGame.Default__UTPawn:Arrow'
   End Object
   Components(1)=Arrow
   Components(2)=MyLightEnvironment
   Components(3)=WPawnSkeletalMeshComponent
   Components(4)=AmbientSoundComponent
   Components(5)=AmbientSoundComponent2
   Components(6)=SkiDust
   bPostRenderIfNotVisible=True
   CollisionComponent=CollisionCylinder
   Name="Default__TrPawn"
   ObjectArchetype=UTPawn'UTGame.Default__UTPawn'
}
