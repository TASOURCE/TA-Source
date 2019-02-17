class GFxTrPage_LiveStream extends GFxTrPage;

var bool bValid;

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
    if (bValid)
    {
        StreamManager.ViewStreamIndex(Action.ActionNumber);
    }
}

function FillData(GFxObject DataList)
{
    local int i;

    ClearActions();

    bValid = false;

    for (i = 0; i < StreamManager.Streams.Length; i++)
    {
        if (StreamManager.Streams[i].Type == VST_TWITCH)
        {
            bValid = true;
            AddActionNumber(i);
        }
    }

    if (StreamManager.Streams.Length == 0)
    {
        AddAction();
    }

    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local int actionNum;
    local GFxObject obj;
    
    obj = super.FillOption(ActionIndex);

    if (StreamManager.Streams.Length == 0)
    {
        obj.SetString("itemTitle", Strings.No@Strings.Streams);
        obj.SetString("itemSubTitle", Strings.Viewers);
    }
    else
    {
        actionNum = PageActions[ActionIndex].ActionNumber;

        obj.SetString("itemTitle", StreamManager.GetTitleAtIndex(actionNum));

        if (StreamManager.IsLiveAtIndex(actionNum))
        {
            obj.SetFloat("bLocked", 0);
            obj.SetString("itemSubTitle", StreamManager.GetViewersAtIndex(actionNum)@"VIEWERS");
        }
        else
        {
            obj.SetFloat("bLocked", 1);
            obj.SetString("itemSubTitle", Strings.Not@Strings.Online);
        }
    }

    return obj;
}

function GFxObject FillDescription(GFxObject DataList)
{
    local int actionNum;
    local GFxObject obj;

    if (StreamManager.Streams.Length > 0)
    {
        actionNum = PageActions[Pages.FocusIndex].ActionNumber;

        obj = CreateObject("Object");

        obj.SetString("descTitle", StreamManager.GetTitleAtIndex(actionNum)@"(TWITCH.TV)");
        obj.SetString("description", StreamManager.GetDescriptionAtIndex(actionNum));
    }
    
    return obj;
}

defaultproperties
{
   PageLabel="LIVE STREAMS"
   Name="Default__GFxTrPage_LiveStream"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
