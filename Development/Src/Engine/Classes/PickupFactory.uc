//=============================================================================
// PickupFactory.
// Produces pickups when active and touched by valid toucher
// Combines functionality of old Pickup and InventorySpot classes
// Pickup class now just used for dropped/individual items
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class PickupFactory extends NavigationPoint
	abstract
	placeable
	native
	nativereplication
	ClassGroup(Pickups);

var		bool						bOnlyReplicateHidden;	// only replicate changes in bPickupHidden and bHidden
var		RepNotify bool				bPickupHidden;			// Whether the pickup mesh should be hidden
var		bool						bPredictRespawns;		// high skill bots may predict respawns for this item
var		bool						bIsSuperItem;

/** set when the respawn process has been paused because DelayRespawn() is returning true */
var bool bRespawnPaused;

var repnotify class<Inventory>				InventoryType;
var		float						RespawnEffectTime;
var		float						MaxDesireability;

var	transient PrimitiveComponent	PickupMesh;

/** when replacing a pickup factory with another (e.g. mutators), set this property on the original to point to the replacement
 * so that AI queries can be redirected to the right one
 */
var PickupFactory ReplacementFactory;
/** similarly, set this property on the replacement to point to the original so
 * that it can optimally anchor itself on the path network
 */
var PickupFactory OriginalFactory;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	// Things the server should send to the client.
	if ( bNetDirty && (Role == ROLE_Authority) )
		bPickupHidden;
	if (bNetInitial && Role == ROLE_Authority)
		InventoryType;
}

simulated event ReplicatedEvent(name VarName)
{
	if ( VarName == 'bPickupHidden' )
	{
		if ( bPickupHidden )
		{
			SetPickupHidden();
		}
		else
		{
			SetPickupVisible();
		}
	}
	else if (VarName == 'InventoryType')
	{
		InitializePickup();
	}
}

simulated event PreBeginPlay()
{
	InitializePickup();

	Super.PreBeginPlay();
}

simulated function InitializePickup()
{
	if ( InventoryType == None )
	{
		;
		return;
	}

	bPredictRespawns = InventoryType.Default.bPredictRespawns;
	MaxDesireability = InventoryType.Default.MaxDesireability;
	SetPickupMesh();
	bIsSuperItem = InventoryType.Default.bDelayedSpawn;
}

// Called after PostBeginPlay.
//
simulated event SetInitialState()
{
	bScriptInitialized = true;

	if (InventoryType == None)
	{
		;
		GotoState('Disabled');
	}
	else if (bIsSuperItem)
	{
		GotoState('WaitingForMatch');
	}
	else
	{
		Super.SetInitialState();
	}
}

simulated function ShutDown()
{
	GotoState('Disabled');
}

simulated function SetPickupMesh()
{
	if ( InventoryType.Default.PickupFactoryMesh != None )
	{
		if (PickupMesh != None)
		{
			DetachComponent(PickupMesh);
			PickupMesh = None;
		}
		PickupMesh = new(self) InventoryType.default.PickupFactoryMesh.Class(InventoryType.default.PickupFactoryMesh);

		AttachComponent(PickupMesh);

		if (bPickupHidden)
		{
			SetPickupHidden();
		}
		else
		{
			SetPickupVisible();
		}
	}
}

/* Reset()
reset actor to initial state - used when restarting level without reloading.
*/
function Reset()
{
	if ( bIsSuperItem )
		GotoState('Sleeping');
	else
		GotoState('Pickup');
	Super.Reset();
}

function bool CheckForErrors()
{
	local Actor HitActor;
	local vector HitLocation, HitNormal;

	HitActor = Trace(HitLocation, HitNormal,Location - Vect(0,0,10), Location,false);
	if ( HitActor == None )
	{
		;
		return true;
	}
	return Super.CheckForErrors();
}

//
// Set up respawn waiting if desired.
//
function SetRespawn()
{
	if( (InventoryType.Default.RespawnTime != 0) && WorldInfo.Game.ShouldRespawn(self) )
		StartSleeping();
	else
		GotoState('Disabled');
}

function StartSleeping()
{
    GotoState('Sleeping');
}

/* DetourWeight()
value of this path to take a quick detour (usually 0, used when on route to distant objective, but want to grab inventory for example)
*/
event float DetourWeight(Pawn Other, float PathWeight)
{
	// not ready to pick up
	return (ReplacementFactory != None ? ReplacementFactory.DetourWeight(Other, PathWeight) : 0.0);
}

function SpawnCopyFor( Pawn Recipient )
{
	local Inventory Inv;

	Inv = spawn(InventoryType);
	if ( Inv != None )
	{
		Inv.GiveTo(Recipient);
		Inv.AnnouncePickup(Recipient);
	}
}

function bool ReadyToPickup(float MaxWait)
{
	return false;
}

/** give pickup to player */
function GiveTo( Pawn P )
{
	SpawnCopyFor(P);
	PickedUpBy(P);
}

function PickedUpBy(Pawn P)
{
	SetRespawn();

	TriggerEventClass(class'SeqEvent_PickupStatusChange', P, 1);

	if (P.Controller != None && P.Controller.MoveTarget == self)
	{
		P.SetAnchor(self);
		P.Controller.MoveTimer = -1.0;
	}
}

//=============================================================================
// Pickup state: this inventory item is sitting on the ground.

function RecheckValidTouch();

