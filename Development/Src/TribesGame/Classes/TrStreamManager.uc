class TrStreamManager extends Object within GFxTrMenuMoviePlayer
    native;

enum STREAMTYPE
{
    VST_NONE,
    VST_HIREZ,
    VST_TWITCH,
    VST_TRAINING,
    VST_COMMUNITY,
    VST_NEWS,
};

var bool   bUpdateReady;
var int    NewsIndex;
var string TokName;
var string TokTitle;
var string TokViewers;
var string WatchStart;
var string WatchEnd;
var string StreamURL;
var string StreamPath;
var string StreamServer;

struct native GameStream
{
    var bool        bLive;
    var bool        bFeatured;
    var STREAMTYPE  Type;
    var init string Title;
    var init string Stream;
    var init string Viewers;
    var init string ChannelName;
    var init string Description;
};

var array<GameStream> Streams;

native function LoadStreams();
native function GetStreamData();
native function OpenStream(string URL);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function Initialize()
{
}

function ViewStreamIndex(int Index)
{
    if (Index < Streams.Length)
    {
        OpenStream(WatchStart$Streams[Index].Stream$WatchEnd);
    }
}

function ViewVideoIndex(int Index)
{
    if (Index < Streams.Length)
    {
        BRowser.OpenVideo(Streams[Index].Stream);
    }
}

function StartTVTimer()
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        TrPC.TVTimer();
    }
}

event UpdateStreams(optional bool bForce = false)
{
    bUpdateReady = true;

    CheckForUpdate(bForce);
}

function CheckForUpdate(optional bool bRunIfReady = false)
{
    if (bUpdateReady && (bRunIfReady || Pages.GetActivePage() == Pages.WatchNowPage))
    {
        RequestStreams();
        bUpdateReady = false;
    }
}

function GetLatestNews()
{
    local int i;
    local int nextIndex;

    nextIndex = INDEX_NONE;

    for (i = NewsIndex+1; i < Streams.Length; i++)
    {
        if (Streams[i].Type != VST_NEWS)
        {
            continue;
        }

        nextIndex = i;
        break;
    }

    if (nextIndex == INDEX_NONE)
    {
        NewsIndex = 0;
        ASC_ShowNews(LoadingData.GetRandomTip(0), false);
    }
    else
    {
        NewsIndex = nextIndex;
        ASC_ShowNews(Streams[nextIndex].Title, Streams[nextIndex].bFeatured);
    }
}

event CompleteUpdate()
{
    local int i;

    StreamURL = StreamPath;

    for (i = 0; i < Streams.Length; i++)
    {
        if (Streams[i].Type == VST_TWITCH)
        {
            Streams[i].ChannelName = "live_user_"$Streams[i].Stream;
            Streams[i].bLive = false;
            StreamURL = StreamURL$","$Streams[i].Stream;
        }
    }

    GetStreamData();

    Streams.Sort(ViewerSort);
    Pages.WatchNowPage.UpdateStreams();
}

delegate int ViewerSort(GameStream A, GameStream B) { return int(A.Viewers) < int(B.Viewers) ? -1 : 0; }

function int GetTypeCount(STREAMTYPE Type)
{
    local int i;
    local int count;

    count = 0;

    for (i = 0; i < Streams.Length; i++)
    {
        if (Streams[i].Type == Type)
        {
            count++;
        }
    }

    return count;
}

function int GetTypeCountWatching(STREAMTYPE Type)
{
    local int i;
    local int count;

    count = 0;

    for (i = 0; i < Streams.Length; i++)
    {
        if (Streams[i].Type == Type)
        {
            count += int(Streams[i].Viewers);
        }
    }

    return count;
}

function bool IsStream(int Index)
{
    if (Index < Streams.Length)
    {
        return Streams[Index].Type == VST_TWITCH ? true : false;
    }

    return false;
}

function string GetTitleAtIndex(int Index)
{
    if (Index < Streams.Length)
    {
        return Streams[Index].Title;
    }

    return "";
}

function string GetViewersAtIndex(int Index)
{
    if (Index < Streams.Length)
    {
        return Streams[Index].Viewers;
    }

    return "0";
}

function string GetDescriptionAtIndex(int Index)
{
    local string desc;

    if (Index < Streams.Length)
    {
        desc = Streams[Index].Description;
    }

    if (desc == "")
    {
        return Strings.ComingSoon;
    }

    return desc;
}

function bool IsLiveAtIndex(int Index)
{
    if (Index < Streams.Length)
    {
        return Streams[Index].bLive;
    }

    return false;
}

function bool HaveFeature()
{
    local int i;

    for (i = 0; i < Streams.Length; i++)
    {
        if (Streams[i].bFeatured)
        {
            return true;
        }
    }

    return false;
}

function string GetFeatureName(optional int Count = 0)
{
    local int i;

    for (i = 0; i < Streams.Length; i++)
    {
        if (Streams[i].bFeatured && Streams[i].Type != VST_NEWS)
        {
            if (Count <= 0)
            {
                return Streams[i].Title;
            }

            Count--;
        }
    }

    return "";
}

function string GetFeatureDescription(optional int Count = 0)
{
    local int i;

    for (i = 0; i < Streams.Length; i++)
    {
        if (Streams[i].bFeatured && Streams[i].Type != VST_NEWS)
        {
            if (Count <= 0)
            {
                return Streams[i].Description;
            }

            Count--;
        }
    }

    return "";
}

defaultproperties
{
   TokName="name"
   TokTitle="title"
   TokViewers="channel_count"
   WatchStart="http://www.twitch.tv/"
   WatchEnd="/popout"
   StreamPath="/api/stream/list.json?meta_game=Tribes%20Ascend&channel="
   StreamServer="api.justin.tv"
   Name="Default__TrStreamManager"
   ObjectArchetype=Object'Core.Default__Object'
}
