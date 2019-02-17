///=============================================================================
// Teleports actors either between different teleporters within a level
// or to matching teleporters on other levels, or to general Internet URLs.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class Teleporter extends NavigationPoint
	placeable
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//-----------------------------------------------------------------------------
// Teleporter URL can be one of the following forms:
//
// TeleporterName
//		Teleports to a named teleporter in this level.
//		if none, acts only as a teleporter destination
//
// LevelName/TeleporterName
//     Teleports to a different level on this server.
//
// Unreal://Server.domain.com/LevelName/TeleporterName
//     Teleports to a different server on the net.
//
var() string URL;

//-----------------------------------------------------------------------------
// Product the user must have installed in order to enter the teleporter.
var() name ProductRequired;

//-----------------------------------------------------------------------------
// Teleporter destination flags.
var() bool    bChangesVelocity; // Set velocity to TargetVelocity.
var() bool    bChangesYaw;      // Sets yaw to teleporter's Rotation.Yaw
var() bool    bReversesX;       // Reverses X-component of velocity.
var() bool    bReversesY;       // Reverses Y-component of velocity.
var() bool    bReversesZ;       // Reverses Z-component of velocity.

// Teleporter flags
var() bool	  bEnabled;			// Teleporter is turned on;
/** whether this Teleporter works on vehicles */
var() bool bCanTeleportVehicles;

//-----------------------------------------------------------------------------
// Teleporter destination directions.
var() vector  TargetVelocity;   // If bChangesVelocity, set target's velocity to this.

var float LastFired;

//-----------------------------------------------------------------------------
// Teleporter destination functions.

replication
{
	if( Role==ROLE_Authority )
		bEnabled, URL;
	if ( bNetInitial && (Role == ROLE_Authority) )
		bChangesVelocity, bChangesYaw, bReversesX, bReversesY, bReversesZ, TargetVelocity;
}

/** returns whether this NavigationPoint is a teleporter that can teleport the given Actor */
native function bool CanTeleport(Actor A);

event PostBeginPlay()
{
	if (URL ~= "")
		SetCollision(false, false); //destination only

	Super.PostBeginPlay();
}

// Accept an actor that has teleported in.
simulated event bool Accept( actor Incoming, Actor Source )
{
	local rotator NewRot, oldRot;
	local float mag;
	local vector oldDir;
	local Controller C;

	if ( Incoming == None )
		return false;

	// Move the actor here.
	Disable('Touch');
	NewRot = Incoming.Rotation;
	if (bChangesYaw)
	{
		oldRot = Incoming.Rotation;
		NewRot.Yaw = Rotation.Yaw;
		if ( Source != None )
		{
			NewRot.Yaw += (32768 + Incoming.Rotation.Yaw - Source.Rotation.Yaw);
		}
	}

	if ( Pawn(Incoming) != None )
	{
		//tell enemies about teleport
		if ( Role == ROLE_Authority )
		{
			foreach WorldInfo.AllControllers(class'Controller', C)
			{
				if ( C.Enemy == Incoming )
				{
					C.EnemyJustTeleported();
				}
			}
		}

		if ( !Pawn(Incoming).SetLocation(Location) )
		{
			;
			return false;
		}
		if ( (Role == ROLE_Authority)
			|| (WorldInfo.TimeSeconds - LastFired > 0.5) )
		{
			NewRot.Roll = 0;
			Pawn(Incoming).SetRotation(NewRot);
			Pawn(Incoming).SetViewRotation(NewRot);
			Pawn(Incoming).ClientSetRotation(NewRot);
			LastFired = WorldInfo.TimeSeconds;
		}
		if ( Pawn(Incoming).Controller != None )
		{
			Pawn(Incoming).Controller.MoveTimer = -1.0;
			Pawn(Incoming).SetAnchor(self);
			Pawn(Incoming).SetMoveTarget(self);
		}
		Incoming.PlayTeleportEffect(false, true);
	}
	else
	{
		if ( !Incoming.SetLocation(Location) )
		{
			Enable('Touch');
			return false;
		}
		if ( bChangesYaw )
			Incoming.SetRotation(NewRot);
	}
	Enable('Touch');

	if (bChangesVelocity)
		Incoming.Velocity = TargetVelocity;
	else
	{
		if ( bChangesYaw )
		{
			if ( Incoming.Physics == PHYS_Walking )
				OldRot.Pitch = 0;
			oldDir = vector(OldRot);
			mag = Incoming.Velocity Dot oldDir;
			Incoming.Velocity = Incoming.Velocity - mag * oldDir + mag * vector(Incoming.Rotation);
		}
		if ( bReversesX )
			Incoming.Velocity.X *= -1.0;
		if ( bReversesY )
			Incoming.Velocity.Y *= -1.0;
		if ( bReversesZ )
			Incoming.Velocity.Z *= -1.0;
	}
	Incoming.PostTeleport(self);
	return true;
}

//-----------------------------------------------------------------------------
// Teleporter functions.

event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	if ( !bEnabled || (Other == None) )
	{
		return;
	}

	if (CanTeleport(Other) && !Other.PreTeleport(self))
	{
		PendingTouch = Other.PendingTouch;
		Other.PendingTouch = self;
	}
}

// Teleporter was touched by an actor.
simulated event PostTouch( actor Other )
{
	local Teleporter D,Dest[16];
	local int i;

	if( (InStr( URL, "/" ) >= 0) || (InStr( URL, "#" ) >= 0) )
	{
		// Teleport to a level on the net.
		if( (Role == ROLE_Authority) && (Pawn(Other) != None)
			&& Pawn(Other).IsHumanControlled() )
			WorldInfo.Game.SendPlayer(PlayerController(Pawn(Other).Controller), URL);
	}
	else
	{
		// Teleport to a random teleporter in this local level, if more than one pick random.

		foreach AllActors( class 'Teleporter', D )
			if( string(D.tag)~=URL && D!=Self )
			{
				Dest[i] = D;
				i++;
				if ( i > arraycount(Dest) )
					break;
			}

		i = rand(i);
		if( Dest[i] != None )
		{
			// Teleport the actor into the other teleporter.
			if ( Other.IsA('Pawn') )
			{
				Other.PlayTeleportEffect(true, true);
			}
			Dest[i].Accept( Other, self );
		}
	}
}

/* SpecialHandling is called by the navigation code when the next path has been found.
It gives that path an opportunity to modify the result based on any special considerations
*/
event Actor SpecialHandling(Pawn Other)
{
	if ( bEnabled && (Other.Controller.RouteCache.Length > 1) && (Teleporter(Other.Controller.RouteCache[1]) != None)
		&& (string(Other.Controller.RouteCache[1].tag)~=URL) )
	{
		if(IsOverlapping(Other))
		{
			PostTouch(Other);
		}

		return self;
	}
	return None;
}

cpptext
{
#if WITH_EDITOR
	void addReachSpecs(AScout *Scout, UBOOL bOnlyChanged=0);
#endif

}


defaultproperties
{
   bChangesYaw=True
   bEnabled=True
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
      Sprite=Texture2D'EditorResources.S_Teleport'
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
   bCollideActors=True
   CollisionComponent=CollisionCylinder
   Name="Default__Teleporter"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
