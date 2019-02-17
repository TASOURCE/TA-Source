/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class TrConsolePlayerController extends TrPlayerController
	config(Game);

/** Whether TargetAdhesion is enabled or not **/
var() config bool bTargetAdhesionEnabled;

var config protected bool bDebugTargetAdhesion;

// @todo amitt update this to work with version 2 of the controller UI mapping system
struct native ProfileSettingToUE3BindingDatum
{
	var name ProfileSettingName;
	var name UE3BindingName;

};

var array<ProfileSettingToUE3BindingDatum> ProfileSettingToUE3BindingMapping360;
var array<ProfileSettingToUE3BindingDatum> ProfileSettingToUE3BindingMappingPS3;

/**
 * We need to override this function so we can do our adhesion code.
 *
 * Would be nice to have have a function or something be able to be inserted between the set up
 * and processing.
 **/
function UpdateRotation( float DeltaTime )
{
	local Rotator	DeltaRot, NewRotation, ViewRotation;

	ViewRotation	= Rotation;
	if (Pawn!=none)
	{
		Pawn.SetDesiredRotation(ViewRotation); //save old rotation
	}

	// Calculate Delta to be applied on ViewRotation
	DeltaRot.Yaw	= PlayerInput.aTurn;
	DeltaRot.Pitch	= PlayerInput.aLookUp;


	// NOTE:  we probably only want to ApplyTargetAdhesion when we are moving as it hides the Adhesion a lot better
	if( ( bTargetAdhesionEnabled )
		&& ( Pawn != none )
		&& ( PlayerInput.aForward != 0 )
		)
	{
		TrConsolePlayerInput(PlayerInput).ApplyTargetAdhesion( DeltaTime, UTWeapon(Pawn.Weapon), DeltaRot.Yaw, DeltaRot.Pitch );
	}


	ProcessViewRotation( DeltaTime, ViewRotation, DeltaRot );

	SetRotation( ViewRotation );

	ViewShake( DeltaTime );

	NewRotation = ViewRotation;
	NewRotation.Roll = Rotation.Roll;

	if( Pawn != None )
	{
		Pawn.FaceRotation(NewRotation, DeltaTime);
	}
}

function bool AimingHelp(bool bInstantHit)
{
	// bUsingGamepad is updated every time we do an input based on what was used to make that input
	//return PlayerInput.bUsingGamepad;
	// @fixme this needs to eventually use the above line and also have some client to server communication where
	// the client tells the server if they have ever used a keyboard/mouse.  The idea being:  once they have "cheated" then
	// they never will get aiming help again.  Doing it this way reduces the amount of server messages we need to have
	return true;
}

/**
* @returns the distance from the collision box of the target to accept aiming help (for instant hit shots)
*/
function float AimHelpModifier()
{
	return (FOVAngle < DefaultFOV - 8) ? 0.75 : 1.0;
}

simulated function bool PerformedUseAction()
{
	// if inside a vehicle station, load vehicle menu
	/*if (m_CurrentStation.IsA('TrVehicleStation'))
	{
		TrHUD(MyHUD).ToggleVehicleMenu();
		return true;
	}*/

	if ( Super.PerformedUseAction() )
	{
		return true;
	}
	else if ( (Role == ROLE_Authority) && !bJustFoundVehicle )
	{
		// console smart use - bring out hoverboard if no other use possible
		ClientSmartUse();
		return true;
	}
	return false;
}

unreliable client function ClientSmartUse()
{
	ToggleTranslocator();
}

reliable client function ClientRestart(Pawn NewPawn)
{
	Super.ClientRestart(NewPawn);

	// we never want the tilt thing on when using UTPawns

	if (UTPawn(NewPawn) != None)
	{
		SetOnlyUseControllerTiltInput(false);
		SetUseTiltForwardAndBack(true);
		SetControllerTiltActive(false);
	}
}

exec function PrevWeapon()
{
	if (Pawn == None || Vehicle(Pawn) != None)
	{
		if ( UDKVehicleBase(Pawn) != None )
		{
			UDKVehicleBase(Pawn).AdjacentSeat(-1, self);
		}
	}
	else if (!Pawn.IsInState('FeigningDeath'))
	{
		Super.PrevWeapon();
	}
}

exec function NextWeapon()
{
	if (Pawn == None || Vehicle(Pawn) != None)
	{
		if ( UDKVehicleBase(Pawn) != None )
		{
			UDKVehicleBase(Pawn).AdjacentSeat(1, self);
		}
	}
	else if (!Pawn.IsInState('FeigningDeath'))
	{
		Super.NextWeapon();
	}
}

