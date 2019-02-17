class GFxTrPage_RoamCTF extends GFxTrPage;

function Initialize()
{
    super.Initialize();

    AddActionString("TrCTF-ArxNovena?m_bRoamingMap=true");    
    AddActionString("TrCTF-Crossfire?m_bRoamingMap=true");
    AddActionString("TrCTF-DangerousCrossing?m_bRoamingMap=true");   
    AddActionString("TrCTF-Drydock?m_bRoamingMap=true"); 
    AddActionString("TrCTF-Katabatic?m_bRoamingMap=true");
    AddActionString("TrCTF-Permafrost?m_bRoamingMap=true");
    AddActionString("TrCTF-Raindance?m_bRoamingMap=true");
    AddActionString("TrCTF-Stonehenge2?m_bRoamingMap=true");
    AddActionString("TrCTF-SunStar?m_bRoamingMap=true");
    AddActionString("TrCTF-Tartarus?m_bRoamingMap=true");
    AddActionString("TrCTF-RuinsOfHarabec?m_bRoamingMap=true");
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
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_CTF);
}

defaultproperties
{
   PageLabel="ROAM CAPTURE THE FLAG MAPS"
   OptionTitles(0)="ARX NOVENA"
   OptionTitles(1)="CROSSFIRE"
   OptionTitles(2)="DANGEROUS CROSSING"
   OptionTitles(3)="DRYDOCK"
   OptionTitles(4)="KATABATIC"
   OptionTitles(5)="PERMAFROST"
   OptionTitles(6)="RAINDANCE"
   OptionTitles(7)="STONEHENGE"
   OptionTitles(8)="SUNSTAR"
   OptionTitles(9)="TARTARUS"
   OptionTitles(10)="TEMPLE RUINS"
   OptionSubtext(0)="EXPLORE ARX NOVENA CTF"
   OptionSubtext(1)="EXPLORE CROSSFIRE CTF"
   OptionSubtext(2)="EXPLORE DANGEROUS CROSSING CTF"
   OptionSubtext(3)="EXPLORE DRYDOCK CTF"
   OptionSubtext(4)="EXPLORE KATABATIC CTF"
   OptionSubtext(5)="EXPLORE PERMAFROST CTF"
   OptionSubtext(6)="EXPLORE RAINDANCE CTF"
   OptionSubtext(7)="EXPLORE STONEHENGE CTF"
   OptionSubtext(8)="EXPLORE SUNSTAR CTF"
   OptionSubtext(9)="EXPLORE TARTARUS CTF"
   OptionSubtext(10)="EXPLORE TEMPLE RUINS CTF"
   Name="Default__GFxTrPage_RoamCTF"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