auto state Pickup
{
	/* DetourWeight()
	value of this path to take a quick detour (usually 0, used when on route to distant objective, but want to grab inventory for example)
	*/
	event float DetourWeight(Pawn Other,float PathWeight)
	{
		return InventoryType.static.DetourWeight(Other,PathWeight);
	}

	function bool ReadyToPickup(float MaxWait)
	{
		return true;
	}

	/*
	 Validate touch (if valid return true to let other pick me up and trigger event).
	*/
	function bool ValidTouch( Pawn Other )
	{
		// make sure its a live player
		if (Other == None || !Other.bCanPickupInventory)
		{
			return false;
		}
		else if (Other.Controller == None)
		{
			// re-check later in case this Pawn is in the middle of spawning, exiting a vehicle, etc
			// and will have a Controller shortly
			SetTimer( 0.2, false, nameof(RecheckValidTouch) );
			return false;
		}
		// make sure not touching through wall
		else if ( !FastTrace(Other.Location, Location) )
		{
			SetTimer( 0.5, false, nameof(RecheckValidTouch) );
			return false;
		}

		// make sure game will let player pick me up
		if (WorldInfo.Game.PickupQuery(Other, InventoryType, self))
		{
			return true;
		}
		return false;
	}

	/**
	Pickup was touched through a wall.  Check to see if touching pawn is no longer obstructed
	*/
	function RecheckValidTouch()
	{
		CheckTouching();
	}

	// When touched by an actor.
	event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
	{
		local Pawn P;

		// If touched by a player pawn, let him pick this up.
		P = Pawn(Other);

		if( P != None && ValidTouch(P) )
		{
			GiveTo(P);
 		}
	}

	// Make sure no pawn already touching (while touch was disabled in sleep).
	function CheckTouching()
	{
		local Pawn P;

		ForEach TouchingActors(class'Pawn', P)
			Touch(P, None, Location, Normal(Location-P.Location) );
	}

	event BeginState(name PreviousStateName)
	{
		TriggerEventClass(class'SeqEvent_PickupStatusChange', None, 0);
	}

Begin:
	CheckTouching();
}

//=============================================================================
// Sleeping state: Sitting hidden waiting to respawn.
function float GetRespawnTime()
{
	return InventoryType.Default.RespawnTime;
}

function RespawnEffect();

/** 
  * Make pickup mesh and associated effects hidden.
  */
simulated function SetPickupHidden()
{
	bForceNetUpdate = TRUE;
	bPickupHidden = true;
	if ( PickupMesh != None )
		PickupMesh.SetHidden(true);
}

/** 
  * Make pickup mesh and associated effects visible.
  */
simulated function SetPickupVisible()
{
	bForceNetUpdate = TRUE;
	bPickupHidden = false;
	if ( PickupMesh != None )
		PickupMesh.SetHidden(false);
}

event Destroyed()
{
	// remove from any replacement chain
	if (OriginalFactory != None)
	{
		OriginalFactory.ReplacementFactory = ReplacementFactory;
	}
	if (ReplacementFactory != None)
	{
		ReplacementFactory.OriginalFactory = OriginalFactory;
	}
}

State WaitingForMatch
{
	ignores Touch;

	function MatchStarting()
	{
		GotoState('Sleeping');
	}

	event BeginState(Name PreviousStateName)
	{
		SetPickupHidden();
	}
}

/** @return whether the respawning process for this pickup is currently halted */
function bool DelayRespawn()
{
	return false;
}

State Sleeping
{
	ignores Touch;

	function bool ReadyToPickup(float MaxWait)
	{
		return (bPredictRespawns && !bRespawnPaused && LatentFloat <= MaxWait && LatentFloat > 0.0);
	}

	function StartSleeping() {}

	event BeginState(Name PreviousStateName)
	{
		SetPickupHidden();
	}

	event EndState(Name NextStateName)
	{
		SetPickupVisible();
	}

Begin:
	bRespawnPaused = true;
	while (DelayRespawn())
	{
		Sleep(1.0);
	}
	bRespawnPaused = false;
	Sleep( GetReSpawnTime() - RespawnEffectTime );
Respawn:
	RespawnEffect();
	Sleep(RespawnEffectTime);
	GotoState('Pickup');
}

State Disabled
{
	function bool ReadyToPickup(float MaxWait)
	{
		return false;
	}

	function Reset() {}
	function StartSleeping() {}

	simulated event SetInitialState()
	{
		bScriptInitialized = true;
	}

	simulated event BeginState(Name PreviousStateName)
	{
		SetPickupHidden();
		SetCollision(false,false);
	}

	simulated event EndState(Name NextStateName)
	{
		SetPickupVisible();
	}
}

cpptext
{
	virtual APickupFactory* GetAPickupFactory() { return this; }
	INT* GetOptimizedRepList( BYTE* InDefault, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );
	virtual UBOOL ReachedBy(APawn* P, const FVector& TestPosition, const FVector& Dest);
	virtual ANavigationPoint* SpecifyEndAnchor(APawn* RouteFinder);

}


defaultproperties
{
   bOnlyReplicateHidden=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.S_NavP'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
   End Object
   Components(4)=PathRenderer
   RemoteRole=ROLE_SimulatedProxy
   TickGroup=TG_DuringAsyncWork
   bStatic=False
   bIgnoreEncroachers=True
   bAlwaysRelevant=True
   bCollideWhenPlacing=False
   bCollideActors=True
   NetUpdateFrequency=1.000000
   CollisionComponent=CollisionCylinder
   SupportedEvents(4)=Class'Engine.SeqEvent_PickupStatusChange'
   Name="Default__PickupFactory"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
