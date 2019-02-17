class GFxTrPage_RoamingMatch extends GFxTrPage;

function Initialize()
{
    AddActionPage(Pages.RoamTDMPage);
    AddActionPage(Pages.RoamCTFPage);
    AddActionPage(Pages.RoamArenaPage);
    AddActionPage(Pages.RoamCAHPage);
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_MapRoaming);
}

defaultproperties
{
   PageLabel="ROAM MAP"
   OptionTitles(0)="TEAM DEATHMATCH"
   OptionTitles(1)="CAPTURE THE FLAG"
   OptionTitles(2)="ARENA"
   OptionTitles(3)="CAPTURE AND HOLD"
   OptionSubtext(0)="ROAM A TEAM DEATHMATCH MAP"
   OptionSubtext(1)="ROAM A CAPTURE THE FLAG MAP"
   OptionSubtext(2)="ROAM AN ARENA MAP"
   OptionSubtext(3)="ROAM A CAPTURE-AND-HOLD MAP"
   Name="Default__GFxTrPage_RoamingMatch"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
