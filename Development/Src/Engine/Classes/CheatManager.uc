//=============================================================================
// CheatManager
// Object within playercontroller that manages "cheat" commands
// only spawned in single player mode
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class CheatManager extends Object within PlayerController
	native;

/** Debug camera - used to have independent camera without stopping gameplay */
var DebugCameraController           DebugCameraControllerRef;
var class<DebugCameraController>    DebugCameraControllerClass;

var localized		string			ViewingFrom;
var localized		string			OwnCamera;


/**
 *	Finds the nearest pawn of the given class (excluding the owner's pawn) and
 *	plays the specified FaceFX animation.
 */
exec function FXPlay(class<Pawn> aClass, string FXAnimPath)
{
	local Pawn P, ClosestPawn;
	local float ThisDistance, ClosestPawnDistance;
	local string FxAnimGroup;
	local string FxAnimName;
	local int dotPos;

	if ( WorldInfo.NetMode == NM_Standalone )
	{
		ClosestPawn = None;
		ClosestPawnDistance = 10000000.0;
		ForEach DynamicActors(class'Pawn', P)
		{
			if( ClassIsChildOf(P.class, aClass) && (P != PlayerController(Owner).Pawn) )
			{
				ThisDistance = VSize(P.Location - PlayerController(Owner).Pawn.Location);
				if(ThisDistance < ClosestPawnDistance)
				{
					ClosestPawn = P;
					ClosestPawnDistance = ThisDistance;
				}
			}
		}

		if( ClosestPawn.Mesh != none )
	    {
			dotPos = InStr(FXAnimPath, ".");
			if( dotPos != -1 )
			{
				FXAnimGroup = Left(FXAnimPath, dotPos);
				FXAnimName  = Right(FXAnimPath, Len(FXAnimPath) - dotPos - 1);
				ClosestPawn.Mesh.PlayFaceFXAnim(None, FXAnimName, FXAnimGroup, none);
			}
	    }
	}
}

/**
 *	Finds the nearest pawn of the given class (excluding the owner's pawn) and
 *	stops any currently playing FaceFX animation.
 */
exec function FXStop(class<Pawn> aClass)
{
	local Pawn P, ClosestPawn;
	local float ThisDistance, ClosestPawnDistance;

	if ( WorldInfo.NetMode == NM_StandAlone )
	{
		ClosestPawn = None;
		ClosestPawnDistance = 10000000.0;
		ForEach DynamicActors(class'Pawn', P)
		{
			if( ClassIsChildOf(P.class, aClass) && (P != PlayerController(Owner).Pawn) )
			{
				ThisDistance = VSize(P.Location - PlayerController(Owner).Pawn.Location);
				if(ThisDistance < ClosestPawnDistance)
				{
					ClosestPawn = P;
					ClosestPawnDistance = ThisDistance;
				}
			}
		}

		if( ClosestPawn.Mesh != none )
	    {
			ClosestPawn.Mesh.StopFaceFXAnim();
		}
	}
}

exec function DebugAI(optional coerce name Category);

exec function EditAIByTrace()
{
	local Vector CamLoc;
	local Rotator CamRot;
	local Vector HitLocation, HitNormal;
	local Pawn HitPawn;
	local Controller C;
	
	GetPlayerViewPoint( CamLoc, CamRot );
	HitPawn = Pawn(Trace( HitLocation, HitNormal, CamLoc + Vector(CamRot) * 10000, CamLoc, TRUE, vect(10,10,10) ));
	if( HitPawn != None )
	{
		C = HitPawn.Controller;
		if( C == None && HitPawn.DrivenVehicle != None )
		{
			C = HitPawn.DrivenVehicle.Controller;
		}

		if( C != None )
		{
			ConsoleCommand( "EDITACTOR NAME="$C.Name, TRUE );
		}		
	}
}

/** Dumps the pause state of the game */
exec function DebugPause()
{
	WorldInfo.Game.DebugPause();
}

exec function ListDynamicActors()
{











}

exec function FreezeFrame(float delay)
{
	WorldInfo.Game.SetPause(Outer,Outer.CanUnpause);
	WorldInfo.PauseDelay = WorldInfo.TimeSeconds + delay;
}

exec function WriteToLog( string Param )
{
	;
}

exec function KillViewedActor()
{
	if ( ViewTarget != None )
	{
		if ( (Pawn(ViewTarget) != None) && (Pawn(ViewTarget).Controller != None) )
			Pawn(ViewTarget).Controller.Destroy();
		ViewTarget.Destroy();
		SetViewTarget(None);
	}
}

