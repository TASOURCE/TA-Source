class TrPartyManager extends Object within GFxTrMenuMoviePlayer
    native;

var bool   bCreatedParty;
var string InvitingPlayer;

native function int    GetMemberId(int Index);
native function int    GetMemberCount();
native function int    GetMemberCap();
native function bool   InParty();
native function bool   AmLeader();
native function bool   CanInvite();
native function bool   Leave();
native function bool   Kick(string PlayerName);
native function bool   SendInvite(string PlayerName);
native function bool   ActiveMember(int Index);
native function bool   AcceptInvite();
native function string GetLeaderName();
native function string GetMemberName(int Index);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function Initialize()
{
}

event ShowInvitation(string LeaderName)
{
    InvitingPlayer = LeaderName;
    bInvitationPopup = true;
    QueuePopup();
}

function InvitationPopup(GFxObject Obj)
{
    Obj.SetFloat("type", 0);
    Obj.SetString("popupTitle", Strings.PartyInvite);
    Obj.SetString("popupBody", InvitingPlayer@Strings.InvitesYouToJoinAParty);
    Obj.SetString("buttonLabel1", Strings.Accept);
    Obj.SetString("buttonLabel2", Strings.Decline);
    Obj.SetString("buttonLabel3", Strings.Block);
    Obj.SetFloat("enterKeyIndex", 0);
}

function InvitationComplete(int Action)
{
    if (Action == 0)
    {
        //TrPlayerController(GetPC()).StartSendMenuBackTimer();
        PartyManager.AcceptInvite();
    }
    else if (Action == 1)
    {
        PartyManager.LeaveParty();
    }
    else
    {
        Friends.IgnoreFriend(InvitingPlayer, true);
    }
}

event OnUpdate()
{
    if (!bMovieIsOpen || bLoading)
    {
        return;
    }

    if (!bCreatedParty && GetMemberCount() == 0)
    {
        if (Pages.GetActivePage() != Pages.MainPage &&
            Pages.GetActivePage() != Pages.GamePage)
        {
            Pages.TravelToMain();
        }
    }
    else if (Pages.GetActivePage() == Pages.PartyPage ||
             Pages.GetActivePage() == Pages.PartyInvitePage ||
             Pages.GetActivePage() == Pages.PartyMemberPage)
    {
        RefreshPage();
    }
}

function LeaveParty(optional bool bHandle = true)
{
    bCreatedParty = false;

    Leave();

    if (!bHandle)
    {
        return;
    }

    if (Pages.GetActivePage() == Pages.PartyPage ||
        Pages.GetActivePage() == Pages.PartyInvitePage ||
        Pages.GetActivePage() == Pages.PartyMemberPage)
    {
        Pages.TravelToMain();
    }
}

defaultproperties
{
   Name="Default__TrPartyManager"
   ObjectArchetype=Object'Core.Default__Object'
}
