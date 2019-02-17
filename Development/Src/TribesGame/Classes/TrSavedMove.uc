class TrSavedMove extends SavedMove;

/** 
 *  When in ATrPawn::physFalling(), there can be discrepencies in edge cases
 *  where the 2D velocity on the client is <= GroundSpeed but is > GroundSpeed 
 *  on the server, so have client send what he predicted with this edge case.
 */
var bool m_bAirSpeedBoundToGroundSpeed;

/** Does this move have the jetpack pressed? */
var bool m_bPressingJetpack;

/** Does this move have jump jet enabled? */
var bool m_bJumpJet;

/** Does this move have a blink? */
var bool m_bBlink;

/** What is our current deceleration factor when walking? */
var WalkingDeceleration m_CurrentDecelerationFactor;

function Clear()
{
	Super.Clear();
	m_bAirSpeedBoundToGroundSpeed = false;
	m_bPressingJetpack = false;
	m_bJumpJet = false;
	m_bBlink = false;
	m_CurrentDecelerationFactor = WalkingDeceleration_None;
}

function PostUpdate(PlayerController P)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(P);
	if( TrPC != none )
	{
		m_bAirSpeedBoundToGroundSpeed = TrPC.m_bAirSpeedBoundToGroundSpeed || m_bAirSpeedBoundToGroundSpeed;
		m_bPressingJetpack = TrPC.m_bPressingJetpack || m_bPressingJetpack;
		m_bJumpJet = TrPC.m_bJumpJet || m_bJumpJet;
		m_bBlink = TrPC.m_bBlink || m_bBlink;
		m_CurrentDecelerationFactor = TrPC.m_CurrentDecelerationFactor;
	}
	super.PostUpdate(P);
}

function bool CanCombineWith(SavedMove NewMove, Pawn InPawn, float MaxDelta)
{
	local TrSavedMove TrSM;

	TrSM = TrSavedMove(NewMove);

	if( TrSM == none )
	{
		// If we don't have a Tr version for some reason just do the super's logic.
		return Super.CanCombineWith(NewMove, InPawn, MaxDelta);
	}
		
	if( InPawn == None )
	{
		return FALSE;
	}

	if( bRootMotionFromInterpCurve )
	{
		return FALSE;
	}

	if ( TrSM.Acceleration == vect(0,0,0) )
	{
		return ( (Acceleration == vect(0,0,0))
			&& (StartVelocity == vect(0,0,0))
			&& (TrSM.StartVelocity == vect(0,0,0))
			&& (SavedPhysics == InPawn.Physics)
			&& !bPressedJump && !TrSM.bPressedJump
			&& !m_bAirSpeedBoundToGroundSpeed && !TrSM.m_bAirSpeedBoundToGroundSpeed
			&& !m_bPressingJetpack && !TrSM.m_bPressingJetpack
			&& !m_bJumpJet && !TrSM.m_bJumpJet
			&& !m_bBlink && !TrSM.m_bBlink
			&& m_CurrentDecelerationFactor == m_CurrentDecelerationFactor
			&& (bRun == TrSM.bRun)
			&& (bDuck == TrSM.bDuck)
			&& (bPreciseDestination == TrSM.bPreciseDestination)
			&& (bDoubleJump == TrSM.bDoubleJump)
			&& ((DoubleClickMove == DCLICK_None) || (DoubleClickMove == DCLICK_Active))
			&& (TrSM.DoubleClickMove == DoubleClickMove)
			&& !bForceRMVelocity && !TrSM.bForceRMVelocity)
			&& (CustomTimeDilation == TrSM.CustomTimeDilation);
	}
	else
	{
		return ( (InPawn != None)
			&& (TrSM.Delta + Delta < MaxDelta)
			&& (SavedPhysics == InPawn.Physics)
			&& !bPressedJump && !TrSM.bPressedJump
			&& !m_bAirSpeedBoundToGroundSpeed && !TrSM.m_bAirSpeedBoundToGroundSpeed
			&& !m_bPressingJetpack && !TrSM.m_bPressingJetpack
			&& !m_bJumpJet && !TrSM.m_bJumpJet
			&& !m_bBlink && !TrSM.m_bBlink
			&& m_CurrentDecelerationFactor == m_CurrentDecelerationFactor
			&& (bRun == TrSM.bRun)
			&& (bDuck == TrSM.bDuck)
			&& (bDoubleJump == TrSM.bDoubleJump)
			&& (bPreciseDestination == TrSM.bPreciseDestination)
			&& ((DoubleClickMove == DCLICK_None) || (DoubleClickMove == DCLICK_Active))
			&& (TrSM.DoubleClickMove == DoubleClickMove)
			&& ((Normal(Acceleration) Dot Normal(TrSM.Acceleration)) > 0.99)
			&& !bForceRMVelocity && !TrSM.bForceRMVelocity)
			&& (CustomTimeDilation == TrSM.CustomTimeDilation);
	}
}

