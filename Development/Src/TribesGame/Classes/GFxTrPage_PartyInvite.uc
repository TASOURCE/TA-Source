class GFxTrPage_PartyInvite extends GFxTrPage;

var int    PopupNum;
var int    Action_ByName;
var int    Action_InviteSent;
var int    Action_SendMessage;
var int    Action_InviteFailed;
var string MemberName;

var array<string> ShownFriends;

function FillData(GFxObject DataList)
{
    local int i;
    local int count;

    ClearActions();
    AddActionNumber(Action_ByName);

    if (Friends.FriendsList.Length > MAX_FRIENDS_DISPLAYED)
    {
        count = MAX_FRIENDS_DISPLAYED;
    }
    else
    {
        count = Friends.FriendsList.Length;
    }

    for (i = ShownFriends.Length; i > 0; i--)
    {
        ShownFriends.Remove(i-1, 1);
    }

    for (i = 0; i < count; i++)
    {
        if (Friends.FriendsList[i].OnlineState == EOS_ONLINE || 
            Friends.FriendsList[i].OnlineState == EOS_INGAME)
        {
            AddAction();
            ShownFriends.AddItem(Friends.FriendsList[i].PlayerName);
            ResetRunaway();
        }
    }

    super.FillData(DataList);
}

function SpecialAction(GFxTrAction Action)
{
    local int i;

    if (Action.ActionNumber == Action_ByName)
    {
        PopupNum = Action_ByName;
        QueuePopup();
        return;
    }

    i = Friends.GetFriendListIndex(ShownFriends[Action.ActionIndex-1]);

    if (Friends.FriendsList[i].OnlineState == EOS_ONLINE)
    {
        MemberName = ShownFriends[Action.ActionIndex-1];
        PartyManager.SendInvite(MemberName);
        PopupNum = Action_InviteSent;
        QueuePopup();
    }
}

function PopupData(GFxObject Obj)
{
    if (PopupNum == Action_ByName)
    {        
        Obj.SetString("popupTitle", Strings.InviteByName);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);
    }
    else if (PopupNum == Action_InviteSent)
    {        
        Obj.SetString("popupTitle", Strings.InviteSent);
        Obj.SetString("popupBody", Strings.InvitationSentTo@"'"$MemberName$"'.");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetFloat("type", 0);
        Obj.SetFloat("enterKeyIndex", 1);
    }
    else if (PopupNum == Action_InviteFailed)
    {        
        Obj.SetString("popupTitle", Strings.InviteFailed);
        Obj.SetString("popupBody", Strings.CouldNotFindPlayer@"'"$MemberName$"'.");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetFloat("type", 0);
        Obj.SetFloat("enterKeyIndex", 1);
    }
    else if (PopupNum == Action_SendMessage)
    {        
        Obj.SetString("popupTitle", Strings.SendMessage);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (PopupNum == Action_ByName)
    {
        PopupNum = INDEX_NONE;

        if (Action == 1)
        {
            if (TextInput != "")
            {
                MemberName = TextInput;

                if (PartyManager.SendInvite(TextInput))
                {
                    PopupNum = Action_InviteSent;
                }
                else
                {
                    PopupNum = Action_InviteFailed;
                }

                QueuePopup();
            }
        }
    }
    else if (PopupNum == Action_SendMessage)
    {
        PopupNum = INDEX_NONE;

        if (Action == 1)
        {
            TrPlayerController(GetPC()).SendPrivateChatMessage(MemberName, TextInput);
        }
    }
    else
    {
        PopupNum = INDEX_NONE;
    }
    
    MemberName = "";
}

function GFxObject FillOption(int ActionIndex)
{
    local int i;
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("bLocked", 0);
    obj.SetFloat("actionID", ActionIndex);

    if (PageActions[ActionIndex].ActionNumber == Action_ByName)
    {
        obj.SetString("itemTitle", OptionTitles[ActionIndex]);
        obj.SetString("itemSubTitle", "");
        return obj;
    }

    i = Friends.GetFriendListIndex(ShownFriends[ActionIndex-1]);

    if (Friends.FriendsList[i].OnlineState == EOS_INGAME)
    {
        obj.SetFloat("bLocked", 1);
        obj.SetString("itemTitle", ShownFriends[ActionIndex-1]);
        obj.SetString("itemSubTitle", Strings.InGame);
    }
    else
    {
        obj.SetString("itemTitle", ShownFriends[ActionIndex-1]);
        obj.SetString("itemSubTitle", Strings.Online);
    }

    return obj;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);

    CheckPricing(DataList);

    return 0;
}

function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_PRICE);

    priceObj = FillPricing(DataList);

    obj.SetObject("data", priceObj);
    DataList.SetElementObject(DataCount++, obj);

    return true;
}

function GFxObject FillPricing(GFxObject DataList)
{
    local GFxObject obj;

    if (bFillingFocus)
    {
        return none;
    }

    if (Pages.FocusIndex <= 0 || PartyManager.GetMemberId(Pages.FocusIndex) == PlayerProfile.PlayerId)
    {
        return none;
    }

    obj = CreateObject("Object");

    obj.SetString("actionLabel", Caps(Strings.SendMessage));
    obj.SetFloat("bUpgradeType", 3);

    return obj;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    MemberName = ShownFriends[ActionIndex-1];
    PopupNum = Action_SendMessage;
    QueuePopup();

    return 0;
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_JoinGame);
}

defaultproperties
{
   PopupNum=-1
   Action_ByName=1
   Action_InviteSent=2
   Action_SendMessage=3
   Action_InviteFailed=4
   PageLabel="INVITE MEMBERS"
   OptionTitles(0)="INVITE BY NAME"
   Name="Default__GFxTrPage_PartyInvite"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
