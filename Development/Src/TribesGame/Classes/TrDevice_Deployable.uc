/**
 * 
 */
class TrDevice_Deployable extends TrDevice
    native;

const DEPLOYMODE_GROUND_DELTA_CHECK_DIST = 60.0f;
const DEPLOYMODE_MINIMUM_RADIUS_CHECK_DIST = 30.0f;

// Data used for deploy mode, not in DeviceAttachment since only netowner who owns device will see it
var() editinline TrDeployableHologram      c_DeployableHologram;
var() class<TrDeployableHologram>   c_DeployableHologramClass;

var	int	m_nPerPlayerMaxDeployed;		// how many of these are allowed to be deployed at once?

var float	m_fPlacementScale; // Used to determine how far to push out from the player before using extents.
var vector	m_vPlacementExtent; // Used to determine the extent bounds for placement.
var vector  m_vDeployVolumePlacementExtent; // Used to determine the extent bounds for placement against deploy volumes.

/** This deployable cannot deploy if it is within this radius of another deployable of the same type. */
var float m_fOtherDeployableProximityCheck;

/** Amount of space in Z required for this deployable to deploy (used for checking if we're 'outside') */
var float m_fOutsideCheckDistance;

/** Should the deployable ignore collision for placement */
var bool m_bIgnoreCollisionForPlacement;

/** The location the client desires to spawn the deployable at */
var vector m_vDesiredPlacementLocation;
var rotator m_rDesiredPlacementRotation;

native function                 UpdateDeployModeStatus();
native function                 TickInHandWeapon(float DeltaSeconds);
native function TrDeployable    Deploy();
native function bool            IsValidDeployTerrain(out vector OutLocation, out Rotator OutRotation, optional bool VerificationCheck); // Returns TRUE if the deployable can be currently placed.
native function bool            IsValidDeployVolume(out vector OutLocation, out Rotator OutRotation, optional bool VerificationCheck);  // Returns TRUE if the deployable can be currently placed.
native function bool            IsValidDeployProximity(Vector DeployLocation, optional bool VerificationCheck); // Returns TRUE if the deployable can be currently placed.
native function bool            IsValidOutsideCheck(Vector DeployLocation, optional bool VerificationCheck); // Returns TRUE if the deployable can be currently placed.

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event ReplicatedEvent(name VarName)
{   
    if(VarName == 'r_AmmoCount')
    {
        AmmoCount = r_AmmoCount.CarriedAmmoCount;
		if (!HasAmmo(0))
		{
			ResumeInhandWeapon();
		}
        return;
    }

	super.ReplicatedEvent(VarName);
}

function UpdateReplicatedCarriedAmmo()
{
    if (Role==ROLE_Authority)
    {
        r_AmmoCount.CarriedAmmoCount = AmmoCount;
        bNetDirty = true;
    }
}

simulated function OnSwitchToWeapon()
{
	EnterDeployMode();
}

simulated function OnSwitchAwayFromWeapon()
{
	ExitDeployMode();
}

simulated function CheckInHandWeapon()
{
}

simulated event Destroyed()
{
	ExitDeployMode();

	super.Destroyed();
}

simulated function HolderEnteredVehicle()
{
	ResumeInhandWeapon();
}

simulated function ResumeInhandWeapon()
{
    local TrInventoryManager invMan;

    ExitDeployMode();
    //swap back to previous inhand
    invMan = TrInventoryManager(Instigator.InvManager);
    if (invMan != none)
    {
		invman.SwitchToPreviousWeapon();
    }
}

simulated function bool TryPutDown()
{
    local TrInventoryManager invMan;

	// Exit deploy mode and instantly change weapons.
    invMan = TrInventoryManager(Instigator.InvManager);
    if (invMan != none)
    {
		ExitDeployMode();
		bWeaponPutDown = true;
		invMan.ChangedWeapon();

		return true;
    }

	return false;
}

simulated function int GetMaxDeployedLimit()
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	if( Instigator != none )
	{
		TrPRI = TrPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				return default.m_nPerPlayerMaxDeployed + VM.m_nExtraDeployablesOutBuff;
			}
		}
	}

	return default.m_nPerPlayerMaxDeployed;
}

