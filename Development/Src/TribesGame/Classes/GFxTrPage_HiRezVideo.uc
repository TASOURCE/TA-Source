class GFxTrPage_HiRezVideo extends GFxTrPage;

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
        StreamManager.ViewVideoIndex(Action.ActionNumber);
    }
}

function FillData(GFxObject DataList)
{
    local int i;

    ClearActions();

    bValid = false;

    for (i = 0; i < StreamManager.Streams.Length; i++)
    {
        if (StreamManager.Streams[i].Type == VST_HIREZ)
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
        obj.SetString("itemTitle", Strings.No@Strings.Videos);
        obj.SetString("itemSubTitle", Strings.Viewers);
    }
    else
    {
        actionNum = PageActions[ActionIndex].ActionNumber;

        obj.SetString("itemTitle", StreamManager.GetTitleAtIndex(actionNum));
        obj.SetString("itemSubTitle", Strings.Video);
    }

    return obj;
}

function GFxObject FillDescription(GFxObject DataList)
{
    local int actionNum;
    local GFxObject obj;

    if (bValid)
    {
        actionNum = PageActions[Pages.FocusIndex].ActionNumber;

        obj = CreateObject("Object");

        obj.SetString("descTitle", StreamManager.GetTitleAtIndex(actionNum)@"(YOUTUBE)");
        obj.SetString("description", "");
    }
    
    return obj;
}

defaultproperties
{
   PageLabel="LATEST FROM HI-REZ"
   Name="Default__GFxTrPage_HiRezVideo"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
