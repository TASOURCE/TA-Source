class TrEntryPlayerController extends TrPlayerController
    native;

var int m_CountdownTime;
var int MIN_RESEND_WAIT_TIME;
var int MAX_RESEND_WAIT_TIME;

var bool bMenuNotified;

var PostProcessChain EntryPostProcessChain;
var array<PostProcessChain> OldPostProcessChain;
var LocalPlayer OldPlayer;

/** Main menu content data. */
var TrMainMenuContentData m_MainMenuContentData;

/** Class where the actual mesh data lives. */
var string MainMenuContentClassName;

/** Pointer to the map's paper doll. */
var TrPaperDollMainMenu m_MainMenuPaperDoll;
var EContentDataType m_ContentDataType;

/** 
 *  Frequency of preloading calls. Textures for the main menu are preloaded
 *  in PostBeginPlay() and then a timer keeps them resident. This allows the game
 *  to release the textures once we are done with them.
 */
var float m_PreloadTextureTime;

/** World-space locations for the camera at various aspect ratios. */
var() Vector m_CameraLocation16x9;
var() Vector m_CameraLocation16x10;
var() Vector m_CameraLocation4x3;

var() Rotator m_rInitialCameraRotation;
var() Rotator m_rTargetCameraRotation;
var() float m_fCameraRotationCurrTime;
var() float m_fCameraRotationInterpTime;

native function bool RequestPaperDoll();
native function      SendMenuToLobby();
native function      ResendReadyCheck();
native function      UpdateMenuTimer(int Seconds);
native function int  GetWaitRemaining();
native function      NotifyMenuReady();
native function      RefreshFriends();
native function      SwapModel();
native function      ShowPeach();

native exec function ToggleMenuVisible();

simulated function PostBeginPlay()
{
	local Class<TrMainMenuContentData> MainMenuContentDataClass;
	local TrPaperDollMainMenu PaperDoll;

    super.PostBeginPlay();

    r_bNeedTeam = false;
    r_bNeedLoadout = false;
    m_PlayerCommands = new(self) class'TrChatConsoleCommands';
	
    // Spawn the data for the main menu background meshes.
    MainMenuContentDataClass = class<TrMainMenuContentData>(DynamicLoadObject(MainMenuContentClassName, class'Class'));
	if( MainMenuContentDataClass != none )
	{
		m_MainMenuContentData = new(self) MainMenuContentDataClass;
		m_MainMenuContentData.PreloadTextures(m_PreloadTextureTime);
		//m_MainMenuContentData.PreloadTextures(-1.0);
		SetTimer(m_PreloadTextureTime - 1.0, true, 'PreloadTexturesTimer');
	}

	// Cache the paper doll.
	ForEach DynamicActors(class'TrPaperDollMainMenu', PaperDoll)
	{
		m_MainMenuPaperDoll = PaperDoll;
		m_MainMenuPaperDoll.m_TrPlayerController = self;
		break;
	}

	SetTimer(0.2f, true, 'NotifyMenuReadyTimer');
}

simulated event GetPlayerViewPoint( out vector POVLocation, out Rotator POVRotation )
{
    local Rotator newRotation;
	local CameraActor Camera;
	local Vector2D ViewportSize;
	local float AspectRatio;

	Camera = CameraActor(ViewTarget);
	if( Camera != none )
	{
		// In order for us to SetLocation on the camera, it must not be in PHYS_Interpolating.
		if( Camera.Physics != PHYS_None )
		{
			Camera.SetPhysics(PHYS_None);
		}

		// Move the camera based on our current aspect ratio.
		LocalPlayer(Player).ViewportClient.GetViewportSize(ViewportSize);
		AspectRatio = ViewportSize.X/ViewportSize.Y;
		if( AspectRatio > 1.7 ) // 16x9 (~1.77777)
		{
			if( Camera.Location != m_CameraLocation16x9 )
			{
				Camera.SetLocation(m_CameraLocation16x9);
			}
		}
		else if( AspectRatio >= 1.5 ) //16x10 (~1.6)
		{
			if( Camera.Location != m_CameraLocation16x10 )
			{
				Camera.SetLocation(m_CameraLocation16x10);
			}
		}
		else if( Camera.Location != m_CameraLocation4x3 )
		{
			Camera.SetLocation(m_CameraLocation4x3);
		}

	    if( Camera.Rotation != m_rTargetCameraRotation )
	    {
            m_fCameraRotationCurrTime += WorldInfo.DeltaSeconds;

            if (m_fCameraRotationCurrTime < m_fCameraRotationInterpTime)
            {
                newRotation = m_rInitialCameraRotation;
                newRotation.Yaw += (m_rTargetCameraRotation.Yaw - m_rInitialCameraRotation.Yaw) * (m_fCameraRotationCurrTime/m_fCameraRotationInterpTime);
                
                Camera.SetRotation(newRotation);
            }
            else
            {
                Camera.SetRotation(m_rTargetCameraRotation);
            }
		}
	}

	Super.GetPlayerViewPoint(POVLocation, POVRotation);
}

