class GFxTrView_MatchMake extends GFxTrFront_View;
/* DEPRECATED
var bool                bInitialized;
var bool                bConsole;
var TrPartySettings     PartySettings;
var TrMakeQuickMatch    QuickMatch;

/** Cached online subsystem variable */
var OnlineSubsystem OnlineSub;

var GFxClikWidget MenuItem1;

function ASonEnterMenu() 
{     
    ActionScriptVoid("onEnterMenu"); 
}


function noticeViewReady()
{
    `log("####**** Main Menu Ready");
}

function noticeViewClosed()
{
    `log("####**** Main Menu Closed");
}

function OnViewActivated()
{
    Advance(0);

    Super.OnViewActivated();


    SetVisible(true);
    ASonEnterMenu();
}


function UiUpdatePartyMembers()
{
    local OnlinePartyMember G;

	ForEach PartySettings.MemberList(G)
	{
        AsAddMember(G.LocalUserNum, G.NickName, 100, true, G.bIsLocal);
    }
}


function RegisterGamerParty()
{
    local LocalPlayer lp;

	if (OnlineSub != None && OnlineSub.GameInterface != None)
	{
        lp = GetLP();

		// Create the default settings to get the standard settings to advertise
        PartySettings = new class'TrPartySettings';
        PartySettings.OwningPlayerName = lp.GetNickname();
        PartySettings.OwningPlayerId = lp.GetUniqueNetId();

        `log("Added player to gamer party"@PartySettings.OwningPlayerName,,'DevOnline');

		// Register the delegate so we can see when it's done
		OnlineSub.GameInterface.AddCreateOnlineGameCompleteDelegate(OnPartyCreateComplete);

		// Now kick off the async publish
		if (!OnlineSub.GameInterface.CreateOnlineGame(0, 'GamerParty', PartySettings))
		{
			OnlineSub.GameInterface.ClearCreateOnlineGameCompleteDelegate(OnPartyCreateComplete);
		}
	}
	else
	{
		`Warn("No party settings to register with the online service. Party won't be advertised");
	}
}

/**
 * Notifies us of the game being registered successfully or not
 *
 * @param SessionName the name of the session that was created
 * @param bWasSuccessful flag telling us whether it worked or not
 */
function OnPartyCreateComplete(name SessionName,bool bWasSuccessful)
{
	OnlineSub.GameInterface.ClearCreateOnlineGameCompleteDelegate(OnPartyCreateComplete);

	if (bWasSuccessful == false)
	{
		`Warn("Failed to register party with online service.");
	}
	else
	{
        UiUpdatePartyMembers();
    }
}


function LaunchQuickMatch()
{
    if (QuickMatch != None)
    {
        return;
    }

    QuickMatch = new class'TrMakeQuickMatch';
    QuickMatch.Init(GetLP().ControllerId, CONTEXT_GAME_MODE_TRCTF);
    QuickMatch.Launch();

    return;
}

function OnEscapeKeyPress()
{    
//	Select_ExitGame();
}

function OnMenuItem1(GFxClikWidget.EventData ev)
{
    `log("###** Click press");
}


///////////////////////////////////////////////////////////////////////////////
// Action script interface function wrappers
final function AsAddMember(int nId, String TagName, int nScore, bool bOwner, bool bLocal)
{
    ActionScriptVoid("addMember");
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget) 
{
	switch(WidgetName)
	{
	case ('mainmenu1'):
		MenuItem1 = GFxClikWidget(Widget);
		MenuItem1.RemoveAllEventListeners("CLIK_press");
		MenuItem1.AddEventListener('CLIK_press', OnMenuItem1);
		break;

	default:
//		return (Super.WidgetInitialized(WidgetName, WidgetPath, Widget));
        break;
	}

    return (true);
}
///////////////////////////////////////////////////////////////////////////////

defaultproperties
{    
	SubWidgetBindings.Add((WidgetName="mainmenu1",WidgetClass=class'GFxClikWidget'))
}

*/

defaultproperties
{
   Name="Default__GFxTrView_MatchMake"
   ObjectArchetype=GFxTrFront_View'TribesGame.Default__GFxTrFront_View'
}
