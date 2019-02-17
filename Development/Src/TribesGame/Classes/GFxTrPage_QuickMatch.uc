class GFxTrPage_QuickMatch extends GFxTrPage;

var string ActiveQueue;

function Initialize()
{
    super.Initialize();

    AddActionSet(Pages.JoinMatchPage, 425);
    AddActionSet(Pages.JoinMatchPage, 426);
    AddActionSet(Pages.JoinMatchPage, 444);
}

function SpecialAction(GFxTrAction Action)
{
    switch (Action.ActionNumber)
    {
    case 425:
        Pages.JoinMatchPage.DollMesh = CDT_TeamDeathMatch;
        Pages.JoinMatchPage.PageLabelOverride = Strings.Join@Strings.TeamDeathmatch;
        break;
    case 426:
        Pages.JoinMatchPage.DollMesh = CDT_CTF;
        Pages.JoinMatchPage.PageLabelOverride = Strings.Join@Strings.CaptureTheFlag;
        break;
    case 428:
        Pages.JoinMatchPage.DollMesh = CDT_Rabbit;
        Pages.JoinMatchPage.PageLabelOverride = Strings.Join@Strings.Rabbit;
        break;
	case 444:
		Pages.JoinMatchPage.DollMesh = CDT_Arena;
        Pages.JoinMatchPage.PageLabelOverride = Strings.Join@Strings.Arena;
        break;
    default:
        return;
    }

    Pages.JoinMatchPage.QueueId = Action.ActionNumber;
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
        case 0: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_TeamDeathMatch); break;
        case 1: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_CTF); break;
        case 2: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Rabbit); break;
		case 3: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Arena); break;
        default: break;
        }
    }

    return 0;
}

defaultproperties
{
   PageLabel="QUICK MATCH"
   OptionTitles(0)="TEAM DEATHMATCH"
   OptionTitles(1)="CAPTURE THE FLAG"
   OptionTitles(2)="ARENA"
   OptionSubtext(0)="OBLITERATE EVERYTHING"
   OptionSubtext(1)="BASES, VEHICLES, AND STRATEGY"
   OptionSubtext(2)="FIVE ON FIVE ACTION"
   Name="Default__GFxTrPage_QuickMatch"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
