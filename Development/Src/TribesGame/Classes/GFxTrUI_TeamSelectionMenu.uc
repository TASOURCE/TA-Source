//
//
//
class GFxTrUI_TeamSelectionMenu extends GFxMoviePlayer;

var int AllowedTeamDiscrepancyNoTeam;
var int AllowedTeamDiscrepancyOnTeam;
var int PrevBloodEagleCount;
var int PrevDiamondSwordCount;
var bool bInitialized;
var bool bJustJoined;
var bool bCompleted;
var bool JoinBloodEagleAllowed;
var bool JoinDiamondSwordAllowed;
var TrPlayerController TrPC;

var GFxObject MovieClip;
var GFxObject BloodEagleButton;
var GFxObject DiamondSwordButton;
var GFxObject BloodEagleCountTF;
var GFxObject DiamondSwordCountTF;

function Initialize()
{
    MovieClip = GetVariableObject("_root.teamChooser");
    BloodEagleButton = GetVariableObject("_root.teamChooser.team1Btn");
    DiamondSwordButton = GetVariableObject("_root.teamChooser.team2Btn");
    BloodEagleCountTF = GetVariableObject("_root.teamChooser.team1Players");
    DiamondSwordCountTF = GetVariableObject("_root.teamChooser.team2Players");

    if (BloodEagleButton != none) BloodEagleButton.GotoAndStopI(1);
    if (DiamondSwordButton != none) DiamondSwordButton.GotoAndStopI(1);
    if (BloodEagleCountTF != none) BloodEagleCountTF.SetText("0");
    if (DiamondSwordCountTF != none) DiamondSwordCountTF.SetText("0");
    
    TrPC = TrPlayerController(GetPC());

    bInitialized = true;
}

function bool Start(optional bool StartPaused = false)
{
    super.Start();
    Advance(0);

    if (!bInitialized)
    {
        Initialize();
    }

    SetFontIndex(TrPC.GetLanguageFontIndex());
    Show();

    return TRUE;
}

final function SetFontIndex(int FontIdx)
{
    ActionScriptVoid("setLanguage");
}

function Show()
{
    EnableSpectate(true);
    EnableBloodEagle(true);
    EnableDiamondSword(true);

    bCompleted = false;
    MovieClip.SetVisible(true);

    SetLabels(TrPC.Strings.ChooseYourTeam, TrPC.Strings.Spectate);
}

final function SetLabels(string Title, string Spectate)
{
    ActionScriptVoid("setLabels");
}

function Tick(GameReplicationInfo GRI)
{
    local int  beCount;
    local int  dsCount;
    local bool bUpdated;
	local TrGameReplicationInfo TrGRI;

    if (GRI != none && !bCompleted)
    {
        TrGRI = TrGameReplicationInfo(GRI);

        if (TrPC != none && TrGRI != none)
        {
            beCount = TrGRI.GetTeamSize(0);
            dsCount = TrGRI.GetTeamSize(1);

            if (PrevBloodEagleCount != beCount && BloodEagleCountTF != none)
            {
                bUpdated = true;
                PrevBloodEagleCount = beCount;
                BloodEagleCountTF.SetText(beCount);
            }
            
            if (PrevDiamondSwordCount != dsCount && DiamondSwordCountTF != none)
            {
                bUpdated = true;
                PrevDiamondSwordCount = dsCount;
                DiamondSwordCountTF.SetText(dsCount);
            }
        }

        if (bUpdated)
        {
            EnableBloodEagle(TrGRI.CanJoinTeam(0, TrPC.GetTeamNum()));
            EnableDiamondSword(TrGRI.CanJoinTeam(1, TrPC.GetTeamNum()));
        }
    }
}

function EnableBloodEagle(bool bEnable)
{
    JoinBloodEagleAllowed = bEnable;

    if (bEnable)
    {
        AsTeamChooseEnableButton(1, "True");
    }
    else
    {
        AsTeamChooseEnableButton(1, "False");
    }

    if (BloodEagleButton != none && bEnable) BloodEagleButton.GotoAndStopI(1);
    if (BloodEagleButton != none && !bEnable) BloodEagleButton.GotoAndStopI(3);
}

function EnableDiamondSword(bool bEnable)
{
    JoinDiamondSwordAllowed = bEnable;

    if (bEnable)
    {
        AsTeamChooseEnableButton(2, "True");
    }
    else
    {
        AsTeamChooseEnableButton(2, "False");
    }

    if (DiamondSwordButton != none && bEnable) DiamondSwordButton.GotoAndStopI(1);
    if (DiamondSwordButton != none && !bEnable) DiamondSwordButton.GotoAndStopI(3);
}

function EnableSpectate(bool bEnable)
{
    AsTeamChooseEnableButton(3, string(bEnable));
}

function choseTeamBE()
{
    bJustJoined = false;

    switch (TrPC.GetTeamNum())
    {
    case 0:
        CompleteMovie();
        break;
    case 1:
        if (JoinBloodEagleAllowed)
        {
            TrPC.ServerRequestPickTeam(0);
        }
        break;
    case 255:
        if (JoinBloodEagleAllowed)
        {
            // Ask the server to join Diamond Sword. If it lets us, it'll spawn the
            // player controller and set a flag for us to complete this movie.
            TrPC.ChooseBloodEagle();
        }
        break;
    }
}

function choseTeamDS()
{
    bJustJoined = false;

    switch (TrPC.GetTeamNum())
    {
    case 0:
        if (JoinDiamondSwordAllowed)
        {
            TrPC.ServerRequestPickTeam(1);
        }
        break;
    case 1:
        CompleteMovie();
        break;
    case 255:
        if (JoinDiamondSwordAllowed)
        {
            // Ask the server to join Diamond Sword. If it lets us, it'll spawn the
            // player controller and set a flag for us to complete this movie.
            TrPC.ChooseDiamondSword();
        }
        break;
    }
}

function choseTeamSpectate()
{
    bJustJoined = false;
    
    if (!TrPC.InRovingSpectate())
    {
        TrPC.Spectate(true);
    }

    CompleteMovie(false);
}

event CompleteMovie(optional bool bHaveTeam = true)
{
    bCompleted = true;

    if (bHaveTeam && TrPC.InRovingSpectate())
    {
        TrPC.EndSpectate();
    }

    TrHUD(TrPC.MyHUD).CompleteTeamSelectionMenuClose();
}

final function AsTeamChooseEnableButton(int TeamId, string bEnable)
{
    ActionScriptVoid("TeamChooseEnableButton");
}

defaultproperties
{
   AllowedTeamDiscrepancyNoTeam=1
   AllowedTeamDiscrepancyOnTeam=-1
   bJustJoined=True
   bCaptureInput=True
   Name="Default__GFxTrUI_TeamSelectionMenu"
   ObjectArchetype=GFxMoviePlayer'GFxUI.Default__GFxMoviePlayer'
}