exec function SwingCamera(float TargetPitch, float TargetYaw, float TargetRoll)
{
	local CameraActor Camera;

	Camera = CameraActor(ViewTarget);

	if (Camera != none)
	{
        m_fCameraRotationCurrTime = 0;
        m_rInitialCameraRotation = Camera.Rotation;
	    m_rTargetCameraRotation = MakeRotator(TargetPitch, TargetYaw, TargetRoll);
	}
}

exec function SwingCameraBack()
{
	local CameraActor Camera;

	Camera = CameraActor(ViewTarget);

	if (Camera != none)
	{
        m_fCameraRotationCurrTime = 0;
        m_rInitialCameraRotation = Camera.Rotation;
	    m_rTargetCameraRotation = default.m_rTargetCameraRotation;
	}
}

function PreloadTexturesTimer()
{
	if( m_MainMenuContentData != none )
	{
		m_MainMenuContentData.PreloadTextures(m_PreloadTextureTime);
	}
}

function NotifyMenuReadyTimer()
{
    if (bMenuNotified)
    {
        ClearTimer('NotifyMenuReadyTimer');
    }
    else
    {
        NotifyMenuReady();
    }
}

/** Continue to request a paper doll until the main menu has found our player controller */
function RequestPaperDollTimer()
{
    if (RequestPaperDoll())
    {
        ClearTimer('RequestPaperDollTimer');
    }
}

event BeginQueueResendTimer(int SecondsLeft)
{
    if (SecondsLeft > 60)
    {
        SecondsLeft = MAX_RESEND_WAIT_TIME;
    }
    else if (SecondsLeft < 20)
    {
        SecondsLeft = MIN_RESEND_WAIT_TIME;
    }

    ClearTimer('ResendReadyCheck');
    SetTimer(SecondsLeft,false,'ResendReadyCheck');
}

function ClearQueueResendTimer()
{
    ClearTimer('ResendReadyCheck');
}

function LoadingTimer(bool bStart)
{
    if (bStart)
    {
        SetTimer(LoadingScreenTimeout, false, 'SendMenuToLobby');
    }
    else
    {
        ClearTimer('SendMenuToLobby');
    }
}

event InitInputSystem()
{
	// Need to bypass the UTPlayerController since it initializes voice and we do not want to do that in the menus.
	Super(GamePlayerController).InitInputSystem();

	AddOnlineDelegates(false);

	// we do this here so that we only bother to create it for local players
	CameraAnimPlayer = new(self) class'CameraAnimInst';

	if (EntryPostProcessChain != None)
	{
		// Remove all post processing chains for the player
		LocalPlayer(Player).RemoveAllPostProcessingChains();
		LocalPlayer(Player).InsertPostProcessingChain(EntryPostProcessChain, -1, FALSE);
	}
}

/** Destroyed event for the PC, resets the post process chain to normal. */
simulated event Destroyed()
{
	Super.Destroyed();
}

/**
 * Attempts to pause/unpause the game when a controller becomes
 * disconnected/connected
 *
 * @param ControllerId the id of the controller that changed
 * @param bIsConnected whether the controller is connected or not
 */
