class TrVehicleStation extends TrStation
	Config(Game);

struct native VehicleSpawnInfo
{
    /** Vehicle class. */
    var     class<TrVehicle>    m_VehicleClass;
    
    /** Max number of vehicles of this type that are allowed to be out in the map. */
    var()   int                 m_nMaxCount;
    
    /** Offset for spawn location. */
    var()   vector              m_vSpawnLocOffset;

    /** Offset for spawn rotation. */
    var()   rotator             m_rSpawnRotOffset;
};

/** List of vehicles this station can spawn */
var() VehicleSpawnInfo m_SpawnList[EVehicleTypes.VEHICLE_MAX];

/** Vehicles will spawn at this actor's location and at this actor's rotation. */
var() TrVehiclePad m_VehiclePad;

/** 
 * Bit packed list of which vehicles are currently spawned. 
 * Pack as VVVVHHHHBBBBSSSSGGGG
 * V=Havoc, H=HERC, B=Beowulf, S=Shrike, G=Gravcycle
 */
var transient private int r_nSpawnedVehicles;

const SPAWNED_VEHICLE_LIST_MASK = 0xF;

/** Is the station locked? */
var transient bool r_bIsLocked;

/** Spawn sequence started */
var repnotify transient bool r_bSpawnSequenceStarted;

/** Spawn sequence ended */
var repnotify transient byte r_nSpawnSequenceEnded;

/** Amount of time before factory can spawn a new vehicle. */
var() float m_fPostSpawnLockoutTime;

/** Timestamp when the last spawn occured. */
var float m_fSpawnTimeStamp;

/** The last vehicle spawned. */
var transient TrVehicle m_LastSpawnedVehicle;

/** The type of vehicle requested to spawn. */
var transient EVehicleTypes m_LastRequestedVehicleType;

var transient TrPawn m_PawnRequestingVehicle;

/** Amount of time before instigator is placed in driver's seat. */
var() float m_fInstigatorTeleportTime;

/** Amount of time after the vehicle pad has begun to spin up to spawn the vehicle. */
var() float m_fTimeToSpawnVehicleAfterRequest;

var TrAnimNodeBlendList m_VehicleStationBlendNode;

replication
{
	if (bNetDirty && Role == ROLE_Authority)
        r_nSpawnedVehicles, r_bIsLocked, r_bSpawnSequenceStarted, r_nSpawnSequenceEnded;
}

simulated event ReplicatedEvent(name VarName)
{
    if( VarName == 'r_bSpawnSequenceStarted' )
    {
        if( r_bSpawnSequenceStarted && WorldInfo.NetMode != NM_DedicatedServer )
        {
            PlayVehiclePadDeployAnim();
            PlayRetractAnim();
        }
    }
	if( VarName == 'r_nSpawnSequenceEnded' )
    {
		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			PlayVehiclePadCollapseAnim();
		}
    }
    Super.ReplicatedEvent(VarName);
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == m_Mesh && m_Mesh.Animations != none )
    {
		m_VehicleStationBlendNode = TrAnimNodeBlendList(m_Mesh.Animations.FindAnimNode('VehicleStationBlendNode'));
    }
}

function PawnEnteredStation(TrPawn P)
{
	local Vector Loc;
	local TrPlayerController C;

    // Don't allow for a new pawn to start the process of getting a vehicle if the station is locked.
    if( !r_bIsLocked )
    {
        Super.PawnEnteredStation(P);

        // Lock the station so that nobody can spawn a new vehicle until the current one is out of the way.
        r_bIsLocked = true;
        m_PawnRequestingVehicle = r_CurrentPawn;

		if( r_CurrentPawn != None )
		{
			// Make sure pawn is standing directly inside the station.
			Loc = Location;
			Loc.Z = r_CurrentPawn.Location.Z;
			r_CurrentPawn.SetBase(self);
			r_CurrentPawn.SetSkiing(false);
			r_CurrentPawn.SetLocation(Loc);
			r_CurrentPawn.Move(vect(0.0, 0.0, -100.0));
			r_CurrentPawn.Velocity = vect(0,0,0);
			r_CurrentPawn.Acceleration = vect(0,0,0);
			r_CurrentPawn.SetPhysics(PHYS_NONE);

			C = TrPlayerController(r_CurrentPawn.Controller);
			if( C != None )
			{
				if (C.Stats != none)
				{
					C.Stats.InvStationVisited(C);
				}

				C.IgnoreMoveInput(true);
				C.ClientIgnoreMoveInput(true);
				C.SetTimer(1.0, false, 'RestoreMoveInput');
			}
		}
    }
}

function PawnLeftStation(TrPawn P)
{
    Super.PawnLeftStation(P);

    // If pawn did not start a spawn sequence and left, unlock the station.
    if( !r_bSpawnSequenceStarted )
    {
        r_bIsLocked = false;
    }
}