simulated event bool IsDeployableOldest(TrDeployable OtherDep)
{
	local TrDeployable CurrDep, OldestDep;
	local int deployedCount;

	// Loop through all deployables.
	foreach DynamicActors(class'TrDeployable', CurrDep)
	{
		// Are they owned by us, alive, and of the type we are looking for?
		if (CurrDep.r_OwnerPRI == Instigator.PlayerReplicationInfo && 
			!CurrDep.r_bInDestroyedState && 
			InStr(string(CurrDep), string(m_WeaponDeployables[0])) == 0)
		{
			// Look for the oldest deployable.
			if (OldestDep == none || CurrDep.CreationTime < OldestDep.CreationTime)
				OldestDep = CurrDep;

			deployedCount++;
		}
	}

	// If we are over our limit and this is the oldest, return true.
	if (deployedCount >= GetMaxDeployedLimit() && OtherDep == OldestDep)
	{
		return true;
	}

	return false;
}

simulated function bool BelowMaxCountLimit(bool bDestroyOldest)
{
	local TrDeployable dep;
	local int deployedCount, ableToDeployCount, MaxDeployedLimit;
	local TrDeployable firstFound;
	local TrGameReplicationInfo GRI;
	//local TrPlayerController TrPC;

	deployedCount=0;

    GRI = TrGameReplicationInfo(WorldInfo.GRI);
    if(GRI!=None)
    {
		foreach GRI.m_Deployables(dep)
		{
			if (dep.m_Controller==Instigator.Controller && !dep.r_bInDestroyedState && 
				InStr(string(dep),string(m_WeaponDeployables[0]))==0)
			{
				if (firstFound == none || dep.CreationTime < firstFound.CreationTime)
					firstFound = dep;

				deployedCount++;
			}
		}
    }

	MaxDeployedLimit = GetMaxDeployedLimit();
	ableToDeployCount = MaxDeployedLimit;
    
	if (deployedCount>=ableToDeployCount && bDestroyOldest)
	{
		firstFound.r_Health=0;
		firstFound.OnHealthChanged(true);
		return true;
	}

	return (deployedCount<MaxDeployedLimit);
}

// Don't do anything here, ServerRequestDeploy handles ammo consumption.
simulated function ConsumeAmmo(byte FireModeNum);

function int AddCarriedAmmo(int Amount)
{
	return AddAmmo(Amount);
}

simulated function int AddAmmo( int Amount )
{
	if( Role == ROLE_Authority )
	{
		AmmoCount = Clamp(AmmoCount + Amount,0,MaxAmmoCount);
		UpdateReplicatedCarriedAmmo();
	}
	return AmmoCount;
}

///////////////////DeployMode/////////////////////
simulated event bool CanAttemptDeploy()
{
	return HasAmmo(0);
}

simulated event EnterDeployMode()
{
    local TrPawn p;

    // turn on FX
    if (CanAttemptDeploy())
    {
        p = TrPawn(Instigator);
        if (p != None)
        {
            p.r_bInDeployMode = true;
            p.bInDeployModeClient = true;
        }

        if( WorldInfo.NetMode == NM_DedicatedServer ) return;
        EnterDeployModeDisplay();
        UpdateDeployModeStatus();
    }
}

simulated event ExitDeployMode()
{
    local TrPawn p;

    p = TrPawn(Instigator);
    if (p != None)
    {
		p.ExitDeployMode();
    }

    if( WorldInfo.NetMode == NM_DedicatedServer ) return;

    // turn off FX
 
    ExitDeployModeDisplay();
}

simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
	super.AttachWeaponTo(MeshCpnt, SocketName);

	bPendingShow = false;
}

simulated function EndZoom(UTPlayerController PC, optional bool bReturningTo3P)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(PC);

	// Calling this on the server was causing the offhand weapons to become invisible on clients.
	// It may be because bHidden is replicated and was being incorrectly set and sent to client (BZ: 8701)
	if( TrPC != none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		ChangeVisibility(false);

		if( TrPC.m_ZoomedEffect != none )
		{
			TrPC.m_ZoomedEffect.bShowInGame = false;
		}
	}
}

simulated function ChangeVisibility(bool bIsVisible)
{
	super.ChangeVisibility(false);
}

simulated event EnterDeployModeDisplay()
{
    if (Instigator == None || WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }

    // spawn the actor to attach to if needed
    if ( c_DeployableHologram == none )
    {
        c_DeployableHologram = Instigator.Spawn(c_DeployableHologramClass, Instigator,, Instigator.Location, , , true);
		if( c_DeployableHologram != none )
		{
			c_DeployableHologram.Init(m_WeaponDeployables[0]);
		}
    }

	ChangeVisibility(false);
}