function SetMoveFor(PlayerController P, float DeltaTime, vector NewAccel, EDoubleClickDir InDoubleClick)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(P);

	super.SetMoveFor(P, Deltatime, NewAccel, InDoubleClick);

	if( TrPC != none )
	{
		m_bAirSpeedBoundToGroundSpeed = TrPC.m_bAirSpeedBoundToGroundSpeed;
		m_bPressingJetpack = TrPC.m_bPressingJetpack;
		m_bJumpJet = TrPC.m_bJumpJet;
		m_bBlink = TrPC.m_bBlink;
		m_CurrentDecelerationFactor = TrPC.m_CurrentDecelerationFactor;
	}
}

/* CompressedFlags()
returns a byte containing encoded special movement information (jumping, crouching, etc.)
SetFlags() and UnCompressFlags() should be overridden to allow game specific special movement information
*/
function byte CompressedFlags()
{
	local byte Result;

	switch( m_CurrentDecelerationFactor )
	{
		case WalkingDeceleration_A:
			Result += 1;
			break;
		case WalkingDeceleration_B:
			Result += 2;
			break;
		case WalkingDeceleration_C:
			Result += 3;
			break;
		case WalkingDeceleration_D:
			Result += 4;
			break;
		case WalkingDeceleration_E:
			Result += 5;
			break;
	}

	if ( m_bJumpJet )
		Result += 8;
	if ( m_bPressingJetpack )
		Result += 16;
	if ( bPressedJump )
		Result += 32;
	if ( m_bAirSpeedBoundToGroundSpeed )
		Result += 64;
	if ( m_bBlink )
		Result += 128;

	return Result;
}

/* SetFlags()
Set the movement parameters for PC based on the passed in Flags
*/
static function EDoubleClickDir SetFlags(byte Flags, PlayerController PC)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(PC);

	if( TrPC != none )
	{
		if ( (Flags & 8) != 0 )
			TrPC.m_bJumpJet = true;
		else
			TrPC.m_bJumpJet = false;
		if ( (Flags & 16) != 0 )
			TrPC.m_bPressingJetpack = true;
		else
			TrPC.m_bPressingJetpack = false;

		TrPC.m_bBlink = ( (Flags & 128) != 0 );

		TrPC.m_bAirSpeedBoundToGroundSpeed = ( (Flags & 64) != 0 );
	}
	PC.bPressedJump = ( (Flags & 32) != 0 );
	switch (Flags & 7)
	{
		case 0:
			TrPC.m_CurrentDecelerationFactor = WalkingDeceleration_None;
			break;
		case 1:
			TrPC.m_CurrentDecelerationFactor = WalkingDeceleration_A;
			break;
		case 2:
			TrPC.m_CurrentDecelerationFactor = WalkingDeceleration_B;
			break;
		case 3:
			TrPC.m_CurrentDecelerationFactor = WalkingDeceleration_C;
			break;
		case 4:
			TrPC.m_CurrentDecelerationFactor = WalkingDeceleration_D;
			break;
		case 5:
			TrPC.m_CurrentDecelerationFactor = WalkingDeceleration_E;
			break;
	}
	return DCLICK_None;
}

function String GetDebugString()
{
	local String Str;

	Str = self@"Delta:'"$Delta$"'"@"SavedPhysics:'"$SavedPhysics$"'"@"StartLocation:'"$StartLocation$"'"@"StartVelocity:'"$StartVelocity$"'"@"SavedLocation:'"$SavedLocation$"'"@"SavedVelocity:'"$SavedVelocity$"'"@"RMVelocity:'"$RMVelocity$"'"@"Acceleration:'"$Acceleration$"'"@"bRootMotionFromInterpCurve:'"$bRootMotionFromInterpCurve$"'"@"RootMotionInterpCurrentTime:'"$RootMotionInterpCurrentTime$"'";
	return Str;
}

defaultproperties
{
   Name="Default__TrSavedMove"
   ObjectArchetype=SavedMove'Engine.Default__SavedMove'
}