simulated function PlayStationEnteredEffects()
{
	local TrPlayerController C;

    // Play animation for bringing up the vehicle selection list.
	m_VehicleStationBlendNode.SetActiveChild(1, 0.f);

    // Bring up the vehicle list
    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
		if( r_CurrentPawn != none )
		{
			C = TrPlayerController(r_CurrentPawn.Controller);

			r_CurrentPawn.SetBase(self);
			r_CurrentPawn.SetSkiing(false);
			r_CurrentPawn.Velocity = vect(0,0,0);
			r_CurrentPawn.Acceleration = vect(0,0,0);
			r_CurrentPawn.SetPhysics(PHYS_NONE);

			if( C != None )
			{
				C.OpenVehicleMenu(self);
				C.ClientIgnoreMoveInput(true);
				C.SetTimer(1.0, false, 'ClientRestoreMoveInput');
			}
		}
    }

	m_PawnRequestingVehicle = r_CurrentPawn;
}

simulated function PlayStationLeftEffects()
{
    if( !r_bSpawnSequenceStarted )
    {
        PlayRetractAnim();
    }

	if (!r_bSpawnSequenceStarted)
		m_PawnRequestingVehicle = none;
}

simulated function PlayRetractAnim()
{
	m_VehicleStationBlendNode.SetActiveChild(2, 0.f);
}

simulated function PlayVehiclePadDeployAnim()
{
	if( m_VehiclePad != none )
	{
		m_VehiclePad.PlayDeployAnim();
	}
}

simulated function PlayVehiclePadCollapseAnim()
{
	if( m_VehiclePad != none )
	{
		m_VehiclePad.PlayCollapseAnim();
	}
}

/** Controller requests a vehicle. Sets the spawning in motion. */
function bool RequestSpawnVehicle(EVehicleTypes VehicleType)
{
	local TrPlayerController TrPC;

    if( AbleToSpawnVehicleType(VehicleType) && r_bIsPowered )
    {
        // Cache the vehicle type to spawn (since we cannot send parameters through timers).
        m_LastRequestedVehicleType = VehicleType;
        SetTimer(m_fTimeToSpawnVehicleAfterRequest, false, 'SpawnVehicle');

		// Go invulnerable for the spawn and teleport time.
		m_PawnRequestingVehicle.GoInvulnerable(m_fTimeToSpawnVehicleAfterRequest + m_fInstigatorTeleportTime);

        // Let clients know that a spawn sequence has begun.
        r_bSpawnSequenceStarted = true;

		// Don't let them use a inventory station for a bit.
		m_PawnRequestingVehicle.m_fLastInventoryStationVisitTime = WorldInfo.TimeSeconds;

        PlayVehiclePadDeployAnim();
        PlayRetractAnim();

		TrPC = TrPlayerController(m_PawnRequestingVehicle.Controller);
		if (TrPC != none)
		{
			TrPC.ReceiveLocalizedMessage(class'TrPromptMessage', 5, m_PawnRequestingVehicle.PlayerReplicationInfo, none, self);
		}

		/*if (VehicleType==VEHICLE_HERC)
		{
			if (m_PawnRequestingVehicle.GetTeamNum()==0)
				BroadcastLocalizedMessage(class'TrMiscellaneousMessage',TrMISC_BloodEagleBoughtHerc,none,none);
			else
				BroadcastLocalizedMessage(class'TrMiscellaneousMessage',TrMISC_DiamondSwordBoughtHerc,none,none);
		}*/

		return true;
    }
	return false;
}

function SpawnVehicle()
{
    local TrVehicle SpawnedVehicle;
    local EVehicleTypes VehicleType;

    // Reset the last requested vehicle type.
    VehicleType = m_LastRequestedVehicleType;

    if( AbleToSpawnVehicleType(VehicleType) )
    {
        // Spawn the vehicle.
        SpawnedVehicle = Spawn( m_SpawnList[VehicleType].m_VehicleClass, // Class
                                self,, // Owner
                                m_VehiclePad.Location + m_SpawnList[VehicleType].m_vSpawnLocOffset, // Location
                                m_VehiclePad.Rotation + m_SpawnList[VehicleType].m_rSpawnRotOffset );

        if( SpawnedVehicle != None )
        {
            // The spawn was successful.
            AddVehicleToPackedList(VehicleType, 1);
            m_LastSpawnedVehicle = SpawnedVehicle;
            SpawnedVehicle.SetTeamNum(DefenderTeamIndex);
            SpawnedVehicle.SetPostSpawnLocked(true);
            SpawnedVehicle.SetPawnToTeleport(m_PawnRequestingVehicle);
            SpawnedVehicle.m_OwnerStation = self;

			// Set the timer to teleport the spawner, and add a second to vehicle invulnerability.
            SetTimer(m_fInstigatorTeleportTime, false, 'TeleportDriverToVehicle');
			SpawnedVehicle.GoInvulnerable(m_fInstigatorTeleportTime + 1.0f);

            // Unlock the station after m_fPostSpawnLockoutTime has passed.
            SetTimer(m_fPostSpawnLockoutTime, false, 'Unlock');
        }
    }
    else
    {
        ;
    }
}