simulated event ExitDeployModeDisplay()
{
	local TrDeployable CurrDeployable;

    if ( c_DeployableHologram != none )
    {
		// despawn the "pre-deploy" fx, and destroy it and the indicator mesh    
    	c_DeployableHologram.Destroy();
        c_DeployableHologram = None;
	}

	// End the x-ray effect on all deployables.
	foreach DynamicActors(class'TrDeployable', CurrDeployable)
	{
		CurrDeployable.m_bIsXRay = false;
	}    
}

simulated state WeaponFiring
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
	
		// Immediately go out of firing state.
		HandleFinishedFiring();
	}

	simulated function RefireCheckTimer();
}

simulated function StartFire(byte FireModeNum)
{
	// Even our client says the desired deploy location is invalid.
	if (WorldInfo.NetMode != NM_DedicatedServer && !IsValidDesiredDeploy(m_vDesiredPlacementLocation, m_rDesiredPlacementRotation))
	{
		return;
	}

	// Prevent them from losing weapons.
	if (!HasAmmo(0))
	{
		ResumeInhandWeapon();
		return;
	}

	super.StartFire(FireModeNum);
}

simulated function bool IsValidDesiredDeploy(vector DesiredPlacement, rotator DesiredRotation)
{
	// Is this a valid deployable location?
	if (IsZero(DesiredPlacement) && DesiredRotation.Pitch == 0 && DesiredRotation.Roll == 0 && DesiredRotation.Yaw == 0)
	{
		return false;
	}

	// Are we close enough to the user's location (10ft)?
	if (VSizeSq(DesiredPlacement - Instigator.Location) > 25600)
	{
		return false;
	}

	return true;
}

reliable server function ServerRequestDeploy(vector DesiredPlacement, rotator DesiredRotation)
{
	local bool bCanDeploy;
	local TrDeployable dep;

	// Make sure we have ammo.
	if (!HasAmmo(0))
		return;

	// Do we have a valid desired deploy location?
	bCanDeploy = IsValidDesiredDeploy(DesiredPlacement, DesiredRotation);

	// Save where we want the placement to be.
	m_vDesiredPlacementLocation = DesiredPlacement;
	m_rDesiredPlacementRotation = DesiredRotation;

	// Attempt deploy.
	if (bCanDeploy)
	{
		dep = Deploy();
	}

	if( dep != None )
	{
		// Consume ammo.
		AddAmmo(-ShotCost[CurrentFireMode]);

		// cull existing deployables to the max count allowed
		BelowMaxCountLimit(true);

		// Link the deployable and its controller back to the instigator
		dep.SetInstigatorController(TrPlayerController(Instigator.Controller));

		TrGameReplicationInfo(WorldInfo.GRI).m_Deployables.AddItem(dep);

        ResumeInHandWeapon();

		// We successfully deployed, so call super (for energy costs, etc).
		super.CustomFire();
	}
	else
	{
		// Deploy failed.
		r_bReadyToFire = true;
	}
}
	
/** Deployables deploy when fired.*/
simulated function CustomFire()
{
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		ServerRequestDeploy(m_vDesiredPlacementLocation, m_rDesiredPlacementRotation);
	}
}

/* don't allow melee while deployable is equipped */
simulated function bool CanAutoDeviceFireNow()
{
	return false;
}

simulated function int GetAmmoCount()
{
	return AmmoCount;
}

simulated function bool HasAnyAmmo()
{
	return AmmoCount > 0;
}

simulated function bool HasAmmo( byte FireModeNum, optional int Amount )
{
	if (Amount==0)
		return (AmmoCount >= ShotCost[FireModeNum]);
	else
		return ( AmmoCount >= Amount );
}

defaultproperties
{
   m_nPerPlayerMaxDeployed=1
   m_fPlacementScale=2.400000
   m_vPlacementExtent=(X=30.000000,Y=30.000000,Z=40.000000)
   m_vDeployVolumePlacementExtent=(X=30.000000,Y=30.000000,Z=40.000000)
   m_fOtherDeployableProximityCheck=1600.000000
   m_bIgnoreCollisionForPlacement=True
   m_eAttackType(0)=TRTT_ATTACK_DEPLOYABLE
   m_eAttackType(1)=()
   m_bUsesDeployMode=True
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Deployable:FireCameraShake'
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=None
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=()
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
   Name="Default__TrDevice_Deployable"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