/* Teleport()
Teleport to surface player is looking at
*/
exec function Teleport()
{
	local Actor		HitActor;
	local vector	HitNormal, HitLocation;
	local vector	ViewLocation;
	local rotator	ViewRotation;

	GetPlayerViewPoint( ViewLocation, ViewRotation );

	HitActor = Trace(HitLocation, HitNormal, ViewLocation + 1000000 * vector(ViewRotation), ViewLocation, true);
	if ( HitActor != None)
		HitLocation += HitNormal * 4.0;

	ViewTarget.SetLocation( HitLocation );
}

/*
Scale the player's size to be F * default size
*/
exec function ChangeSize( float F )
{
	Pawn.CylinderComponent.SetCylinderSize( Pawn.Default.CylinderComponent.CollisionRadius * F, Pawn.Default.CylinderComponent.CollisionHeight * F );
	Pawn.SetDrawScale(F);
	Pawn.SetLocation(Pawn.Location);
}

/* Stop interpolation
*/
exec function EndPath()
{
}

exec function Amphibious()
{
	Pawn.UnderwaterTime = +999999.0;
}

exec function Fly()
{
	if ( (Pawn != None) && Pawn.CheatFly() )
	{
		ClientMessage("You feel much lighter");
		bCheatFlying = true;
		Outer.GotoState('PlayerFlying');
	}
}

exec function Walk()
{
	bCheatFlying = false;
	if (Pawn != None && Pawn.CheatWalk())
	{
		Restart(false);
	}
}

exec function Ghost()
{
	if ( (Pawn != None) && Pawn.CheatGhost() )
	{
		bCheatFlying = true;
		Outer.GotoState('PlayerFlying');
	}
	else
	{
		bCollideWorld = false;
	}

	ClientMessage("You feel ethereal");
}

/* AllAmmo
	Sets maximum ammo on all weapons
*/
exec function AllAmmo();

exec function God()
{
	if ( bGodMode )
	{
		bGodMode = false;
		ClientMessage("God mode off");
		return;
	}

	bGodMode = true;
	ClientMessage("God Mode on");
}

exec function Slomo( float T )
{
	WorldInfo.Game.SetGameSpeed(T);
}

exec function SetJumpZ( float F )
{
	Pawn.JumpZ = F;
}

exec function SetGravity( float F )
{
	WorldInfo.WorldGravityZ = F;
}

exec function SetSpeed( float F )
{
	Pawn.GroundSpeed = Pawn.Default.GroundSpeed * f;
	Pawn.WaterSpeed = Pawn.Default.WaterSpeed * f;
}

exec function KillAll(class<actor> aClass)
{
	local Actor A;









	if ( ClassIsChildOf(aClass, class'Pawn') )
	{
		KillAllPawns(class<Pawn>(aClass));
		return;
	}
	ForEach DynamicActors(class 'Actor', A)
		if ( ClassIsChildOf(A.class, aClass) )
			A.Destroy();
}

// Kill non-player pawns and their controllers
function KillAllPawns(class<Pawn> aClass)
{
	local Pawn P;

	ForEach DynamicActors(class'Pawn', P)
		if ( ClassIsChildOf(P.Class, aClass)
			&& !P.IsPlayerPawn() )
		{
			if ( P.Controller != None )
				P.Controller.Destroy();
			P.Destroy();
		}
}

exec function KillPawns()
{
	KillAllPawns(class'Pawn');
}

/**
 * Possess a pawn of the requested class
 */
exec function Avatar( name ClassName )
{
	local Pawn			P, TargetPawn, FirstPawn, OldPawn;
	local bool			bPickNextPawn;

	Foreach DynamicActors(class'Pawn', P)
	{
		if( P == Pawn )
		{
			bPickNextPawn = TRUE;
		}
		else if( P.IsA(ClassName) )
		{
			if( FirstPawn == None )
			{
				FirstPawn = P;
			}

			if( bPickNextPawn )
			{
				TargetPawn = P;
				break;
			}
		}
	}

	// if we went through the list without choosing a pawn, pick first available choice (loop)
	if( TargetPawn == None )
	{
		TargetPawn = FirstPawn;
	}

	if( TargetPawn != None )
	{
		// detach TargetPawn from its controller and kill its controller.
		TargetPawn.DetachFromController( TRUE );

		// detach player from current pawn and possess targetpawn
		if( Pawn != None )
		{
			OldPawn = Pawn;
			Pawn.DetachFromController();
		}

		Possess(TargetPawn, FALSE);

		// Spawn default controller for our ex-pawn (AI)
		if( OldPawn != None )
		{
			OldPawn.SpawnDefaultController();
		}
	}
	else
	{
		;
	}
}

