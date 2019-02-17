class GFxTrPage_FriendActions extends GFxTrPage;

const _JoinInGame = 0;
const _InviteToParty = 1;
const _SendMessage = 2;
const _UpdateNotes = 3;
const _InviteToTribe = 4;
const _RemoveFriend = 5;

var int             FriendActionPopupIndex;
var bool            bWaitingForFriendActionPopup;
var string          TargetPlayer;
var int             TargetPlayerIndex;
var EOnlineState    TargetOnlineState;


function Initialize()
{
    super.Initialize();

    AddActionNumber(_JoinInGame);    
    //AddActionNumber(_InviteToParty);
    AddActionNumber(_SendMessage); 
    //AddActionNumber(_UpdateNotes); 
    //AddActionNumber(_InviteToTribe);
    AddActionNumber(_RemoveFriend);    
}

function RefreshButtons()
{
    FillData(none);

    super.RefreshButtons();
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    local TrEntryPlayerController TrEPC;

    super.TakeFocus(ActionIndex, DataList);
    
    TrEPC = TrEntryPlayerController(GetPC());

    if (TrEPC != none)
    {
        TrEPC.UpdateMainMenuPaperDoll_Mesh(ActionIndex == _RemoveFriend ? CDT_RemoveFriend : CDT_AddFriend);        
    }

    return 0;
}

function FillData(GFxObject DataList)
{
    TargetPlayerIndex = Friends.GetFriendListIndex(TargetPlayer);
    TargetOnlineState = Friends.FriendsList[TargetPlayerIndex].OnlineState;
    PageLabelOverride = TargetPlayer;
    
    if(TargetPlayerIndex >= 0)
    {
        switch (TargetOnlineState)
        {        
        case EOS_ONLINE:
            PageLabelOverride @= "-"@InLobbyLabel;
            break;
        case EOS_INGAME:
            PageLabelOverride @= "-"@InGameLabel;
            break;
        default:
            PageLabelOverride @= "-"@OfflineLabel;
        }        
    }
    else
    {
        PageLabelOverride = TargetPlayer;
    }
    
    if (DataList != none)
    {
        super.FillData(DataList);
    }
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);

    if(PageActions[ActionIndex].ActionNumber == _JoinInGame)
    {
        obj.SetFloat("bLocked", TargetOnlineState == EOS_INGAME ? 0 : 1);
    }
    else if(PageActions[ActionIndex].ActionNumber != _RemoveFriend)
    {
        obj.SetFloat("bLocked", TargetOnlineState ==  EOS_OFFLINE ? 1 : 0);
    }        
    return obj;
}

function SpecialAction(GFxTrAction Action)
{
    TargetPlayerIndex = Friends.GetFriendListIndex(TargetPlayer);
    TargetOnlineState = Friends.FriendsList[TargetPlayerIndex].OnlineState;

    FriendActionPopupIndex = Action.ActionNumber;
    switch(FriendActionPopupIndex)
    {
    case _JoinInGame:
        if(TargetOnlineState == EOS_INGAME)
        {
            QueueManager.JoinFriend(TargetPlayer, "");
        }
        break;
    case _SendMessage:
        if(TargetOnlineState == EOS_OFFLINE)
        {
            break;
        }
    case _RemoveFriend:
        bWaitingForFriendActionPopup = true;
        QueuePopup();
        break;
    }
}
    
function PopupData(GFxObject Obj)
{
    if (FriendActionPopupIndex == _SendMessage)
    {
        Obj.SetString("popupTitle", "@"$TargetPlayer);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);  
    }    
    else if (FriendActionPopupIndex == _RemoveFriend)
    {   
        Obj.SetString("popupTitle", Pages.FriendsPage.RemoveFriendTitle);
        Obj.SetString("popupBody", Pages.FriendsPage.RemoveFriendTitle@TargetPlayer$"?");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("type", 0);
        Obj.SetFloat("enterKeyIndex", 1);        
    }    
}

function PopupComplete(int Action, string TextInput)
{
    local TrPlayerController TrPC;    

    if (bWaitingForFriendActionPopup)
    {
        bWaitingForFriendActionPopup = false;        
        if (FriendActionPopupIndex == _SendMessage)
        {
            TrPC = TrPlayerController(GetPC());
            TrPC.SendPrivateChatMessage(TargetPlayer, TextInput);
        }
        else if (FriendActionPopupIndex == _RemoveFriend)
        {
            if (Action == 1)
            {
                Friends.RemoveFriend(TargetPlayer);
                Pages.PopPage();              
            }
        }
    }
}

defaultproperties
{
   PageLabel="FRIEND ACTIONS"
   OptionTitles(0)="JOIN IN GAME"
   OptionTitles(1)="SEND MESSAGE"
   OptionTitles(2)="REMOVE FRIEND"
   OptionSubtext(0)="SELECT TO JOIN"
   OptionSubtext(1)="SELECT TO SEND MESSAGE"
   OptionSubtext(2)="SELECT TO REMOVE"
   Name="Default__GFxTrPage_FriendActions"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
