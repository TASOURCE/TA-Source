//=============================================================================
// PlayerInput
// Object within playercontroller that manages player input.
// only spawned on client
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class PlayerInput extends Input within PlayerController
	config(Input)
	transient
	native(UserInterface);

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

/** Player is giving input through a gamepad */
var	const bool	bUsingGamepad;
var const Name	LastAxisKeyName;

var globalconfig	bool		bInvertMouse;							/** if true, mouse y axis is inverted from normal FPS mode */
var globalconfig	bool		bInvertTurn;							/** if true, mouse x axis is inverted from normal FPS mode */
var globalconfig    bool        bInvertAirVehicles;                     //$$ JCR

// Double click move flags
var					bool		bWasForward;
var					bool		bWasBack;
var					bool		bWasLeft;
var					bool		bWasRight;
var					bool		bEdgeForward;
var					bool		bEdgeBack;
var					bool		bEdgeLeft;
var					bool 		bEdgeRight;

var					float		DoubleClickTimer;						/** max double click interval for double click move */
var globalconfig	float		DoubleClickTime;						/** stores time of first click for potential double click */

var globalconfig	float		MouseSensitivity;
var globalconfig    float       FlyingPitchSensitivity;                 //$$ BE Pitch sensitivity for flying vehicles.
var globalconfig    float       FlyingYawSensitivity;                   //$$ BE Yaw sensitivity for flying vehicles.

// Input axes.
var input			float		aBaseX;
var input			float		aBaseY;
var input			float		aBaseZ;
var input			float		aMouseX;
var input			float		aMouseY;
var input			float		aForward;
var input			float		aTurn;
var input			float		aStrafe;
var input			float		aUp;
var input			float		aLookUp;

// analog trigger axes
var input			float		aRightAnalogTrigger;
var input			float		aLeftAnalogTrigger;

// PS3 SIXAXIS axes
var input			float		aPS3AccelX;
var input			float		aPS3AccelY;
var input			float		aPS3AccelZ;
var input			float		aPS3Gyro;

//
// Joy Raw Input
//
/** Joypad left thumbstick, vertical axis. Range [-1,+1] */
var		transient	float	RawJoyUp;
/** Joypad left thumbstick, horizontal axis. Range [-1,+1] */
var		transient	float	RawJoyRight;
/** Joypad right thumbstick, horizontal axis. Range [-1,+1] */
var		transient	float	RawJoyLookRight;
/** Joypad right thumbstick, vertical axis. Range [-1,+1] */
var		transient	float	RawJoyLookUp;

/** move forward speed scaling */
var()	config		float	MoveForwardSpeed;
/** strafe speed scaling */
var()	config		float	MoveStrafeSpeed;
/** Yaw turn speed scaling */
var()	config		float	LookRightScale;
/** pitch turn speed scaling */
var()	config		float	LookUpScale;


// Input buttons.
var input			byte		bStrafe;
var input			byte		bXAxis;
var input			byte		bYAxis;

// Mouse smoothing control
var globalconfig bool		bEnableMouseSmoothing;			/** if true, mouse smoothing is enabled */

var globalconfig bool		bUseToggleZoom;		        	/** if true, zoom button will toggle zoom on and off. Otherwise, player must hold zoom down. */

// Zoom Scaling
var globalconfig int  FOVSetting;        //$$ TRIBESGAME JR: added
var globalconfig bool bEnableFOVScaling; //$$ TRIBESGAME JR: added globalconfig

// Mouse smoothing sample data
var float ZeroTime[2];							/** How long received mouse movement has been zero. */
var float SmoothedMouse[2];						/** Current average mouse movement/sample */
var int MouseSamples;							/** Number of mouse samples since mouse movement has been zero */
var float  MouseSamplingTotal;					/** DirectInput's mouse sampling total time */

/** If TRUE turn input will be ignored until the stick is released */
var transient bool bLockTurnUntilRelease;
/** Time remaining to disable bLockTurnUntilRelease */
var transient float AutoUnlockTurnTime;

//=============================================================================
// Input related functions.

exec function bool InvertMouse()
{
	bInvertMouse = !bInvertMouse;
	SaveConfig();
	return bInvertMouse;
}

exec function bool InvertTurn()
{
	bInvertTurn = !bInvertTurn;
	SaveConfig();
	return bInvertTurn;
}

exec function SetSensitivity(Float F)
{
	MouseSensitivity = F;
}

/** Hook called from HUD actor. Gives access to HUD and Canvas */
function DrawHUD( HUD H );

function PreProcessInput(float DeltaTime);
function PostProcessInput(float DeltaTime);

function AdjustMouseSensitivity(float FOVScale)
{
	// Apply mouse sensitivity.
	aMouseX			*= MouseSensitivity * FOVScale;
	aMouseY			*= MouseSensitivity * FOVScale;
}

//$$BE Function for checking if mouse smoothing should be enabled.
function bool IsMouseSmoothEnabled() { return bEnableMouseSmoothing; }