function OnControllerChanged(int ControllerId,bool bIsConnected)
{
	local LocalPlayer LocPlayer;
	// Don't worry about remote players
	LocPlayer = LocalPlayer(Player);
	// If the controller that changed, is attached to the this playercontroller
	if (WorldInfo.IsConsoleBuild() && LocPlayer != None && LocPlayer.ControllerId == ControllerId)
	{
		bIsControllerConnected = bIsConnected;
		// @todo - show appropriate warning message on console here
	}
}

/** Callback for when a game invite has been received. */
function OnGameInviteReceived(byte LocalUserNum,string RequestingNick)
{
}


/** Callback for when a friend request has been received. */
function OnFriendInviteReceived(byte LocalUserNum,UniqueNetId RequestingPlayer,string RequestingNick,string Message)
{
}

/**
 * Called when a friend invite arrives for a local player
 *
 * @param LocalUserNum the user that is receiving the invite
 * @param SendingPlayer the player sending the friend request
 * @param SendingNick the nick of the player sending the friend request
 * @param Message the message to display to the recipient
 *
 * @return true if successful, false otherwise
 */
function OnFriendMessageReceived(byte LocalUserNum,UniqueNetId SendingPlayer,string SendingNick,string Message)
{
}







/**
 * Called when a system level connection change notification occurs. If we are
 * playing a match through the platform's online service, we may need to notify and
 * go back to the menu. Otherwise silently ignore this.
 *
 * @param ConnectionStatus the new connection status.
 */
 function OnConnectionStatusChange(EOnlineServerConnectionStatus ConnectionStatus)
{
	local bool bInvalidConnectionStatus;

	// Determine whether the connection status change requires us to drop and go to the menu
	switch (ConnectionStatus)
	{
	case OSCS_DuplicateLoginDetected:
		// Two people can't play or badness will happen
		;

		// now set an error message to be displayed to the user
		SetFrontEndErrorMessage("<Strings:UTGameUI.Errors.DuplicateLogin_Title>",
			"<Strings:UTGameUI.Errors.DuplicateLogin_Message>");

		bInvalidConnectionStatus = true;
		break;

	case OSCS_ConnectionDropped:
	case OSCS_NoNetworkConnection:
	case OSCS_UpdateRequired:
	case OSCS_ServersTooBusy:
		// set an error message to be displayed to the user
		SetFrontEndErrorMessage("<Strings:UTGameUI.Errors.ConnectionLost_Title>",
			"<Strings:UTGameUI.Errors.ConnectionLost_Message>");

		bInvalidConnectionStatus = true;
		break;

	case OSCS_ServiceUnavailable:
		SetFrontEndErrorMessage("<Strings:UTGameUI.Errors.ServiceUnavailable_Title>", "<Strings:UTGameUI.Errors.ServiceUnavailable_Message>");
		bInvalidConnectionStatus = true;
		break;
	}

	;
	if ( bInvalidConnectionStatus )
	{
		// finalize
		QuitToMainMenu();
	}
}

/**
 * Called when the platform's network link status changes.  If we are playing a match on a remote server, we need to go back
 * to the front end menus and notify the player.
 */
 function OnLinkStatusChanged( bool bConnected )
{
	local string ErrorDisplay;

	;

	if ( !bConnected )
	{
		// if we're no longer connected to the network, check to see if another error message has been set
		// only display our message if none are currently set.
		if (!class'UIRoot'.static.GetDataStoreStringValue("<Registry:FrontEndError_Display>", ErrorDisplay)
		||	int(ErrorDisplay) == 0 )
		{
			SetFrontEndErrorMessage("<Strings:UTGameUI.Errors.Error_Title>", "<Strings:UTGameUI.Errors.NetworkLinkLost_Message>");
			QuitToMainMenu();
		}
	}
}

/** Called when returning to the main menu. */
function QuitToMainMenu()
{
	;

	if( GetURLMap()=="MainEntry" )
	{
		OnlineSub.GameInterface.DestroyOnlineGame('Game');
	}
	else
	{
		Super.QuitToMainMenu();
	}
}

function SetPawnConstructionScene(bool bShow);	// Do nothing
function ShowMidGameMenu(optional name TabTag,optional bool bEnableInput);
function ShowScoreboard();