/** Teleports the pawn at the station to the vehicle. */
function TeleportDriverToVehicle()
{
    m_LastSpawnedVehicle.TeleportDriverToSeat();

	r_nSpawnSequenceEnded++;
	PlayVehiclePadCollapseAnim();
}

/** Unlocks the station. */
function Unlock()
{
	m_PawnRequestingVehicle = none;
    r_bIsLocked = false;
    r_bSpawnSequenceStarted = false;
}

/** Returns TRUE if a certain vehicle type is allowed to spawn. */
function bool AbleToSpawnVehicleType(EVehicleTypes VehicleType)
{
    return GetNumVehiclesSpawnedByType(VehicleType) < GetMaxVehicleCountAllowed(VehicleType) && m_VehiclePad != none;
}

simulated function int GetMaxVehicleCountAllowed(EVehicleTypes VehicleType)
{
	local int MaxCount;
	local TrGameReplicationInfo TrGRI;

	MaxCount = m_SpawnList[VehicleType].m_nMaxCount;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
		MaxCount = TrGRI.r_ServerConfig.GetVehicleLimit(VehicleType);
	}

	return MaxCount;
}

/** Returns the amount of vehicles of a type that are currently out in the world. */
simulated function int GetNumVehiclesSpawnedByType(EVehicleTypes VehicleType)
{
    return (r_nSpawnedVehicles >> (4*INT(VehicleType))) & SPAWNED_VEHICLE_LIST_MASK;
}

function AddVehicleToPackedList(EVehicleTypes VehicleType, int Num)
{
    local int NewNumVehicles, ShiftAmount;
    
    ShiftAmount = 4*INT(VehicleType);

    NewNumVehicles = GetNumVehiclesSpawnedByType(VehicleType) + Num; // Add to our counter.
    NewNumVehicles = NewNumVehicles & SPAWNED_VEHICLE_LIST_MASK; // Make sure we don't go above the limit of the mask.
    NewNumVehicles = NewNumVehicles << ShiftAmount; // Isolated number ready for applying to the spawned vehicles list.
    r_nSpawnedVehicles = ~(SPAWNED_VEHICLE_LIST_MASK << ShiftAmount) & r_nSpawnedVehicles; // Zero out the section for this vehicle type.
    r_nSpawnedVehicles = r_nSpawnedVehicles | NewNumVehicles; // Add the new number back in.
}

simulated function Texture2D GetMarker()
{
	if (r_bIsPowered)
		return class'TrHUD'.default.BaseVehicleStation;
	else
		return class'TrHUD'.default.BaseNoPower;
}

simulated function bool ShouldPostRenderForCaH()
{
	return true;
}

defaultproperties
{
   m_SpawnList(0)=(m_VehicleClass=Class'TribesGame.TrVehicle_GravCycle',m_vSpawnLocOffset=(X=0.000000,Y=0.000000,Z=20.000000))
   m_SpawnList(1)=(m_VehicleClass=Class'TribesGame.TrVehicle_Shrike',m_vSpawnLocOffset=(X=0.000000,Y=0.000000,Z=800.000000))
   m_SpawnList(2)=(m_VehicleClass=Class'TribesGame.TrVehicle_Beowulf',m_vSpawnLocOffset=(X=0.000000,Y=0.000000,Z=80.000000))
   m_SpawnList(3)=(m_VehicleClass=Class'TribesGame.TrVehicle_HERC',m_vSpawnLocOffset=(X=0.000000,Y=0.000000,Z=80.000000))
   m_SpawnList(4)=(m_VehicleClass=Class'TribesGame.TrVehicle_Havoc',m_vSpawnLocOffset=(X=0.000000,Y=0.000000,Z=800.000000))
   m_fPostSpawnLockoutTime=5.000000
   m_fInstigatorTeleportTime=1.250000
   m_fTimeToSpawnVehicleAfterRequest=2.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrStation:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrStation:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ObjectiveMesh'
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicleStation:MyLightEnvironment'
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_sScreenName="Vehicle Station"
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrStation:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrStation:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrStation:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrStation:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrStation:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrStation:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrStation:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrStation:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrStation:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrStation:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrStation:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrStation:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=CollisionMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrStation:CollisionMesh'
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenGame=True
      HiddenEditor=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="CollisionMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrStation:CollisionMesh'
   End Object
   Components(5)=CollisionMesh
   Components(6)=ShieldMesh
   Components(7)=OnlineSound
   Components(8)=CriticalSound
   Components(9)=ShieldHitSound
   Components(10)=PowerDownSound
   Components(11)=DestroyedSound
   bPostRenderIfNotVisible=True
   s_bThrottleNetRelevancy=True
   CollisionComponent=CollisionMesh
   Name="Default__TrVehicleStation"
   ObjectArchetype=TrStation'TribesGame.Default__TrStation'
}
