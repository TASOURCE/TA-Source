/**
 * GFxTrScene_Login
 * 
 * This scene is responsible for handling the login processing and callbacks
 * for success and failure back to as
 */

class GFxTrScene_Login extends GFxTrScene;
/*
var bool   bRemember;
var string LoginName;
var string LoginPassword;

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();
    
	if (OnlineSub.PlayerInterface != none)
	{
		OnlineSub.PlayerInterface.AddLoginFailedDelegate(0,OnUserLoginFailed);
	}

    bSceneCreated = true;
}

function bool Login(string userName, string password, bool bRemember)
{
    bRemember = bRemember;
    LoginName = userName;
    LoginPassword = password;

    if (OnlineSub.PlayerInterface.GetLoginStatus(GetLP().ControllerId) == LS_LoggedIn)
    {
        //TrOuter.UserLoginChanged("Already logged in", 0, true);
        return true;
    }

    return (OnlineSub.PlayerInterface.Login(0, LoginName, LoginPassword, false));
}

function OnUserLoginFailed(byte LocalUserNum,EOnlineServerConnectionStatus ErrorCode)
{
    local string error;

    if (!TrOuter.bCreatingNewPlayer)
    {
        switch (ErrorCode)
        {
        case OSCS_NotConnected: error = "Cannot connect to server. Please wait and try again shortly."; break;
        case OSCS_InvalidUser:  error = "Invalid username or password given. Try again.";               break;
        default:                error = string(ErrorCode);                                              break;
        }

        TrOuter.SendPlayerLogin("Unknown", error, false);
    }
}

function RetryLogin()
{
    OnlineSub.PlayerInterface.Login(0, LoginName, LoginPassword, false);
}

function Logout()
{
    if (TrOuter.bInGame)
    {
        TrOuter.ExitGameInProgress();
    }

    if (!OnlineSubsystemMcts(OnlineSub).Logout(0))
    {
        `log("Unable to successfully log player out of online system.");
    }
    else
    {
        TrOuter.bInGame        = false;
        TrOuter.bFullyLoaded   = false;
        TrOuter.bProfileLoaded = false;
        TrOuter.LoginSuccess   = false;
        TrOuter.LoginReason    = "";
        TrOuter.LoginPlayer    = "";

        TrOuter.SetPlayerInLobby();
    }
}

function SubmitPlayerName(string PlayerName)
{
    OnlineSubsystemMcts(OnlineSub).RequestNewPlayer(0, LoginName, LoginPassword, PlayerName);
}*/

defaultproperties
{
   Name="Default__GFxTrScene_Login"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
