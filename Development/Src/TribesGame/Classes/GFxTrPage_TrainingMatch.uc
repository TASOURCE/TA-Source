class GFxTrPage_TrainingMatch extends GFxTrPage;

function Initialize()
{
    AddActionString("TrTraining-SkiTutorial?m_bRoamingMap=true");
    AddActionPage(Pages.TrainVideoPage);
    AddActionString("TrTraining-Crossfire?m_bRoamingMap=true");
    AddActionString("TrTraining-TutorialAdv?m_bRoamingMap=true");
    AddActionPage(Pages.RoamingMatchPage);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionString != "")
    {
        if (Action.ActionString == "TrTraining-SkiTutorial?m_bRoamingMap=true")
        {
            if (!User.m_DidLogin) User.SaveDidLogin();
        }

        JoinLocalGame(Action.ActionString);
    }
}

function JoinLocalGame(string SessionName)
{
	;

    MenuSounds.SoundSelectedQueue();
	QueueManager.OpenLocal(SessionName);
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
        case 0: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_SkiingTutorial); break;
        case 1: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_MainMenu); break;
        case 2: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_TargetPractice); break;
        case 3: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_SkiChallenge); break;
        case 4: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_MapRoaming); break;
        default: break;
        }
    }

    return 0;
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionString == "TrTraining-SkiTutorial?m_bRoamingMap=true")
    {
        if (!User.m_DidLogin)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetString("itemRibbonLabel", Strings.Recommended);
            obj.SetFloat("ribbonType", 2);
        }
        else
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemRibbonLabel", "");
        }
    }

    return obj;
}

defaultproperties
{
   PageLabel="TRAINING"
   OptionTitles(0)="SKI TUTORIAL"
   OptionTitles(1)="VIDEO TUTORIALS"
   OptionTitles(2)="TARGET PRACTICE"
   OptionTitles(3)="SKI CHALLENGE"
   OptionTitles(4)="ROAM MAP"
   OptionSubtext(0)="LEARN TO SKI"
   OptionSubtext(1)="WATCH AND LEARN"
   OptionSubtext(2)="HONE YOUR SKILLS AGAINST BOTS"
   OptionSubtext(3)="PERFECT YOUR SKIING"
   OptionSubtext(4)="EXPLORE A MAP LOCALLY"
   Name="Default__GFxTrPage_TrainingMatch"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
