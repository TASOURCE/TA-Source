/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class TrPlayerInput extends PlayerInput within TrPlayerController
	config(Input)
	dependson(TrVGSNode) 
	native;

var         int         m_VGSClassId;
var         float       m_LeftJoystickLastValue;        // last reaading from analog joysticks, in degrees
var         float       m_RightJoystickLastValue;
var         TrHUD       m_HUD;

/** Is player in 'VGS' menu? */
var transient protected bool m_bInVGSCaptureMode;

/** Keys that will always ignore the VGS capture and be sent to the game. */
var array<name> m_VGSPassThroughKeys;

/** Hardcoded numkeys to be used in class and loadout VGS menus. */
var array<name> m_VGSNumKeys;
var array<name> m_VGSPadKeys;

/** Which part of the VGS tree (menu) we are currently on. */
var transient class<TrVGSNode> m_CurrentVGSNode;

/** List of all VGS commands. */
var transient TrVGSCommandList m_VGSCommandList;

/** Used to broadcast the key sequence for a VGS command. */
var transient string m_CurrentVGSKeySequence;

/** Is player in 'VGS Classes' menu? */
var transient protected bool m_bInVGSClassMode;

/** Is player in 'VGS Loadouts' menu? */
var transient protected bool m_bInVGSLoadoutMode;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function InitInputSystem()
{
	// Build the list of commands.
	m_VGSCommandList = new(Outer) class'TrVGSCommandList';
	m_VGSCommandList.Init();
	
	super.InitInputSystem();
}

function AdjustMouseSensitivity(float FOVScale)
{
	// Apply mouse sensitivity depending on what the player is doing.
	if (Pawn != none && Pawn.IsA('TrVehicle_BaseFlying'))
	{
		aMouseX *= FlyingYawSensitivity * FOVScale;
		aMouseY *= FlyingPitchSensitivity * FOVScale;
	}
	else
	{
		aMouseX *= MouseSensitivity * FOVScale;
		aMouseY *= MouseSensitivity * FOVScale;
	}
}

function bool IsMouseSmoothEnabled()
{
	// Apply mouse smoothing if we are piloting a flying vehicle.
	if (Pawn != none && Pawn.IsA('TrVehicle_BaseFlying'))
	{
		return true;
	}

	return bEnableMouseSmoothing;
}

simulated event OnVGSKeyPressed(name KeyPressed)
{
	local class<TrVGSNode> NewVGSNode;
	local int i;

	NewVGSNode = m_CurrentVGSNode.static.ProcessKeyInput(KeyPressed, self, WorldInfo.GRI.GameClass);

    if (NewVGSNode != none)
    {
	    m_CurrentVGSNode = NewVGSNode;
	    m_HUD.UpdateVGSMenu();
	    m_CurrentVGSKeySequence = m_CurrentVGSKeySequence $ Caps(KeyPressed);
    }
    else
    {
	    // Our requested key did not take us to a new menu, try and find a VGSCommand on our current node.
	    for( i = 0; i < m_CurrentVGSNode.default.m_Commands.Length; i++ )
	    {
		    if( m_VGSCommandList.m_CommandList[m_CurrentVGSNode.default.m_Commands[i]].KeyBind == KeyPressed )
		    {
			    if( m_CurrentVGSNode.static.VerifyVGSCommandEntry(m_CurrentVGSNode.default.m_Commands[i], WorldInfo.GRI.GameClass) )
			    {
				    m_CurrentVGSKeySequence = m_CurrentVGSKeySequence $ Caps(KeyPressed);
				    PlayVGSCommand(m_CurrentVGSNode.default.m_Commands[i]);
			    }
			    break;
		    }
	    }

	    EndVGS();
    }
}

