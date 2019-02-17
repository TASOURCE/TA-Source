class GFxTrPage_PlayNow extends GFxTrPage;

const QUI_CTF = 10350;
const QUI_TeamRabbit = 10351;
const QUI_Arena = 10352;
const QUI_Rabbit = 10353;
const QUI_Special = 10354;
const QUI_CaptureAndHold = 10377;

var localized string ComingSoonSubtext;
var localized string CustomServerSubtext;
var localized string JoinFriendSubLabel;
var localized string JoinFriendInGameSubLabel;
var localized string JoinFriendLabel;
var localized string CustomServerLabel;
var localized string RankedLabel;
var localized string RegionsLabel;
var localized string RegionsSubtext;
var localized string NoFriendsOnlineLabel;
var localized string SeasonUpcomingSubtext;

function int GetMeshEnumFromVV(int inVal)
{
    switch(inVal)
    {
    case QUI_CTF:
        return CDT_CTF;
    case QUI_TeamRabbit:
        return CDT_TeamDeathMatch;
    case QUI_Arena:
        return CDT_Arena;        
    case QUI_CaptureAndHold:
        return CDT_CaptureAndHold;
    }
    return CDT_PlayNow;
}

function Initialize()
{
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionPage == Pages.FriendJoinPage)
    {
        return;
    }

    if (Action.ActionNumber > 0)
    {
        QueueManager.bJoiningCustom = false;
        QueueManager.JoinQueue(Action.ActionNumber);
    }
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex != GoBack && PageActions[ActionIndex].ActionPage == Pages.RankedMatchPage)
    {
        return 0;
    }
    
    return super.TakeAction(ActionIndex, DataList);
}

function RefreshButtons()
{
    FillData(none);

    super.RefreshButtons();
}

function FillData(GFxObject DataList)
{
    local int i;    

    bQueueListDirty = true;
    if(bQueueListDirty)
    {
        for (i = PageActions.Length; i > 0; i--)
        {
            PageActions.Remove(i-1, 1);
        }
    
        GetQueueUIInfo();
        RemoveDuplicateQueues();        
        QueueManager.RequestCustomServers();

        for(i=0;i<QueueUIList.length;i++)
        {
            AddActionNumber(QueueUIList[i].queueId);        
        }
        
        AddActionPage(Pages.CustomMatchPage);
        AddActionPage(Pages.RegionSettingsPage);
        AddActionPage(Pages.FriendJoinPage);

        super.FillData(DataList);
        bQueueListDirty = false;     
    }
}

function RemoveDuplicateQueues()
{
    local int i;

    for (i = QueueUIList.Length; i > 0; i--)
    {
        if (HaveDuplicates(i-1))
        {
            if (PlayerProfile.Rank < QueueUIList[i-1].LevelMin || PlayerProfile.Rank > QueueUIList[i-1].LevelMax)
            {
                QueueUIList.Remove(i-1, 1);
            }
        }
    }
}

