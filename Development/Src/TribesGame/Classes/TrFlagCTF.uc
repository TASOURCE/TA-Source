/**
* Generic class for all TrFlagCTF flags.
*/
class TrFlagCTF extends TrFlagBase
	abstract;

var int   m_LastReturnedTime;
var int   m_ReturnedTimeLimit;

var float m_YouHaveTheFlagReminderTime;

// States
auto state Home
{
	function SameTeamTouch(Controller C)
	{
		local TrFlagCTF flag;
		local TrPlayerController TrPC;

		// We're ignoring same team touch events, to prevent the flag carrier landing on the flag with fully upgraded reach and causing a flag cap.
		if (WorldInfo.TimeSeconds < m_fIgnoreSameTeamTouch)
		{
			return;
		}

		if ( UTPlayerReplicationInfo(C.PlayerReplicationInfo).bHasFlag )
		{
			// Score!
			flag = TrFlagCTF(UTPlayerReplicationInfo(C.PlayerReplicationInfo).GetFlag());
			TrGame_TRCTF(WorldInfo.Game).ScoreFlag(C, flag);
			flag.Score();
            BroadcastCapturedMessage(C);

			TrPC = TrPlayerController(C);
			if( TrPC != none )
			{
				// Pulse HUD of scorer.
				TrPC.ClientPulseHUD(0);
			}

			// Let any spectators viewing the opposite flag or flag carrier that the flag is captured.
			foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
			{
				if( TrPC.InRovingSpectate() && (TrPC.ViewTarget == flag || ( C.Pawn != none && TrPC.ViewTarget == C.Pawn)) )
				{
					// Spectators should now stay watching this flag.
					TrPC.OnViewTargetCapturedFlag(self);
				}
			}
		}
	}

	// Override so we can award credits for the pickup event
	function SetHolder(Controller C)
	{
		local TrPlayerController TrPC;

		TrPC = TrPlayerController(C);

        // Give that player the flag grab accolade
		if (TrPC != none) TrPC.m_AccoladeManager.FlagGrab();

		Super.SetHolder(C);
	}
}

function LogTaken(Controller EventInstigator)
{
    // JCR - Tween up the new flag icon
    if (TrPlayerController(EventInstigator) != none) TrPlayerController(EventInstigator).ClientShowFlagIcon(true); 

    super.LogTaken(EventInstigator);
}

function LogDropped(Controller EventInstigator)
{
    // JCR - Tween away the new flag icon
    if (TrPlayerController(EventInstigator) != none) TrPlayerController(EventInstigator).ClientShowFlagIcon(false); 
    
    super.LogDropped(EventInstigator);
}

function ClearHolder()
{
    // JCR - Tween away the new flag icon
    if (Holder != none && TrPlayerController(Holder.Owner) != none) TrPlayerController(Holder.Owner).ClientShowFlagIcon(false); 

	ClearTimer('RemindPlayerAboutFlagTimer');

	if (Role == ROLE_Authority && WorldInfo.NetMode == NM_DedicatedServer)
	{
		;
		ScriptTrace();
	}

    super.ClearHolder();
}

state Dropped
{
	ignores Drop;

	function SameTeamTouch(Controller c)
	{
	    local TrPlayerController TrPC;

        // We're giving everyone on the team some credits for the return
        if ((WorldInfo.TimeSeconds - m_LastReturnedTime) > m_ReturnedTimeLimit)
        {
	        foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
	        {
                if (TrPC.GetTeamNum() == GetTeamNum())
                {
                    TrPC.AwardTeamAssistCredits();
                }
	        }

            m_LastReturnedTime = WorldInfo.TimeSeconds;
        }

		TrPC = TrPlayerController(C);
		if( TrPC != none )
		{
			// Pulse HUD of returner.
			TrPC.ClientPulseHUD(0);
		}

		// returned flag
		TrGame_TRCTF(WorldInfo.Game).ScoreFlag(C, self);
		SendHome(C);
	}
}

function SendHome(Controller Returner)
{
	local TrPlayerController TrPC;

	// Let spectators know this flag is returned.
	foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
	{
		if( TrPC.InRovingSpectate() && TrPC.ViewTarget == self )
		{
			// Spectators should now stay watching this flag.
			TrPC.OnViewTargetFlagReturned();
		}
	}

    BroadcastReturnedMessage();

	// Ignore same team touch events whenever we get returned home for 100ms.
	m_fIgnoreSameTeamTouch = WorldInfo.TimeSeconds + 0.1f;

    Super.SendHome(Returner);
}