event OnVGSNumKeyPressed(int Index)
{
	local class<TrFamilyInfo> FamilyInfo;
    local class<TrFamilyInfoList> InfoList;

    if (Index == INDEX_NONE)
    {
        return;
    }

    if (m_bInVGSClassMode)
    {
        InfoList = class<TrFamilyInfoList>(DynamicLoadObject("TribesGame.TrFamilyInfoList", class'Class'));

        if (InfoList != none && Index < InfoList.default.ClassList.Length)
        {
            FamilyInfo = class<TrFamilyInfo>(DynamicLoadObject("TribesGame."$InfoList.default.ClassList[Index], class'Class'));

            if (FamilyInfo != none)
            {
                StartVGSLoadouts(FamilyInfo.default.ClassId);
            }
        }
    }
    else if (m_bInVGSLoadoutMode)
    {
        if (m_TrEquipInterface.IsLoadoutOwned(m_VGSClassId, Index) && Index < LST_MAX)
        {
            RegisterPendingClass(m_VGSClassId, Index);
        }

        EndVGS();
    }
}

/** 
 *  Finds the closest valid actor to spot to the reticule and initiates a voice and chat spot. 
 *  Returns TRUE if something was successfully spotted.
 */
simulated function bool PlaySpottedCommand()
{
	local bool bInEnemyTerritory;
	local string ChatString, ContextTargetString, ContextLocationString;
	local TrPawn EnemyPawn;
	local TrDeployable_Turret EnemyTurret;
	local TrDeployable_Sensor EnemySensor;
	local TrDeployable EnemyDeployable;
	local TrVehicle EnemyVehicle;
	local EArmorType EnemyPawnArmorType;
	local EVGSContextActor ContextActor;
	local EVGSContextLocation ContextLocation;
	local TrPhysicsVolume TrPhysicsV;
	local Actor A, BestContextActor;
	local Vector ActorDir, ViewDir, POVLoc, HitLocation, HitNormal;
	local Rotator POVRot;
	local float Dist, BestDist;

	if (Pawn == none)
		return false;

	if( AllowTextMessage("") )
	{
		ContextActor = VGSContextActors_None;

		GetPlayerViewPoint(POVLoc, POVRot);
		ViewDir = Vector(POVRot);

		// Give priority to a valid actor that is directly down sights
		A = Pawn.Trace(HitLocation, HitNormal, POVLoc + (ViewDir * 10000.0), POVLoc, true,,,TRACEFLAG_Bullet);
		if( IsValidVGSTarget(A) )
		{
			BestContextActor = A;
		}
		
		// Find the closest valid target to the reticule.
		if( BestContextActor == none )
		{
			BestDist = 0.995;
			foreach DynamicActors(class'Actor',A)
			{
				if( A.GetTeamNum() != Pawn.GetTeamNum() && IsValidVGSTarget(A) )
				{
					ActorDir = Normal(A.Location - POVLoc);
					Dist = ViewDir dot ActorDir;
					if( Dist > BestDist )
					{
						// Make sure actor is in LOS to POV.
						if( A == Pawn.Trace(HitLocation, HitNormal, A.Location, POVLoc, true,,,TRACEFLAG_Bullet) )
						{
							BestContextActor = A;
							BestDist = Dist;
						}
					}
				}
			}
		}

		// Determine what type of actor this is.
		if( BestContextActor != none )
		{
			// Try for an enemy pawn.
			EnemyPawn = TrPawn(BestContextActor); 
			if( EnemyPawn != none && EnemyPawn.PlayerReplicationInfo != none)
			{
				EnemyPawnArmorType = TrPlayerReplicationInfo(EnemyPawn.PlayerReplicationInfo).GetArmorType();
				if( EnemyPawnArmorType == ARMOR_Light )
				{
					ContextActor = VGSContextActors_ActorLightPawn;
					ContextTargetString = m_VGSCommandList.ChatString_WarnContext_ActorLightPawn;
				}
				else if( EnemyPawnArmorType == ARMOR_Medium )
				{
					ContextActor = VGSContextActors_ActorMediumPawn;
					ContextTargetString = m_VGSCommandList.ChatString_WarnContext_ActorMediumPawn;
				}
				else
				{
					ContextActor = VGSContextActors_ActorHeavyPawn;
					ContextTargetString = m_VGSCommandList.ChatString_WarnContext_ActorHeavyPawn;
				}
			}
			if( ContextActor == VGSContextActors_None )
			{
				// Try for an enemy turret.
				EnemyTurret = TrDeployable_Turret(BestContextActor);
				if( EnemyTurret != none )
				{
					ContextActor = VGSContextActors_ActorTurret;
					ContextTargetString = m_VGSCommandList.ChatString_WarnContext_ActorTurret;
				}
			}
			if( ContextActor == VGSContextActors_None )
			{
				// Try for an enemy sensor.
				EnemySensor = TrDeployable_Sensor(BestContextActor);
				if( EnemySensor != none )
				{
					ContextActor = VGSContextActors_ActorSensor;
					ContextTargetString = m_VGSCommandList.ChatString_WarnContext_ActorSensor;
				}
			}
			if( ContextActor == VGSContextActors_None )
			{
				// Try for an enemy vehicle.
				EnemyVehicle = TrVehicle(BestContextActor);
				if( EnemyVehicle != none )
				{
					ContextActor = VGSContextActors_ActorVehicle;
					ContextTargetString = m_VGSCommandList.ChatString_WarnContext_ActorVehicle;
				}
			}
			if( ContextActor == VGSContextActors_None )
			{
				// Try for an enemy generic deployable.
				EnemyDeployable = TrDeployable(BestContextActor);
				if( EnemyDeployable != none )
				{
					ContextActor = VGSContextActors_ActorDeployable;
					ContextTargetString = m_VGSCommandList.ChatString_WarnContext_ActorDeployable;
				}
			}
		}

		// Abort if we don't have a context actor.
		if( ContextActor == VGSContextActors_None )
		{
			return false;
		}

		// Determine the location.
		TrPhysicsV = TrPhysicsVolume(BestContextActor.PhysicsVolume);
		if( TrPhysicsV != none )
		{
			ContextLocation = TrPhysicsV.m_ContextLocation;
			bInEnemyTerritory = TrPhysicsV.m_DefenderTeamIndex != Pawn.GetTeamNum();
		}
		else
		{
			ContextLocation = VGSContext_None;
		}

		ContextLocationString = m_VGSCommandList.GetContextLocationString(ContextLocation, bInEnemyTerritory);
		ChatString = "[Spotted]" @ ContextTargetString@ContextLocationString;
		BroadcastChatMessage(GC_CC_LOCAL_TEAM, ChatString);
		ServerRequestVGSContextCommand(ContextActor, ContextLocation, bInEnemyTerritory, BestContextActor);

		return true;
	}
	return false;
}

