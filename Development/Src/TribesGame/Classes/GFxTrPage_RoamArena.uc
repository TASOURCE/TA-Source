class GFxTrPage_RoamArena extends GFxTrPage;

function Initialize()
{
    super.Initialize();

    AddActionString("TrArena-Airarena?m_bRoamingMap=true");
    AddActionString("TrArena-Lavarena?m_bRoamingMap=true");    
    AddActionString("TrArena-Walledin?m_bRoamingMap=true");    
    AddActionString("TrArena-Hinterland?m_bRoamingMap=true");    
}

function SpecialAction(GFxTrAction Action)
{
    JoinLocalGame(Action.ActionString);
}

function JoinLocalGame(string SessionName)
{
	;

    MenuSounds.SoundSelectedQueue();
	QueueManager.OpenLocal(SessionName);
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Arena);
}

defaultproperties
{
   PageLabel="ROAM ARENA MAPS"
   OptionTitles(0)="AIR ARENA"
   OptionTitles(1)="LAVA ARENA"
   OptionTitles(2)="WALLED IN"
   OptionTitles(3)="HINTERLANDS"
   OptionSubtext(0)="EXPLORE AIR ARENA"
   OptionSubtext(1)="EXPLORE LAVA ARENA"
   OptionSubtext(2)="EXPLORE WALLED IN"
   OptionSubtext(3)="EXPLORE HINTERLANDS"
   Name="Default__GFxTrPage_RoamArena"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
