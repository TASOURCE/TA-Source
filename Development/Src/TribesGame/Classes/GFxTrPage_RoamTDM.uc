class GFxTrPage_RoamTDM extends GFxTrPage;

function Initialize()
{
    super.Initialize();

    AddActionString("TrTeamRabbit-ArxNovena?m_bRoamingMap=true");
    AddActionString("TrTeamRabbit-BellaOmega?m_bRoamingMap=true");    
    AddActionString("TrTeamRabbit-CrossfireSmall?m_bRoamingMap=true");
    AddActionString("TrTeamRabbit-Drydock?m_bRoamingMap=true");
    AddActionString("TrTeamRabbit-NightKatabatic?m_bRoamingMap=true");
    AddActionString("TrTeamRabbit-Harabec?m_bRoamingMap=true");    
    AddActionString("TrTeamRabbit-Tartarus?m_bRoamingMap=true");    
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
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_TeamDeathmatch);
}

defaultproperties
{
   PageLabel="ROAM TEAM DEATHMATCH MAPS"
   OptionTitles(0)="OUTSKIRTS"
   OptionTitles(1)="QUICKSAND"
   OptionTitles(2)="SULFUR COVE"
   OptionTitles(3)="DRYDOCK NIGHT"
   OptionTitles(4)="NIGHTABATIC"
   OptionTitles(5)="INFERNO"
   OptionTitles(6)="MIASMA"
   OptionSubtext(0)="EXPLORE OUTSKIRTS TDM"
   OptionSubtext(1)="EXPLORE QUICKSAND TDM"
   OptionSubtext(2)="EXPLORE SULFUR COVE TDM"
   OptionSubtext(3)="EXPLORE DRYDOCK NIGHT TDM"
   OptionSubtext(4)="EXPLORE NIGHTABATIC TDM"
   OptionSubtext(5)="EXPLORE INFERNO TDM"
   OptionSubtext(6)="EXPLORE MIASMA TDM"
   Name="Default__GFxTrPage_RoamTDM"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