simulated function PlayVGSCommand(VGSCommandType VGSCommandIndex)
{
	//local bool bIsGlobal;
	//local string ChatString;

	if( AllowTextMessage("") )
	{
		//bIsGlobal = m_VGSCommandList.m_CommandList[VGSCommandIndex].VGSScope == VGSScope_Global;
		//ChatString = "[" $ m_CurrentVGSKeySequence $ "]" @ m_VGSCommandList.m_CommandList[VGSCommandIndex].ChatString;
		//BroadcastChatMessage(bIsGlobal ? GC_CC_INSTANCE : GC_CC_LOCAL_TEAM, ChatString);
		ServerRequestVGSCommand(VGSCommandIndex, m_VGSCommandList.m_CommandList[VGSCommandIndex].VGSScope == VGSScope_Global );
	}
}

function bool IsValidVGSTarget(Actor ActorUnderReticule)
{
	local TrVehicle V;
	local TrPawn P;
	local TrDeployable D;

	if (ActorUnderReticule == none)
		return false;

	if( ActorUnderReticule.LastRenderTime + 0.25 > WorldInfo.TimeSeconds )
	{
		V = TrVehicle(ActorUnderReticule);
		if( V != none )
		{
			return V.GetTeamNum() != Pawn.GetTeamNum();
		}

		P = TrPawn(ActorUnderReticule);
		if( P != none )
		{
			return (P.GetTeamNum() != Pawn.GetTeamNum()) && (!P.r_bIsStealthed);
		}
		
		D = TrDeployable(ActorUnderReticule);
		if( D != none )
		{
			return D.GetTeamNum() != Pawn.GetTeamNum() && D.m_bCanBeSpottedByVGS;
		}
	}

	return false;
}

