class GFxTrPage_JoinMatch extends GFxTrPage;

var int QueueId;
var int DollMesh;

function Initialize()
{
    super.Initialize();

    AddAction();
    AddActionPage(Pages.RegionSettingsPage);
    
    OptionSubtextOverride[0] = OptionSubtext[0];
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionIndex == 0)
    {
        QueueManager.JoinQueue(QueueId);
    }
}

function FillData(GFxObject DataList)
{
    OptionSubtextOverride[1] = "CURRENTLY"@Caps(SettingsManager.RegionSettings.LoadRegionSetting());

    super.FillData(DataList);
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    local TrEntryPlayerController TrEPC;

    super.TakeFocus(ActionIndex, DataList);
    
    TrEPC = TrEntryPlayerController(GetPC());

    if (TrEPC != none)
    {
        switch (ActionIndex)
        {
        case 0: TrEPC.UpdateMainMenuPaperDoll_Mesh(EContentDataType(DollMesh)); break;
        case 1: TrEPC.UpdateMainMenuPaperDoll_Mesh(EContentDataType(DollMesh)); break;
        default: break;
        }
    }

    return 0;
}

defaultproperties
{
   PageLabel="JOIN MATCH"
   OptionTitles(0)="JOIN QUEUE"
   OptionTitles(1)="CHANGE REGION"
   OptionSubtext(0)="SELECT TO JOIN GAME"
   OptionSubtext(1)="CHANGE SERVER REGION"
   Name="Default__GFxTrPage_JoinMatch"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