/** Tester function for background posed meshes. */
 function Pose(int PoseId)
{
	UpdateMainMenuPaperDoll_Mesh(EContentDataType(PoseId));
}

/** Tester function for weapons. */
exec function Weap(int WeapId)
{
	switch( WeapId )
	{
	case 0:
		UpdatePaperDoll_Device(class'TrDevice_LightSpinfusor');
		break;
	case 1:
		UpdatePaperDoll_Device(class'TrDevice_Falcon');
		break;
	case 2:
		UpdatePaperDoll_Device(class'TrDevice_ConcussionGrenade');
		break;
	}
}

/** Tester function for family infos. */
 function Char(int CharId)
{
	switch( CharId )
	{
	case 00:
		UpdatePaperDoll(class'TrFamilyInfo_Light_Infiltrator',class'TrDevice_RhinoSMG');
		break;
	case 01:
		UpdatePaperDoll(class'TrFamilyInfo_Light_Infiltrator',class'TrDevice_StealthLightSpinfusor');
		break;
	case 02:
		UpdatePaperDoll(class'TrFamilyInfo_Light_Pathfinder',class'TrDevice_BoltLauncher');
		break;
	case 03:
		UpdatePaperDoll(class'TrFamilyInfo_Light_Pathfinder',class'TrDevice_LightSpinfusor');
		break;
	case 04:
		UpdatePaperDoll(class'TrFamilyInfo_Light_Sentinel',class'TrDevice_PhaseRifle');
		break;
	case 05:
		UpdatePaperDoll(class'TrFamilyInfo_Light_Sentinel',class'TrDevice_SniperRifle');
		break;

	case 10:
		UpdatePaperDoll(class'TrFamilyInfo_Medium_Raider',class'TrDevice_ArxBuster');
		break;
	case 11:
		UpdatePaperDoll(class'TrFamilyInfo_Medium_Raider',class'TrDevice_GrenadeLauncher');
		break;
	case 12:
		UpdatePaperDoll(class'TrFamilyInfo_Medium_Soldier',class'TrDevice_AssaultRifle');
		break;
	case 13:
		UpdatePaperDoll(class'TrFamilyInfo_Medium_Soldier',class'TrDevice_Spinfusor');
		break;
	case 14:
		UpdatePaperDoll(class'TrFamilyInfo_Medium_Technician',class'TrDevice_TCN4SMG');
		break;
	case 15:
		UpdatePaperDoll(class'TrFamilyInfo_Medium_Technician',class'TrDevice_Thumper');
		break;

	case 20:
		UpdatePaperDoll(class'TrFamilyInfo_Heavy_Brute',class'TrDevice_ARC8');
		break;
	case 21:
		UpdatePaperDoll(class'TrFamilyInfo_Heavy_Brute',class'TrDevice_HeavySpinfusor');
		break;
	case 22:
		UpdatePaperDoll(class'TrFamilyInfo_Heavy_Doombringer',class'TrDevice_SaberLauncher');
		break;
		// There is only one primary weapon for doombringer at the moment.
//	case 23:
//		UpdatePaperDoll(class'TrFamilyInfo_Heavy_Doombringer',class'TrDevice_LightSpinfusor');
//		break;
	case 24:
		UpdatePaperDoll(class'TrFamilyInfo_Heavy_Juggernaught',class'TrDevice_MortarLauncher');
		break;
	case 25:
		UpdatePaperDoll(class'TrFamilyInfo_Heavy_Juggernaught',class'TrDevice_MIRVLauncher');
		break;
	}
}

/** Updates the background mesh to be a specific device */
function UpdatePaperDoll_Device(class<TrDevice> DeviceClass)
{
	m_ContentDataType = CDT_None;

	if( m_MainMenuPaperDoll != none )
	{
		m_MainMenuPaperDoll.SetWeaponOnlyMesh(DeviceClass);
	}
}

function ClearMainMenuPaperDoll()
{
    if (m_ContentDataType != CDT_None)
    {
        UpdateMainMenuPaperDoll_Mesh(CDT_None);
    }
}