simulated function StartVGS()
{
    m_bInVGSClassMode = false;
	m_bInVGSCaptureMode = true;
    m_bInVGSLoadoutMode = false;

	m_CurrentVGSNode = class'TrVGSNode_Root';
	m_CurrentVGSKeySequence = "V";

	m_HUD.UpdateVGSMenu();
    
    SetTimer(4.0f, false, 'EndVGSInput');
}

simulated function StartVGSClasses()
{
    if (m_bInVGSClassMode)
    {
        EndVGS();
        return;
    }

    m_bInVGSClassMode = true;
	m_bInVGSCaptureMode = false;
    m_bInVGSLoadoutMode = false;

    m_HUD.UpdateVGSMenu();
    
    SetTimer(4.0f, false, 'EndVGSInput');
}

simulated function StartVGSLoadouts(int ClassId)
{
    m_bInVGSClassMode = false;
	m_bInVGSCaptureMode = false;
    m_bInVGSLoadoutMode = true;

    m_VGSClassId = ClassId;

    m_HUD.UpdateVGSMenu();
    
    SetTimer(4.0f, false, 'EndVGSInput');
}

simulated function EndVGS()
{
    m_bInVGSClassMode = false;
	m_bInVGSCaptureMode = false;
    m_bInVGSLoadoutMode = false;

	m_CurrentVGSNode = none;
	m_CurrentVGSKeySequence = "";

	m_HUD.HideVGSMenu();
}

simulated function SetHUDTarget(TrHUD TrH)
{
	m_HUD = TrH;
}

//
//  Returns angle in degrees of a joystick.  Zero degrees is X axis
//
simulated function int GetStickAngle(float UpDown, float LeftRight)
{
	local float joystickAngle;
	local bool UpValid,LeftValid;

	joystickAngle = -1;

	// threshold for analog input
	UpValid = abs(UpDown) > 0.05;
	LeftValid = abs(LeftRight) > 0.05;

	if ( UpValid || LeftValid )
	{
		if (!UpValid)
		{
			if (LeftRight>0) joystickAngle = 0;
			else joystickAngle = 180;
		}
		else if (!LeftValid)
		{
			if (UpDown > 0) joystickAngle = 90;
			else joystickAngle = 270;
		}
		else
		{
			joystickAngle = (Atan(UpDown/LeftRight) * 180 / 3.141);

			if (LeftRight<0) joystickAngle += 180;
			else if (UpDown<0) joystickAngle += 360;
		}
	}

	return joystickAngle;
}

simulated function PushAnalogJoysticksToScaleform()
{
	local bool bTriggerEvent;
	local float joystickAngle;

	if (m_HUD==none || !bUsingGamepad) return;

	//`log("LEFT=("@RawJoyUp@","@RawJoyRight@")  RIGHT=("@-RawJoyLookUp@","@RawJoyLookRight@")");

	// left stick
	joystickAngle = GetStickAngle(RawJoyUp, RawJoyRight);
	if (m_LeftJoystickLastValue!=joystickAngle)
	{
		bTriggerEvent=true;
		m_LeftJoystickLastValue=joystickAngle;
	}

	// right stick
	joystickAngle = GetStickAngle(-RawJoyLookUp,RawJoyLookRight);
	if (m_RightJoystickLastValue!=joystickAngle)
	{
		bTriggerEvent=true;
		m_RightJoystickLastValue=joystickAngle;
	}

	if (bTriggerEvent)
	{
		m_HUD.ScaleformJoystickInputEvent(m_LeftJoystickLastValue,m_RightJoystickLastValue);
	}
}