// Postprocess the player's input.
event PlayerInput( float DeltaTime )
{
	local float FOVScale, TimeScale;

	// Save Raw values
	RawJoyUp		= aBaseY;
	RawJoyRight		= aStrafe;
	RawJoyLookRight	= aTurn;
	RawJoyLookUp	= aLookUp;

	// PlayerInput shouldn't take timedilation into account
	DeltaTime /= WorldInfo.TimeDilation;
	if (Outer.bDemoOwner && WorldInfo.NetMode == NM_Client)
	{
		DeltaTime /= WorldInfo.DemoPlayTimeDilation;
	}

	PreProcessInput( DeltaTime );

	// Scale to game speed
	TimeScale = 100.f*DeltaTime;
	aBaseY		*= TimeScale * MoveForwardSpeed;
	aStrafe		*= TimeScale * MoveStrafeSpeed;
	aUp			*= TimeScale * MoveStrafeSpeed;
	aTurn		*= TimeScale * LookRightScale;
	aLookUp		*= TimeScale * LookUpScale;

	PostProcessInput( DeltaTime );

	ProcessInputMatching(DeltaTime);

	// Check for Double click movement.
	CatchDoubleClickInput();

	// Take FOV into account (lower FOV == less sensitivity).

	if ( bEnableFOVScaling )
	{
		FOVScale = GetFOVAngle() * 0.01111; // 0.01111 = 1 / 90.0
	}
	else
	{
		FOVScale = 1.0;
	}

	AdjustMouseSensitivity(FOVScale);

	// mouse smoothing
	//$$BE Added function to determine if we should use mouth smoothing.
	if ( IsMouseSmoothEnabled() )
	{
		aMouseX = SmoothMouse(aMouseX, DeltaTime,bXAxis,0);
		aMouseY = SmoothMouse(aMouseY, DeltaTime,bYAxis,1);
	}

	aLookUp			*= FOVScale;
	aTurn			*= FOVScale;

	// Turning and strafing share the same axis.
	if( bStrafe > 0 )
		aStrafe		+= aBaseX + aMouseX;
	else
		aTurn		+= aBaseX + aMouseX;

	// Look up/down.
	aLookup += aMouseY;
	if (bInvertMouse)
	{
		aLookup *= -1.f;
	}

	if (bInvertTurn)
	{
		aTurn *= -1.f;
	}

	// Forward/ backward movement
	aForward		+= aBaseY;

	// Handle walking.
	HandleWalking();

	// check for turn locking
	if (bLockTurnUntilRelease)
	{
		if (RawJoyLookRight != 0)
		{
			aTurn = 0.f;
			if (AutoUnlockTurnTime > 0.f)
			{
				AutoUnlockTurnTime -= DeltaTime;
				if (AutoUnlockTurnTime < 0.f)
				{
					bLockTurnUntilRelease = FALSE;
				}
			}
		}
		else
		{
			bLockTurnUntilRelease = FALSE;
		}
	}

	// ignore move input
	// Do not clear RawJoy flags, as we still want to be able to read input.
	if( IsMoveInputIgnored() )
	{
		aForward	= 0.f;
		aStrafe		= 0.f;
		aUp			= 0.f;
	}

	// ignore look input
	// Do not clear RawJoy flags, as we still want to be able to read input.
	if( IsLookInputIgnored() )
	{
		aTurn		= 0.f;
		aLookup		= 0.f;
	}
}

function CatchDoubleClickInput()
{
	if (!IsMoveInputIgnored())
	{
		bEdgeForward	= (bWasForward	^^ (aBaseY	> 0));
		bEdgeBack		= (bWasBack		^^ (aBaseY	< 0));
		bEdgeLeft		= (bWasLeft		^^ (aStrafe < 0));
		bEdgeRight		= (bWasRight	^^ (aStrafe > 0));
		bWasForward		= (aBaseY	> 0);
		bWasBack		= (aBaseY	< 0);
		bWasLeft		= (aStrafe	< 0);
		bWasRight		= (aStrafe	> 0);
	}
}

// check for double click move
function Actor.EDoubleClickDir CheckForDoubleClickMove(float DeltaTime)
{
	local Actor.EDoubleClickDir DoubleClickMove, OldDoubleClick;

	if ( DoubleClickDir == DCLICK_Active )
		DoubleClickMove = DCLICK_Active;
	else
		DoubleClickMove = DCLICK_None;
	if (DoubleClickTime > 0.0)
	{
		if ( DoubleClickDir == DCLICK_Active )
		{
			if ( (Pawn != None) && (Pawn.Physics == PHYS_Walking) )
			{
				DoubleClickTimer = 0;
				DoubleClickDir = DCLICK_Done;
			}
		}
		else if ( DoubleClickDir != DCLICK_Done )
		{
			OldDoubleClick = DoubleClickDir;
			DoubleClickDir = DCLICK_None;

			if (bEdgeForward && bWasForward)
				DoubleClickDir = DCLICK_Forward;
			else if (bEdgeBack && bWasBack)
				DoubleClickDir = DCLICK_Back;
			else if (bEdgeLeft && bWasLeft)
				DoubleClickDir = DCLICK_Left;
			else if (bEdgeRight && bWasRight)
				DoubleClickDir = DCLICK_Right;

			if ( DoubleClickDir == DCLICK_None)
				DoubleClickDir = OldDoubleClick;
			else if ( DoubleClickDir != OldDoubleClick )
				DoubleClickTimer = DoubleClickTime + 0.5 * DeltaTime;
			else
				DoubleClickMove = DoubleClickDir;
		}

		if (DoubleClickDir == DCLICK_Done)
		{
			DoubleClickTimer = FMin(DoubleClickTimer-DeltaTime,0);
			if (DoubleClickTimer < -0.35)
			{
				DoubleClickDir = DCLICK_None;
				DoubleClickTimer = DoubleClickTime;
			}
		}
		else if ((DoubleClickDir != DCLICK_None) && (DoubleClickDir != DCLICK_Active))
		{
			DoubleClickTimer -= DeltaTime;
			if (DoubleClickTimer < 0)
			{
				DoubleClickDir = DCLICK_None;
				DoubleClickTimer = DoubleClickTime;
			}
		}
	}
	return DoubleClickMove;
}

