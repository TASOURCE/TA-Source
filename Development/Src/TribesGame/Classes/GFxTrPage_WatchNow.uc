class GFxTrPage_WatchNow extends GFxTrPage;

var int NumLiveStreams;
var int NumHiRezVideos;
var int NumTrainVideos;
var int NumCmntyVideos;

var localized string strLiveStreams;
var localized string strHiRezVideos;
var localized string strTrainVideos;
var localized string strCmntyVideos;

var array<int> FeaturedNums;

function Initialize()
{
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_MainMenu);
}

function SpecialAction(GFxTrAction Action)
{
    if (IsFeatured(Action.ActionNumber))
    {
        if (StreamManager.IsStream(Action.ActionNumber))
        {
            StreamManager.ViewStreamIndex(Action.ActionNumber);
        }
        else
        {
            StreamManager.ViewVideoIndex(Action.ActionNumber);
        }
    }
}

function UpdateStreams()
{
    local int i;

    ClearActions();

    for (i = FeaturedNums.Length; i > 0; i--)
    {
        FeaturedNums.Remove(i-1, 1);
    }

    for (i = 0; i < StreamManager.Streams.Length; i++)
    {
        if (StreamManager.Streams[i].bFeatured && 
            StreamManager.Streams[i].Type != VST_NEWS)
        {
            AddActionNumber(i);
            FeaturedNums.AddItem(i);
        }
    }

    AddActionSet(Pages.LiveStreamPage, NumLiveStreams);
    AddActionSet(Pages.HiRezVideoPage, NumHiRezVideos);
    AddActionSet(Pages.TrainVideoPage, NumTrainVideos);
    AddActionSet(Pages.CmntyVideoPage, NumCmntyVideos);
    
    RefreshButtons();
}

function FillData(GFxObject DataList)
{
    StreamManager.CheckForUpdate(true);

    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local int count;
    local int actionNum;
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);

    actionNum = PageActions[ActionIndex].ActionNumber;

    if (IsFeatured(actionNum))
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 3);
        obj.SetString("itemRibbonLabel", Strings.Featured);
        obj.SetString("itemTitle", StreamManager.Streams[actionNum].Title);

        if (StreamManager.Streams[actionNum].Type == VST_TWITCH)
        {
            if (StreamManager.Streams[actionNum].bLive)
            {
                obj.SetString("itemSubTitle", StreamManager.Streams[actionNum].Viewers@"WATCHING");
            }
            else
            {
                obj.SetString("itemSubTitle", Strings.ComingSoon);
            }
        }
        else
        {
            obj.SetString("itemSubTitle", Strings.Video);
        }
    }
    else
    {
        switch (actionNum)
        {
        case NumLiveStreams:
            obj.SetString("itemTitle", strLiveStreams);

            count = StreamManager.GetTypeCountWatching(VST_TWITCH);

            if (count > 50)
            {
                obj.SetFloat("hasRibbon", 1);
                obj.SetFloat("ribbonType", 3);
                obj.SetString("itemRibbonLabel", count@Strings.Viewers);
            }
            
            count = StreamManager.GetTypeCount(VST_TWITCH);
            if (count == 1) obj.SetString("itemSubTitle", count@Strings.Stream);
            else obj.SetString("itemSubTitle", count@Strings.Streams);
            break;
        case NumHiRezVideos:
            obj.SetString("itemTitle", strHiRezVideos);
            count = StreamManager.GetTypeCount(VST_HIREZ);
            if (count == 1) obj.SetString("itemSubTitle", count@Strings.Video);
            else obj.SetString("itemSubTitle", count@Strings.Videos);
            break;
        case NumTrainVideos:
            obj.SetString("itemTitle", strTrainVideos);
            count = StreamManager.GetTypeCount(VST_TRAINING);
            if (count == 1) obj.SetString("itemSubTitle", count@Strings.Video);
            else obj.SetString("itemSubTitle", count@Strings.Videos);
            break;
        case NumCmntyVideos:
            obj.SetString("itemTitle", strCmntyVideos);
            count = StreamManager.GetTypeCount(VST_COMMUNITY);
            if (count == 1) obj.SetString("itemSubTitle", count@Strings.Video);
            else obj.SetString("itemSubTitle", count@Strings.Videos);
            break;
        default:
            obj.SetString("itemTitle", Strings.TrNone);
            obj.SetString("itemSubTitle", "");
            break;
        }
    }

    return obj;
}

function GFxObject FillDescription(GFxObject DataList)
{
    local GFxObject obj;

    if (Pages.FocusIndex < StreamManager.Streams.Length)
    {
        obj = CreateObject("Object");

        obj.SetString("descTitle", StreamManager.GetFeatureName(Pages.FocusIndex));
        obj.SetString("description", StreamManager.GetFeatureDescription(Pages.FocusIndex));
    }

    return obj;
}

function bool IsFeatured(int Num)
{
    local int i;

    for (i = 0; i < FeaturedNums.Length; i++)
    {
        if (Num == FeaturedNums[i])
        {
            return true;
        }
    }

    return false;
}

defaultproperties
{
   NumLiveStreams=1000
   NumHiRezVideos=1001
   NumTrainVideos=1002
   NumCmntyVideos=1003
   strLiveStreams="LIVE STREAMS"
   strHiRezVideos="LATEST FROM HI-REZ"
   strTrainVideos="TRAINING VIDEOS"
   strCmntyVideos="COMMUNITY VIDEOS"
   PageLabel="WATCH TRIBES NOW"
   Name="Default__GFxTrPage_WatchNow"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
