class GFxTrPage_RoamRabbit extends GFxTrPage;

function Initialize()
{
    super.Initialize();

    AddActionString("TrRabbit-ArxNovena?m_bRoamingMap=true");
    AddActionString("TrRabbit-BellaOmega?m_bRoamingMap=true");
    AddActionString("TrRabbit-CrossfireSmall?m_bRoamingMap=true");
    AddActionString("TrRabbit-Drydock?m_bRoamingMap=true");    
    AddActionString("TrRabbit-NightKatabatic?m_bRoamingMap=true");
    AddActionString("TrRabbit-Harabec?m_bRoamingMap=true");
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
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Rabbit);
}

defaultproperties
{
   PageLabel="ROAM RABBIT MAPS"
   OptionTitles(0)="OUTSKIRTS"
   OptionTitles(1)="QUICKSAND"
   OptionTitles(2)="SULFUR COVE"
   OptionTitles(3)="DRYDOCK NIGHT"
   OptionTitles(4)="NIGHTABATIC"
   OptionTitles(5)="INFERNO"
   OptionSubtext(0)="EXPLORE OUTSKIRTS RABBIT"
   OptionSubtext(1)="EXPLORE QUICKSAND RABBIT"
   OptionSubtext(2)="EXPLORE SULFUR COVE RABBIT"
   OptionSubtext(3)="EXPLORE DRYDOCK RABBIT"
   OptionSubtext(4)="EXPLORE NIGHTABATIC RABBIT"
   OptionSubtext(5)="EXPLORE INFERNO RABBIT"
   Name="Default__GFxTrPage_RoamRabbit"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