/**
 * Iterates through all InputRequests on the PlayerController and
 * checks to see if a new input has been matched, or if the entire
 * match sequence should be reset.
 *
 * @param	DeltaTime - time since last tick
 */
final function ProcessInputMatching(float DeltaTime)
{
	local float Value;
	local int i,MatchIdx;
	local bool bMatch;
	// iterate through each request,
	for (i = 0; i < InputRequests.Length; i++)
	{
		// if we have a valid match idx
		if (InputRequests[i].MatchIdx >= 0 &&
			InputRequests[i].MatchIdx < InputRequests[i].Inputs.Length)
		{
			if (InputRequests[i].MatchActor == None)
			{
				InputRequests[i].MatchActor = Outer;
			}
			MatchIdx = InputRequests[i].MatchIdx;
			// if we've exceeded the delta,
			// ignore the delta for the first match
			if (MatchIdx != 0 &&
				InputRequests[i].Inputs[MatchIdx].TimeDelta > 0.f && 
				WorldInfo.TimeSeconds - InputRequests[i].LastMatchTime >= InputRequests[i].Inputs[MatchIdx].TimeDelta)
			{
				// reset this match
				InputRequests[i].LastMatchTime = 0.f;
				InputRequests[i].MatchIdx = 0;

				// fire off the cancel event
				if (InputRequests[i].FailedFuncName != 'None')
				{
					InputRequests[i].MatchActor.SetTimer(0.01f, false, InputRequests[i].FailedFuncName );
				}
			}
			else
			{
				// grab the current input value of the matching type
				Value = 0.f;
				switch (InputRequests[i].Inputs[MatchIdx].Type)
				{
				case IT_XAxis:
					Value = aStrafe;
					break;
				case IT_YAxis:
					Value = aBaseY;
					break;
				}
				// check to see if this matches
				switch (InputRequests[i].Inputs[MatchIdx].Action)
				{
				case IMA_GreaterThan:
					bMatch = Value >= InputRequests[i].Inputs[MatchIdx].Value;
					break;
				case IMA_LessThan:
					bMatch = Value <= InputRequests[i].Inputs[MatchIdx].Value;
					break;
				}
				if (bMatch)
				{
					// mark it as matched
					InputRequests[i].LastMatchTime = WorldInfo.TimeSeconds;
					InputRequests[i].MatchIdx++;
					// check to see if we've matched all inputs
					if (InputRequests[i].MatchIdx >= InputRequests[i].Inputs.Length)
					{
						if (InputRequests[i].MatchDelegate != None)
						{
							InputMatchDelegate = InputRequests[i].MatchDelegate;
							InputMatchDelegate();
						}
						// fire off the event
						if (InputRequests[i].MatchFuncName != 'None')
						{
							InputRequests[i].MatchActor.SetTimer(0.01f,false,InputRequests[i].MatchFuncName);
						}
						// reset this match
						InputRequests[i].LastMatchTime = 0.f;
						InputRequests[i].MatchIdx = 0;
						// as well as all others
					}
				}
			}
		}
	}
}

//*************************************************************************************
// Normal gameplay execs
// Type the name of the exec function at the console to execute it

exec function Jump()
{
	if ( WorldInfo.Pauser == PlayerReplicationInfo )
		SetPause( False );
	else
		bPressedJump = true;
}

exec function SmartJump()
{
	Jump();
}

//*************************************************************************************
// Mouse smoothing

exec function ClearSmoothing()
{
	local int i;

	for ( i=0; i<2; i++ )
	{
		//`Log(i$" zerotime "$zerotime[i]$" smoothedmouse "$SmoothedMouse[i]);
		ZeroTime[i] = 0;
		SmoothedMouse[i] = 0;
	}
	//`Log("MouseSamplingTotal "$MouseSamplingTotal$" MouseSamples "$MouseSamples);
    	MouseSamplingTotal = Default.MouseSamplingTotal;
	MouseSamples = Default.MouseSamples;
}

/** SmoothMouse()
Smooth mouse movement, because mouse sampling doesn't match up with tick time.
 * @note: if we got sample event for zero mouse samples (so we
			didn't have to guess whether a 0 was caused by no sample occuring during the tick (at high frame rates) or because the mouse actually stopped)
 * @param: aMouse is the mouse axis movement received from DirectInput
 * @param: DeltaTime is the tick time
 * @param: SampleCount is the number of mouse samples received from DirectInput
 * @param: Index is 0 for X axis, 1 for Y axis
 * @return the smoothed mouse axis movement
 */
