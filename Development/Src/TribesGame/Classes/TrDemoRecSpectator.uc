//=============================================================================
// DemoRecSpectator - spectator for demo recordings to replicate ClientMessages
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class TrDemoRecSpectator extends TrPlayerController;

var bool bFindPlayer;

/** local copy of RealViewTarget as the C++ code might clear it in some cases we don't want to for demo spectators */
var PlayerReplicationInfo MyRealViewTarget;

/** if set, camera rotation is always forced to viewtarget rotation */
var config bool bLockRotationToViewTarget;

/** If set, automatically switches players every AutoSwitchPlayerInterval seconds */
var config bool bAutoSwitchPlayers;

/** Interval to use if bAutoSwitchPlayers is TRUE */
var config float AutoSwitchPlayerInterval;

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	r_bNeedTeam = false;
	r_bNeedLoadout = false;
	GotoState('NeutralRovingSpecate');

	if ( PlayerReplicationInfo != None )
	{
		PlayerReplicationInfo.bOutOfLives = true;
	}
}

auto state NeutralRovingSpectateTimer
{
	function BeginState(Name PreviousStateName)
	{
		SetTimer(10.0f);
	}

	event Timer()
	{
		GotoState('NeutralRovingSpecate');
	}
}

simulated event ReceivedPlayer()
{
	Super.ReceivedPlayer();

	// DemoRecSpectators don't go through the login process, so manually call ClientSetHUD()
	// so the spectator has it when playing back the demo
	if (Role == ROLE_Authority && WorldInfo.Game != None)
	{
		ClientSetHUD(WorldInfo.Game.HUDType);
	}
}

function InitPlayerReplicationInfo()
{
	Super.InitPlayerReplicationInfo();
	PlayerReplicationInfo.PlayerName = "Spectator";
	PlayerReplicationInfo.bIsSpectator = true;
	PlayerReplicationInfo.bOnlySpectator = true;
	PlayerReplicationInfo.bOutOfLives = true;
	PlayerReplicationInfo.bWaitingPlayer = false;
}

exec function Slomo(float NewTimeDilation)
{
	WorldInfo.DemoPlayTimeDilation = NewTimeDilation;
}

exec function ViewClass( class<actor> aClass, optional bool bQuiet, optional bool bCheat )
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
		SetViewTarget(first);
		SetBehindView(ViewTarget != self);
	}
	else
		SetViewTarget(self);
}

//==== Called during demo playback ============================================

exec function DemoViewNextPlayer()
{
	local Pawn P, Pick;
	local bool bFound;

	// view next player
	foreach WorldInfo.AllPawns(class'Pawn', P)
	{
		if (P.PlayerReplicationInfo != None)
		{
			if (Pick == None)
			{
				Pick = P;
			}
			if (bFound)
			{
				Pick = P;
				break;
			}
			else
			{
				bFound = (RealViewTarget == P.PlayerReplicationInfo || ViewTarget == P);
			}
		}
	}

	SetViewTarget(Pick);
}

function SetViewTarget(Actor NewViewTarget, optional ViewTargetTransitionParams TransitionParams)
{
	Super.SetViewTarget(NewViewTarget, TransitionParams);

	// this check is so that a Pawn getting gibbed doesn't break finding that player again
	// must manually clear MyRealViewTarget when player controlled switch back to viewing self
	if (NewViewTarget != self)
	{
		MyRealViewTarget = RealViewTarget;
	}
}

unreliable server function ServerViewSelf(optional ViewTargetTransitionParams TransitionParams)
{
	Super.ServerViewSelf(TransitionParams);

	MyRealViewTarget = None;
}

reliable client function ClientSetRealViewTarget(PlayerReplicationInfo NewTarget)
{
	SetViewTarget(self); // will find Pawn from RealViewTarget next tick
	RealViewTarget = NewTarget;
	MyRealViewTarget = NewTarget;
	bFindPlayer = (NewTarget == None);
}

function bool SetPause(bool bPause, optional delegate<CanUnpause> CanUnpauseDelegate = CanUnpause)
{
	// allow the spectator to pause demo playback
	if (WorldInfo.NetMode == NM_Client)
	{
		WorldInfo.Pauser = (bPause) ? PlayerReplicationInfo : None;
		return true;
	}
	else
	{
		return false;
	}
}

exec function Pause()
{
	if (WorldInfo.NetMode == NM_Client)
	{
		ServerPause();
	}
}

simulated event GetPlayerViewPoint(out vector CameraLocation, out rotator CameraRotation)
{
	bFreeCamera = (!bLockRotationToViewTarget && (bBehindView || Vehicle(ViewTarget) != None));
	Super.GetPlayerViewPoint(CameraLocation, CameraRotation);
}

function UpdateRotation(float DeltaTime)
{
	local rotator NewRotation;

	if (bLockRotationToViewTarget)
	{
		SetRotation(ViewTarget.Rotation);
	}
	else
	{
		Super.UpdateRotation(DeltaTime);
	}

	if (Rotation.Roll != 0)
	{
		NewRotation = Rotation;
		NewRotation.Roll = 0;
		SetRotation(NewRotation);
	}
}

defaultproperties
{
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
   m_CameraShakes(0)=(Shake=CameraShake'TribesGame.Default__TrDemoRecSpectator:SmallShake')
   m_CameraShakes(1)=(Shake=CameraShake'TribesGame.Default__TrDemoRecSpectator:MediumShake')
   m_CameraShakes(2)=(Shake=CameraShake'TribesGame.Default__TrDemoRecSpectator:LargeShake')
   m_CameraShakes(3)=(Shake=CameraShake'TribesGame.Default__TrDemoRecSpectator:Zinged')
   m_CameraShakes(4)=(Shake=CameraShake'TribesGame.Default__TrDemoRecSpectator:ConcussionShake')
   bBehindView=True
   CameraShakeShortWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDemoRecSpectator:ForceFeedbackWaveform7'
   CameraShakeLongWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDemoRecSpectator:ForceFeedbackWaveform8'
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
   RemoteRole=ROLE_AutonomousProxy
   bDemoOwner=True
   CollisionComponent=CollisionCylinder
   Name="Default__TrDemoRecSpectator"
   ObjectArchetype=TrPlayerController'TribesGame.Default__TrPlayerController'
}
