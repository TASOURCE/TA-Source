class TrPartySettings extends OnlineGameSettings;

var transient OnlineSubsystem           OnlineSub;
var transient OnlinePlayerInterface     PlayerInterface;

var transient array<OnlinePartyMember>  MemberList;


function Init(LocalPlayer InPlayer)
{
	// Figure out if we have an online subsystem registered
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	if (OnlineSub != None)
	{
		// Grab the player interface to verify the subsystem supports it
		PlayerInterface = OnlineSub.PlayerInterface;

		if (PlayerInterface != None)
		{
			// Register that we are interested in any sign in change for this player
			PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
		}
	}
}

function Close()
{
	if (PlayerInterface != None)
	{
		// Clear our delegate
		PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
	}
}

function OnLoginChange(byte LocalUserNum)
{
    local OnlinePartyMember G;
    local bool loggedIn;

    if (PlayerInterface == None)
	{
        return;
    }

    loggedIn = (PlayerInterface.GetLoginStatus(LocalUserNum) > LS_NotLoggedIn);

    ForEach MemberList(G)
	{
        if (G.bIsLocal && G.LocalUserNum == LocalUserNum)
        {
            if (!loggedIn)
            {
            }

            return;
        }
    }

    if (loggedIn)
    {
    }
}

function RefreshMembersList()
{
	if (PlayerInterface != None)
	{
		// Start the async task
//				PlayerInterface.ReadFriendsList(Player.ControllerId);
		;
	}
}

defaultproperties
{
   NumPublicConnections=8
   NumPrivateConnections=8
   bUsesStats=False
   bAllowJoinInProgress=False
   Name="Default__TrPartySettings"
   ObjectArchetype=OnlineGameSettings'Engine.Default__OnlineGameSettings'
}
