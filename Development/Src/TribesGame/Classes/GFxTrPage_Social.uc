class GFxTrPage_Social extends GFxTrPage;

var localized string FriendsOnlineSubtext;
var localized string FriendsOfflineSubtext;
var localized string FollowersOnlineSubtext;

function Initialize()
{
    super.Initialize();

    AddActionPage(Pages.ProfilePage);
    AddActionPage(Pages.FriendsPage);
    AddActionPage(Pages.FollowersPage);    
    AddActionString("https://account.hirezstudios.com/tribesingameredirect.aspx?dest=REFER");    
    AddActionPage(Pages.BlockedPlayersPage);
}

function SpecialAction(GFxTrAction Action)
{
    if(Action.ActionString != "")
    {
        Browser.OpenURL(Action.ActionString);
    }
    else
    {
        Super.SpecialAction(Action);
    }
}

function GFxObject FillOption(int ActionIndex)
{
    local int count;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionPage == Pages.FriendsPage)
    {
        count = Friends.GetOnlineFriendCount();

        if (count > 0)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetString("itemRibbonLabel", count@Strings.Online);
            obj.SetString("itemSubTitle", FriendsOnlineSubtext);
        }
        else
        {
            obj.SetFloat("hasRibbon", 0);            
            obj.SetString("itemRibbonLabel", "");
            obj.SetString("itemSubTitle", FriendsOfflineSubtext);
        }
    }
    else if(PageActions[ActionIndex].ActionPage == Pages.FollowersPage)
    {
        count = Friends.GetOnlineFollowerCount();

        if (count > 0)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetString("itemRibbonLabel", count@Strings.Online);            
            
        }
        else
        {
            obj.SetFloat("hasRibbon", 0);            
            obj.SetString("itemRibbonLabel", "");                       
        }
        obj.SetString("itemSubTitle", "");
        obj.SetString("itemSubTitle", FollowersOnlineSubtext);
    }

    return obj;
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_AddFriend);
}

defaultproperties
{
   FriendsOnlineSubtext="JOIN FRIENDS"
   FriendsOfflineSubtext="FOLLOW PLAYERS"
   FollowersOnlineSubtext="OTHERS FRIENDING YOU"
   PageLabel="SOCIAL"
   OptionTitles(0)="PROFILE"
   OptionTitles(1)="FRIENDS"
   OptionTitles(2)="FOLLOWERS"
   OptionTitles(3)="REFER-A-FRIEND"
   OptionTitles(4)="BLOCKED PLAYERS"
   OptionSubtext(0)="VIEW STATS AND PROGRESSION"
   OptionSubtext(1)="ADD AND JOIN FRIENDS"
   OptionSubtext(2)="VIEW YOUR FANS"
   OptionSubtext(3)="EARN REWARDS BY BRINGING PEOPLE TO TRIBES"
   OptionSubtext(4)="BLOCK AND UNBLOCK PLAYERS"
   Name="Default__GFxTrPage_Social"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
