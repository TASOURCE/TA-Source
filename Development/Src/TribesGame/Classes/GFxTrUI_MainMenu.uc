class GFxTrUI_MainMenu extends GFxUI_PauseMenu;


var GFxUI_PauseMenu FamilyMenuMovie;


function bool Start(optional bool StartPaused = false)
{
    local GFxObject ButtonsMC;

    super(UTGFxTweenableMoviePlayer).Start();
    Advance(0);

	RootMC = GetVariableObject("_root");
    PauseMC = RootMC.GetObject("mainmenu_mc");
    ButtonsMC = PauseMC.GetObject("menu_mc").GetObject("buttons_mc");

    Btn_ResumeMC = GFxClikWidget(ButtonsMC.GetObject("resume_btn_mc", class'GFxClikWidget'));
    Btn_ExitMC = GFxClikWidget(ButtonsMC.GetObject("exit_btn_mc", class'GFxClikWidget'));

	Btn_ResumeMC.SetString("label", ResumeString);
	Btn_ExitMC.SetString("label", ExitString);

	Btn_ExitMC.AddEventListener('CLIK_press', OnPressExitButton);
	Btn_ResumeMC.AddEventListener('CLIK_press', OnPressResumeButton);

	AddCaptureKey('XboxTypeS_A');
	AddCaptureKey('XboxTypeS_Start');
	AddCaptureKey('Enter');

    return TRUE;
}

defaultproperties
{
   Name="Default__GFxTrUI_MainMenu"
   ObjectArchetype=GFxUI_PauseMenu'UTGame.Default__GFxUI_PauseMenu'
}