function ResetPlayerMovementInput()
{
	local TrConsolePlayerInput ConsoleInput;

	Super.ResetPlayerMovementInput();

	ConsoleInput = TrConsolePlayerInput(PlayerInput);
	if (ConsoleInput != None)
	{
		//ConsoleInput.ForcedDoubleClick = DCLICK_None;
	}
}

// Player movement.
// Player Standing, walking, running, falling.
state PlayerWalking
{
	ignores SeePlayer, HearNoise, Bump;

	function ProcessMove(float DeltaTime, vector NewAccel, eDoubleClickDir DoubleClickMove, rotator DeltaRot)
	{
		Super.ProcessMove(DeltaTime,NewAccel,DoubleClickMove,DeltaRot);
	}
}

defaultproperties
{
   bTargetAdhesionEnabled=True
   ProfileSettingToUE3BindingMapping360(0)=(ProfileSettingName="GamepadBinding_ButtonA",UE3BindingName="XboxTypeS_A")
   ProfileSettingToUE3BindingMapping360(1)=(ProfileSettingName="GamepadBinding_ButtonB",UE3BindingName="XboxTypeS_B")
   ProfileSettingToUE3BindingMapping360(2)=(ProfileSettingName="GamepadBinding_ButtonX",UE3BindingName="XboxTypeS_X")
   ProfileSettingToUE3BindingMapping360(3)=(ProfileSettingName="GamepadBinding_ButtonY",UE3BindingName="XboxTypeS_Y")
   ProfileSettingToUE3BindingMapping360(4)=(ProfileSettingName="GamepadBinding_Back",UE3BindingName="XboxTypeS_Back")
   ProfileSettingToUE3BindingMapping360(5)=(ProfileSettingName="GamepadBinding_Start",UE3BindingName="XboxTypeS_Start")
   ProfileSettingToUE3BindingMapping360(6)=(ProfileSettingName="GamepadBinding_RightBumper",UE3BindingName="XboxTypeS_RightTrigger")
   ProfileSettingToUE3BindingMapping360(7)=(ProfileSettingName="GamepadBinding_LeftBumper",UE3BindingName="XboxTypeS_LeftTrigger")
   ProfileSettingToUE3BindingMapping360(8)=(ProfileSettingName="GamepadBinding_RightTrigger",UE3BindingName="XboxTypeS_RightShoulder")
   ProfileSettingToUE3BindingMapping360(9)=(ProfileSettingName="GamepadBinding_LeftTrigger",UE3BindingName="XboxTypeS_LeftShoulder")
   ProfileSettingToUE3BindingMapping360(10)=(ProfileSettingName="GamepadBinding_RightThumbstickPressed",UE3BindingName="XboxTypeS_RightThumbStick")
   ProfileSettingToUE3BindingMapping360(11)=(ProfileSettingName="GamepadBinding_LeftThumbstickPressed",UE3BindingName="XboxTypeS_LeftThumbStick")
   ProfileSettingToUE3BindingMapping360(12)=(ProfileSettingName="GamepadBinding_DPadUp",UE3BindingName="XboxTypeS_DPad_Up")
   ProfileSettingToUE3BindingMapping360(13)=(ProfileSettingName="GamepadBinding_DPadDown",UE3BindingName="XboxTypeS_DPad_Down")
   ProfileSettingToUE3BindingMapping360(14)=(ProfileSettingName="GamepadBinding_DPadLeft",UE3BindingName="XboxTypeS_DPad_Left")
   ProfileSettingToUE3BindingMapping360(15)=(ProfileSettingName="GamepadBinding_DPadRight",UE3BindingName="XboxTypeS_DPad_Right")
   ProfileSettingToUE3BindingMappingPS3(0)=(ProfileSettingName="GamepadBinding_ButtonA",UE3BindingName="XboxTypeS_A")
   ProfileSettingToUE3BindingMappingPS3(1)=(ProfileSettingName="GamepadBinding_ButtonB",UE3BindingName="XboxTypeS_B")
   ProfileSettingToUE3BindingMappingPS3(2)=(ProfileSettingName="GamepadBinding_ButtonX",UE3BindingName="XboxTypeS_X")
   ProfileSettingToUE3BindingMappingPS3(3)=(ProfileSettingName="GamepadBinding_ButtonY",UE3BindingName="XboxTypeS_Y")
   ProfileSettingToUE3BindingMappingPS3(4)=(ProfileSettingName="GamepadBinding_Back",UE3BindingName="XboxTypeS_Back")
   ProfileSettingToUE3BindingMappingPS3(5)=(ProfileSettingName="GamepadBinding_Start",UE3BindingName="XboxTypeS_Start")
   ProfileSettingToUE3BindingMappingPS3(6)=(ProfileSettingName="GamepadBinding_RightBumper",UE3BindingName="XboxTypeS_RightShoulder")
   ProfileSettingToUE3BindingMappingPS3(7)=(ProfileSettingName="GamepadBinding_LeftBumper",UE3BindingName="XboxTypeS_LeftShoulder")
   ProfileSettingToUE3BindingMappingPS3(8)=(ProfileSettingName="GamepadBinding_RightTrigger",UE3BindingName="XboxTypeS_RightTrigger")
   ProfileSettingToUE3BindingMappingPS3(9)=(ProfileSettingName="GamepadBinding_LeftTrigger",UE3BindingName="XboxTypeS_LeftTrigger")
   ProfileSettingToUE3BindingMappingPS3(10)=(ProfileSettingName="GamepadBinding_RightThumbstickPressed",UE3BindingName="XboxTypeS_RightThumbStick")
   ProfileSettingToUE3BindingMappingPS3(11)=(ProfileSettingName="GamepadBinding_LeftThumbstickPressed",UE3BindingName="XboxTypeS_LeftThumbStick")
   ProfileSettingToUE3BindingMappingPS3(12)=(ProfileSettingName="GamepadBinding_DPadUp",UE3BindingName="XboxTypeS_DPad_Up")
   ProfileSettingToUE3BindingMappingPS3(13)=(ProfileSettingName="GamepadBinding_DPadDown",UE3BindingName="XboxTypeS_DPad_Down")
   ProfileSettingToUE3BindingMappingPS3(14)=(ProfileSettingName="GamepadBinding_DPadLeft",UE3BindingName="XboxTypeS_DPad_Left")
   ProfileSettingToUE3BindingMappingPS3(15)=(ProfileSettingName="GamepadBinding_DPadRight",UE3BindingName="XboxTypeS_DPad_Right")
   Begin Object Class=AudioComponent Name=LowHealthLoop Archetype=AudioComponent'TribesGame.Default__TrPlayerController:LowHealthLoop'
      bShouldRemainActiveIfDropped=True
      Name="LowHealthLoop"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerController:LowHealthLoop'
   End Object
   m_AudioComponentLowHealthLoop=LowHealthLoop
   Begin Object Class=AudioComponent Name=RechargeHealth Archetype=AudioComponent'TribesGame.Default__TrPlayerController:RechargeHealth'
      bShouldRemainActiveIfDropped=True
      Name="RechargeHealth"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerController:RechargeHealth'
   End Object
   m_AudioComponentRechargeHealth=RechargeHealth
   Begin Object Class=AudioComponent Name=CreditsSound Archetype=AudioComponent'TribesGame.Default__TrPlayerController:CreditsSound'
      bShouldRemainActiveIfDropped=True
      Name="CreditsSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrPlayerController:CreditsSound'
   End Object
   m_AudioComponentCreditsSound=CreditsSound
   m_CameraShakes(0)=(Shake=CameraShake'TribesGame.Default__TrConsolePlayerController:SmallShake')
   m_CameraShakes(1)=(Shake=CameraShake'TribesGame.Default__TrConsolePlayerController:MediumShake')
   m_CameraShakes(2)=(Shake=CameraShake'TribesGame.Default__TrConsolePlayerController:LargeShake')
   m_CameraShakes(3)=(Shake=CameraShake'TribesGame.Default__TrConsolePlayerController:Zinged')
   m_CameraShakes(4)=(Shake=CameraShake'TribesGame.Default__TrConsolePlayerController:ConcussionShake')
   CameraShakeShortWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrConsolePlayerController:ForceFeedbackWaveform7'
   CameraShakeLongWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrConsolePlayerController:ForceFeedbackWaveform8'
   bConsolePlayer=True
   VehicleCheckRadiusScaling=1.500000
   InputClass=Class'TribesGame.TrConsolePlayerInput'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrPlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrPlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=LowHealthLoop
   Components(2)=RechargeHealth
   Components(3)=CreditsSound
   CollisionComponent=CollisionCylinder
   Name="Default__TrConsolePlayerController"
   ObjectArchetype=TrPlayerController'TribesGame.Default__TrPlayerController'
}