function bool HaveDuplicates(int Index)
{
    local int i;

    for (i = 0; i < QueueUIList.Length; i++)
    {
        if (i == Index)
        {
            continue;
        }

        if (QueueUIList[i].Title == QueueUIList[Index].Title)
        {
            return true;
        }
    }

    return false;
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;    
    local QueueUIData data;
    local int count;

    obj = super.FillOption(ActionIndex);

    if(ActionIndex < QueueUIList.Length)
    {
        //`log("Filling option"@ActionIndex);
        data = QueueUIList[ActionIndex];

        if (data.Title == "CTF Blitz")
        {
            data.bShowRibbon = true;
            data.Subtitle = Strings.FlagsMoveEveryCap;
            data.RibbonText = Strings.Featured;
        }

        obj.SetString("itemTitle", Caps(data.Title));
        if(data.bAvailable)
        {
            obj.SetString("itemSubTitle", Caps(data.Subtitle));
        }
        else
        {
            obj.SetString("itemSubTitle", Strings.AvailableAtLevel@data.LevelMin);
        }
        obj.SetFloat("bLocked", data.bAvailable ? 0 : 1);

        //TAG=DYNAMIC_FIRST note, this works because the "fixed" action pages come last    
        obj.SetFloat("hasRibbon", data.bShowRibbon ? 1 : 0);

        if(data.bShowRibbon)
        {
            obj.SetFloat("ribbonType", data.ribbonType);
            obj.SetString("itemRibbonLabel", Caps(data.RibbonText));        
        }   
    }
    else
    {
        if(PageActions[ActionIndex].ActionPage == Pages.CustomMatchPage)
        {
            obj.SetString("itemTitle", Caps(CustomServerLabel));
            obj.SetString("itemSubTitle", Caps(CustomServerSubtext));
        }
        else if(PageActions[ActionIndex].ActionPage == Pages.RankedMatchPage)
        {
            obj.SetString("itemTitle", Caps(RankedLabel));
            obj.SetString("itemSubTitle", Caps(SeasonUpcomingSubtext));    
            obj.SetFloat("bLocked", 1);
        }
        else if(PageActions[ActionIndex].ActionPage == Pages.FriendJoinPage)
        {
            count = Friends.GetInGameFriendCount();

            if(count > 0)
            {                
                obj.SetFloat("hasRibbon", 1);
                obj.SetFloat("ribbonType", 2);
                obj.SetString("itemRibbonLabel", count@InGameLabel);
                obj.SetString("itemSubTitle", Caps(JoinFriendInGameSubLabel));                                
            }
            else
            {
                count = Friends.GetOnlineFriendCount();
                if (count > 0)
                {                    
                    obj.SetFloat("hasRibbon", 1);
                    obj.SetFloat("ribbonType",1);
                    obj.SetString("itemRibbonLabel", count@OnlineLabel);
                    obj.SetString("itemSubTitle", Caps(JoinFriendSubLabel)); 

                }
                else
                {
                    obj.SetString("itemSubTitle", Caps(NoFriendsOnlineLabel));                    
                    obj.SetFloat("hasRibbon", 0);
                }
            }
            obj.SetString("itemTitle", Caps(JoinFriendLabel));
            
        }
        else if (PageActions[ActionIndex].ActionPage == Pages.RegionSettingsPage)
        {
            obj.SetString("itemTitle", Caps(RegionsLabel));
            obj.SetString("itemSubTitle", Caps(RegionsSubtext));    
            obj.SetFloat("bLocked", 0);
        }
    }

    return obj;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    local TrEntryPlayerController TrEPC;    

    super.TakeFocus(ActionIndex, DataList);
    
    TrEPC = TrEntryPlayerController(GetPC());

    if (TrEPC != none)
    {
        if(PageActions[ActionIndex].ActionPage == Pages.CustomMatchPage)
        {
            TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_PrivateServer); 
        }
        else if(PageActions[ActionIndex].ActionPage == Pages.RankedMatchPage)
        {
            TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_RankedMatch);
        }
        else if(PageActions[ActionIndex].ActionPage == Pages.FriendJoinPage)
        {
            TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_JoinGame); 
        }
        else if(ActionIndex < QueueUIList.Length)// && QueueUIList[ActionIndex].contentIndex < EContentDataType.length)
        {   //TAG=DYNAMIC_FIRST                  
            TrEPC.UpdateMainMenuPaperDoll_Mesh(EContentDataType(GetMeshEnumFromVV(QueueUIList[ActionIndex].contentIndex)));
        }
        else
        {
            TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_PlayNow);
        }        
    }

    return 0;
}

defaultproperties
{
   ComingSoonSubtext="COMING SOON"
   CustomServerSubtext="PLAY AND MANAGE"
   JoinFriendSubLabel="NO FRIENDS IN GAME"
   JoinFriendInGameSubLabel="GAMES IN PROGRESS"
   JoinFriendLabel="JOIN FRIENDS"
   CustomServerLabel="CUSTOM SERVERS"
   RankedLabel="RANKED MATCH"
   RegionsLabel="CHANGE REGION"
   RegionsSubtext="CHANGE SERVER REGION"
   NoFriendsOnlineLabel="NO FRIENDS ONLINE"
   SeasonUpcomingSubtext="NEW SEASON STARTING SOON"
   PageLabel="PLAY NOW"
   Name="Default__GFxTrPage_PlayNow"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