function PreProcessInput( float DeltaTime )
{
	super.PreProcessInput(DeltaTime);
	PushAnalogJoysticksToScaleform();
}

event PlayerInput( float DeltaTime )
{
	local TrPlayerPawn PlayerPawn;
	local vector			X,Y,Z;

	super.PlayerInput(DeltaTime);

	PlayerPawn = TrPlayerPawn(Pawn);
	if( PlayerPawn != none )
	{
		if( bFreeCamera )
		{
			GetAxes(PlayerPawn.Rotation, X, Y, Z);
			m_fFreeCamYawOffset = NormalizeRotAxis(m_fFreeCamYawOffset + aTurn);
			m_fFreeCamPitchOffset = NormalizeRotAxis(m_fFreeCamPitchOffset + aLookUp);

			// limit the pitch rotation to complete up and complete down.
			if( m_fFreeCamPitchOffset > 16834 )
			{
				m_fFreeCamPitchOffset = 16834;
			}
			else if( m_fFreeCamPitchOffset < -16834 )
			{
				m_fFreeCamPitchOffset = -16834;
			}
			aTurn = 0.0;
			aLookUp = 0.0;
		}
		else
		{
			// Interpolate any free cam pitch/yaw to zero.
			m_fFreeCamYawOffset = FInterpTo(m_fFreeCamYawOffset, 0, DeltaTime, 10.f);
			m_fFreeCamPitchOffset = FInterpTo(m_fFreeCamPitchOffset, 0, DeltaTime, 10.f);
		}
	}
}

exec function SetFlyingPitchSensitivity(Float F)
{
	FlyingPitchSensitivity = F;

	SetAirVehicleControls(bInvertAirVehicles);
}

exec function SetFlyingYawSensitivity(Float F)
{
	FlyingYawSensitivity = F;

	SetAirVehicleControls(bInvertAirVehicles);
}

function bool InVGSClassMode()
{
    return m_bInVGSClassMode;
}

function bool InVGSLoadoutMode()
{
    return m_bInVGSLoadoutMode;
}

function int GetVGSClassId()
{
    return m_VGSClassId;
}

defaultproperties
{
   m_VGSPassThroughKeys(0)="SpaceBar"
   m_VGSPassThroughKeys(1)="LeftMouseButton"
   m_VGSPassThroughKeys(2)="RightMouseButton"
   m_VGSPassThroughKeys(3)="MouseScrollUp"
   m_VGSPassThroughKeys(4)="MouseScrollDown"
   m_VGSNumKeys(0)="one"
   m_VGSNumKeys(1)="two"
   m_VGSNumKeys(2)="three"
   m_VGSNumKeys(3)="four"
   m_VGSNumKeys(4)="five"
   m_VGSNumKeys(5)="Six"
   m_VGSNumKeys(6)="Seven"
   m_VGSNumKeys(7)="Eight"
   m_VGSNumKeys(8)="Nine"
   m_VGSPadKeys(0)="NumPadOne"
   m_VGSPadKeys(1)="NumPadTwo"
   m_VGSPadKeys(2)="NumPadThree"
   m_VGSPadKeys(3)="NumPadFour"
   m_VGSPadKeys(4)="NumPadFive"
   m_VGSPadKeys(5)="NumPadSix"
   m_VGSPadKeys(6)="NumPadSeven"
   m_VGSPadKeys(7)="NumPadEight"
   m_VGSPadKeys(8)="NumPadNine"
   Name="Default__TrPlayerInput"
   ObjectArchetype=PlayerInput'Engine.Default__PlayerInput'
}
