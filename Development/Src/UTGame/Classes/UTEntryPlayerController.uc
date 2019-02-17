/**
 * UTEntryPlayerController
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTEntryPlayerController extends UTPlayerController
	config(Game)
    native;

var PostProcessChain EntryPostProcessChain;
var array<PostProcessChain> OldPostProcessChain;
var LocalPlayer OldPlayer;

event InitInputSystem()
{
	// Need to bypass the UTPlayerController since it initializes voice and we do not want to do that in the menus.
	Super(GamePlayerController).InitInputSystem();

	AddOnlineDelegates(false);

	// we do this here so that we only bother to create it for local players
	CameraAnimPlayer = new(self) class'CameraAnimInst';

	if (EntryPostProcessChain != None)
	{
		// Store the old post process chains
		if(OldPostProcessChain.length==0)
		{
			OldPostProcessChain = LocalPlayer(Player).PlayerPostProcessChains;
			OldPlayer = LocalPlayer(Player);
		}

		// Remove all post processing chains for the player
		LocalPlayer(Player).RemoveAllPostProcessingChains();
		LocalPlayer(Player).InsertPostProcessingChain(EntryPostProcessChain, -1, FALSE);
	}
}

simulated function RestorePostProcessing()
{
	local int PPIdx;

	// Restore the old post process chain if we removed it
	if( (OldPlayer != None) && (EntryPostProcessChain != none) )
	{
		OldPlayer.RemoveAllPostProcessingChains();

		for(PPIdx=0; PPIdx<OldPostProcessChain.length; PPIdx++)
		{
			OldPlayer.InsertPostProcessingChain(OldPostProcessChain[PPIdx], -1, true);
		}
		OldPostProcessChain.length = 0;
		OldPlayer = None;
	}
}

/** Destroyed event for the PC, resets the post process chain to normal. */
simulated event Destroyed()
{
	RestorePostProcessing();

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

defaultproperties
{
   CameraShakeShortWaveForm=ForceFeedbackWaveform'UTGame.Default__UTEntryPlayerController:ForceFeedbackWaveform7'
   CameraShakeLongWaveForm=ForceFeedbackWaveform'UTGame.Default__UTEntryPlayerController:ForceFeedbackWaveform8'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTPlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTPlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__UTEntryPlayerController"
   ObjectArchetype=UTPlayerController'UTGame.Default__UTPlayerController'
}
