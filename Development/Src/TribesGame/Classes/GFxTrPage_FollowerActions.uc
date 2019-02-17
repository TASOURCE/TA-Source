class GFxTrPage_FollowerActions extends GFxTrPage;

const _AddAsFriend = 0;
const _JoinInGame = 1;
const _InviteToParty = 2;
const _SendMessage = 3;
const _UpdateNotes = 4;
const _InviteToTribe = 5;
const _BlockPlayer = 6;

var int             FriendActionPopupIndex;
var bool            bWaitingForFriendActionPopup;
var string          TargetPlayer;
var int             TargetPlayerIndex;
var EOnlineState    TargetOnlineState;
var localized string AlreadyFriendText;


function Initialize()
{
    super.Initialize();

    AddActionNumber(_AddAsFriend);
    AddActionNumber(_JoinInGame);    
    //AddActionNumber(_InviteToParty);
    AddActionNumber(_SendMessage); 
    //AddActionNumber(_UpdateNotes); 
    //AddActionNumber(_InviteToTribe);
    AddActionNumber(_BlockPlayer);    
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
        TrEPC.UpdateMainMenuPaperDoll_Mesh(ActionIndex == _BlockPlayer ? CDT_RemoveFriend : CDT_AddFriend);        
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

    if(PageActions[ActionIndex].ActionNumber == _AddAsFriend)
    {
        if(Friends.IsFriend(TargetPlayer))
        {
            obj.SetFloat("bLocked", 1);
            obj.SetString("itemSubTitle", AlreadyFriendText);
        }
        else
        {
            obj.SetFloat("bLocked", 0);
            obj.SetString("itemSubTitle", "");
        }        
    }
    else if(PageActions[ActionIndex].ActionNumber == _JoinInGame)
    {
        obj.SetFloat("bLocked", TargetOnlineState == EOS_INGAME ? 0 : 1);
    }
    else if(PageActions[ActionIndex].ActionNumber != _BlockPlayer)
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
    case _AddAsFriend:
        if(Friends.IsFriend(TargetPlayer) == false)
        {
            Friends.AddFriend(TargetPlayer);
        }
        break;
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
    case _BlockPlayer:
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
        Obj.SetString("buttonLabel2", OKLabel);
        Obj.SetString("buttonLabel3", CancelLabel);
        Obj.SetFloat("type", 2);
        Obj.SetFloat("enterKeyIndex", 1);  
    }    
    else if (FriendActionPopupIndex == _BlockPlayer)
    {   
        Obj.SetString("popupTitle", Pages.BlockedPlayersPage.BlockOption);
        Obj.SetString("popupBody", Pages.BlockedPlayersPage.BlockOption@TargetPlayer$"?");
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
        else if (FriendActionPopupIndex == _BlockPlayer)
        {
            if (Action == 1)
            {
                Friends.IgnoreFriend(TargetPlayer,true);
                Pages.PopPage();              
            }
        }
    }
}

defaultproperties
{
   AlreadyFriendText="PLAYER ALREADY A FRIEND"
   PageLabel="FRIEND ACTIONS"
   OptionTitles(0)="ADD AS FRIEND"
   OptionTitles(1)="JOIN IN GAME"
   OptionTitles(2)="SEND MESSAGE"
   OptionTitles(3)="BLOCK PLAYER"
   OptionSubtext(0)=
   OptionSubtext(1)="SELECT TO JOIN"
   OptionSubtext(2)="SELECT TO SEND MESSAGE"
   OptionSubtext(3)="SELECT TO BLOCK"
   Name="Default__GFxTrPage_FollowerActions"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