function float SmoothMouse(float aMouse, float DeltaTime, out byte SampleCount, int Index)
{
	local float MouseSamplingTime;

	if (DeltaTime < 0.25)
	{
		MouseSamplingTime = MouseSamplingTotal/MouseSamples;

		if ( aMouse == 0 )
		{
			// no mouse movement received
			ZeroTime[Index] += DeltaTime;
			if ( ZeroTime[Index] < MouseSamplingTime )
			{
				// zero mouse movement is possibly because less than the mouse sampling interval has passed
				aMouse = SmoothedMouse[Index] * DeltaTime/MouseSamplingTime;
			}
			else
			{
				SmoothedMouse[Index] = 0;
			}
		}
		else
		{
			ZeroTime[Index] = 0;
			if ( SmoothedMouse[Index] != 0 )
			{
				// this isn't the first tick with non-zero mouse movement
				if ( DeltaTime < MouseSamplingTime * (SampleCount + 1) )
				{
					// smooth mouse movement so samples/tick is constant
					aMouse = aMouse * DeltaTime/(MouseSamplingTime * SampleCount);
				}
				else
				{
					// fewer samples, so going slow
					// use number of samples we should have had for sample count
					SampleCount = DeltaTime/MouseSamplingTime;
				}
			}
			SmoothedMouse[Index] = aMouse/SampleCount;
		}
	}
	else
	{
		// if we had an abnormally long frame, clear everything so it doesn't distort the results
		ClearSmoothing();
	}
	SampleCount = 0;
	return aMouse;
}

/**
 * The player controller will call this function directly after creating the input system
 */
function InitInputSystem();

/**
 * Called via replication to tell the Client to Init it's input system                                                                     
 */
function ClientInitInputSystem();

/**
 * The player controll will call this function directly before traveling                                                                     
 */

function PreClientTravel( string PendingURL, ETravelType TravelType, bool bIsSeamlessTravel)
{
}

cpptext
{
	/**
	 * Generates an IE_Released event for each key in the PressedKeys array, then clears the array.  Should be called when another
	 * interaction which swallows some (but perhaps not all) input is activated.
	 */
	virtual void FlushPressedKeys();

	/** Override to detect input from a gamepad */
	virtual UBOOL InputKey(INT ControllerId, FName Key, enum EInputEvent Event, FLOAT AmountDepressed = 1.f, UBOOL bGamepad = FALSE );
	virtual UBOOL InputAxis(INT ControllerId, FName Key, FLOAT Delta, FLOAT DeltaTime, UBOOL bGamepad=FALSE);
	virtual void  UpdateAxisValue( FLOAT* Axis, FLOAT Delta );
	virtual UBOOL IsGamepadKey(FName Name) const;

	/** stub functions for mobile devices */

	virtual void InputTouch(UINT Handle, BYTE Type, FVector2D TouchLocation, DOUBLE DeviceTimestamp);
	virtual void ProcessTouches(FLOAT DeltaTime);



}


