class GFxTrPage_RoamCAH extends GFxTrPage;

function Initialize()
{
    super.Initialize();

    AddActionString("TrCaH-ArxOutskirts_3p?m_bRoamingMap=true");
    AddActionString("TrCaH-Katabatic?m_bRoamingMap=true");
    AddActionString("TrCaH-Raindance?m_bRoamingMap=true");
    AddActionString("TrCaH-CrossfireSmall?m_bRoamingMap=true");
    AddActionString("TrCaH-Tartarus?m_bRoamingMap=true");
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
   PageLabel="ROAM CAPTURE-AND-HOLD MAPS"
   OptionTitles(0)="OUTSKIRTS"
   OptionTitles(1)="KATABATIC"
   OptionTitles(2)="RAINDANCE"
   OptionTitles(3)="SUNSET COVE"
   OptionTitles(4)="TARTARUS"
   OptionSubtext(0)="EXPLORE OUTSKIRTS CAH"
   OptionSubtext(1)="EXPLORE KATABATIC CAH"
   OptionSubtext(2)="EXPLORE RAINDANCE CAH"
   OptionSubtext(3)="EXPLORE SUNSET COVE CAH"
   OptionSubtext(4)="EXPLORE TARTARUS CAH"
   Name="Default__GFxTrPage_RoamCAH"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
