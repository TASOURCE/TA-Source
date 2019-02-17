/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


/** used to mark a door; handles the usability of paths through it and any special actions needed to open it */
class DoorMarker extends NavigationPoint
	placeable
	native;

/** the door mover associated with this marker */
var() InterpActor MyDoor;
/** how do we open this door? */
var() enum EDoorType
{
	DOOR_Shoot,
	DOOR_Touch,
} DoorType;
/** trigger for the door; if specified, the opening action will be done to the trigger instead of the door */
var() Actor DoorTrigger;
/** if true, AI should wait until the door has completely finished opening before trying to move through */
var() bool bWaitUntilCompletelyOpened;
/** if true, means that the initial position of the mover blocks navigation */
var() bool bInitiallyClosed;
/** if true, don't even try to go through this path if door is closed */
var() bool bBlockedWhenClosed;

/** whether or not the door is currently open */
var bool bDoorOpen;

/** internal - used in path building */
var const transient bool bTempDisabledCollision;

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

event PostBeginPlay()
{
	bBlocked = (bInitiallyClosed && bBlockedWhenClosed);
	bDoorOpen = !bInitiallyClosed;

	Super.PostBeginPlay();
}

function MoverOpened()
{
	bBlocked = (!bInitiallyClosed && bBlockedWhenClosed);
	bDoorOpen = bInitiallyClosed;
	WorldInfo.Game.NotifyNavigationChanged(self);
}

function MoverClosed()
{
	bBlocked = (bInitiallyClosed && bBlockedWhenClosed);
	bDoorOpen = !bInitiallyClosed;
	WorldInfo.Game.NotifyNavigationChanged(self);
}

event Actor SpecialHandling(Pawn Other)
{
	local Actor TouchActor;

	if (bDoorOpen || MyDoor == None || bInitiallyClosed == (bDoorOpen || VSizeSq(MyDoor.Velocity) > 1.f))
	{
		return self;
	}
	else if (DoorType == DOOR_Touch)
	{
		if (DoorTrigger == None)
		{
			return MyDoor;
		}
		else
		{
			TouchActor = DoorTrigger.SpecialHandling(Other);
			if (TouchActor == None)
			{
				TouchActor = DoorTrigger;
			}
			return TouchActor;
		}
	}
	else
	{
		return self;
	}
}

function bool ProceedWithMove(Pawn Other)
{
	if (DoorType == DOOR_Shoot && Other.Controller.Focus == MyDoor)
	{
		Other.Controller.StopFiring();
	}

	if (bDoorOpen || DoorType != DOOR_Shoot)
	{
		return true;
	}

	// door still needs to be shot
	Other.Controller.Focus = (DoorTrigger != None) ? DoorTrigger : MyDoor;
	if (!Other.Controller.FireWeaponAt(Other.Controller.Focus))
	{
		// failed to fire at mover, try again later
		Other.Controller.MoveTimer = 0.25f;
	}
	else if (bWaitUntilCompletelyOpened)
	{
		Other.Controller.WaitForMover(MyDoor);
	}

	return false;
}

/** tell Other what to do to open the door
 * @param Other the Controller to tell what to do
 * @return true if Other needs to wait for the door, false if it doesn't need to do anything further
 */
event bool SuggestMovePreparation(Pawn Other)
{
	if (bDoorOpen || MyDoor == None)
	{
		return false;
	}
	else if (VSizeSq(MyDoor.Velocity) > 1.f)
	{
		Other.Controller.WaitForMover(MyDoor);
		return true;
	}
	else if (DoorType == DOOR_Shoot)
	{
		Other.Controller.Focus = (DoorTrigger != None) ? DoorTrigger : MyDoor;
		if (!Other.Controller.FireWeaponAt(Other.Controller.Focus))
		{
			// failed to fire at mover, try again later
			Other.Controller.MoveTimer = 0.25f;
			Other.Controller.bPreparingMove = true;
			return true;
		}
		else if (bWaitUntilCompletelyOpened)
		{
			Other.Controller.WaitForMover(MyDoor);
			Other.Controller.bPreparingMove = true;
			return true;
		}
		else
		{
			return false;
		}
	}
	else if (DoorType == DOOR_Touch && DoorTrigger != None && Other.Controller.ActorReachable(DoorTrigger))
	{
		// go to trigger instead
		if (Other.Controller.Focus == Other.Controller.MoveTarget)
		{
			Other.Controller.Focus = DoorTrigger;
		}
		Other.Controller.MoveTarget = DoorTrigger;
		Other.Controller.CurrentPath = None;
		Other.Controller.NextRoutePath = None;
		return false;
	}
	else
	{
		return false;
	}
}

cpptext
{
	virtual AActor* AssociatedLevelGeometry();
	virtual UBOOL HasAssociatedLevelGeometry(AActor* Other);
	virtual void PrePath();
	virtual void PostPath();
	virtual void FindBase();
#if WITH_EDITOR
	virtual void CheckForErrors();
#endif

}


defaultproperties
{
   bInitiallyClosed=True
   bSpecialMove=True
   ExtraCost=100
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
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
   CollisionComponent=CollisionCylinder
   Name="Default__DoorMarker"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
