class GFxTrPage_PartyAction extends GFxTrPage;

const Action_AddFriend   = 1;
const Action_SendMessage = 2;
const Action_KickMember  = 3;

var int    PopupNum;
var string MemberName;

function FillData(GFxObject DataList)
{
    ClearActions();

    if (!Friends.IsFriend(MemberName))
    {
        AddActionNumber(Action_AddFriend);
    }

    AddActionNumber(Action_SendMessage);

    if (PartyManager.AmLeader())
    {
        AddActionNumber(Action_KickMember);
    }
    
    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    if (PageActions[ActionIndex].ActionNumber == Action_AddFriend)
    {
        obj.SetString("itemTitle", Strings.Add@Strings.Friend);
        obj.SetString("itemSubTitle", "");
    }
    else if (PageActions[ActionIndex].ActionNumber == Action_SendMessage)
    {
        obj.SetString("itemTitle", Strings.SendMessage);
        obj.SetString("itemSubTitle", "");
    }
    else if (PageActions[ActionIndex].ActionNumber == Action_KickMember)
    {
        obj.SetString("itemTitle", Strings.KickFromParty);
        obj.SetString("itemSubTitle", "");
    }

    return obj;
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (PageActions[ActionIndex].ActionNumber == Action_AddFriend)
    {
        Friends.AddFriend(MemberName);
        PopupNum = Action_AddFriend;
        QueuePopup();
    }
    else if (PageActions[ActionIndex].ActionNumber == Action_SendMessage)
    {
        PopupNum = Action_SendMessage;
        QueuePopup();
    }
    else if (PageActions[ActionIndex].ActionNumber == Action_KickMember)
    {
        PartyManager.Kick(MemberName);
        ActionIndex = GoBack;
    }

    if (ActionIndex == GoBack)
    {
        Pages.PopPage().FillData(DataList);
        return GoBack;
    }

    return 0;
}

function PopupData(GFxObject Obj)
{
    if (PopupNum == Action_SendMessage)
    {        
        Obj.SetString("popupTitle", Strings.SendMessage);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);
    }
    else if (PopupNum == Action_AddFriend)
    {        
        Obj.SetString("popupTitle", Strings.Added@Strings.Friend);
        Obj.SetString("popupBody", Strings.AddedNewFriend@"'"$MemberName$"'.");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 0);
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
             TrPlayerController(GetPC()).SendPrivateChatMessage(MemberName, TextInput);
        }
    }
}

defaultproperties
{
   PageLabel="MEMBER ACTIONS"
   Name="Default__GFxTrPage_PartyAction"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
