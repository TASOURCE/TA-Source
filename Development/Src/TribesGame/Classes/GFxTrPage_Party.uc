class GFxTrPage_Party extends GFxTrPage;

var int PopupNum;
var int Action_Leave;
var int Action_SendMessage;

function Initialize()
{
    AddActionPage(Pages.PlayNowPage);
    AddActionPage(Pages.PartyInvitePage);
    AddActionPage(Pages.PartyMemberPage);
    AddActionNumber(Action_SendMessage);
    AddActionNumber(Action_Leave);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);
    obj.SetString("itemTitle", OptionTitles[ActionIndex]);
    obj.SetString("itemSubTitle", "");
    
    if (PageActions[ActionIndex].ActionPage == Pages.PlayNowPage)
    {
        if (bInGame)
        {
            obj.SetFloat("bLocked", 1);
            obj.SetString("itemTitle", Caps(Strings.InGame));
        }
        else if (QueueManager.bQueued)
        {
            if (PartyManager.AmLeader())
            {
                obj.SetString("itemTitle", Strings.Leave@Strings.Queue);
            }
            else
            {
                obj.SetString("itemTitle", Strings.InQueue);
            }

            obj.SetString("itemSubTitle", Strings.SearchingForAMatch@"...");
        }
        else if (!PartyManager.AmLeader())
        {
            obj.SetFloat("bLocked", 1);
            obj.SetString("itemSubTitle", Strings.LeaderOnly);
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.PartyInvitePage)
    {
        if (bInGame)
        {
            obj.SetFloat("bLocked", 1);
            obj.SetString("itemSubTitle", Strings.Locked@Strings.InGame);
        }
        else if (!PartyManager.AmLeader())
        {
            obj.SetFloat("bLocked", 1);
            obj.SetString("itemSubTitle", Strings.LeaderOnly);
        }
        else if (QueueManager.bQueued)
        {
            obj.SetFloat("bLocked", 1);
            obj.SetString("itemSubTitle", Strings.Locked@Strings.InQueue);
        }
        else if (!PartyManager.CanInvite())
        {
            obj.SetFloat("bLocked", 1);
            obj.SetString("itemSubTitle", Strings.Full@Strings.Party);
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.PartyMemberPage)
    {
        if (PartyManager.GetMemberCap() > 0)
        {
            obj.SetString("itemTitle", OptionTitles[ActionIndex]@"("$PartyManager.GetMemberCount()$"/"$PartyManager.GetMemberCap()$")");
        }
        else
        {
            obj.SetString("itemTitle", OptionTitles[ActionIndex]@"("$PartyManager.GetMemberCount()$")");
        }
    }

    return obj;
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    local GFxTrPage page;

    if (ActionIndex == GoBack)
    {
        Pages.PopPage().FillData(DataList);
        return GoBack;
    }

    if (PageActions[ActionIndex].ActionNumber == Action_Leave)
    {
        PartyManager.LeaveParty(false);

        page = Pages.PopPage();

        if (page == Pages.GamePage)
        {
            Pages.GamePage.bRemovePartyTemp = true;
        }

        page.FillData(DataList);
        return GoBack;
    }

    if (PageActions[ActionIndex].ActionNumber == Action_SendMessage)
    {
        PopupNum = Action_SendMessage;
        QueuePopup();
        return 0;
    }

    if (PageActions[ActionIndex].ActionPage == Pages.PlayNowPage)
    {
        if (bInGame || !PartyManager.AmLeader())
        {
            return 0;
        }
        else if (QueueManager.bQueued)
        {
            QueueManager.LeaveMatchmaking();
            FillData(DataList);
            return 0;
        }
    }

    if (PageActions[ActionIndex].ActionPage == Pages.PartyInvitePage)
    {
        if (bInGame || QueueManager.bQueued || !PartyManager.CanInvite())
        {
            return 0;
        }
    }

    PageActions[ActionIndex].ActionPage.FillData(DataList);
    return 1;
}

function PopupData(GFxObject Obj)
{
    if (PopupNum == Action_SendMessage)
    {        
        Obj.SetString("popupTitle", "SEND PARTY MESSAGE");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (PopupNum == Action_SendMessage)
    {
        PopupNum = INDEX_NONE;

        if (Action == 1)
        {
            TrPlayerController(GetPC()).BroadcastChatMessage(GC_CC_PARTY, TextInput);
        }
    }   
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_PrivateServer);
}

defaultproperties
{
   Action_Leave=1
   Action_SendMessage=2
   PageLabel="PARTY"
   OptionTitles(0)="JOIN QUEUE"
   OptionTitles(1)="INVITE MEMBERS"
   OptionTitles(2)="MEMBERS"
   OptionTitles(3)="SEND PARTY MESSAGE"
   OptionTitles(4)="LEAVE PARTY"
   Name="Default__GFxTrPage_Party"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
