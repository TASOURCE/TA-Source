class TrLoginManager extends Object within GFxTrMenuMoviePlayer
    native;

var bool   bRemember;
var bool   bWaitingForLoginWaitPopup;
var string LoginName;
var string LoginPassword;

function Initialize()
{
	//if (OnlineSub.PlayerInterface != none)
	//{
	    //OnlineSub.PlayerInterface.AddLoginFailedDelegate(0,OnUserLoginFailed);
	//}
}

function bool Login(string userName, string password, bool bShouldRemember)
{
    if (!bStartupCompleted)
    {
        return false;
    }

    bRemember = bShouldRemember;
    LoginName = userName;
    LoginPassword = password;

    if (OnlineSub.PlayerInterface.GetLoginStatus(GetLP().ControllerId) == LS_LoggedIn)
    {
        return true;
    }

    if (userName != "")
    {
        LoginWaitPopup();
    }

    return (OnlineSub.PlayerInterface.Login(0, LoginName, LoginPassword, false));
}

function OnUserLoginFailed(byte LocalUserNum,EOnlineServerConnectionStatus ErrorCode)
{
    local string error;

    if (!bCreatingNewPlayer)
    {
        switch (ErrorCode)
        {
        case OSCS_NotConnected: error = "Cannot connect to server. Please wait and try again shortly."; break;
        case OSCS_InvalidUser:  error = "Invalid username or password given. Try again.";               break;
        default:                error = string(ErrorCode);                                              break;
        }

        SendPlayerLogin("Unknown", error, false);
    }
}

function RetryLogin()
{
    OnlineSub.PlayerInterface.Login(0, LoginName, LoginPassword, false);
}

function Logout()
{
    if (bInGame)
    {
        QueueManager.LeaveMatchmaking();
    }

    if (!OnlineSubsystemMcts(OnlineSub).Logout(0))
    {
        ;
    }
    else
    {
        bInGame        = false;
        bFullyLoaded   = false;
        bProfileLoaded = false;
        LoginSuccess   = false;
        LoginReason    = "";
        LoginPlayer    = "";
        
        //Pages.PushOpenLogin();
    }
}

function SubmitPlayerName(string PlayerName)
{
    OnlineSubsystemMcts(OnlineSub).RequestNewPlayer(0, LoginName, LoginPassword, PlayerName);
}

function LoginWaitPopup()
{
    bWaitingForLoginWaitPopup = true;
    QueuePopup();
}

function PopupData(GFxObject Obj)
{
    if (bWaitingForLoginWaitPopup)
    {
        bWaitingForLoginWaitPopup = false;

        Obj.SetFloat("type", 0);
        Obj.SetString("popupTitle", Strings.LoggingIn);
        Obj.SetString("popupBody", Strings.PleaseWait$"...");
    }
}

defaultproperties
{
   Name="Default__TrLoginManager"
   ObjectArchetype=Object'Core.Default__Object'
}