exec function Summon( string ClassName )
{
	local class<actor> NewClass;
	local vector SpawnLoc;

	;
	NewClass = class<actor>( DynamicLoadObject( ClassName, class'Class' ) );
	if( NewClass!=None )
	{
		if ( Pawn != None )
			SpawnLoc = Pawn.Location;
		else
			SpawnLoc = Location;
		Spawn( NewClass,,,SpawnLoc + 72 * Vector(Rotation) + vect(0,0,1) * 15 );
	}
}

/**
 * Give a specified weapon to the Pawn.
 * If weapon is not carried by player, then it is created.
 * Weapon given is returned as the function's return parmater.
 */
exec function Weapon GiveWeapon( String WeaponClassStr )
{
	Local Weapon		Weap;
	local class<Weapon> WeaponClass;

	WeaponClass = class<Weapon>(DynamicLoadObject(WeaponClassStr, class'Class'));
	Weap		= Weapon(Pawn.FindInventoryType(WeaponClass));
	if( Weap != None )
	{
		return Weap;
	}
	
	return Weapon(Pawn.CreateInventory( WeaponClass ));
}

exec function PlayersOnly()
{
	if (WorldInfo.bPlayersOnly || WorldInfo.bPlayersOnlyPending)
	{
		WorldInfo.bPlayersOnly = false;
		WorldInfo.bPlayersOnlyPending = false;
	}
	else
	{
		WorldInfo.bPlayersOnlyPending = !WorldInfo.bPlayersOnlyPending;
		// WorldInfo.bPlayersOnly is set after next tick of UWorld::Tick
	}	
}

/** Util for fracturing meshes within an area of the player. */
exec function DestroyFractures(optional float Radius)
{
	local FracturedStaticMeshActor FracActor;

	if(Radius == 0.0)
	{
		Radius = 256.0;
	}

	foreach CollidingActors(class'FracturedStaticMeshActor', FracActor, Radius, Pawn.Location, TRUE)
	{
		if(FracActor.Physics == PHYS_None)
		{
			// Make sure the impacted fractured mesh is visually relevant
			FracActor.BreakOffPartsInRadius(Pawn.Location, Radius, 500.0, TRUE);
		}
	}
}

/** Util for ensuring at least one piece is broken of each FSM in level */
exec function FractureAllMeshes()
{
	local FracturedStaticMeshActor FracActor;

	foreach AllActors(class'FracturedStaticMeshActor', FracActor)
	{
		FracActor.HideOneFragment();
	}
}

/** This will break all Fractured meshes in the map in a way to maximize memory usage **/
exec function FractureAllMeshesToMaximizeMemoryUsage()
{
	local FracturedStaticMeshActor FracActor;

	foreach AllActors(class'FracturedStaticMeshActor', FracActor)
	{
		FracActor.HideFragmentsToMaximizeMemoryUsage();
	}
}



// ***********************************************************
// Navigation Aids (for testing)

// remember spot for path testing (display path using ShowDebug)
exec function RememberSpot()
{
	if ( Pawn != None )
		SetDestinationPosition( Pawn.Location );
	else
		SetDestinationPosition( Location );
}

// ***********************************************************
// Changing viewtarget

exec function ViewSelf(optional bool bQuiet)
{
	Outer.ResetCameraMode();
	if ( Pawn != None )
		SetViewTarget(Pawn);
	else
		SetViewtarget(outer);
	if (!bQuiet )
		ClientMessage(OwnCamera, 'Event');

	FixFOV();
}

exec function ViewPlayer( string S )
{
	local Controller P;

	foreach WorldInfo.AllControllers(class'Controller', P)
	{
		if ( P.bIsPlayer && (P.PlayerReplicationInfo.PlayerName ~= S ) )
		{
			break;
		}
	}

	if ( P.Pawn != None )
	{
		ClientMessage(ViewingFrom@P.PlayerReplicationInfo.PlayerName, 'Event');
		SetViewTarget(P.Pawn);
	}
}

exec function ViewActor( name ActorName)
{
	local Actor A;

	ForEach AllActors(class'Actor', A)
		if ( A.Name == ActorName )
		{
			SetViewTarget(A);
	    SetCameraMode('ThirdPerson');
			return;
		}
}

exec function ViewBot()
{
	local actor first;
	local bool bFound;
	local AIController C;

	foreach WorldInfo.AllControllers(class'AIController', C)
	{
		if (C.Pawn != None && C.PlayerReplicationInfo != None)
		{
			if (bFound || first == None)
			{
				first = C;
				if (bFound)
				{
					break;
				}
			}
			if (C.PlayerReplicationInfo == RealViewTarget)
			{
				bFound = true;
			}
		}
	}

	if ( first != None )
	{
		;
		SetViewTarget(first);
		SetCameraMode( 'ThirdPerson' );
		FixFOV();
	}
	else
		ViewSelf(true);
}