function RemindPlayerAboutFlagTimer()
{
	local PlayerController PC;
	local TrGame_TRCTF CTFGame;

	CTFGame = TrGame_TRCTF(WorldInfo.Game);
	if( Holder != none && CTFGame != none && CTFGame.m_Flags[Holder.GetTeamNum()].bHome )
	{
		PC = PlayerController(Holder.Controller);
		if( PC != none )
		{
			PC.ReceiveLocalizedMessage(class'TrCTFHUDMessage', 3);
		}
		SetTimer(m_YouHaveTheFlagReminderTime, false, 'RemindPlayerAboutFlagTimer');
	}
}

function BroadcastTakenFromBaseMessage(Controller EventInstigator)
{
	local PlayerController P;

	foreach WorldInfo.AllControllers(class'PlayerController', P)
	{
		if( Holder.PlayerReplicationInfo == P.PlayerReplicationInfo )
		{
			P.ReceiveLocalizedMessage(class'TrCTFHUDMessage', 0);
			SetTimer(m_YouHaveTheFlagReminderTime, false, 'RemindPlayerAboutFlagTimer');
		}
		else
		{
			P.ReceiveLocalizedMessage(MessageClass, 0, EventInstigator.PlayerReplicationInfo, None, Team);
		}
	}
}

function BroadcastTakenDroppedMessage(Controller EventInstigator)
{
	local PlayerController P;

	foreach WorldInfo.AllControllers(class'PlayerController', P)
	{
		if( Holder.PlayerReplicationInfo == P.PlayerReplicationInfo )
		{
			P.ReceiveLocalizedMessage(class'TrCTFHUDMessage', 0);
			SetTimer(m_YouHaveTheFlagReminderTime, true, 'RemindPlayerAboutFlagTimer');
		}
		else
		{
			P.ReceiveLocalizedMessage(MessageClass, 1, EventInstigator.PlayerReplicationInfo, None, Team);
		}
	}
}

function BroadcastCapturedMessage(Controller EventInstigator)
{
	if (EventInstigator.PlayerReplicationInfo.Team.Score < WorldInfo.Game.GoalScore)
	{
		BroadcastLocalizedMessage(MessageClass, 2, EventInstigator.PlayerReplicationInfo, None, Team);
	}
}

function BroadcastReturnedMessage()
{
	local TrGame_TRCTF CTFGame;
	local TrFlagCTF EnemyFlag;

	if ( !WorldInfo.GRI.bMatchIsOver )
	{
		BroadcastLocalizedMessage(MessageClass, 3, None, None, Team);
	}

	// If the enemy team's flag is being held, remind that holder that this flag has
	// returned.
	CTFGame = TrGame_TRCTF(WorldInfo.Game);
	if( CTFGame != none )
	{
		EnemyFlag = Team.TeamIndex == 0 ? CTFGame.m_Flags[1] : CTFGame.m_Flags[0];
		if( EnemyFlag != none )
		{
			EnemyFlag.SetTimer(4.0, false, 'RemindPlayerAboutFlagTimer');
		}
	}
}

function BroadcastDroppedMessage(Controller EventInstigator)
{
	if ( !WorldInfo.GRI.bMatchIsOver )
	{
		if ( EventInstigator == None )
			BroadcastLocalizedMessage(MessageClass, 4, HolderPRI, None, Team);
		else
			BroadcastLocalizedMessage(MessageClass, 4, HolderPRI, EventInstigator.PlayerReplicationInfo, Team);
	}
}

defaultproperties
{
   m_ReturnedTimeLimit=25
   m_YouHaveTheFlagReminderTime=20.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=FlagLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagBase:FlagLightEnvironment'
      bDynamic=False
      Name="FlagLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagBase:FlagLightEnvironment'
   End Object
   LightEnvironment=FlagLightEnvironment
   PickUpWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrFlagCTF:ForceFeedbackWaveformPickUp'
   Begin Object Class=SkeletalMeshComponent Name=TheFlagSkelMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrFlagBase:TheFlagSkelMesh'
      bUpdateSkelWhenNotRendered=False
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bEnableClothSimulation=True
      ClothWind=(X=20.000000,Y=10.000000,Z=0.000000)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagCTF:FlagLightEnvironment'
      RBChannel=RBCC_Nothing
      BlockRigidBody=True
      RBCollideWithChannels=(Vehicle=True,Cloth=True)
      Translation=(X=0.000000,Y=0.000000,Z=-40.000000)
      Name="TheFlagSkelMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrFlagBase:TheFlagSkelMesh'
   End Object
   SkelMesh=TheFlagSkelMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrFlagBase:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Translation=(X=0.000000,Y=0.000000,Z=35.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrFlagBase:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   Components(1)=FlagLightEnvironment
   Components(2)=TheFlagSkelMesh
   CollisionComponent=CollisionCylinder
   MessageClass=Class'TribesGame.TrCTFMessage'
   Name="Default__TrFlagCTF"
   ObjectArchetype=TrFlagBase'TribesGame.Default__TrFlagBase'
}