/** Updates the background mesh to be a specific non-device mesh. */
function UpdateMainMenuPaperDoll_Mesh(EContentDataType Type)
{
    if (m_MainMenuPaperDoll != none)
    {
        m_MainMenuPaperDoll.m_LastFamilyClassRequest = none;
        m_MainMenuPaperDoll.m_LastDeviceOnlyRequest = none;
        m_MainMenuPaperDoll.m_LastDeviceClassRequest = none;
    }

	if( m_MainMenuContentData != none )
	{
        if (Type != m_ContentDataType)
        {
            m_ContentDataType = Type;
		    m_MainMenuContentData.SendPaperDollANewMesh(m_MainMenuPaperDoll, Type);
        }
	}
}

/** Updates the background mesh to be a full character. */
function UpdatePaperDoll(class<TrFamilyInfo> FamilyInfoClass, class<TrDevice> DeviceClass, optional class<TrSkin> SkinClass = none, optional int TeamNum = 0)
{
	if( m_MainMenuPaperDoll != none )
	{
		m_MainMenuPaperDoll.SetFamilyInfo(FamilyInfoClass, DeviceClass, SkinClass, TeamNum);
	}
}

event OnDeviceContentDataClassLoaded(class<TrDeviceContentData> DeviceContentDataClass)
{
	if( m_MainMenuPaperDoll != none )
	{
		m_MainMenuPaperDoll.OnDeviceContentDataClassLoaded(DeviceContentDataClass);
	}
}

/** Called from the main menu when a class is selected. */
function OnClassSelectedMainMenu()
{
	if( m_MainMenuPaperDoll != none )
	{
		// The class has been selected so play the class/weapon specific custom animation.
		m_MainMenuPaperDoll.PlayCustomAnimation();
	}
}

/** Called when 3P content has finished preloading. */
event On3PSkinContentLoaded(class<TrPlayerSkin3PData> Skin3PDataClass)
{
	if( m_MainMenuPaperDoll != none )
	{
		m_MainMenuPaperDoll.OnCharacterMeshContentDataClassLoaded(Skin3PDataClass);
	}
}

function RefreshFriendsTimer()
{
    SetTimer(0.5f, false, 'RefreshFriends');
}

function SwapModelTimer()
{
    SetTimer(0.2f, false, 'SwapModel');
}

function ShowPeachTimer()
{
    SetTimer(2.0f, false, 'ShowPeach');
}

defaultproperties
{
   MIN_RESEND_WAIT_TIME=20
   MAX_RESEND_WAIT_TIME=60
   MainMenuContentClassName="TribesGameContent.TrMainMenuContentData_Content"
   m_PreloadTextureTime=10.000000
   m_CameraLocation16x9=(X=-71.000000,Y=290.000000,Z=-74.000000)
   m_CameraLocation16x10=(X=-71.000000,Y=290.000000,Z=-74.000000)
   m_CameraLocation4x3=(X=-65.000000,Y=223.000000,Z=-76.999825)
   m_rTargetCameraRotation=(Pitch=182,Yaw=-15291,Roll=0)
   m_fCameraRotationInterpTime=1.800000
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
   m_CameraShakes(0)=(Shake=CameraShake'TribesGame.Default__TrEntryPlayerController:SmallShake')
   m_CameraShakes(1)=(Shake=CameraShake'TribesGame.Default__TrEntryPlayerController:MediumShake')
   m_CameraShakes(2)=(Shake=CameraShake'TribesGame.Default__TrEntryPlayerController:LargeShake')
   m_CameraShakes(3)=(Shake=CameraShake'TribesGame.Default__TrEntryPlayerController:Zinged')
   m_CameraShakes(4)=(Shake=CameraShake'TribesGame.Default__TrEntryPlayerController:ConcussionShake')
   CameraShakeShortWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrEntryPlayerController:ForceFeedbackWaveform7'
   CameraShakeLongWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrEntryPlayerController:ForceFeedbackWaveform8'
   CheatClass=Class'PlatformCommon.TgCheatManager'
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
   Name="Default__TrEntryPlayerController"
   ObjectArchetype=TrPlayerController'TribesGame.Default__TrPlayerController'
}