exec function ViewClass( class<actor> aClass )
{
	local actor other, first;
	local bool bFound;

	first = None;

	ForEach AllActors( aClass, other )
	{
		if ( bFound || (first == None) )
		{
			first = other;
			if ( bFound )
				break;
		}
		if ( other == ViewTarget )
			bFound = true;
	}

	if ( first != None )
	{
		if ( Pawn(first) != None )
			ClientMessage(ViewingFrom@First.GetHumanReadableName(), 'Event');
		else
			ClientMessage(ViewingFrom@first, 'Event');
		SetViewTarget(first);
		FixFOV();
	}
	else
		ViewSelf(false);
}

exec function Loaded()
{
	if( WorldInfo.Netmode!=NM_Standalone )
		return;

    AllWeapons();
    AllAmmo();
}

/* AllWeapons
	Give player all available weapons
*/
exec function AllWeapons()
{
	// subclass me
}

/** streaming level debugging */

function SetLevelStreamingStatus(name PackageName, bool bShouldBeLoaded, bool bShouldBeVisible)
{
	local PlayerController PC;
	local int i;

	if (PackageName != 'All')
	{
		foreach WorldInfo.AllControllers(class'PlayerController', PC)
		{
			PC.ClientUpdateLevelStreamingStatus(PackageName, bShouldBeLoaded, bShouldBeVisible, FALSE );
		}
	}
	else
	{
		foreach WorldInfo.AllControllers(class'PlayerController', PC)
		{
			for (i = 0; i < WorldInfo.StreamingLevels.length; i++)
			{
				PC.ClientUpdateLevelStreamingStatus(WorldInfo.StreamingLevels[i].PackageName, bShouldBeLoaded, bShouldBeVisible, FALSE );
			}
		}
	}
}

//$$BE Removing unneeded exec commands.


















































/**
 *  Switch controller to debug camera without locking gameplay and with locking
 *  local player controller input
 */
function EnableDebugCamera()
{
	local Player P;
	local vector eyeLoc;
	local rotator eyeRot;

	P = Player;
	if( P!= none && Pawn != none && IsLocalPlayerController() )
	{
		if( DebugCameraControllerRef==None )
		{
			DebugCameraControllerRef = spawn(DebugCameraControllerClass);
		}
		DebugCameraControllerRef.OryginalPlayer = P;
		DebugCameraControllerRef.OryginalControllerRef = outer;

		GetPlayerViewPoint(eyeLoc,eyeRot);
		DebugCameraControllerRef.SetLocation(eyeLoc);
		DebugCameraControllerRef.SetRotation(eyeRot);
		DebugCameraControllerRef.PlayerCamera.SetFOV( GetFOVAngle() );
		DebugCameraControllerRef.PlayerCamera.UpdateCamera(0.0);

		P.SwitchController( DebugCameraControllerRef );
		DebugCameraControllerRef.OnActivate( outer );
    }
}

//$$BE Removing unneeded exec commands.





















































































//$$BE Removing unneeded exec commands.














































































/** This is not an actor, so we need a stand in for PostBeginPlay */
function InitCheatManager();


/**
 * This will have all PlaySound function calls emit a warnf so you can see that name of 
 * the soundcue being played.
 **/
exec native function LogPlaySoundCalls( bool bShouldLog );


/**
* This will have all ActivateSystem function calls emit a warnf so you can see that name of 
* the particlesystem being played.
**/
exec native function LogParticleActivateSystemCalls( bool bShouldLog );

/**
 * debug command, verifies that all path objects and path obstacls are valid 
 * (E.G.) that they haven't been deleted, but left registered
 */
exec native function VerifyNavMeshObjects();

/**
 * debug command, will draw all edges that are not supported for the passed pawn class
 */
exec native function DrawUnsupportingEdges(coerce string PawnClassName);

//$$BE Removing unneeded exec commands.

















/**
 * debug command, prints all active navmesh obstaces
 */
exec native function PrintNavMeshObstacles();

//$$BE Removing unneeded exec commands.

























/**
 * debug command which prints out stats about memory usage by covernodes
 */
exec native function DumpCoverStats();

defaultproperties
{
   DebugCameraControllerClass=Class'Engine.DebugCameraController'
   ViewingFrom="Now viewing from"
   OwnCamera="Now viewing from own camera"
   Name="Default__CheatManager"
   ObjectArchetype=Object'Core.Default__Object'
}
