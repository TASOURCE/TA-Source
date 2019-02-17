class GFxTrFront_Party extends Object within GFxTrFront;
/* DEPRECATED
var TrPartySettings     PartySettings;


function UiUpdatePartyMembers()
{
	local int i;
    local LocalPlayer lp;
    local OnlinePartyMember G;

	lp = GetLP();
	AsUpdatePlayer(0, lp.GetNickname(), "General", 100, true, true, 1);

	i = 1;
	ForEach PartySettings.MemberList(G)
	{
		AsUpdatePlayer(i++, G.NickName, "General", 100, true, true, G.LocalUserNum);
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




defaultproperties
{    
}

*/

defaultproperties
{
   Name="Default__GFxTrFront_Party"
   ObjectArchetype=Object'Core.Default__Object'
}
