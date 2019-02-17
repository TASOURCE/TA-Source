/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ToggleCinematicMode extends SequenceAction;

var() bool bDisableMovement;
var() bool bDisableTurning;
var() bool bHidePlayer;
/** Don't allow input */
var() bool bDisableInput;
/** Whether to hide the HUD during cinematics or not */
var() bool bHideHUD;

/** Destroy dead GearPawns */
var() bool bDeadBodies;
/** Destroy dropped weapons and pickups */
var() bool bDroppedPickups;

/** Delete objects we don't want to keep around during cinematics */
event Activated()
{
	local Actor A;
	foreach GetWorldInfo().DynamicActors( class'Actor', A )
	{
		if( ( bDeadBodies		&& A.IsA('GamePawn') && A.bTearOff ) || 
			( bDroppedPickups	&& A.IsA('DroppedPickup') ) )
		{
			A.Destroy();
		}
	}
}

defaultproperties
{
   bDisableMovement=True
   bDisableTurning=True
   bHidePlayer=True
   bDisableInput=True
   bHideHUD=True
   bDeadBodies=True
   bDroppedPickups=True
   InputLinks(0)=(LinkDesc="Enable")
   InputLinks(1)=(LinkDesc="Disable")
   InputLinks(2)=(LinkDesc="Toggle")
   ObjName="Toggle Cinematic Mode"
   ObjCategory="Toggle"
   Name="Default__SeqAct_ToggleCinematicMode"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