defaultproperties
{
   bInvertAirVehicles=True
   bEnableFOVScaling=True
   DoubleClickTime=0.250000
   MouseSensitivity=30.000000
   FlyingPitchSensitivity=15.000000
   FlyingYawSensitivity=15.000000
   MoveForwardSpeed=1200.000000
   MoveStrafeSpeed=1200.000000
   LookRightScale=300.000000
   LookUpScale=-250.000000
   FOVSetting=90
   MouseSamples=1
   MouseSamplingTotal=0.008300
   Bindings(0)=(Name="Duck",Command="Button bDuck | Axis aUp Speed=-1.0  AbsoluteAxis=100")
   Bindings(1)=(Name="Look",Command="Button bLook")
   Bindings(2)=(Name="Pause",Command="Pause")
   Bindings(3)=(Name="LookToggle",Command="Toggle bLook")
   Bindings(4)=(Name="LookUp",Command="Axis aLookUp Speed=+25.0 AbsoluteAxis=100")
   Bindings(5)=(Name="LookDown",Command="Axis aLookUp Speed=-25.0 AbsoluteAxis=100")
   Bindings(6)=(Name="CenterView",Command="Button bSnapLevel")
   Bindings(7)=(Name="Walking",Command="Button bRun")
   Bindings(8)=(Name="Strafe",Command="Button bStrafe")
   Bindings(9)=(Name="NextWeapon",Command="NextWeapon")
   Bindings(10)=(Name="ViewTeam",Command="ViewClass Pawn")
   Bindings(11)=(Name="TurnToNearest",Command="Button bTurnToNearest")
   Bindings(12)=(Name="Turn180",Command="Button bTurn180")
   Bindings(13)=(Name="MouseX",Command="Count bXAxis | Axis aMouseX")
   Bindings(14)=(Name="MouseY",Command="Count bYAxis | Axis aMouseY")
   Bindings(15)=(Name="B",Command="ToggleSpeaking true | OnRelease ToggleSpeaking false")
   Bindings(16)=(Name="F9",Command="shot")
   Bindings(17)=(Name="XboxTypeS_LeftTriggerAxis",Command="Axis aLeftAnalogTrigger Speed=1.0 DeadZone=0.11")
   Bindings(18)=(Name="XboxTypeS_RightTriggerAxis",Command="Axis aRightAnalogTrigger Speed=1.0 DeadZone=0.11")
   Bindings(19)=(Name="MOBILE_StopMatinee",Command="ce stopmatinee | OnRelease StopUseAttractModeInputConfig")
   Bindings(20)=(Name="MOBILE_StartMatinee",Command="ce playmatinee | OnRelease StartUseAttractModeInputConfig")
   Bindings(21)=(Name="MOBILE_NextConfig",Command="OnRelease NextMobileInputConfig")
   Bindings(22)=(Name="MOBILE_CalibrateTilt",Command="CalibrateTilt")
   Bindings(23)=(Name="MOBILE_ATurn",Command="Axis aTurn DeadZone=0.05")
   Bindings(24)=(Name="MOBILE_ALookup",Command="Axis aLookup Speed=-1 DeadZone=0.05")
   Bindings(25)=(Name="MOBILE_AStrafe",Command="Axis aStrafe DeadZone=0.15")
   Bindings(26)=(Name="MOBILE_AForward",Command="Axis aBaseY DeadZone=0.15")
   Bindings(27)=(Name="MOBILE_Fire",Command="StartFire | OnRelease StopFire")
   Bindings(28)=(Name="MOBILE_NextWeapon",Command="NextWeapon")
   Bindings(29)=(Name="MOBILE_Jump",Command="Jump")
   Bindings(30)=(Name="MOBILE_ToggleFPS",Command="OnRelease stat fps")
   Bindings(31)=(Name="NumPadZero",Command="MOBILE_ResetPrimitiveTracking")
   Bindings(32)=(Name="NumPadOne",Command="MOBILE_IncrementTrackedPrimitive -1")
   Bindings(33)=(Name="NumPadThree",Command="MOBILE_IncrementTrackedPrimitive 1")
   Bindings(34)=(Name="GBA_MoveForward",Command="Axis aBaseY Speed=1.0")
   Bindings(35)=(Name="GBA_Backward",Command="Axis aBaseY Speed=-1.0")
   Bindings(36)=(Name="GBA_StrafeLeft",Command="Axis aStrafe Speed=-1.0")
   Bindings(37)=(Name="GBA_StrafeRight",Command="Axis aStrafe Speed=+1.0")
   Bindings(38)=(Name="GBA_TurnLeft",Command="Axis aBaseX Speed=-200.0 AbsoluteAxis=100")
   Bindings(39)=(Name="GBA_TurnRight",Command="Axis aBaseX  Speed=+200.0 AbsoluteAxis=100")
   Bindings(40)=(Name="GBA_Jump",Command="Jump | Axis aUp Speed=+1.0 AbsoluteAxis=100")
   Bindings(41)=(Name="GBA_Duck",Command="Duck | onrelease UnDuck | Axis aUp Speed=-1.0  AbsoluteAxis=100")
   Bindings(42)=(Name="GBA_Fire",Command="StartFire | OnRelease StopFire")
   Bindings(43)=(Name="GBA_AltFire",Command="StartAltFire | OnRelease StopAltFire")
   Bindings(44)=(Name="GBA_Use",Command="use")
   Bindings(45)=(Name="GBA_Reload",Command="ReloadWeapon")
   Bindings(46)=(Name="GBA_FeignDeath",Command="FeignDeath")
   Bindings(47)=(Name="GBA_SwitchToBestWeapon",Command="SwitchToBestWeapon")
   Bindings(48)=(Name="GBA_PrevWeapon",Command="PrevWeapon")
   Bindings(49)=(Name="GBA_NextWeapon",Command="NextWeapon")
   Bindings(50)=(Name="GBA_SwitchWeapon1",Command="EquipPrimary")
   Bindings(51)=(Name="GBA_SwitchWeapon2",Command="EquipSecondary")
   Bindings(52)=(Name="GBA_SwitchWeapon3",Command="switchweapon 3")
   Bindings(53)=(Name="GBA_SwitchWeapon4",Command="switchweapon 4")
   Bindings(54)=(Name="GBA_SwitchWeapon5",Command="switchweapon 5")
   Bindings(55)=(Name="GBA_SwitchWeapon6",Command="switchweapon 6")
   Bindings(56)=(Name="GBA_SwitchWeapon7",Command="switchweapon 7")
   Bindings(57)=(Name="GBA_SwitchWeapon8",Command="switchweapon 8")
   Bindings(58)=(Name="GBA_SwitchWeapon9",Command="switchweapon 9")
   Bindings(59)=(Name="GBA_SwitchWeapon10",Command="switchweapon 10")
   Bindings(60)=(Name="GBA_ToggleTranslocator",Command="ToggleTranslocator")
   Bindings(61)=(Name="GBA_ToggleSpeaking",Command="ToggleSpeaking true | OnRelease ToggleSpeaking false")
   Bindings(62)=(Name="GBA_Talk",Command="talk")
   Bindings(63)=(Name="GBA_TeamTalk",Command="teamtalk")
   Bindings(64)=(Name="GBA_Taunt1",Command="taunt 1")
   Bindings(65)=(Name="GBA_Taunt2",Command="taunt 2")
   Bindings(66)=(Name="GBA_Horn",Command="PlayVehicleHorn")
   Bindings(67)=(Name="GBA_BugIt",Command="BugIt")
   Bindings(68)=(Name="GBA_ShowMenu",Command="CloseEditorViewport | onrelease ShowMenu")
   Bindings(69)=(Name="GBA_ShowCommandMenu",Command="ShowCommandMenu")
   Bindings(70)=(Name="GBA_ShowScores",Command="SetShowScores true | Onrelease SetShowScores false")
   Bindings(71)=(Name="GBA_ShowMap",Command="ShowMap")
   Bindings(72)=(Name="GBA_ToggleMinimap",Command="ToggleMinimap")
   Bindings(73)=(Name="GBA_GrowHud",Command="GrowHud")
   Bindings(74)=(Name="GBA_ShrinkHud",Command="ShrinkHud")
   Bindings(75)=(Name="GBA_ToggleMelee",Command="Duck | onrelease UnDuck | Axis aUp Speed=-1.0  AbsoluteAxis=100")
   Bindings(76)=(Name="GBA_WeaponPicker",Command="PrevWeapon")
   Bindings(77)=(Name="GBA_Jump_Gamepad",Command="SmartJump | Axis aUp Speed=1.0 AbsoluteAxis=100")
   Bindings(78)=(Name="GBA_StrafeLeft_Gamepad",Command="Axis aStrafe Speed=1.0 DeadZone=0.2")
   Bindings(79)=(Name="GBA_MoveForward_Gamepad",Command="Axis aBaseY Speed=1.0 DeadZone=0.2")
   Bindings(80)=(Name="GBA_TurnLeft_Gamepad",Command="Axis aTurn Speed=1.0 DeadZone=0.2")
   Bindings(81)=(Name="GBA_Look_Gamepad",Command="Axis aLookup Speed=0.65 DeadZone=0.2")
   Bindings(82)=(Name="GBA_SwitchToBestWeapon_Gamepad",Command="SwitchToBestWeapon | Axis aUp Speed=-1.0 AbsoluteAxis=100")
   Bindings(83)=(Name="GBA_ToggleJumpJetpack",Command="ToggleJetpack 1 1| onrelease ToggleJetpack 0 | Axis aUp Speed=+1.0 AbsoluteAxis=100")
   Bindings(84)=(Name="GBA_ToggleJetpack",Command="ToggleJetpack 1 0| onrelease ToggleJetpack 0 | Axis aUp Speed=+1.0 AbsoluteAxis=100")
   Bindings(85)=(Name="GBA_FlyUp",Command="Axis aUp Speed=1.0")
   Bindings(86)=(Name="GBA_FlyDown",Command="Axis aUp Speed=-1.0")
   Bindings(87)=(Name="GBA_DoSki",Command="PressedSki 0| OnRelease ReleasedSki")
   Bindings(88)=(Name="GBA_DoSkiJump",Command="PressedSki 1| OnRelease ReleasedSki")
   Bindings(89)=(Name="GBA_DoJump",Command="DoJump")
   Bindings(90)=(Name="GBA_ActivateMelee",Command="PressedMelee")
   Bindings(91)=(Name="GBA_ActivateLaser",Command="PressedLaser")
   Bindings(92)=(Name="GBA_ActivateBelt",Command="PressedBelt")
   Bindings(93)=(Name="GBA_ActivatePack",Command="PressedPack")
   Bindings(94)=(Name="GBA_ActivateDeployable",Command="PressedDeployable")
   Bindings(95)=(Name="GBA_ToggleSki",Command="ToggleSki")
   Bindings(96)=(Name="GBA_DelaySki",Command="PressedSki | OnRelease DelayReleasedSki | Axis aUp Speed=-1.0 AbsoluteAxis=100")
   Bindings(97)=(Name="GBA_ConsoleJets",Command="ToggleJetpack 1 | onrelease ToggleJetpack 0 | Axis aUp Speed=+1.0 AbsoluteAxis=100")
   Bindings(98)=(Name="GBA_DoZoom",Command="ToggleZoom 1 | onrelease ToggleZoom 0")
   Bindings(99)=(Name="GBA_ShowEquip",Command="SetShowEquip true | Onrelease SetShowEquip false")
   Bindings(100)=(Name="GBA_UseReload",Command="PressedConsoleUse")
   Bindings(101)=(Name="GBA_WeaponSwitch",Command="PressedWeaponSwitch 0")
   Bindings(102)=(Name="GBA_WeaponSwitchWithFilter",Command="PressedWeaponSwitch 1")
   Bindings(103)=(Name="GBA_DropFlag",Command="DropFlag")
   Bindings(104)=(Name="DoZoom",Command="PressedZoom | OnRelease ReleasedZoom")
   Bindings(105)=(Name="GBA_ShowObjectMarkers",Command="ToggleShowObjectMarkers")
   Bindings(106)=(Name="GBA_DeployableMenu",Command="| onrelease ToggleDeployableMenu")
   Bindings(107)=(Name="GBA_SwitchToSeat1",Command="SwitchToSeat 1")
   Bindings(108)=(Name="GBA_SwitchToSeat2",Command="SwitchToSeat 2")
   Bindings(109)=(Name="GBA_SwitchToSeat3",Command="SwitchToSeat 3")
   Bindings(110)=(Name="GBA_SwitchToSeat4",Command="SwitchToSeat 4")
   Bindings(111)=(Name="GBA_SwitchToSeat5",Command="SwitchToSeat 5")
   Bindings(112)=(Name="GBA_SwitchToSeat6",Command="SwitchToSeat 6")
   Bindings(113)=(Name="GBA_CallIn1",Command="SwitchToCallIn 1")
   Bindings(114)=(Name="GBA_CallIn2",Command="SwitchToCallIn 2")
   Bindings(115)=(Name="GBA_CallIn3",Command="SwitchToCallIn 3")
   Bindings(116)=(Name="GBA_CallIn4",Command="SwitchToCallIn 4")
   Bindings(117)=(Name="GBA_CallIn5",Command="SwitchToCallIn 5")
   Bindings(118)=(Name="GBA_CallIn6",Command="SwitchToCallIn 6")
   Bindings(119)=(Name="GBA_SpotTarget",Command="SpotTarget")
   Bindings(120)=(Name="GBA_OpenClasses",Command="| onrelease OpenClasses")
   Bindings(121)=(Name="GBA_MagnifyZoom",Command="MagnifyZoom")
   Bindings(122)=(Name="GBA_DemagnifyZoom",Command="DemagnifyZoom")
   Bindings(123)=(Name="GBA_ClassSelectPTH",Command="ClassHotkeyPTH")
   Bindings(124)=(Name="GBA_ClassSelectSEN",Command="ClassHotkeySEN")
   Bindings(125)=(Name="GBA_ClassSelectINF",Command="ClassHotkeyINF")
   Bindings(126)=(Name="GBA_ClassSelectSLD",Command="ClassHotkeySLD")
   Bindings(127)=(Name="GBA_ClassSelectRDR",Command="ClassHotkeyRDR")
   Bindings(128)=(Name="GBA_ClassSelectTCN",Command="ClassHotkeyTCN")
   Bindings(129)=(Name="GBA_ClassSelectJUG",Command="ClassHotkeyJUG")
   Bindings(130)=(Name="GBA_ClassSelectDMB",Command="ClassHotkeyDMB")
   Bindings(131)=(Name="GBA_ClassSelectBRT",Command="ClassHotkeyBRT")
   Bindings(132)=(Name="GBA_Friends",Command="| onrelease ToggleFriends")
   Bindings(133)=(Name="GBA_Settings",Command="| onrelease ToggleSettings")
   Bindings(134)=(Name="GBA_MainMenu",Command="| onrelease ToggleMainMenu")
   Bindings(135)=(Name="GBA_ReplyTalk",Command="| onrelease replytalk")
   Bindings(136)=(Name="GBA_ToggleChat",Command="| onrelease ToggleChat")
   Bindings(137)=(Name="XboxTypeS_LeftThumbStick",Command="GBA_Jump_Gamepad")
   Bindings(138)=(Name="XboxTypeS_Start",Command="GBA_ShowMenu")
   Bindings(139)=(Name="XboxTypeS_LeftX",Command="GBA_StrafeLeft_Gamepad")
   Bindings(140)=(Name="XboxTypeS_LeftY",Command="GBA_MoveForward_Gamepad")
   Bindings(141)=(Name="XboxTypeS_RightX",Command="GBA_TurnLeft_Gamepad")
   Bindings(142)=(Name="XboxTypeS_RightY",Command="GBA_Look_Gamepad")
   Bindings(143)=(Name="XboxTypeS_RightShoulder",Command="GBA_ActivateBelt")
   Bindings(144)=(Name="XboxTypeS_RightTrigger",Command="GBA_Fire")
   Bindings(145)=(Name="XboxTypeS_LeftShoulder",Command="GBA_DelaySki")
   Bindings(146)=(Name="XboxTypeS_LeftTrigger",Command="GBA_ConsoleJets")
   Bindings(147)=(Name="XboxTypeS_RightThumbStick",Command="DoZoom")
   Bindings(148)=(Name="XboxTypeS_LeftThumbStick",Command="| onrelease ToggleLoadoutMenu")
   Bindings(149)=(Name="XboxTypeS_A",Command="GBA_ActivatePack")
   Bindings(150)=(Name="XboxTypeS_B",Command="GBA_ActivateMelee")
   Bindings(151)=(Name="XboxTypeS_Y",Command="GBA_WeaponSwitch")
   Bindings(152)=(Name="XboxTypeS_X",Command="GBA_UseReload")
   Bindings(153)=(Name="XboxTypeS_Back",Command="GBA_ShowScores")
   Bindings(154)=(Name="XboxTypeS_DPad_Up",Command="| onrelease ToggleClassMenu")
   Bindings(155)=(Name="XboxTypeS_DPad_Down",Command="GBA_DropFlag")
   Bindings(156)=(Name="XboxTypeS_DPad_Right",Command="GBA_ShowObjectMarkers")
   Bindings(157)=(Name="XboxTypeS_DPad_Left",Command="GBA_DropFlag")
   Bindings(158)=(Name="SIXAXIS_AccelX",Command="GBA_TurnLeft_Gamepad")
   Bindings(159)=(Name="SIXAXIS_AccelZ",Command="GBA_Look_Gamepad")
   Bindings(160)=(Name="Left",Command="GBA_TurnLeft")
   Bindings(161)=(Name="Right",Command="GBA_TurnRight")
   Bindings(162)=(Name="SpaceBar",Command="GBA_DoSki | GBA_FlyDown")
   Bindings(163)=(Name="LeftControl",Command="GBA_DoJump")
   Bindings(164)=(Name="Q",Command="GBA_NextWeapon")
   Bindings(165)=(Name="W",Command="GBA_MoveForward")
   Bindings(166)=(Name="S",Command="GBA_Backward")
   Bindings(167)=(Name="A",Command="GBA_StrafeLeft")
   Bindings(168)=(Name="D",Command="GBA_StrafeRight")
   Bindings(169)=(Name="G",Command="GBA_Use")
   Bindings(170)=(Name="R",Command="GBA_Reload")
   Bindings(171)=(Name="E",Command="GBA_ActivateMelee")
   Bindings(172)=(Name="L",Command="GBA_ActivateLaser")
   Bindings(173)=(Name="C",Command="GBA_ActivatePack")
   Bindings(174)=(Name="F",Command="GBA_ActivateBelt")
   Bindings(175)=(Name="X",Command="BehindView")
   Bindings(176)=(Name="Z",Command="GBA_DropFlag")
   Bindings(177)=(Name="LeftMouseButton",Command="GBA_Fire")
   Bindings(178)=(Name="RightMouseButton",Command="GBA_ToggleJumpJetpack | GBA_FlyUp")
   Bindings(179)=(Name="MiddleMouseButton",Command="ActivateFreeCam | OnRelease DeactivateFreeCam")
   Bindings(180)=(Name="Escape",Command="OpenMenu")
   Bindings(181)=(Name="I",Command="GBA_OpenClasses")
   Bindings(182)=(Name="U",Command="| onrelease ToggleDeployableMenu")
   Bindings(183)=(Name="H",Command="GBA_Horn")
   Bindings(184)=(Name="F12",Command="GBA_BugIt")
   Bindings(185)=(Name="MouseScrollUp",Command="GBA_WeaponSwitchWithFilter | GBA_MagnifyZoom")
   Bindings(186)=(Name="MouseScrollDown",Command="GBA_WeaponSwitchWithFilter | GBA_DemagnifyZoom")
   Bindings(187)=(Name="P",Command="| onrelease ToggleTeamSelectionMenu")
   Bindings(188)=(Name="Y",Command="GBA_TeamTalk")
   Bindings(189)=(Name="T",Command="GBA_Talk")
   Bindings(190)=(Name="Tab",Command="GBA_ShowScores")
   Bindings(191)=(Name="F10",Command="stat net")
   Bindings(192)=(Name="V",Command="BeginVGS")
   Bindings(193)=(Name="Up",Command="Axis aLookup Speed=0.8 DeadZone=0.2")
   Bindings(194)=(Name="Down",Command="Axis aLookup Speed=-0.8 DeadZone=0.2")
   Bindings(195)=(Name="LeftShift",Command="DoZoom")
   Bindings(196)=(Name="O",Command="GBA_ShowObjectMarkers")
   Bindings(197)=(Name="F1",Command="GBA_SwitchToSeat1")
   Bindings(198)=(Name="F2",Command="GBA_SwitchToSeat2")
   Bindings(199)=(Name="F3",Command="GBA_SwitchToSeat3")
   Bindings(200)=(Name="F4",Command="GBA_SwitchToSeat4")
   Bindings(201)=(Name="F5",Command="VoteNo")
   Bindings(202)=(Name="F6",Command="VoteYes")
   Bindings(203)=(Name="'",Command="SuppressHelpText")
   Bindings(204)=(Name="Enter",Command="QuickClasses")
   Bindings(205)=(Name="LeftAlt",Command="GBA_SpotTarget")
   Bindings(206)=(Name="K",Command="Suicide")
   Bindings(207)=(Name="Tilde",Command="GBA_ToggleChat")
   Bindings(208)=(Name="one",Command="GBA_SwitchWeapon1")
   Bindings(209)=(Name="two",Command="GBA_SwitchWeapon2")
   Bindings(210)=(Name="three",Command="GBA_CallIn1")
   Bindings(211)=(Name="four",Command="GBA_CallIn2")
   Bindings(212)=(Name="five",Command="GBA_CallIn3")
   Bindings(213)=(Name="LeftBracket",Command="TypeKeyPressed")
   Bindings(214)=(Name="NumPadOne",Command="GBA_ClassSelectPTH")
   Bindings(215)=(Name="NumPadTwo",Command="GBA_ClassSelectSEN")
   Bindings(216)=(Name="NumPadThree",Command="GBA_ClassSelectINF")
   Bindings(217)=(Name="NumPadFour",Command="GBA_ClassSelectSLD")
   Bindings(218)=(Name="NumPadFive",Command="GBA_ClassSelectRDR")
   Bindings(219)=(Name="NumPadSix",Command="GBA_ClassSelectTCN")
   Bindings(220)=(Name="NumPadSeven",Command="GBA_ClassSelectJUG")
   Bindings(221)=(Name="NumPadEight",Command="GBA_ClassSelectDMB")
   Bindings(222)=(Name="NumPadNine",Command="GBA_ClassSelectBRT")
   Bindings(223)=(Name="J",Command="GBA_Friends")
   Bindings(224)=(Name="N",Command="GBA_Settings")
   Bindings(225)=(Name="M",Command="GBA_MainMenu")
   Bindings(226)=(Name="slash",Command="GBA_ReplyTalk")
   Bindings(227)=(Name="[",Command="TestSteamPurchase")
   Name="Default__PlayerInput"
   ObjectArchetype=Input'Engine.Default__Input'
}
